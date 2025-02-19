// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
contract StructBookEx{
  uint private storeCount;
  string public storeName;
  Book public myBook = Book(1,"Test name","Test author");
  struct Book {
    uint bookId;
    string bookName;
    string bookAuthor;
  }
  constructor(){
    storeCount=1;
    storeName="Test Store";
  }
  function getBook () public pure returns (Book memory _book){
    _book = Book(3,"Test name3","Test author3");
    return _book;
  }
  function incrementStoreCount() public  {
    storeCount++;
  }
  function getStoreCount() public view returns(uint) {
    return storeCount;
  }
}
