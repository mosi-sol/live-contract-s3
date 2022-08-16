// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8;

// zk-Sign = how to smartcontract know about the tx without signing message

contract SignMain {
    bytes4 immutable private TrustSign;

    mapping(address => bytes32) private txSeries;
    mapping(bytes32 => bool) private txSeriesTrue;

    // ---------------------------
    event Claim(address claimer, bytes32 signWithNoMessage, bool notClaim);

    // ---------------------------
    constructor() {
        TrustSign = bytes4(keccak256("txSign(uint8)"));
    }

    // ---------------------------
    function txSign() private returns (bytes32) {
        require(txSeries[msg.sender] == bytes32(0), "you're signed||claimed");
        bytes32 tmp = bytes32(keccak256(abi.encode(TrustSign, msg.sender, txNonce())));
        txSeries[msg.sender] = tmp;
        txSeriesTrue[tmp] = true;
        return tmp;
    }

    function txNonce() private view returns (bytes32) {
        uint8 nonce = salt();
        return bytes32(keccak256(abi.encode(msg.sender, nonce)));
    }

    function salt() private view returns(uint8) {
        // type(uint8).max === 255
        uint8 _salt = 255;
    	return uint8(uint256(
    		keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))
    		)) % _salt; // salt = 0 to 255 
    }

    // ---------------------------
    function claim() public {
        txSign();
        require(txSeries[msg.sender] != bytes32(0), "you're signed/claimed");
        require(txSeriesTrue[txSeries[msg.sender]] == true, "you're claimed");
        txSeriesTrue[txSeries[msg.sender]] = false;
        emit Claim(msg.sender, txSeries[msg.sender], txSeriesTrue[txSeries[msg.sender]]);
    }
}
