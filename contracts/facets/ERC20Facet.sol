// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import {LibERC20Storage} from "../libraries/LibERC20Storage.sol";
import {IERC20} from "../interfaces/IERC20.sol";
import {IERC165} from "../interfaces/IERC165.sol";

contract ERC20Facet is IERC20 {
    function mint(address _addr) internal {
        LibERC20Storage.ERC20 storage erc20 = LibERC20Storage.ERC20storage();
        erc20.balances[_addr] += erc20.totalSupply;
    }

    function balanceOf(address account) public override view returns (uint256){
        LibERC20Storage.ERC20 storage erc20 = LibERC20Storage.ERC20storage();
        return erc20.balances[account];
    }

    function transfer(address to, uint256 amount) external override{
        LibERC20Storage.ERC20 storage erc20 = LibERC20Storage.ERC20storage();
        require(erc20.balances[msg.sender] >= amount, "Insufficient Fund");
        erc20.balances[msg.sender] -= amount;
        erc20.balances[to] += amount;
    }

    function approve(address to,uint256 amount) external override{
        LibERC20Storage.ERC20 storage erc20 = LibERC20Storage.ERC20storage();
        require(balanceOf(msg.sender) >= amount, "You can't approve what you don't have");
        erc20.Approve[msg.sender][to] = amount;
    }

    function transferFrom(address from,address to,uint256 amount) external override {
        LibERC20Storage.ERC20 storage erc20 = LibERC20Storage.ERC20storage();
        uint256 initialBalance = erc20.Approve[from][to];
        require(initialBalance > amount, "Amount not approved");
        require(balanceOf(from) >= amount, "Insufficient Fund");
        erc20.Approve[from][to] -= amount;
        erc20.balances[from] -= amount;
        erc20.balances[to] += amount;

    }

    function allowance(address owner,address spender) external override view returns(uint256) {
        LibERC20Storage.ERC20 storage erc20 = LibERC20Storage.ERC20storage();
        return (erc20.Approve[owner][spender]);
    }

    function totalSupply() external override view returns (uint256) {
        LibERC20Storage.ERC20 storage erc20 = LibERC20Storage.ERC20storage();
        return erc20.totalSupply;

    }

    function name() external override view returns (string memory) {
        LibERC20Storage.ERC20 storage erc20 = LibERC20Storage.ERC20storage();
        return erc20.name;
    }

    function symbol() external override view returns (string memory) {
        LibERC20Storage.ERC20 storage erc20 = LibERC20Storage.ERC20storage();
        return erc20.symbol;
    }


}


 