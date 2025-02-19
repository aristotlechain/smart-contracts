// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract InventoryTracker {

    // Mapping and Array
    mapping(uint => uint) public stock; // Product ID => Stock quantity
    
    uint[] public productIds;
    
    // Update stock for a product
    function updateStock(uint _productId, uint _newStock) external {
        stock[_productId] = _newStock;
        productIds.push(_productId); // Track unique product IDs
    }
    
    // Get total tracked products
    function getTotalProducts() external view returns (uint) {
        return productIds.length;
    }
}