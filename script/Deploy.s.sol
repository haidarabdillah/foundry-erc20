// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/LinkedinToken.sol";

contract Deploy is Script {
    function run() external {
        // Load private key from env (or hardcoded for dev only, not recommended)
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Start broadcasting transaction
        vm.startBroadcast(deployerPrivateKey);

        // Deploy the token
        new LinkedinToken();

        // Stop broadcasting
        vm.stopBroadcast();
    }
}
