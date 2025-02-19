// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.28;

contract PassFailEx{
 uint256 public passMarks = 60;
 string public myResult;

 function testResult(uint256 _num) public returns(string memory){
  if (_num <= passMarks){
    myResult = "You Failed";
  }
  else if (_num>passMarks){
	  myResult = "You Passed";
  }
  return myResult;
 }

 function testResultShort(uint256 _num) public returns(string memory){
  return _num <=passMarks ? myResult = "You Failed" : myResult = "You Passed";
 }
}