// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;
contract Auction {
    address payable public highestBidder;
    uint public highestBid;

    function bid() external payable {
        require(msg.value > highestBid, "Bid must be higher than the current highest bid");

        // Refund the previous highest bidder
        if (highestBidder != address(0)) {
            highestBidder.transfer(highestBid);
        }

        highestBidder = payable(msg.sender);
        highestBid = msg.value;
    }
}