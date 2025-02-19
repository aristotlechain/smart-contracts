// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ProductCategories {

    // An enum to represent product categories
    // Enums restrict values to a predefined set which is Electronics, Clothing, Books and Furniture
    enum Category { Electronics, Clothing, Books, Furniture }

    // Map product IDs to their assigned category
    // Default value for unassigned IDs: Category.Electronics (index 0)
    mapping(uint => Category) public productCategory;

    // Assign or update a product's category
    function setCategory(uint _productId, Category _category) external {
        productCategory[_productId] = _category; // Update the mapping
    }
}