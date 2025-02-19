// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.28;

contract EventTicketMiniTest {
 uint256  numberOfBuyTicket; 
 uint256  ticketPrice;
 uint256  totalAmountOfTickets;
 uint256  startAt; 
 uint256 endAt; 
 uint256  timeRange;
 string   message="Buy your first Event Ticket";
 uint256  grandTotal;

 constructor(uint _ticketPrice){
   ticketPrice= _ticketPrice;
   startAt = block.timestamp;
   endAt = block.timestamp + 7 days;
   timeRange = (endAt-startAt) / 60 / 60 / 24;
 }

 // try adding to class payable
 function buyTicket (uint256 _ticketUnits ) public returns(uint256 ticketId){
   //require(msg.value >= _ticketUnits * ticketPrice, "Not enough Ether sent.");
   numberOfBuyTicket++;
   totalAmountOfTickets +=_ticketUnits;
   ticketId = numberOfBuyTicket;
   grandTotal=totalAmountOfTickets*ticketPrice;
 }
 function getNumberOfPurchase() public view returns(uint256 ){
  return numberOfBuyTicket;
 }
 function getTotalAmountOfTickets () public view  returns(uint256 ){
  return totalAmountOfTickets;
 }
 function getGrandTotal() public  view returns(uint256 ){
  return grandTotal;
 }

}