// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract IfElseSkeleton {
    bool condition = true;

    function test() public view {
        if (condition == true) {
            // Code to execute if the condition is true
        } else {
            // Code to execute if the condition is false
        }

        if (condition == false) {
            // Code to execute if condition1 is true
        } else if (condition == true) {
            // Code to execute if condition1 is false and condition2 is true
        } else {
            // Code to execute if none of the previous conditions are true
        }
    }
}