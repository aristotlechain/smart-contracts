// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract InterfaceContractCallee {

    uint256 public data;
    uint256 public sum;

    function setData(uint256 _data) external {
        data = _data;
    }

    function getData() view external returns(uint256) {
        return data;
    }

    function add(uint256 _a, uint256 _b) external returns(uint256){
        sum = _a + _b;
        return sum;
    }

}