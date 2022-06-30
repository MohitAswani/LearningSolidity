// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom{
    // We learn the following things in this :
    // Ether payments
    // Modifiers
    // Visibility
    // Events
    // Enums

    // Enumss
    // Collection of constant which cannot be changed.
    enum Statuses {
        Vacant,
        Occupied
    }
    Statuses public currentStatus;

    // We want to emit an event anytime a booking happens.
    // Solidity lets us emit events anytime a particular thing happens.
    // This will create a log and we can get an alert about it.
    // We can also get a history of all the events that took place.
    event Occupy(address _occupant,uint _value);

    // payable is a modifier which allows this address to receive eth
    address payable public owner;

    // constructor only get called when the contract is put on the blockchain.
    // So it will only be called for the owner of the smart contract.
    constructor(){
        // We also need to convert the senders address to payable before setting it
        owner=payable(msg.sender);
        currentStatus=Statuses.Vacant;
    }

    // Modifier
    // We can define our own modifiers and add them to any function.
    // This allows us to write clean code.
    modifier onlyWhileVacant{
        require(currentStatus==Statuses.Vacant,"Currently occupied");
        _;  // this will returns the function code
    }

    // This modifier allows us to set the required amount by using arguments.
    modifier costs(uint _amount){
        require(msg.value >=_amount,"Not enough ether provided.");
        _;
    }

    // In this function we will book the hotel room and pay the owner who is the creator of the contract.
    // payable modifier to allow payment in this function
    function book() public payable onlyWhileVacant costs(2 ether){
        // // Checking price
        // // We require the user to provide more than 2 ether.
        // require(msg.value >=2 ether,"Not enough ether provided.");

        // Checking status

        // // solidity gives us a special function called require()
        // // require check whether a value is true or false.
        // // if true if continues function execution
        // // if false it terminates the function execution
        // // Also we can pass it another arg which is a msg which is served when the condition is false.
        // require(currentStatus==Statuses.Vacant,"Currently occupied");
        // // CONVERTED TO MODIFIER

        // Changing the current status
        currentStatus=Statuses.Occupied;

        // // The transfer function send eth to the address we call it on.
        // // The eth comes from the one who sends the money.
        // // msg.value is the amount of eth sent in when we call this function.
        // // And for this to work we also need to payable to the function.
        // // We can have some issues with the transfer function.
        // owner.transfer(msg.value);

        // We can use call to send eth arround like transfer.
        // We can also send arbitart msg using call
        // We can also get the status of the transaction and data it returns back.
        // We also require it to true and this is a benefit of call function.
        (bool sent,bytes memory data) = owner.call{value:msg.value}("");
        require(sent);

        // We emit the occupy event after successful booking
        emit Occupy(msg.sender,msg.value);
    }
}