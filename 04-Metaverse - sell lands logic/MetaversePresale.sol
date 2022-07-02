// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract MetaversePresale {
    // width & height = 0 to 128 (calculate: 0 to 7, 8 to 15.... -> 2^6 -> 16 times)
    uint id = 1;
    uint counter = 0;
    struct Pos { // land 128*128 (from 0 to 127) - id from 1 to 16
        uint id;
        uint start;
        uint end;
    }
    mapping(uint => Pos) public area; // id -> area position
    mapping(address => uint) public balanceOf;

    function createLand() public {
        counter < 128 ? 
            areaAdd() : 
            revert ("Error: land's soldout");
    }

    function areaAdd() private {
        area[id] = Pos(id,counter,counter+7); // 2^x
        id += 1;
        counter += 8;
        balanceOf[msg.sender] += 1;
    }
}
