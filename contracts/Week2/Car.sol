// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.28;
// This Contract will be instanciated  by CarFactory
contract Car{

 address public owner;
 string public model;
 string public salt;
 address public carAddr;

constructor (address _owner, string memory _model,string memory _salt) payable{
    owner = _owner;
    model = _model;
    salt = _salt;
    carAddr = address(this); // Always assign the contract address
 }
}




