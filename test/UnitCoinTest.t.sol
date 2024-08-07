// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { Test } from "forge-std/Test.sol";
import { RunTheToken } from "../script/Coin.s.sol";
import { MYFIRSTMINIMALTOKEN } from "../src/Coin.sol";

contract UnitCoinTest is Test {
    MYFIRSTMINIMALTOKEN token;
    RunTheToken deployer;

    address BOB = makeAddr("bob");
    address ALICE = makeAddr("alice");

    uint256 SENDING_AMOUNT = 1e18;
    uint256 STARTING_BALANCE = 5e18;

    function setUp() public { 
            deployer = new RunTheToken();
            token = deployer.run();

            vm.startPrank(msg.sender); // <--- He's the one who gets all the coins minted 
            token.transfer(BOB, STARTING_BALANCE);
            token.transfer(ALICE, STARTING_BALANCE);
            vm.stopPrank();
        }
    
    function testTransfer() public {
        vm.prank(BOB);
        token.transfer(ALICE, SENDING_AMOUNT);
        assertEq(token.balanceOf(ALICE), SENDING_AMOUNT+STARTING_BALANCE);
    }

    function testTransferFrom() public {
        // We want that Bob gets money from Alice, but it's done by the msg.msg.sender
        vm.prank(ALICE);
        token.approve(BOB, SENDING_AMOUNT); // Bob is now allowed to transfer the sending amount

        vm.prank(BOB);
        token.transferFrom(ALICE, BOB, SENDING_AMOUNT); 

        assert(token.balanceOf(BOB) == SENDING_AMOUNT+STARTING_BALANCE);
    }

}