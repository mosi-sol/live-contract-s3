// SPDX-License-Identifier: MIT
pragma solidity 0.8;

import "github.com/mosi-sol/5min/blob/main/07-IERC%20Lib/IERC20/IERC20.sol";
import "github.com/mosi-sol/5min/blob/main/07-IERC%20Lib/IERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract SafeModel {
    using Address for address;

    // can not transfer %$1, %$2
    error NotTransfer(bytes data);

    /* ------------------------- ERC20 ------------------------- */
    function safeTransfer(
        IERC20 token, address to, uint256 value ) internal {
        _call20(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(
        IERC20 token, address from, address to, uint256 value) internal {
        _call20(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /* ------------------------- ERC721 ------------------------- */
    function safeTransferFrom(
        IERC721 token, address from, address to, uint256 id) internal {
        _call721(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, id));
    }

    /* ------------------------- lowlevel call hook ------------------------- */
    function _call20(IERC20 token, bytes memory data) private {
        bytes memory hooked = address(token).functionCall(data, "ERROR: call failed");
        if (hooked.length > 0) {
            require(abi.decode(hooked, (bool)), "ERROR: operation failed");
        } else { // else never run, just for security check (debuging)
            revert NotTransfer(data);
        }
    }

    function _call721(IERC721 token, bytes memory data) private {
        bytes memory hooked = address(token).functionCall(data, "ERROR: call failed");
        if (hooked.length > 0) {
            require(abi.decode(hooked, (bool)), "ERROR: operation failed");
        } else { // else never run, just for security check (debuging)
            revert NotTransfer(data);
        }
    }
}
