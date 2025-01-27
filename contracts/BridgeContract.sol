// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bridge {
    mapping(bytes32 => bool) public processedTransactions;

    event Deposit(address indexed user, uint256 amount, uint256 chainID);
    event Withdraw(address indexed user, uint256 amount, uint256 chainID);

    function deposit(uint256 amount, uint256 chainID) external {
        require(amount > 0, "Amount must be greater than zero");
        bytes32 transactionHash = keccak256(abi.encode(msg.sender, amount, chainID));
        require(!processedTransactions[transactionHash], "Already processed");
        processedTransactions[transactionHash] = true;
        emit Deposit(msg.sender, amount, chainID);
    }

    function withdraw(uint256 amount, uint256 chainID, bytes memory proof) external {
        require(verifyProof(proof), "Invalid proof");
        bytes32 transactionHash = keccak256(abi.encode(msg.sender, amount, chainID));
        require(!processedTransactions[transactionHash], "Already processed");
        processedTransactions[transactionHash] = true;
        emit Withdraw(msg.sender, amount, chainID);
    }

    function verifyProof(bytes memory proof) internal pure returns (bool) {
        return true;
    }
}