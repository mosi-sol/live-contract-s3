// SPDX-License-Identifier: MIT
pragma solidity 0.8;

/// debugging error
error ch(uint256 id, address sender, uint256 date);

contract BlockchainSimulation {
    // ***************** requierment *****************
    uint256 id;
    mapping(uint256 => bytes32) private chain;
    mapping(uint256 => bytes32) private root;

    // ***************** events *****************
    event Generate(uint256 id, address sender, uint256 date, bytes32 chain, bytes32 previusProof, bytes32 root);

    // ***************** init *****************
    constructor () {
        chain[0] = bytes32(0);
        root[0] = bytes32(0);
        id = 0;
    }

    receive() payable external {}

    // ***************** proof *****************
    function generate() public returns (bytes32 newBlock) {
        newBlock = _generate();
    }

    function _generate() private returns (bytes32 newBlock) {
        id += 1;
        bytes memory theBlock = abi.encode(id, msg.sender, block.timestamp);
        newBlock = keccak256(abi.encode(theBlock, msg.data));
        chain[id] = newBlock;
        root[id] = keccak256(abi.encode(newBlock, chain[id - 1]));
        emit Generate(id, msg.sender, block.timestamp, newBlock, root[id - 1], root[id]);
    }

    // ***************** checker *****************
    function checkProof(uint256 _id) public view returns (bool) {
        require(_id > 0, "genesis is safe");
        bytes32 tmp = keccak256(abi.encode(chain[_id], chain[_id - 1]));
        return root[_id] == tmp;
    }
    
    function checkProof(bytes32 target, bytes32 previus) public view returns (bool s, uint256 j, bytes32 t) {
        bytes32 tmp = keccak256(abi.encode(target, previus));
        for(uint256 i=0; i <= id; i++){
            if(root[i] == tmp) { 
                s = true;       // compare summury
                j = i;          // id
                t = root[i];    // root
            }
        }
    }

    // ***************** find *****************
    function getChain(uint256 _id) public view returns (bytes32) { // leaf
        return chain[_id];
    }
    
    function getProof(uint256 _id) public view returns (bytes32) { // root
        return root[_id];
    }

}
