// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;
contract PayableFunction {
    address public owner;
    uint256  public  contractBalance;
    address  payable public  contractBalance2;
    constructor() {
        owner = msg.sender;
    }
    // Payable function to accept Ether
    function deposit() public payable {
        contractBalance = contractBalance+msg.value; // Increase contract's balance
    }
    // View function to get contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance; // Return contract's Ether balance
    }
    function getContractBalance() public view returns (uint256) {
        return contractBalance; // Return contract's Ether balance
    }
}
//standalone