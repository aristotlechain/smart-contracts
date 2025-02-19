//Event are suppose to be cheap on Fee state variable are expensive
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract EventAndLog {
    //Event Declaration
    //Up to 2 parameters can be indexed. Indexed param help you filter
    //the logs by index param
    event Log(address indexed sender, string message);
    event AnotherLog();
    event AnotherLog(string message);

    // Simple messages
    function test() public {
        emit Log(msg.sender, "Hello");
        emit AnotherLog("Yet another Hello EMV!");
    }
}
