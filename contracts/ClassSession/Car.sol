// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Car {

    address public owner;
    string public model;
    string public salt;
    address public callerAddr;
    address public carAddr;


    constructor (address _owner, string memory _model, string memory _salt, address _calleradd) payable {

        owner = _owner;
        model = _model;
        salt = _salt;
        callerAddr = _calleradd;
        carAddr = address(this);
    }

    function getCar() public view returns (address, string memory, string memory, address, address) {
        return (owner, model, salt, callerAddr, carAddr);
    }

}