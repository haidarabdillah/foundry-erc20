// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/LinkedinToken.sol";

contract MyTokenTest is Test {
    LinkedinToken token;

    function setUp() public {
        token = new LinkedinToken();
    }

    function testName() public view {
        assertEq(token.name(), "Linkedin");
    }

    function testTotalSupply() public view {
        uint256 expectedSupply = 1000000 * 10 ** token.decimals();
        assertEq(token.totalSupply(), expectedSupply);
    }

    function testInitialBalance() public view {
        uint256 expectedBalance = 1000000 * 10 ** token.decimals();
        assertEq(token.balanceOf(address(this)), expectedBalance);
    }
}
