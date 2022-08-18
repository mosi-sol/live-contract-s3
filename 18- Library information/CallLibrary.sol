// SPDX-License-Identifier: MIT
pragma solidity 0.8;

library Calls {
    event CallIn(address,uint256,bytes,bool);
    event CallOut(address,uint256,bool);
    function callIn(address recipient, uint256 amount) internal returns (bool success) {
        (success, ) = recipient.call{value: amount}("");
        require(success);
        emit CallIn(recipient,amount,msg.data,success);
    }
    function callOut(address recipient, uint256 amount) internal returns (bool success) {
        (success, ) = recipient.call{value: amount}("");
        require(success);
        emit CallOut(recipient,amount,success);
    }
}


// just import library OR write in same file like top
contract MockCall {
    using Calls for address;

    fallback() external payable {
        if(msg.value > 0)
            require(Calls.callIn(address(this), msg.value));    
    }

    receive() external payable {}

    function balanceOf() public view returns (uint256) {
        return address(this).balance;
    }

    // type 1: library.function()arguments
    function deposit() public payable {
        require(Calls.callIn(address(this), msg.value));  
    }

    // type 2: using library for type; type as frist arg: type.function(other arguments);
    function withdraw() public {
        uint256 bal = balanceOf();
        require(msg.sender.callOut(bal));  
    }
}
