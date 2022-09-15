// SPDX-License-Identifier: MIT
pragma solidity 0.8;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract SafePercentage {
    using SafeMath for uint256;

    uint256 percentage;

    function setPercentageFee(uint256 fee) external {
         percentage = fee;
    }
    
    function test(uint256 amount) public view returns (uint256 percentageFee, uint256 total) { 
        percentageFee = (amount.mul(percentage)).div(10000);
        total = amount.sub(percentageFee);
    }

}
