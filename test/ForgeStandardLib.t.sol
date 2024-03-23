// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/StdUtils.sol";

contract ContractTest is Test {
    address alice = makeAddr("alice");
    address bob = makeAddr("bob");

    function test_alice() public {
        // vm.prank(alice);
        startHoax(alice, 1 ether);
        // vm.startPrank(alice);
        assertEq(alice, makeAddr("alice"));
        console.logAddress(alice);
        // vm.deal(alice, 1 ether);
        // deal(address(dai), alice, 1 ether);
        assertEq(alice.balance, 1 ether);
        // vm.stopPrank();
    }
}
