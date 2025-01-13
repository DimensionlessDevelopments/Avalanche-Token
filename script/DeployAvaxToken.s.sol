// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "../lib/forge-std/src/Script.sol";
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
 * @notice This contract is the deployer script of the token. It handles for  deploying the intial mint and transfers required during deployment.
 * @notice This contract is inheriting from the forge library
 */


contract DeployAvaxToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1_000_000 ether; // 1 million tokens with 18 decimal places

    function run() external returns (AvaxToken) {
        vm.startBroadcast();
        AvaxToken avaxToken = new AvaxToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return avaxToken;
    }
}