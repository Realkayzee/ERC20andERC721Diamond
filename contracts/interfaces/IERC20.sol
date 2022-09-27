// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external;
    function approve(address to, uint256 amount) external;
    function allowance(address owner, address spender) external view returns (uint256);
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external;
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);

}