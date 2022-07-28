// SPDX-License-Identifier: MIT
pragma solidity 0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract MockTokenIco is ERC20, ERC20Burnable, AccessControl {
    using Address for address;

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant KEEPER = keccak256("KEEPER");
    address admin;
    address icoKeeper; // ico smartcontract address

    constructor(string memory _name, string memory _symbol, address _icoKeeper) ERC20(_name, _symbol) {
        require(_icoKeeper != address(0), "make sure keeper address is currect");
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        admin = msg.sender;
        icoKeeper = _icoKeeper;
        _grantRole(KEEPER, icoKeeper);
        _mint(msg.sender, 10000 * 10 ** decimals());
        _mint(address(this), 10000 * 10 ** decimals()); // for fun ;)
        _mint(icoKeeper, 10000 * 10 ** decimals()); // for ico :)
        approve(icoKeeper, balanceOf(address(this)));
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount * 10 ** decimals());
    }

    function release(address to, uint256 amount) public onlyRole(KEEPER) {
        _mint(to, amount * 10 ** decimals());
    }
}
