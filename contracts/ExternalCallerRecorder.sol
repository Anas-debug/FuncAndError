// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExternalCallerRecorder {
    address public owner;
    mapping(address => address) public externalCallers;

    event ExternalCallerRecorded(address indexed externalCaller, address indexed calledSmartContract);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function recordExternalCaller(address calledSmartContract) external {
        require(calledSmartContract != address(0), "Invalid smart contract address");
        externalCallers[msg.sender] = calledSmartContract;
        emit ExternalCallerRecorded(msg.sender, calledSmartContract);
    }

    function getCalledSmartContract(address externalCaller) external view returns (address) {
        return externalCallers[externalCaller];
    }

}
