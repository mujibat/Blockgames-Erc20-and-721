// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Element is ERC20 {
    // 1 token per eth is 1000
    uint256 public tokenPerEth = 1000 * 10**decimals();

    constructor() ERC20("Element", "ELT") {
        // mint initial one million tokens to the deployer
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    function buyToken(address _recipient) public payable {
        // amount to mint to the recipient depends on the number of eth sent
        uint256 amountToMint = (msg.value * tokenPerEth) / 10**decimals();
        _mint(_recipient, amountToMint);
    }
}