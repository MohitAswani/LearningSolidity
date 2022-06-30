// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract{
    // State variables
    // This variable value is stored on the blockchain
    // By default its scope is the whole smart contract.
    uint public myUint = 1;  // 256 bits size by default
    uint256 public  myUint256 = 1;  // 256 bits size
    uint8 public myUint8 = 1 ;  // 8 bits size
    int256 public myInt256 = -1 ;

    // Strings
    string public myString = "EAT SHIT";
    // Bytes32 treats our string more like an array and gives us some more options
    bytes32 public myBytes32 = "EAT WORLD";

    // Addresses
    // This is something like a user id on the blockchain.
    // It can correspond to a user account like a metamask wallet.
    // Or it corresponds to a smart contract.
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // Structs 
    // Can be used to create our own custom data types
    struct MyStruct{
        uint256 myUint256;
        string myString;
    }

    // Creating an instance of struct
    // Assigning values through the contructor
    MyStruct public myStruct=MyStruct(1,"Hello, world!");

    // Local variables : which exist inside function
    // Are used and read inside the function and cannot be accessed outside it.

    // Pure because it doesn't modify the blockchain and only fetches info and doesnt mutate anything.
    function getValue() public pure returns(uint){
        uint value=1;
        value++;
        return value;
    }
}