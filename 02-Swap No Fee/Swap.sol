// SPDX-License-Identifier: MIT
pragma solidity 0.8;

import "./IERC20.sol";

contract NoFeeSwap2Pairs {
    // ------------------------------------------------------------
    IERC20 public immutable pairA; // notChangable ERC20 Token A
    IERC20 public immutable pairB; // notChangable ERC20 Token B
    uint public holdA; // hold token A
    uint public holdB; // hold token B
    uint public totalSupply; // total from pool - show by equetion
    mapping(address => uint) public balanceOf; // balance of address x

    // ------------------------------------------------------------
    event CreateValue(address indexed caller, uint indexed valueA, uint indexed valueB, uint time);
    event ClearValue(address indexed caller, uint indexed value, uint time);
    event Swap(address indexed caller, uint indexed valueIn, uint indexed valueOut, uint time); // change / exchange / swap

    modifier isValidToken(address _in) {
        require(_in == address(pairA) || _in == address(pairB), "invalid token");
        _;
    }

    // ------------------------------------------------------------
    constructor(address _pairA, address _pairB) {
        pairA = IERC20(_pairA);
        pairB = IERC20(_pairB);
    }

    // ------------------------------------------------------------
    function _lock(address _to, uint _amount) private {
        balanceOf[_to] += _amount;
        totalSupply += _amount;
    }

    function _release(address _from, uint _amount) private {
        balanceOf[_from] -= _amount;
        totalSupply -= _amount;
    }

    function _hold(uint _holdA, uint _holdB) private {
        holdA = _holdA;
        holdB = _holdB;
    }

    // ------------------------------------------------------------
    // Valuetion -> looklike: liquidity pool
    function createValuetion(uint _amountA, uint _amountB) external returns (uint variant) {
        require(_amountA > 0 && _amountB > 0, "why you want to spend gas!?");
        pairA.transferFrom(_msgSender(), _this(), _amountA);
        pairB.transferFrom(_msgSender(), _this(), _amountB);
        require(holdA * _amountB == holdB * _amountA, "rule is rule, read mathematicals");
        totalSupply == 0 ? variant = sqrt_(_amountA * _amountB) : 
            variant = _min(
                (_amountA * totalSupply) / holdA,
                (_amountB * totalSupply) / holdB
            );
        require(variant > 0, "imposible thing happend");
        _lock(_msgSender(), variant);
        _hold(pairA.balanceOf(_this()), pairB.balanceOf(_this()));
        emit CreateValue(_msgSender(), _amountA, _amountB, block.timestamp);
    }

    // Valuetion -> looklike: liquidity pool
    function clearValuetion(uint _variant) external returns (uint amountA, uint amountB) {
        uint balanceA = pairA.balanceOf(_this());
        uint balanceB = pairB.balanceOf(_this());
        amountA = (_variant * balanceA) / totalSupply;
        amountB = (_variant * balanceB) / totalSupply;
        require(amountA > 0 && amountB > 0, "imposible thing happend, not match value on tokens, one of them is zero");
        _release(_msgSender(), _variant);
        _hold(balanceA - amountA, balanceB - amountB);
        pairA.transfer(_msgSender(), amountA);
        pairB.transfer(_msgSender(), amountB);
        emit ClearValue(_msgSender(), _variant, block.timestamp);
    }

    // swap - change - exchange
    function swap(address _tokenIn, uint _amountIn) external isValidToken(_tokenIn) returns (uint amountOut) {
        require(_amountIn > 0, "can not posibble the amount be zero!");
        bool isPairA = _tokenIn == address(pairA);
        (IERC20 pairIn, IERC20 pairOut, uint holdIn, uint holdOut) = isPairA
            ? (pairA, pairB, holdA, holdB)
            : (pairB, pairA, holdB, holdA);
        pairIn.transferFrom(_msgSender(), _this(), _amountIn);
        amountOut = (holdOut * _amountIn) / (holdIn + _amountIn);
        pairOut.transfer(_msgSender(), amountOut);
        _hold(pairA.balanceOf(_this()), pairB.balanceOf(_this()));
        emit Swap(_msgSender(), _amountIn, amountOut, block.timestamp);
    }

    // ------------------------------------------------------------
    // Math lib
    // example math libs: https://github.com/extraterrestrial-tech/fixidity/tree/master/contracts
    // example math libs: @openzeppelin 

    function _min(uint numA, uint numB) private pure returns (uint) {
        return numA <= numB ? numA : numB; // if equal return A
    }

    // sqrt(uint $num): uint
    // sqrt(9) = 3 - sqrt(10) = 3.16227766 ...

    // https://github.com/Uniswap/uniswap-v2-core/blob/v1.0.1/contracts/libraries/Math.sol
    function _sqrt(uint y) private pure returns (uint z) {
        if (y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
    }
    // https://github.com/ethereum/dapp-bin/pull/50
    function sqrt_(uint x) private pure returns (uint y) {
        uint z = (x + 1) / 2;
        y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
    }

    // ------------------------------------------------------------
    // 
    function _this() internal view virtual returns (address) {
        return address(this);
    }

    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    function _msgValue() internal view virtual returns (uint) {
        return msg.value;
    }

}
