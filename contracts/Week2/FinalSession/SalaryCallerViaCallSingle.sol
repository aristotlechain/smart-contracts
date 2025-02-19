//Call Function Keywords  One wallet to other method called "call".
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
contract SalaryCalleeViaCallSingle {
    event Received(address caller, uint256 amount, string message);
    uint256 public salaryNew ;
    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }
    receive() external payable {} // try commenting this out
    function increaseSalary(string memory _message, uint256 _salary) public payable returns (uint256) {
        emit Received(msg.sender, msg.value, _message);
        salaryNew=_salary + 1;
        return _salary + 1;
    }
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    function getSalaryNew() public view returns (uint256) {
        return salaryNew;
    }
}
contract SalaryCallerViaCall {
    
    event Response(bool success, bytes data); //You can send ether and specify a custom gas amount
    function callSalary(address payable _addr) public payable returns (bytes memory) {
        (bool success, bytes memory data) = _addr.call{value: msg.value,gas: 620000}(abi.encodeWithSignature("increaseSalary(string,uint256)", "inc Salary", 123));
        emit Response(success, data); //,gas: 5000
        return data;
    }
    function increaseSalary(address payable  _addr,uint256 _sal) public payable returns (bytes memory) {
        //(bool success, bytes memory data) = _addr.call(abi.encodeWithSignature("increaseSalary(string,uint256)", "inc Salary)", _sal));
        //emit Response(success, data);
                            
         bytes memory data1 =abi.encodeWithSignature("increaseSalary(string,uint256)", "inc Salary",_sal);
         (bool success2, bytes memory data2) = _addr.call{value: msg.value}(data1);
         emit Response(success2, data2);
        
        return data2;
    }
    //calling a function that does not exist triggers fallback fucntion
    function callDoesNotExist(address payable _addr) public {  //payable
        (bool success, bytes memory data) = _addr.call(abi.encodeWithSignature("doesNotExist()"));
        emit Response(success, data);
    }
}
//Lets imagine that contract Caller does not have the source code for the Contrct Receiver
//but we do know the address of the Contract Receiver and the address to call

/*
contract ReceiveEther {
    receive() external payable {}
    fallback() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}*/