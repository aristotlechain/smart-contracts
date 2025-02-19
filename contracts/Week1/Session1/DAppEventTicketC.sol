// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract EventTicketMiniTest {
    uint256 numberOfBuyTickets;
    uint256 public  ticketPrice;
    uint256 totalAmountOfTickets;
    uint256 startAt;
    uint256 endAt;
    uint256 timeRange;
    string message = "Buy yourfirst";
    uint256 grandTotal;

    constructor(uint256 _ticketPrice) {
        ticketPrice = _ticketPrice;
        startAt = block.timestamp;
        endAt = block.timestamp + 7 days;
        timeRange = (endAt - startAt) / 60 / 60 / 24;
    }

    function buyTicket(uint256 _ticketUints) public returns (uint256 ticketId) {
        numberOfBuyTickets++;
        totalAmountOfTickets = totalAmountOfTickets + _ticketUints;
        ticketId = numberOfBuyTickets;
        grandTotal = totalAmountOfTickets * ticketPrice;
    }

    function getNumberOfPurchase() public view returns (uint256) {
        return numberOfBuyTickets;
    }

    function getTotalAmountOfTickets() public view returns (uint256) {
        return totalAmountOfTickets;
    }

    function getGrandTotal() public view returns (uint256) {
        return grandTotal;
    }
}