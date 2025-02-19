// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
contract DelegatecallCallee {
    uint256 public num;
    address public sender;
    uint256 public value;
    function setVar(uint256 _num) public payable {
        //num = _num + num;
        num = _num * 2 ; //different logic
        sender = msg.sender;
        value = msg.value;
    }
    function getState() public view returns (uint256,address,uint256){
        return (num, sender, value);
    }
}
contract  DelegatecallCallerSingle{
    uint256 public num;
    address public sender;
    uint256 public value;
    function setVar(address _contract, uint256 _num) public payable {
        bytes memory data1 = abi.encodeWithSignature("setVar(uint256)", _num);
        emit LogMessage(data1);

        (bool success2, bytes memory data2) =_contract.delegatecall(data1);
        emit LogMessage(success2,data2);
        //(bool success,) = _contract.delegatecall(abi.encodeWithSignature("setVar(uint256)", _num));
        //(bool success, bytes memory data) = _contract.delegatecall(abi.encodeWithSignature("setVar(uint256)", _num));
    }
    function getState()public view returns (uint256,address,uint256){
        return (num, sender, value);
    }
    event LogMessage(bytes data);
    event LogMessage(bool success,bytes data);
}
//1.Deploy DelegatecallCallee 2. DelegatecallCallerSingle
//3. Run 1 Time Both in following order DelegatecallCallerSingle, DelegatecallCallee
//4. Try to set vale of callee setting value in DelegatecallCallerSingle would not set value in DelegatecallCallee
//5. update the Function of DelegatecallCallee and redeploy only callee.
//6.DelegatecallCallerSingle would use the previous code as it is running code 
//of previous version in its own contect 

//Note Storage layout must be the same between the 2 contracts i.e DelegatecallCallee & DelegatecallCallerSingle
//The key aspect here is that even though the setVars function is defined in Contract DelegatecallCallee,
//it modifies the storage of Contract DelegatecallCallerSingle (the caller).
//Storage layout must be the same: If not, delegatecall can lead to corrupted state.

//Security risks: Improper use can make contracts vulnerable to attack, as the logic
//of the implementation contract operates on the storage of the proxy.
