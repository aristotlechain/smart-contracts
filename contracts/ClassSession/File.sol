// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IncrementCalleeViaCall{
    receive() external payable{}// try commenting this out
    fallback()external payable{
        emit Received(msg.sender, msg.value, "Fallback was called due to data");
    }
    uint public y;
    function increment(string memory _message, uint _x) external payable returns (uint){
        emit Received (msg.sender, msg.value, _message);
        y=_x + 1;
        return _x + 1;
    }
    event Received(address caller, uint amount, string message);
}
//Lets imagine that contract Caller does not have the source code for the Contrct Receiver but we do know the address of the Contract Receiver and the address to call
contract IncrementCallerViaCall {
    address rc;  // Store the address of the Receiver contract
    // Constructor to set the address of the Receiver contract
    constructor(address _rc) {
        rc = _rc;
    }
    function testCallIncrement() public payable returns (bytes memory) {
       
        //(bool success ,) = rc.call{value: msg.value, gas:5000} (abi.encodeWithSignature("increment(string,uint","test",123));
 
        //(bool success , bytes memory data) = rc.call{value: msg.value, gas:5000} (abi.encodeWithSignature("increment(string,uint","test",123));
        //or
        bytes memory data = abi.encodeWithSignature("increment(string,uint256)", "test", 124);
        (bool success, bytes memory returnData) = rc.call{value: msg.value}(data);
       
        // Emit the response
        emit Response(success,returnData);
        return returnData;
    }
    function testCallDoesNotExist(address payable _addr) public { //payable
        (bool success, bytes memory data) = _addr.call(abi.encodeWithSignature("doesNotExist()"));
        emit Response(success, data);
    }
    event Response (bool success , bytes data);
}
//Call Function Keywords  One wallet to other method called "call".
