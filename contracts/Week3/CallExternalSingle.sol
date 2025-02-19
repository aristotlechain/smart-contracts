// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
//This is Dependent on CalleeExternalSingle CallerMain and is using New keyword
//Deploy CalleeExternalSingle  then deploy CallerMain
contract CalleeExternalSingle {
    address public owner;
    //try catch  used in External Contract
    constructor(address _owner) {
        require(_owner != address(0), "invalid address");
        assert(_owner != 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        owner = _owner;
    }
    function myFunc(uint256 x,uint256 y) public pure returns (uint256) {
        require(x != 0 && y != 0 , "require failed");
        uint256 z= x+y;
        return (z);
    }
}
contract CallerMain {
    event Log(uint256 message);
    event Log(string message);
    CalleeExternalSingle public callext;
    constructor() {
        //This Foo Contrat is used for example of try catch with external call.
        callext = new CalleeExternalSingle(msg.sender);
    }
    function tryCatchExternalCall(uint256 _x,uint256 _y) public {
        try callext.myFunc(_x,_y) returns (uint256){
            uint256 result=callext.myFunc(_x,_y);
            emit Log(result);
            
        } catch {
            emit Log("External call failed ");
        }
    }
}

