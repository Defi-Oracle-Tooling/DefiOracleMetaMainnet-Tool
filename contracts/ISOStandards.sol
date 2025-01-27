// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Validator.sol";

contract ISOStandards is Ownable {
    Validator public validatorContract;

    event SEPATransfer(address indexed from, address indexed to, uint256 amount, string reference);
    event SWIFTTransfer(address indexed from, address indexed to, uint256 amount, string reference);
    event FedWireTransfer(address indexed from, address indexed to, uint256 amount, string reference);
    event CardTransfer(address indexed from, address indexed to, uint256 amount, string reference);
    event ISO20022Transfer(address indexed from, address indexed to, uint256 amount, string reference);
    event ISO8583Transfer(address indexed from, address indexed to, uint256 amount, string reference);

    constructor(address _validatorContract) {
        validatorContract = Validator(_validatorContract);
    }

    function sepaTransfer(address _to, uint256 _amount, string calldata _reference) external {
        require(validatorContract.isValidator(msg.sender), "Not a validator");
        emit SEPATransfer(msg.sender, _to, _amount, _reference);
    }

    function swiftTransfer(address _to, uint256 _amount, string calldata _reference) external {
        require(validatorContract.isValidator(msg.sender), "Not a validator");
        emit SWIFTTransfer(msg.sender, _to, _amount, _reference);
    }

    function fedWireTransfer(address _to, uint256 _amount, string calldata _reference) external {
        require(validatorContract.isValidator(msg.sender), "Not a validator");
        emit FedWireTransfer(msg.sender, _to, _amount, _reference);
    }

    function cardTransfer(address _to, uint256 _amount, string calldata _reference) external {
        require(validatorContract.isValidator(msg.sender), "Not a validator");
        emit CardTransfer(msg.sender, _to, _amount, _reference);
    }

    function iso20022Transfer(address _to, uint256 _amount, string calldata _reference) external {
        require(validatorContract.isValidator(msg.sender), "Not a validator");
        emit ISO20022Transfer(msg.sender, _to, _amount, _reference);
    }

    function iso8583Transfer(address _to, uint256 _amount, string calldata _reference) external {
        require(validatorContract.isValidator(msg.sender), "Not a validator");
        emit ISO8583Transfer(msg.sender, _to, _amount, _reference);
    }
}
