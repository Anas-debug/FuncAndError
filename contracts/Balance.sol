// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
// import "hardhat/console.sol";

contract Balance {
    address public owner;
    uint public balance; 
    constructor(){
        owner = msg.sender;
    }
    event Withdrawal(uint amount, uint when);

    function withdraw(uint _amount) public payable onlyOwner(){
        require(msg.value >= _amount, "Insufficient funds");
        balance += _amount;
        emit Withdrawal(_amount, block.timestamp);
    }
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
}