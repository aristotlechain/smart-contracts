// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
//untested
contract SimpleBank {
    mapping(address => uint256) public balances;

    // Modifier to check if the sender has a sufficient balance
    modifier hasSufficientBalance(uint256 _amount) {
        if (balances[msg.sender] < _amount) {
            return; // Simply return without doing anything if balance is insufficient
        }
        _; // Placeholder for the function's code
    }

    // Function to deposit Ether into the contract
    function deposit() public payable {
        balances[msg.sender] = balances[msg.sender] + msg.value; // Increase the user's balance
    }

    // Function to withdraw Ether, using the hasSufficientBalance modifier
    function withdraw(uint256 _amount) public hasSufficientBalance(_amount) {
        // Deduct the amount from the user's balance
        balances[msg.sender] = balances[msg.sender] -_amount;

        // Transfer the amount to the sender
        payable(msg.sender).transfer(_amount);
    }
}