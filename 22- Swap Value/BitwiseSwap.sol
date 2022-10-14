// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract BitwiseSwap {

    function featureSwapValue(uint x, uint y) public pure returns (uint, uint) {
        x = x ^ y;
        y = x ^ y;
        x = x ^ y;
        return (x,y);
    }
    
}
