// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract Proxy {
	event Deploy(address addr);
	
	function deploy(bytes memory _code) external payable returns (address addr_) {
		assembly{
			addr_ := create(callvalue(), add(_code, 0x20), mload(_code))
		}
		require(addr_ != address(0), "failed");
		emit Deploy(addr_);
	}
	
	// 1
	function getBytecode(address _owner) public pure returns (bytes memory) {
		bytes memory bytecode = type(TargetContract).creationCode;
		return abi.encodePacked(bytecode, abi.encode(_owner)); // call constructor
		// return bytecode; // not constructor
	}
	
	// return by : encodeWithSignature <-- for call functions
}
