// SPDX-License-Identifier: MIT
pragma solidity 0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Mock is ERC20{
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol){
        _mint(msg.sender, (100 * 10 ** 18));
    }

    function mint(uint amount) public {
        _mint(msg.sender, (amount * 10 ** 18));
    }
}
