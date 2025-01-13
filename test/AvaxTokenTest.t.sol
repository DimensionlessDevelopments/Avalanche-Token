// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {DeployAvaxToken} from "../script/DeployAvaxToken.s.sol";
import {AvaxToken} from "../src/AvaxToken.sol";



/*
 * @title AvaxToken
 * @author Dimensionless Developments
 *
 * This designed to be as secure & minimal as possible, and have the tokens perform the standard ERC20 functionalities required at all times.
 * This is a avaxtoken with the properties:
 * - To mint
 * - To do transfers
 *
 * @notice This contract is the core test of the token. It handles all the logic for minting, transfers etc.
 * @notice This contract is inheriting from the forge library
 */

 
interface MintableToken {
    function mint(address, uint256) external;
}

contract AvaxTokenTest is Test {
    uint256 RICK_STARTING_AMOUNT = 100 ether;
    uint256 public constant INITIAL_SUPPLY = 1_000_000 ether; // 1 million tokens with 18 decimal places

    AvaxToken public avaxToken;
    DeployAvaxToken public deployer;
    address public deployerAddress;
    address rick;
    address cynthia;

    function setUp() public {
        deployer = new DeployAvaxToken();
        
            avaxToken = deployer.run();
        
            avaxToken = new AvaxToken(INITIAL_SUPPLY);
            avaxToken.transfer(msg.sender, INITIAL_SUPPLY);
       
        rick = makeAddr("rick");
        cynthia = makeAddr("cynthia");

        vm.prank(msg.sender);
        avaxToken.transfer(rick, RICK_STARTING_AMOUNT);
    }

    function testInitialSupply() public view {
        assertEq(avaxToken.totalSupply(), deployer.INITIAL_SUPPLY());
    }

    function testUsersCantMint() public {
        vm.expectRevert();
        MintableToken(address(avaxToken)).mint(address(this), 1);
    }

    function testAllowances() public {
        uint256 initialAllowance = 1000;

        //Rick approves Cynthia to spend tokens on his behalf

        vm.prank(rick);
        avaxToken.approve(cynthia, initialAllowance);
        uint256 transferAmount = 500;

        vm.prank(cynthia);
        avaxToken.transferFrom(rick, cynthia, transferAmount);
        assertEq(avaxToken.balanceOf(cynthia), transferAmount);
        assertEq(avaxToken.balanceOf(rick), RICK_STARTING_AMOUNT - transferAmount);
    }

   
}