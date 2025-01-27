// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Validator.sol";

contract Oracle is Ownable {
    Validator public validatorContract;
    mapping(bytes32 => uint256) public data;

    event DataUpdated(bytes32 indexed key, uint256 value);
    event DataRemoved(bytes32 indexed key);

    constructor(address _validatorContract) {
        validatorContract = Validator(_validatorContract);
    }

    function updateData(bytes32 _key, uint256 _value) external {
        require(validatorContract.isValidator(msg.sender), "Not a validator");
        data[_key] = _value;
        emit DataUpdated(_key, _value);
    }

    function removeData(bytes32 _key) external {
        require(validatorContract.isValidator(msg.sender), "Not a validator");
        delete data[_key];
        emit DataRemoved(_key);
    }

    function getData(bytes32 _key) external view returns (uint256) {
        return data[_key];
    }
}
