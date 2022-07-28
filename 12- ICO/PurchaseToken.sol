// SPDX-License-Identifier: MIT
pragma solidity 0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract MockTokenPurchase is ERC20, ERC20Burnable, AccessControl {
    using Address for address;

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    address admin;
    uint256 price = 0.01 ether;

    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        _mint(msg.sender, 10000 * 10 ** decimals());
        _mint(address(this), 10000 * 10 ** decimals()); // for ico :)
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        admin = msg.sender;
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount * 10 ** decimals());
    }

    function mint(uint256 amount) public payable {
        require(msg.value >= amount * price);
        // payable(msg.sender).transfer(address(this), msg.value);
        (bool s, ) = admin.call{value: msg.value}("");
        require(s);
        _mint(msg.sender, amount * 10 ** decimals());
    }
}
