// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ProductDetails {

    // A struct to store product metadata
    // Structs group related data fields together
    struct Product {
        string name;  
        uint price;     
        uint stock;   
    }

    // Map product IDs to their details
    // Uninitialized Product structs will have default values (e.g., price = 0)
    mapping(uint => Product) public products;

    // Add or overwrite product details for a given ID
    function addProduct(uint _id, string memory _name, uint _price, uint _stock) external {
        products[_id] = Product(_name, _price, _stock); // Store struct in mapping
    }
}