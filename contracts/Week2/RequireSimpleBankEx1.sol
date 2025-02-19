// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract RequireSimpleBankEx {
    mapping(address => uint256) public balances;

    // Function to deposit Ether into the contract
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // Function to withdraw Ether from the contract
    function withdraw(uint256 _amount) public {
        
        if (balances[msg.sender] < _amount) {
            // Revert with a custom error message if the balance is insufficient
            revert("Insufficient balance");
        } else {
            // Deduct the amount from the user's balance
            balances[msg.sender] -= _amount;

            // Transfer the amount to the sender
            payable(msg.sender).transfer(_amount);
        }

        //or use this way

        require(balances[msg.sender] >= _amount, "Insufficient balance");
        // Deduct the amount from the user's balance
        balances[msg.sender] -= _amount;

        // Transfer the amount to the sender
        payable(msg.sender).transfer(_amount);
    }
}