// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
contract MappingStructStep1{
  uint private storeCount;
  string public storeName;
  struct Book {
    uint bookId;
    string bookName;
    string bookAuthor;
    bool   audioversion;
  }
  Book public myBook = Book(1,"Test name","Test author",false);
  constructor(){
    storeCount=1;
    storeName = "Test Store";
  }
  function incrementStoreCount() public  {
    storeCount++;
  }
  function getStoreCount() public view returns(uint) {
    return storeCount;
  }
  function getBook() public pure returns (Book memory _book){
    _book = Book(3,"Test name3","Test author3",false);
    return _book;
  }
}
