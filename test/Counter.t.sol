// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter, MyContract} from "../src/Counter.sol";
import "forge-std/Test.sol";

abstract contract CounterTest is Test {
    Counter public counter;
    MyContract public myContract;

    function setUp() public virtual {
        counter = new Counter();
        counter.setNumber(5);
        myContract = new MyContract();
    }

    function test_Increment() public {
        counter.increment();
        // counter.increment();
        assertEq(counter.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function testFail_Increment() public {
        counter.increment();
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function test_RevertIfIncrementFail() public {
        counter.increment();
        vm.expectRevert(stdError.arithmeticError);
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function test_getCounterNumber() public view returns (uint256) {
        console.log("Counter number: ", counter.number());
        return counter.number();
    }

    function test_MyContractSafeIncrement() public view {
        uint256 result = myContract.safeIncrement(5);
        assertEq(result, 6);
    }
}
