// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
//Deploy all contract at same time giving input text
contract Contract1 {
    //X
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract Contract2 {
    //Y
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

//There are two ways to initilize parent contract with parameters.
//Pass the parameter here in the inheritance list. Order is  important
//B
contract Contract3 is Contract1("Input to Contract1"),Contract2("Input to Contract2"){

}

//Pass the parameter here in the constructor. Similar to fucntion modifier.
//C
contract Contract4 is Contract1, Contract2 {
    constructor(string memory _name, string memory _text)
        Contract1(_name)
        Contract2(_text)
    {}
}

//Parent Constructor are always called in the order of inheritance
//regadless of the order of the parent contract listed in the constructor of the child contract.
//order of the constructor called Constructor1 Constructor2 Constructor3
//D
contract Contract5 is Contract1, Contract2 {
    constructor()
        Contract1("Input to Constructor1")
        Contract2("Input to Constructor2")
    {}
}

//Order of constructor Constructor1 Constructor2 Constructor6
//E
contract Contract6 is Contract1, Contract2 {
    constructor()
    Contract2("Input to Constructor2")
    Contract1("Input to Constructor1")
    {}
}
