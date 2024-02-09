// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
// import "hardhat/console.sol";

contract Balance {
    uint public balance;
    event Withdrawal(uint amount, uint when);
    constructor() {
        balance = 0;
    }

    function withdraw(uint _amount) public payable {
        require(msg.value >= _amount, "Insufficient funds");
        balance += _amount;
        emit Withdrawal(_amount, block.timestamp);
    }
}