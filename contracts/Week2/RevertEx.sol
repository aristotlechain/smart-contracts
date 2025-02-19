// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract RevertEx {
    uint256 public maxLimit = 100;

    // Function to set a new value with a validation check
    function setValue(uint256 _value) public view {
        if (_value > maxLimit) {
            revert("Value exceeds the maximum limit");
        }

        // Logic for setting the value if the condition is met
        // In a real contract, you might store this value or perform some other action
    }
}