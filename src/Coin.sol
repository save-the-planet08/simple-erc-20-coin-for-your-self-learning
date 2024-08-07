// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/*
    * @title MYFIRSTMINIMALTOKEN
    * @dev Very minimal ERC20 token example
    * @notice This contract is completely minimal and is only for educational purposes
    * @notice copied from: https://wizard.openzeppelin.com/#erc20
*/
 
contract MYFIRSTMINIMALTOKEN is ERC20 {
    constructor() ERC20("MYFIRSTMINIMALTOKEN", "MFMT") {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }
}
