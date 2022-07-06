// SPDX-License-Identifier: MIT
pragma solidity 0.8;

import "./IERC165.sol";

contract ERC165 is IERC165 {
    function supportsInterface(bytes4 interfaceId) external virtual override view returns (bool) {
        return interfaceId == type(IERC165).interfaceId;
    }
}
