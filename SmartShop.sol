//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//i created a smart contract that allows a user to deposit, withdraw and save ETH!!

contract SmartShop{
    //we mapped the address of the caller balance in the contract
    mapping(address => uint) public balances;


// whatever the user deposit is added to msg.value of the sender address we mapped above
    function deposit() public payable{
        balances[msg.sender] += msg.value;
    }
//we create the fucntion of witdraw
    function withdraw(uint _amount) public{
//we create a require arg to make sure the balance of the sender is >=_amount if not ERR
        require(balances[msg.sender]>= _amount, "Not enough ether");
        //if the amount is availabe we subtract it from the sender
        balances[msg.sender] -= _amount;
        //True bool is called to confirm the amount
        (bool sent,) = msg.sender.call{value: _amount}("Sent");
        require(sent, "failed to send ETH");
    }

    function getBal() public view returns(uint){
        return address(this).balance;
    }
}

















































// The contract will allow deposits from any account, and can be trusted to allow withdrawals only
// by accounts that have sufficient funds to cover the requested withdrawal.
// This post assumes that you are comfortable with the ether-handling concepts introduced in our
// post, Writing a Contract That Handles Ether.
// That post demonstrated how to restrict ether withdrawals to an “owner’s” account. It did this by
// persistently storing the owner account’s address, and then comparing it to the msg.sender value
// for any withdrawal attempt. Here’s a slightly simplified version of that smart contract, which
// allows anybody to deposit money, but only allows the owner to make withdrawals:

// Maintaining Individual Account Balances
// I am going to generalize this contract to keep track of ether deposits based on the account
// address of the depositor, and then only allow that same account to make withdrawals of that
// ether. To do this, we need a way keep track of account balances for each depositing account—a
// mapping from accounts to balances. Fortunately, Solidity provides a ready-made mapping data
// type that can map account addresses to integers, which will make this bookkeeping job quite
// simple. (This mapping structure is much more general key/value mapping than just addresses to
// integers, but that’s all we need here.)



// Here are the new concepts in the code above:
// mapping(address => uint256) public balanceOf; declares a persistent public variable, balanceOf,
// that is a mapping from account addresses to 256-bit unsigned integers. Those integers will
// represent the current balance of ether stored by the contract on behalf of the corresponding
// address.
// Mappings can be indexed just like arrays/lists/dictionaries/tables in most modern programming
// languages.
// The value of a missing mapping value is 0. Therefore, we can trust that the beginning balance for
// all account addresses will effectively be zero prior to the first deposit.
// It’s important to note that balanceOf keeps track of the ether balances assigned to each account,
// but it does not actually move any ether anywhere. The bank contract’s ether balance is the sum
// of all the balances of all accounts—only balanceOf tracks how much of that is assigned to each
// account.
// Note also that this contract doesn’t need a constructor. There is no persistent state to initialize
// other than the balanceOf mapping, which already provides default values of 0.
// Withdrawals and Account Balances
// Given the balanceOf mapping from account addresses to ether amounts, the remaining code for a
// fully-functional bank contract is pretty small. I’ll simply add a withdrawal function:


//What is Ethereum?
// Ethereum is a decentralized blockchain designed to be highly secure, fault-tolerant, and
// programmable. Ethereum blockchain is a choice for many developers and businesses. As said
// programmable, the main task of Ethereum is to securely execute and verify the application code
// known as smart contracts. Ethereum helps to build native scripting language(solidity) and EVM.
// Ethereum consensus mechanism is proof of work to operate to verify the new transaction. Now
// we will learn about smart contracts and how it runs on the Ethereum platform.
// Overview of Smart Contracts
// A smart contract is a small program that runs on an Ethereum blockchain. Once the smart
// contract is deployed on the Ethereum blockchain, it cannot be changed. To deploy the smart
// contract to Ethereum, you must pay the ether (ETH) cost. Understand it as a digital agreement
// that builds trust and allows both parties to agree on a particular set of conditions that cannot be
// tampered with.
// To understand the need for a smart contract, suppose there was one grocery shop, and ram went
// to buy some groceries. He purchased the groceries for 500 rupees and kept on debt that would
// pay the money next month when he returned, so the shopkeeper jotted down his purchase in his
// ledger. In between the period somehow shopkeeper changed 500 to 600 and when next month
// ram went to pay the money, the shopkeeper has demanded 600 INR and ram has no proof to
// show that he has only bought 500 INR so in this case, smart contracts play an essential role
// which prevents both the parties to tamper the agreement and only gets terminate when all the
// conditions satisfy after the deal. There are a couple of languages to write smart contracts, but the

// 101

// most popular is solidity.
// What is Solidity Programming?
// Solidity is an object-oriented programming language created specifically by the Ethereum
// Network team for constructing and designing smart contracts on Blockchain platforms.
// • It's used to create smart contracts that implement business logic and generate a chain of
// transaction records in the blockchain system.
// • It acts as a tool for creating machine-level code and compiling it on the Ethereum Virtual
// Machine (EVM).
// • It has a lot of similarities with C and C++ and is pretty simple to learn and understand. For
// example, a “main” in C is equivalent to a “contract” in Solidity.
// Like other programming languages, Solidity programming also has variables, functions, classes,
// arithmetic operations, string manipulation, and many other concepts.

// Evolution of Solidity Programming

// Solidity is a relatively new language that is rapidly growing.
// • Solidity is currently the core language on Ethereum and other private blockchains operating
// on competing platforms, such as Monax and its Hyperledger Burrow blockchain which uses
// Tendermint for consensus.
// • SWIFT has created a proof of concept that runs on Burrow and uses Solidity.
// What are EVM and Smart Contracts?

// EVM or Ethereum Virtual Machine
// • The Ethereum Virtual Machine (EVM) provides a runtime environment for Ethereum smart
// contracts.
// • It is primarily concerned with ensuring the security and execution of untrusted programs
// through the use of an international network of public nodes.

// 102

// • EVM is specialized in preventing Denial-of-Service attacks and certifies that the programs do
// not have access to each other's state, as well as establishing communication, with no possible
// interference.

// Smart Contracts
// • Smart contracts refer to high-level program codes compiled into EVM before being posted to
// the Ethereum blockchain for execution.
// • It enables you to conduct trustworthy transactions without the involvement of a third party;
// these transactions are traceable and irreversible.
// • Programming languages commonly used to create and write smart contracts are Serpent,
// Solidity, Mutan, and LLL.


//Data Types of Solidity Programming

//It supports all the common data types seen in other OOP languages, such as,
//• Boolean - The Boolean data type returns ‘1' when the condition is true and ‘0' when it is false,
//depending on the status of the condition.
//• Integer - You can sign or unsign integer values in Solidity. It also supports runtime exceptions and the
//‘uint8' and ‘uint256' keywords.
//• String - Single or double quotes can denote a string.
//• Modifier - Before executing the code for a smart contract, a modifier often verifies that any condition
//is rational.
//• Array - The syntax of Solidity programming is like that of other OOP languages, and it supports both
//single and multidimensional arrays.
//Apart from that, Solidity programming allows you to "Map" data structures with enums,
//operators, and hash values to return values stored in specific storage places.
