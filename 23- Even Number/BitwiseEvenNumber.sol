// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract BitwiseEvenNumber {

    function featureIsEven(uint number) public pure returns (bool result) {
        if(number & 1 == 1) return false;
        return true;
    }
    
}
