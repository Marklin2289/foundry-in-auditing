// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/Console.sol";

error Unauthorized();

contract OwnerUpOnly {
    address public immutable owner;
    uint256 public count;

    constructor() {
        owner = msg.sender;
    }

    function increment() external {
        if (msg.sender != owner) {
            revert Unauthorized();
        }
        count++;
    }
}

contract OwnerUpOnlyTest is Test {
    OwnerUpOnly upOnly;

    function setUp() public {
        upOnly = new OwnerUpOnly();
    }

    function test_IncrementAsOwner() public {
        assertEq(upOnly.count(), 0);
        upOnly.increment();
        // vm.expectRevert();
        assertEq(upOnly.count(), 1);
    }

    function test_RevertIncrementAsNotOwner() public {
        vm.expectRevert(Unauthorized.selector);
        vm.prank(address(0));
        upOnly.increment();
    }
}

contract ExpectEmit {
    event Transfer(address indexed from, address indexed to, uint256 amount, uint256 payBack);

    function t() public {
        emit Transfer(msg.sender, address(1337), 1337, 1338);
    }
}

contract EmitContractTest is Test {
    event Transfer(address indexed from, address indexed to, uint256 amount, uint256 payBack);

    function test_ExpectEmit() public {
        ExpectEmit emitter = new ExpectEmit();

        vm.expectEmit(true, true, false, true);

        emit Transfer(address(this), address(1337), 1337, 1339);

        emitter.t();
    }

    function test_ExpectEmit_DoNotCheckData() public {
        ExpectEmit emitter = new ExpectEmit();

        vm.expectEmit(true, true, false, false);

        emit Transfer(address(this), address(1337), 1338, 1338);

        emitter.t();
    }
}
