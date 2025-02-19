// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Crowdfunding {
    address payable public   owner;
    uint256 public fundingGoal;
    uint256 public totalFunds;
    mapping(address => uint256) public contributions;
    bool public goalReached;
    event Log(address indexed sender,string message);

    // Set the owner and the funding goal when deploying the contract
    constructor(uint256 _goal) {
        owner = payable(msg.sender);
        fundingGoal = _goal;
    }

    // Function to contribute Ether to the crowdfunding
    function contribute()  public payable {
        //require(msg.value > 0, "Must send some Ether");
        if (msg.value > 0){ 
            //contributions[msg.sender] += msg.value;
            contributions[msg.sender] = contributions[msg.sender] + msg.value;
            //totalFunds += msg.value;
            totalFunds  = totalFunds+msg.value;
        }
        else 
            emit Log(msg.sender,"Must send some Ether");
    }

    // Function to withdraw funds if the funding goal is reached
    function withdrawFunds() public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(totalFunds >= fundingGoal, "Funding goal not reached");
        require(!goalReached, "Funds have already been withdrawn");

        goalReached = true; // Mark the goal as reached to prevent multiple withdrawals
        owner.transfer(totalFunds); // Transfer all funds to the owner
    }

    // Function to get the balance of the contract
    function getContractBalance() public view  returns (uint256) {
        return address(this).balance;
    }

    // Function to get the contribution of a specific address
    function getContribution(address _contributor) public view returns (uint256) {
        return contributions[_contributor];
    }
}