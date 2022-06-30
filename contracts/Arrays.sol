// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Arrays{
    // Arrays
    uint[] public uintArray=[1,2,3];
    string[] public stringArray=["Aa","Bb","Cu","Nt"];
    string[] public value;

    // 2D-Arrays
    uint[][] public array2D = [[ 1 , 2 , 3 ],[ 4 , 5 , 6 ]];

    // Array manipulation
    // We are taking an argument in this function.
    // Memory is a temprory way to store data in solidity
    function addValue(string memory _value) public{
        // Pushing the value in value array
        value.push(_value);
    }

    function valueCount() public view returns(uint){
        return value.length; // To get the size of an array
    }

    // Also when we try to access the value of an array we need to provide the index
    // We cannot access the whole array at once.
}