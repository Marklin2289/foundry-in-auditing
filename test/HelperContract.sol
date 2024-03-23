// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import {CounterTest} from "./Counter.t.sol";
import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/Console.sol";
import "forge-std/StdError.sol";

// import "forge-std/Test.sol";

// abstract contract HelperContract {
//     address constant IMPORTANT_ADDRESS = 0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84;
//     CounterTest counterTest;

//     constructor() {}
// }

contract MyContractTest is CounterTest {
    function setUp() public override {
        super.setUp();
    }

    function test_IncrementByTwo() public {
        counter.increment();
        counter.increment();
        // vm.expectRevert(stdError.arithmeticError);
        assertEq(counter.number(), 3);
    }

    function test_getCounterNumberFromCounter() public view returns (uint256) {
        // console.log("Counter number: ", counter.number());
        // console.log("Counter number: ", super.test_getCounterNumber());
        // return counter.number();
        return super.test_getCounterNumber();
    }

    // function test_consoleAddress() public view returns (address) {
    //     console.logAddress(IMPORTANT_ADDRESS);
    //     return IMPORTANT_ADDRESS;
    // }

    // function test_getCounterNumberFromTest() public view returns (uint256) {
    //     console.log("Counter number: ", counterTest.test_getCounterNumber());
    //     return counterTest.test_getCounterNumber();
    // }

    // tips :
    // Use the getCode cheatcode to deploy contracts with incompatible Solidity versions.
}
