//cannot have function implimentation.
//can inherit from other interface.
//all declared function must be external.
//cannot declare a constructor.
//cannot declare state variable.
// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.28;
contract Counter{
 uint public count;
 function increment() external {
  count += 1;
 }
}

interface ICounter{
 function count() external view returns(uint);
 function increment() external;
}

contract MyContract{
 function incrementCounter(address _counter) external {
  ICounter(_counter).increment();
 }
 function getCount(address _counter) external view returns (uint) {
  return ICounter(_counter).count();
 }
}
//Uniswap example
interface UniswapV2Factory{
 function getPair(address tokenA, address tokenB) external view returns(address pairs);
}
interface UniswapV2Pair{
 function getReserves() external view returns (uint112 reserve0, uint112 reserve1,uint32 blockTimestampLast);
}
contract UniswapExample{
 address private factory = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; //address of uniswap from uniswap address
 address private dai = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;//Todo get the real address 
 address private weth = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;//Todo get the real address

 function getTokenReserves()external view returns (uint, uint ){
  address pair = UniswapV2Factory(factory).getPair(dai,weth);
  (uint reserve0, uint reserve1,)  = UniswapV2Pair(pair).getReserves();//todo explain the casting at the begining
  return (reserve0,reserve1);
 }

}