// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//importing and using the openzeppelin library so we can inherit ERC20
import {ERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";


/*
 * @title AvaxToken
 * @author Dimensionless Developments
 *
 * This designed to be as secure & minimal as possible, and have the tokens perform the standard ERC20 functionalities required at all times.
 * This is a avaxtoken with the properties:
 * - To mint
 * - To do transfers
 *
 * @notice This contract is inheriting from the openzepellin library
 * @notice This contract is the child contract, it creates the token DIME. 
 */

contract AvaxToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Dime", "DIME") {
        _mint(msg.sender, initialSupply);

    }   
    
}