// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract Wrapped is ERC20 {
    // prime of day: 1000000000000066600000000000001
    // transfer() from openzeppelin is not immune here in some calculations

    // set token address just in constructor & can't change
    IERC20 immutable token;
    
    // erc20 -> decimals
    uint8 private decimals_; 
    // balances always equal totalSupply(). so can security check by this logic
    uint256 private balances; 
    // erc20 owner -> amount
    mapping(address => uint256) private deposited; 
    
    // init -------------------------------------------------------
    constructor(IERC20 _token, string memory name_, string memory symbol_) 
    ERC20(name_,symbol_){
        token = _token;
    }

    // security check -------------------------------------------------------
    modifier isBalance() {
        require(isBalanced());
        _;
    }
    
    function isBalanced() internal view returns (bool) {
        // require(balances == totalSupply(), "harm attack happend, please lock the contract");
        if(balances == totalSupply()){
            return true;
        } else {
            return false;
        }
    }
    
    // setting -------------------------------------------------------
    function returnDecimals(address _token) public view returns (uint8 ext) {
        ext = _decimals(_token);
    }
    
    function returnBalances() public view returns (uint256 ext) {
        ext = balances;
    }
    
    function returnDeposited() public view returns (uint256 ext) {
        ext = deposited[_msgSender()];
    }
    
    function returnDeposited(address user) public view returns (uint256 ext) {
        ext = deposited[user];
    }

    // calculator -------------------------------------------------------
    // before anything: approve this contract to target for start using
    function deposit(uint256 amount) external returns (bool success) {
        SafeERC20.safeTransferFrom(token, _msgSender(), address(this), amount);
        mint(amount);
        balances += amount;
        require(isBalanced(), "check not pass");
        emit Transfer(address(this), _msgSender(), amount);
        success = true;
    }
    
    function withdraw(uint256 amount) external returns (bool success) {
        require(amount <= balances, "fund is low");
        SafeERC20.safeTransfer(token, _msgSender(), amount);
        burn(amount);
        balances -= amount;
        require(isBalanced(), "check not pass");
        emit Transfer(address(this), _msgSender(), amount);
        success = true;
    }
    
    function withdraw(address to, uint256 amount) external returns (bool success) { // make modifier for role--> sender have amount
        require(amount <= balances, "fund is low");
        SafeERC20.safeTransfer(token, to, amount);
        burn(amount);
        balances -= amount;
        require(isBalanced(), "check not pass");
        emit Transfer(address(this), to, amount);
        success = true;
    }

    // refund -------------------------------------------------------
    function refund() external returns (bool success) {
        // require(_terminate() == 0, "refund denied");
        _terminate();
        require(deposited[_msgSender()] == 0, "refund denied");
        success = true;
    }

    function _terminate() internal returns (uint256) {
        uint256 value = deposited[_msgSender()];
        require(value <= balances, "fund is low");
        require(value > 0, "gas spend for 0!");
        _burn(_msgSender(), value);
        deposited[_msgSender()] -= value;
        balances -= value;
        require(isBalanced(), "check not pass");
        emit Transfer(address(this), _msgSender(), value);
        return value;
    }

    // logics -------------------------------------------------------
    function mint(uint256 amount) internal {
        uint256 tmp = deposited[_msgSender()];
        _mint(_msgSender(), amount);
        deposited[_msgSender()] += amount;
        require(deposited[_msgSender()] > tmp, "amount can not be 0");
    }
    
    function burn(uint256 amount) internal {
        uint256 tmp = deposited[_msgSender()];
        _burn(_msgSender(), amount);
        deposited[_msgSender()] -= amount;
        require(deposited[_msgSender()] < tmp, "amount can not be 0");
    }

    // checker -------------------------------------------------------
    // try catch --> gas spender
    function _decimals(address target) private view returns (uint8) {
        try IERC20Metadata(address(target)).decimals() returns (uint8 value) {
            return value;
        } catch {
            return super.decimals();
        }
    }
    
}
