// SPDX-License-Identifier: MIT
pragma solidity 0.8;

// target
contract TargetContract {
	address public owner;
	
	constructor(address _owner) {
		owner = _owner;
	}
}
