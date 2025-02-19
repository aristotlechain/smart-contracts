// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
contract DelegatecallTestCallee{  //deploy DelegateCallStep1 and then deploy
    uint256 test;
    function setValue(uint256 _test)external payable {
        test=_test+2;
        //test=_test+3;
    } 
    function getTest() public view returns (uint256 ){
        return test;
    }
}
contract DelegatecallTestCallerSingle {
    uint256 test;
    address cc;  // Store the address of the Receiver contract
    constructor(address _contract) {
        cc = _contract;
    }
    function testDelegateCall(address _contract,uint256 _test) public payable {
        bytes memory data1=abi.encodeWithSignature("setValue(uint256)", _test);
        (bool success1, bytes memory data2) = _contract.delegatecall(data1);
        emit LogMessage(success1,data2);

        //(bool success2, bytes memory data3) = _contract.delegatecall(abi.encodeWithSignature("setValue(uint256)", _test));
        //emit LogMessage(success2,data3);
        
        //(bool success, bytes memory data) = _contract.call{value: msg.value}(abi.encodeWithSignature("setValue(uint256)", 100));
    }
    function getTest() public view returns (uint256 ){
        return test;
    }
    event LogMessage(bool success,bytes data);
}

//1.Deploy DelegatecallTestCallee 2. DelegatecallTestCallerSingle
//3. Run 1 Time Both in following order DelegatecallTestCallerSingle, DelegatecallTestCallee
//4. Try to set vale of callee setting value in DelegatecallTestCallerSingle would not set value in DelegatecallCallee
//5. update the Function of DelegatecallTestCallee and redeploy only DelegatecallTestCallee.
//6. DelegatecallTestCallerSingle would use the previous code as it is running code 
//of previous version in its own contect 
//7. Variable in the Two contracts needs to be exactly same name  number etc

//Note Storage layout must be the same between the 2 contracts i.e DelegatecallTestCallee & DelegatecallTestCallerSingle
//The key aspect here is that even though the setValue function is defined in Contract DelegatecallTestCallee,
//it modifies the storage of Contract DelegatecallTestCallerSingle (the caller).
//Storage layout must be the same: If not, delegatecall can lead to corrupted state.

//Security risks: Improper use can make contracts vulnerable to attack, as the logic
//of the implementation contract operates on the storage of the proxy.
