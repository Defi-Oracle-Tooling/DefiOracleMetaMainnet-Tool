// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Validator.sol";

contract Bridge is Ownable {
    Validator public validatorContract;
    mapping(bytes32 => bool) public processedTransactions;

    event TransferInitiated(address indexed from, address indexed to, uint256 amount, bytes32 indexed txHash);
    event TransferCompleted(address indexed from, address indexed to, uint256 amount, bytes32 indexed txHash);
    event TransferCancelled(bytes32 indexed txHash);

    constructor(address _validatorContract) {
        validatorContract = Validator(_validatorContract);
    }

    function initiateTransfer(address _to, uint256 _amount, bytes32 _txHash) external {
        require(!processedTransactions[_txHash], "Transaction already processed");
        processedTransactions[_txHash] = true;
        emit TransferInitiated(msg.sender, _to, _amount, _txHash);
    }

    function completeTransfer(address _from, address _to, uint256 _amount, bytes32 _txHash) external {
        require(validatorContract.isValidator(msg.sender), "Not a validator");
        require(processedTransactions[_txHash], "Transaction not initiated");
        emit TransferCompleted(_from, _to, _amount, _txHash);
    }

    function cancelTransfer(bytes32 _txHash) external {
        require(processedTransactions[_txHash], "Transaction not initiated");
        processedTransactions[_txHash] = false;
        emit TransferCancelled(_txHash);
    }
}
