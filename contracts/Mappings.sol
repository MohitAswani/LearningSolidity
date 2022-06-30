// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mappings{

    // Mapping : data types which allow us to store data as key-value pairs.
    // key data type : uint and value data type : string
    mapping(uint=>string) public names;
    mapping(uint=>Book) public books;

    // Nested mappings
    // Nested mappings are extremely useful for things like NFTS
    // They can be used to see the things associated with a particular address/account.
    mapping(address=>mapping(uint=>Book)) public myBooks;

    struct Book{
        string title;
        string author;
    }

    constructor(){
        // We can [] to either write or access the entries.
        names[1]="Mohit";
        names[2]="Sia";
        names[3]="Ronald";
    }

    // Argument are local variables.
    // We usually add _ before local variables so as to easily diff them.
    function addBook(
        uint _id,
        string memory _title,
        string memory _author
    ) public {
        books[_id]=Book(_title,_author);
    }

    function addMyBook(
        uint _id,
        string memory _title,
        string memory _author
    ) public {
        // Solidity has a global variable called msg.
        // And msg.sender will give us the eth address of the person which is calling the smart contract.
        myBooks[msg.sender][_id]=Book(_title,_author);
    }

}