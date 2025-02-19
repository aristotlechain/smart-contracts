// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.27;

interface ICalculator {
    function add(uint a, uint b) external pure returns (uint);
    function subtract(uint a, uint b) external pure returns (uint);
    function multiply(uint a, uint b) external pure returns (uint);
    function divide(uint a, uint b) external pure returns (uint);
}

contract Calculator is ICalculator {
    function add(uint a, uint b) external pure override returns (uint) {
        return a + b;
    }

    function subtract(uint a, uint b) external pure override returns (uint) {
        return a - b;
    }

    function multiply(uint a, uint b) external pure override returns (uint) {
        return a * b;
    }

    function divide(uint a, uint b) external pure override returns (uint) {
        require(b != 0, "Division by zero");
        return a / b;
    }
}