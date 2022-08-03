// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract BlockchainSimulation {
    // ***************** requirment *****************
    bytes16 private immutable GENESIS;
    bytes16 private hash;
    uint256 private nonce;
    uint256 private id;
    uint256 private fee;
    mapping(uint256 => bytes16) private prev; // proof by id & hash
    mapping(address => uint256[]) private ownerAddress; // claim
    mapping(uint256 => address) private ownerId; // claim
    bool private start;
    address private immutable ADMIN;

    // ***************** conditions *****************
    modifier isStart(){
        require(start == true, "rule: not started yet");
        _;
    }

    modifier onlyAdmin(){
        require(msg.sender == ADMIN, "rule: you are not moderator of system");
        _;
    }

    // ***************** events *****************
    event Claim(uint256 id, bytes16 past, bytes16 present, address creator, address proof);
    event Pay(uint256 id, address creator, uint256 amoun, uint256 time);

    // ***************** init *****************
    constructor(uint256 _fee) {
        nonce = _genesis();
        GENESIS = bytes16(keccak256(abi.encode(address(this), block.timestamp, msg.sender, nonce)));
        id = 0;
        start = false;
        ADMIN = msg.sender;
        fee = _fee;
    }

    receive() payable external {
        WD();
    }

    // ***************** helpers *****************
    function _genesis() internal view returns (uint256) {
        return uint(
    		keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))
    		) % (block.timestamp - 15);
    }
    
    function getFee() public view returns (uint256) {
        return fee;
    }

    function getGenesis() public view returns (bytes16) {
        return GENESIS;
    }
    
    function getBlock(uint256 _id) public view returns (bytes16) {
        return prev[_id];
    }
    
    function getOwnerById(uint256 _id) public view returns (address) {
        return ownerId[_id];
    }
    
    function getOwnerByAddress(address target) public view returns (uint[] memory) {
        return ownerAddress[target];
    }

    // ***************** cal *****************
    function _generate() internal returns (bytes16 next) {
        next = bytes16(keccak256(abi.encode(address(this), block.timestamp, msg.sender, prev[id - 1])));
        prev[id] = next;
        ownerAddress[msg.sender].push(id);
        ownerId[id] = msg.sender;
        id += 1;
    }

    function WD() internal returns (bool s) {
        (s, ) = ADMIN.call{value: msg.value}("");
        require(s, "rule: withdraw failed");
        emit Pay(id - 1, msg.sender, msg.value, block.timestamp);
    }

    function starting() public onlyAdmin {
        prev[0] = GENESIS;
        ownerId[0] = address(this);
        start = true;
        id += 1;
        emit Claim(0, bytes16(0), GENESIS, address(this), address(0));
    }

    function setFee(uint256 _fee) public onlyAdmin {
        require(_fee > 0, "rule: fee > 0");
        fee = _fee;
    }

    function claim() public payable isStart {
        require(msg.value >= fee && msg.value > 0, "rule: pay to win");
        _generate();
        WD();
        emit Claim(id  - 1, prev[id - 2], prev[id - 1], msg.sender, getOwnerById(id - 2));
    }

}
