// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
contract StorageMemoryStructEx {
    struct Product {
        string name;
        uint price;
    }
    Product[] public products;
    //calldata
    function addProduct(string memory _name, uint _price) public {
        products.push(Product(_name, _price));
    }
    // Function that modifies a product's details using storage
    function updateProduct(uint _index, string memory _newName, uint _newPrice) public {
        Product storage product = products[_index];
        product.name = _newName;
        product.price = _newPrice;
    }
    function getProduct(uint _index) public view returns(string memory,uint) {
        Product storage product = products[_index];
        return(product.name,product.price);
    }
    function getProductObj(uint _index) public view returns(Product memory product) {
        product = products[_index];
        return product;
    }
}