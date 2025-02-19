// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.28;


contract ContractCallee  { //contract ContractCallee is IContract{
    uint256 public data;
    function setData(uint256 _data)external{
        data= _data;
    }
    
}

contract InterfaceContractCaller {
    IContract public contractCallee;
    constructor (address _contractCalleeAaddress){
        contractCallee= IContract(_contractCalleeAaddress);
    }
    function setDataInContractA(uint256 _data)external{
        contractCallee.setData(_data);
    }
}

interface IContract{
    function setData(uint256 _data) external;
    //function data()external view returns(uint256);
}
