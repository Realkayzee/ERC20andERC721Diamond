// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

library LibERC721Storage {
    bytes32 constant ERC721StoragePosition = keccak256("diamond.standard.ERC721.storage");


    struct ERC721 {
        string name;
        string symbol;
        uint256 totalSupply;
        mapping(address => uint256) balances;
        mapping(address => mapping(address => uint256)) Approve;
    }

    function ERC721storage() internal pure returns (ERC721 storage erc721) {
        bytes32 position = ERC721StoragePosition;
        assembly {
            erc721.slot := position
        }
    }

}