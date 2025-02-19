// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

//Abi Encodeailed
interface IERC20 {
    function transfer(address, uint256) external;
}

contract Token is IERC20{
    function transfer(address, uint256) external {}
}

contract AbiEncode {
    function test(address _contract, bytes calldata data) external {
        (bool ok, ) = _contract.call(data);
        require(ok, "call failed");
    }

    function encodeWithSignature(address to, uint256 amount)external pure returns (bytes memory){
        //Typo is not checked - "transfer (address, uint)"
        return abi.encodeWithSignature("transfer(address,uint256)", to, amount);
    }

    function encodeWithSelector(address to, uint256 amount)external pure returns (bytes memory){
        //Tye is not checked - IERC20.transfer.selector true amount
        return abi.encodeWithSelector(IERC20.transfer.selector, to, amount);
    }

    function encodeCall(address to, uint256 amount) external pure returns (bytes memory){
        //Typo and type error will not compile
        return abi.encodeCall(IERC20.transfer, (to, amount));
    }
}
