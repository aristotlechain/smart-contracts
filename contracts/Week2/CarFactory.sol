// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "./Car.sol";

//Push values in CarFactory using the 4 different constructor and see the values using get and indexm  

contract CarFactory {

    Car[] public cars;
    //Both Create create their own instance This does not push any value in Balance
    function create(address _owner, string memory _model, string memory _salt) public {
        Car car = new Car(_owner, _model,_salt);
        cars.push(car);
    }
    //Both Create create their own instance This creates and
    function createAndSendEther(address _owner, string memory _model, string memory _salt) public payable{
        Car car = new Car {value: msg.value} (_owner, _model,_salt);
        cars.push(car);
    }

    function getCar(uint _index) public view returns (address owner, string memory model,address carAddr, uint balance,string memory salt){
        Car car = cars[_index];
        return (car.owner(), car.model(),car.carAddr(), address(car).balance, car.salt());
    }

}
