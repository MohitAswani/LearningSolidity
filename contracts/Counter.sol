// SPDX-License-Identifier: MIT
// Capital letter for smart contract file names with .sol extension.

// First thing we do is to declare solidity prog lang version.
// This means we are atleast using 0.8.0
pragma solidity ^0.8.0;

// Following is how we declare a smart contract
// Contract are like classes hence they support inheritance.
// We can call other smart contracts from one smart contract.
// And smart are the basic units which can be reused in solidity.
contract Counter {

    // Code for smart contract goes here

    // This contract will simply store the count on the blockchain which a user can change.

    // Following is a state variable.
    // So state variables are the ones which are actually stored in the blockchain.
    // We declare state variables by just declaring them in the smart contract.
    // Solidity is statically typed hence we need to tell the type
    // We now make this variable public.
    // When we make our variable public solidity gives us get function by defualt.
    // We can also set the default values inline.
    uint public count=0; // 1,2,3..

    // Creating a constructor
    // We create a constructor to set the default value of count in smart contract
    // We make it public so that it can be called from outside.
    // constructor() public{
    //     count=0;
    // }

    // Function
    // Just returning the count in the below function.
    // We add public modifier because by default function are private.
    // Also support modifiers like internal.
    // We also set view which makes it a view function.
    // We also specify that it return unit 
    // Following function is a read function.
    // function getCount() public view returns(uint){
    //     return count;
    // }

    // Following function is a write function.
    // Reads are free on blockchain and writes cost gas.
    // And hence we will have to pay a gas fee for the following function.
    function incrementCount() public {
        // count=count+1;
        count++;
    }

    // To deploy our smart contract we do the following :
    // 1) Compiler so that it can run on the ethereum VM.
    // 2) Then we deploy it on the fake blockchain and using a fake ethereum acc.
    // Deploy takes some gas fee and then it is deployed.
    // Then we can call our functions and for every write function we will have to pay gas. 
}