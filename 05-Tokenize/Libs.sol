// SPDX-License-Identifier: MIT
pragma solidity 0.8;

library ADDRESS {
    function isContract(address account) internal view returns (bool) {
        return account.code.length > 0;
    }
}

library MATH {
    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }

    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a >= b ? a : b;
    }

    function dec(uint256 val) internal pure { // decrement
        require(val > 0, "ERROR: overflow");
        unchecked { val -= 1; }
    }

    function inc(uint256 val) internal pure { // increment
        unchecked { val += 1; }
    }
}
