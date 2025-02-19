// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract CalleeCallerSingle {
    uint256 public age;
    uint256 public value;

    function setAge(uint256 _age) public returns (uint256) {
      age = _age;
      return age;
    }
    function setAgeAndSendEther(uint256 _age) public payable returns (uint256, uint256){
      age = _age;
      value = msg.value;
      return (age, value);
    }
}

contract Caller {
    event CallerContract(uint256);
    event CallerContract(uint256,uint256);

    function setAge(CalleeCallerSingle _callee, uint256 _age) public {
      uint256 age = _callee.setAge(_age);
      emit CallerContract(age);
    }

    function setAgeFromAddress(address _addr, uint256 _age) public {
      CalleeCallerSingle callee = CalleeCallerSingle(_addr);
      callee.setAge(_age);
    }

    function setAgeAndSendEther(CalleeCallerSingle _callee, uint256 _age) public payable {
      (uint256 age, uint256 value) = _callee.setAgeAndSendEther{value: msg.value}(_age);
      emit CallerContract(age,value);
    }
}