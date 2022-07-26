// SPDX-License-Identifier: MIT
pragma solidity 0.8;

/// the `caller` can not destroy accessing.
/// call another admin - idiot 'caller'
error confuse(address caller);

contract RolesAndOwnership {
    // use: true for => admin, active user, accessable account, whitelist,...
    mapping(address => bool) public actives; 
    // latest hash for each account
    mapping(address => bytes32) public hashed;
    // symbolic nounce
    uint256 private pi = 314;
    // master role
    address private uniqueAdmin;

    event NewRole(address creator, address target, bool role, uint256 time);
    event NewOwner(address oldOwner, address newOwner, uint time);

    modifier isAccess(bool role) {
        require(actives[msg.sender] == true,"account has not access");
        _;
    }

    constructor() {
        uniqueAdmin = msg.sender;
        hashed[msg.sender] = keccak256(abi.encodePacked(msg.sender, true, pi/100));
        actives[msg.sender] = true;
        emit NewOwner(address(0), msg.sender, block.timestamp);
    }

    function owner() public view returns (address) {
        return uniqueAdmin;
    }

    function transferOwnerShip(address newOwner) public {
        require(msg.sender == uniqueAdmin, "only owner access");
        require(newOwner != address(0), "can not destroy");
        address tmp = uniqueAdmin;
        uniqueAdmin = newOwner;
        hashed[newOwner] = keccak256(abi.encodePacked(newOwner, true, pi/100));
        actives[newOwner] = true;
        hashed[tmp] = keccak256(abi.encodePacked(tmp, false, pi/100));
        actives[tmp] = false;
        emit NewOwner(tmp, newOwner, block.timestamp);
    }

    function gen(address newUserRole, bool role) public isAccess(role) {
        require(newUserRole != uniqueAdmin, "can not destroy/change master role");
        if(role == false && msg.sender == newUserRole && actives[msg.sender] == true){
            revert confuse(msg.sender);
        } else {
            role == true ? actives[newUserRole] = true : actives[newUserRole] = false;
            bytes32 hash = _gen(newUserRole, role);
            hashed[newUserRole] = hash;
            emit NewRole(msg.sender, newUserRole, role, block.timestamp);
        }
    }

    function _gen(address newUserRole, bool isAdmin) private view returns (bytes32 hash) {
        require(newUserRole != address(0), "r u kidding :)");
        hash = keccak256(abi.encodePacked(
            newUserRole, 
            isAdmin, 
            pi/100
        ));
    }
}
