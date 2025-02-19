// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract ValueChecker {
    uint256 public  newVal1 =0;
    uint256 public  newVal2 =0;
    uint256 constant CHECK_FIVE=5;
    uint256 constant CHECK_TEN=10;
    // Modifier to check that a value is greater than zero
    modifier greaterThanFive(uint256 _value) {
        require(_value > CHECK_FIVE, "Value must be greater than zero");
        _; // Placeholder for the function's code
    }
    modifier greaterThanTen(uint256 _value) {
        require(_value > CHECK_TEN, "Value must be greater than zero");
        _; // Placeholder for the function's code
    }

    // Function that requires a value greater than zero
    function setValue(uint256 _value1) public greaterThanFive(_value1) {
        newVal1=_value1;
        // Logic for setting the value
    }
    function setValue2(uint256 _value2) public greaterThanTen(_value2) {
        newVal2=_value2;
        // Logic for setting the value
    }
}