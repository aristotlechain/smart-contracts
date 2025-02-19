// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract MyFirstContract {
    string public hey = "Hello"; //Show method. getter Fucntion Look at byte code is Empty. Bal 0
    uint256 public no = 4; //Show method. getter Fucntion Look at byte code is Empty. Bal 0

    //No inital val
    string _hey_method; //No inital val
    uint256 public no_method;

    //state variable initilized with constructor
    constructor(string memory n_hey_method, uint256 _no_method) {
        hey = n_hey_method;
        no = _no_method;
    }

    //state variable initilized with method
    function addInfo(string memory n_hey_method, uint256 _no_method) public {
        hey = n_hey_method;
        no = _no_method;
    }
}
