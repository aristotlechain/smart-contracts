// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IContract{

    function setData(uint256 _data) external ;
    function getData() external view returns(uint256);

    function add(uint256, uint256) external returns (uint256);

}

contract InterfaceContractCaller {
    IContract public iCC;

    constructor (address _iCC){
        iCC = IContract(_iCC);
    }

    function setiICC(uint256 _data) external {
        iCC.setData(_data);
    }

    function addICC(uint256 _x, uint256 _y) public {
        iCC.add(_x, _y);
    }

}