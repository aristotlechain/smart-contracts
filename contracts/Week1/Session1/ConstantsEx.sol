// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract ConstantsEx {
    address public constant MY_ADDR = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address public MY_ADDR1 = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

    function getConstant() public pure returns (address) {
        //No issue
        //function getConstant() public returns (address){ //Warning about pure and view
        return MY_ADDR;
    }

    function getNonConstant() public view returns (address) {
        //Warning about pure and view
        //function getNonConstant() public returns (address ){
        return MY_ADDR1;
    }
}