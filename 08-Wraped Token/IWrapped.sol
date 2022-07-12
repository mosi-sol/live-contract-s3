// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// if using this intrface, then inherit erc165 & inherite Wrapped contract...
interface IWrapped /*is IERC20*/ {
    function deposit(uint256 amount) external returns (bool success);
    function withdraw(uint256 amount) external returns (bool success);
    function withdraw(address to, uint256 amount) external returns (bool success);
    function refund() external returns (bool success);
}
