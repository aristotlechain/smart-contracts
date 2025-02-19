// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract EventFundraising {
    event Funded(address indexed contributor, uint256 amount);
     //check and message no transfer
    function contribute() public payable {
        require(msg.value > 0, "Must send some ether"); // Ensure a contribution is made
        emit Funded(msg.sender, msg.value); // Emit the Funded event
    }
}