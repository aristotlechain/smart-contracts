// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
//Enum can only store int by default better than storing integerq
//Enum is fixed size Cannot be chnaged Dynamically.
//Space efficiency and make less mistake more readbale code.
contract EnumEx {
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    Status public myenum;

    //returns uint Pending-0,Shipped-1,Accepted-2,Rejected-3,Canceled-4
    function get() public view returns (Status) {
        return myenum;
    }

    //Update status by passing uint into input
    function set(Status _status) public {
        myenum = _status;
    }

    function accepted() public {
        myenum = Status.Accepted;
    }

    //Update status to Specifc enum
    //function cancel(Status _status) public {
    function cancel() public {
        myenum = Status.Canceled;
    }

    //Same as Pending or delete status or reset function
    function pending() public {
        myenum = Status.Pending;
    }

    //delete resets the enum to its first value,0
    function reset() public {
        delete myenum;
    }

    function shipped() public {
        myenum = Status.Shipped;
    }

    //returns uint Pending-0,Shipped-1,Accepted-2,Rejected-3,Canceled-4
    function show() public view returns (string memory stat) {
        if (myenum==Status.Pending){
            stat="Pending";
        }
        else if (myenum==Status.Pending){
            stat="Pending";
        }
        else if (myenum==Status.Shipped){
            stat="Shipped";
        }
        else if (myenum==Status.Accepted){
            stat="Accepted";
        }
        else if (myenum==Status.Rejected){
            stat="Rejected";
        }
        else if (myenum==Status.Canceled){
            stat="Canceled";
        }
        return stat;
    }
}
