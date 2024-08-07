// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { Script } from "forge-std/Script.sol";
import { MYFIRSTMINIMALTOKEN } from "../src/Coin.sol";

contract RunTheToken is Script{
    function run() public returns (MYFIRSTMINIMALTOKEN){
        vm.startBroadcast();
        MYFIRSTMINIMALTOKEN token = new MYFIRSTMINIMALTOKEN();
        vm.stopBroadcast();
        return token;
    }
}

