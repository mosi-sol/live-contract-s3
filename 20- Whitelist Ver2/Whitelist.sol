// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract Whitelist {
    // ===== variables =====
    address immutable owner;
    mapping(address => bool) private _whiteList;
    // for simulation
    mapping(address => uint) private successClaim;
    uint256 private claiming = 0;

    // ===== events =====
    event AddWhiteList(address listed);
    event RemoveWhiteList(address listed);
    
    // ===== modifiers =====
    modifier onlyOwner() {
        require(msg.sender == owner, "only owner access");
        _;
    }
    
    modifier onlyListedUser() {
        require(_whiteList[msg.sender] == true, "only whitelisted user access");
        _;
    }

    // ===== init =====
    constructor() {
        owner = msg.sender;
    }

    // ===== claim simulation =====
    function claim() public {
        require(validate(msg.sender), "not valid user");
        if(isClaimed(msg.sender) > 0){revert("bye bye");}
        claiming += 1;
        successClaim[msg.sender] = claiming;
        _whiteList[msg.sender] = false;
    }

    function isClaimed(address recipient) public view returns (uint256) {
        return successClaim[recipient];
    }

    function getLatestClaimed() public view returns (uint256) {
        return claiming;
    }

    // ===== verify =====
    function validate(address recipient) private view returns (bool) {
        return _whiteList[recipient];
    }

    // ===== single =====
    function addToList(address newUser) public onlyOwner {
        require(_whiteList[newUser] != true, "can't add again");
        _whiteList[newUser] = true;
        emit AddWhiteList(newUser);
    }

    function removeFromList(address theUser) public onlyOwner {
        require(_whiteList[theUser] == true, "address not listed");
        _whiteList[theUser] = false;
        emit RemoveWhiteList(theUser);
    }

    function removeMeFromList() public onlyListedUser {
        _whiteList[msg.sender] = false;
        emit RemoveWhiteList(msg.sender);
    }

    // ===== bulk =====
    function bulkAddToList(address[] memory newUsers) public onlyOwner {
        for(uint i =0; i < newUsers.length; i++){
            require(_whiteList[newUsers[i]] != true, "can't add again");
            _whiteList[newUsers[i]] = true;
            emit AddWhiteList(newUsers[i]);
        }
    }

    function bulkRemoveFromList(address[] memory theUsers) public onlyOwner {        
        for(uint i =0; i < theUsers.length; i++){
            require(_whiteList[theUsers[i]] == true, "address not listed");
            _whiteList[theUsers[i]] = false;
            emit RemoveWhiteList(theUsers[i]);
        }
    }
}
/*
["0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
"0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2",
"0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db"]
*/
