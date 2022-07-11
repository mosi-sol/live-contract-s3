// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract Errors {

    /* -------- Debuging by Error's -------- */

    /// ERROR Message: debug error not value
    error debugNor();
    /// ERROR Message: debug error by value
    error debugVal(bytes);

}


// ------------ mock test contract
contract MockErrors is Errors {
    address owner;

    constructor(){
        owner = msg.sender;
    }

    function x() external pure {
        revert debugNor();
    }

    function y() external pure {
        revert debugVal(msg.data);
    }

    function z() external view {
        if(msg.sender == owner){ 
            revert debugVal(msg.data);
        } else {
            revert debugNor();
        }
    }
}
