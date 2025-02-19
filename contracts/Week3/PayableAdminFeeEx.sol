// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

// Example 8: Admin-restricted payable function
contract AdminFee {
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    // Only the admin can send funds using this function
    function collectFee() external payable {
        require(msg.sender == admin, "Only the admin can pay fees");
        // Logic to handle the received fee can be implemented here
    }
}