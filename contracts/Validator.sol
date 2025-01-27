// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Validator is Ownable {
    mapping(address => bool) public validators;

    event ValidatorAdded(address indexed validator);
    event ValidatorRemoved(address indexed validator);

    function addValidator(address _validator) external onlyOwner {
        validators[_validator] = true;
        emit ValidatorAdded(_validator);
    }

    function removeValidator(address _validator) external onlyOwner {
        validators[_validator] = false;
        emit ValidatorRemoved(_validator);
    }

    function isValidator(address _validator) external view returns (bool) {
        return validators[_validator];
    }
}
