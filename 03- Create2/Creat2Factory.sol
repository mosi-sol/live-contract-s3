// SPDX-License-Identifier: MIT
pragma solidity 0.8;

// target
import "./TargetContract";

// create target
contract Create2Factory {
	event Deploy(address addr);
	
	// 1
	function getBytecode(address _owner) public pure returns (bytes memory) {
		bytes memory bytecode = type(TargetContract).creationCode;
		return abi.encodePacked(bytecode, abi.encode(_owner));
	}

	// 2
	function getAddress(bytes memory bytecode, uint _salt) public view returns (address) {
		bytes32 hash = keccak256(
			abi.encodePacked(
				bytes1(0xff), address(this), _salt, keccak256(bytecode)
			)
		);
		return address(uint160(uint(hash)));
	}
  
	// 3
	function deploy(uint _salt) external {
		TargetContract _contract = new TargetContract{salt: bytes32(_salt)}(msg.sender);
		emit Deploy(address(_contract));
	}


}
