// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract DataType{
 bool public hey;  // false default
 bool public no = true;
 //UINT  no negitive only positive.
 uint8   public u8 = 1;  // 0 - 255 .Uint26 2 ^ 16
 uint256 public u256 = 123;
 uint    public u = 123;
 
 //Nagative number
 int8 public i8 = -1; //-2 * 256-1
 int public  i256 = 456;
 int public i = -1234;
 //Add min and Max
 int public minInt = type (int).min;
 int public maxInt = type (int).max;

 //Array 2 Types of array byte/string
 //fixed size and dynamic sized
 bytes1 public aa; //0x00
 bytes1 public bb;
 
 bytes1 public a = 0x05;
 bytes1 public b = 0x06; 
  //address
 address public hey1=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
 address public addr=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
 
 bool public defBool;//false;
 uint public number;//0
 uint public defInt;//0
 address public hey2=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;//0x00
}