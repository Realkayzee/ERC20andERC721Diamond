// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

library LibERC20Storage {
    bytes32 constant ERC20StoragePosition = keccak256("diamond.standard.ERC20.storage");


    struct ERC20 {
        string name;
        string symbol;
        uint256 totalSupply;
        uint256 decimals;
        mapping(address => uint256) balances;
        //Approver to aprovee to amount approved
        mapping(address => mapping(address => uint256)) Approve;  
    }

    function ERC20storage() internal pure returns (ERC20 storage erc20) {
        bytes32 position = ERC20StoragePosition;
        assembly {
            erc20.slot := position
        }
    }

}