// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract EventOwnable {
    //Tell me who is the owner
    address public owner;
    //event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    constructor() {
        owner = msg.sender; // Set the contract deployer as the owner
    }
    function transferOwnership(address _newOwner) payable public {
        require(msg.sender == owner, "You are not the owner"); // Check if caller is the owner
        //emit OwnershipTransferred(owner, _newOwner); // Emit the event
        owner = _newOwner; // Update the owner
    }
}