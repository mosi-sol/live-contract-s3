// SPDX-License-Identifier: MIT
pragma solidity 0.8;

import "./IERC165.sol";

interface IShop is IERC165 {
	event Transfer(uint256 indexed id, address from, address to, bytes16 indexed certification, uint256 indexed time);
	event PriceChange(uint256 indexed id, address caller, uint256 oldPrice, uint256 newPrice, uint256 indexed time);
	event ListItem(uint256 indexed id, address caller, uint256 price, bool isListed, uint256 indexed time);

	function create(uint8 theType, uint8 material, uint256 price, string calldata ipfs) external returns (uint256 itemId); // only by shop or creator
	function changePrice(uint256 id, uint256 newPrice) external payable returns (bool);
	function transfer(uint256 id, address recipient) external payable;
	function list(uint256 id, uint256 price) external returns (bool);
	function unList(uint256 id) external;
	function buy(uint256 id) external payable;

	function verify(bytes16 certification) external view returns (bool success); // validate/verify the certification
}
