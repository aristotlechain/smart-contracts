// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.28;

contract evenEx{
  
 string public testResult;

 function evenTest(uint256 _num) public returns(string memory){
  if (_num % 2 == 0){
    testResult = "Number is Even ";
  }
  else{
    testResult = "Number is Odd";
  } 
  return testResult;
 }

 function shortHand(uint256 _num) public returns(string memory){
  return _num % 2 == 0 ? testResult = "Number is Even" : testResult = "Number is Odd";
 }
}