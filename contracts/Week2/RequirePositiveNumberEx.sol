// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract RequirePositiveNumberEx {
    uint256 public number;
    // Function that sets the number, only if it's greater than zero
    function setNumber(uint256 _number) public {
        
        require(_number > 0, "Number must be greater than zero");
        number = _number;
        
        // same as above
        if (_number > 0) {
            number = _number;
        } else {
            revert("Number must be greater than zero");
        } 
        // same as above
        if (_number <= 0) {
            revert("Number must be greater than zero");
        } else {
            number = _number;
        }
    }
}