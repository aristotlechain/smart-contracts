// Example 7: Payment splitter
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
contract PaymentSplitterEx {
    address payable public recipient1;
    address payable public recipient2;

    constructor(address payable _recipient1, address payable _recipient2) {
        recipient1 = _recipient1;
        recipient2 = _recipient2;
    }

    // This function splits any incoming Ether evenly between two recipients
    function splitPayment() external payable {
        //require(msg.value > 0, "Payment must be greater than 0");
        uint half = msg.value / 2;

        recipient1.transfer(half);
        recipient2.transfer(msg.value - half); // Remainder goes to recipient2
    }
}