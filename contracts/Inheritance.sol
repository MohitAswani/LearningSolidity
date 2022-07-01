// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// We are putting all the owner related code in this smart contract
contract Ownable{
    address owner;

    modifier onlyOwner(){
        require(msg.sender==owner,"Can only be accessed by owner");
        _;
    }

    constructor(){
        owner=msg.sender;
    }
}

// All the logic related to secret in this contract.
contract SecretVault{
    string secret;

    constructor(string memory _secret){
        secret=_secret;
    }

    // We also write memory when we return the string
    function getSecret() public view returns(string memory){
        return secret;
    }
}

// We use this as a factory which is smart contract which is used to deploy other smart contracts.
contract Inheritance is Ownable{
    // Inheritance : we inherit properties from a parent smart contracts.
    // Factories : we deploy other smart contracts.
    // Interaction : talk to other smart contracts.

    // We want to have contracts to interact with each other

    // address owner;
    // string secret;

    // We also need to save the secret vaults address to reference it.
    address secretVault;

    // We will set the secret when we deploy the smart contract
    constructor(string memory _secret){
        // owner=msg.sender;
        // secret=_secret;

        // One way to call the parents constructor is to call super.
        super;

        // This is how we create an instance of a particular smart contract
        SecretVault _secretVault=new SecretVault(_secret);
        secretVault=address(_secretVault);
    }

    // modifier onlyOwner(){
    //     require(msg.sender==owner,"Can only be accessed by owner");
    //     _;
    // }

    // We also write memory when we return the string
    function getSecret() public view onlyOwner returns(string memory){
        // Calling the SecretVault will reference the smart contract with the passed address.
        // Then we can call the functions of the smart contract
        return SecretVault(secretVault).getSecret();
    }
}
