// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract BankVault is ReentrancyGuard {
    // safeApprove - safeTransfer - safeTransferFrom
    using SafeERC20 for IERC20;

    // target token, not changable. set in deploy time
    address private immutable tokenAddress;
    // userAddress => tokenAddress => token amount
    mapping (address => uint256) private userTokenBalance;

    // Events
    event tokenDepositComplete(address tokenAddress, uint256 amount);
    event tokenWithdrawalComplete(address tokenAddress, uint256 amount);

    // init
    constructor(address _tokenAddress) {
        tokenAddress = _tokenAddress;
    }

    // not accepting native token
    receive() payable external {
        revert("not accepted");
    }

    // computing
    function bankToken() public view returns (address _contract, string memory _name, string memory _symbol) {
        _contract = tokenAddress;
        _name = IERC20Metadata(tokenAddress).name();
        _symbol = IERC20Metadata(tokenAddress).symbol();
    }

    function userBalances() public view returns (uint256) {
        return userTokenBalance[msg.sender];
    }

    function vaultBalance() public view returns (uint256) {
        return IERC20(tokenAddress).balanceOf(address(this));
    }

    function depositToken(uint256 amount) public {
        require(IERC20(tokenAddress).balanceOf(msg.sender) >= amount, "Your token amount must be greater then you are trying to deposit");
        // approve can not work from contract, do this from frontend. so next line don't work
        IERC20(tokenAddress).safeApprove(address(this), amount); // <-- safe library not need require
        require(IERC20(tokenAddress).transferFrom(msg.sender, address(this), amount));
        userTokenBalance[msg.sender] += amount;
        emit tokenDepositComplete(tokenAddress, amount);
    }

    function withDrawAll() public nonReentrant {
        require(userTokenBalance[msg.sender] > 0, "User doesnt has funds on this vault");
        uint256 amount = userTokenBalance[msg.sender];
        userTokenBalance[msg.sender] = 0;
        require(IERC20(tokenAddress).transfer(msg.sender, amount), "the transfer failed");
        emit tokenWithdrawalComplete(tokenAddress, amount);
    }

    function withDrawAmount(uint256 amount) public nonReentrant {
        require(userTokenBalance[msg.sender] >= amount);
        require(IERC20(tokenAddress).transfer(msg.sender, amount), "the transfer failed");
        userTokenBalance[msg.sender] -= amount;
        emit tokenWithdrawalComplete(tokenAddress, amount);
    }

}
