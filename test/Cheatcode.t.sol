// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
// import MockERC20 from forge-std/mocks/MockERC20.sol
import {MockERC20} from "forge-std/mocks/MockERC20.sol";
import {StdUtils} from "forge-std/StdUtils.sol";
import {console} from "forge-std/console.sol";

contract LeetContract {
    uint256 private leet = 1337; // slot 0
}

contract CheatcodeTest is Test {
    LeetContract leetContract;
    MockERC20 dai;

    function setUp() public {
        leetContract = new LeetContract();
        dai = new MockERC20();
    }

    function test_vmStoreAndLoad() public {
        vm.store(address(leetContract), bytes32(uint256(0)), bytes32(uint256(31337)));
        bytes32 leet = vm.load(address(leetContract), bytes32(uint256(0)));
        emit log_uint(uint256(leet)); // 31337
    }

    function test_vmDeal() public {
        address alice = makeAddr("alice");
        emit log_address(alice);
        vm.deal(alice, 1 ether);
        console.log(alice.balance);
        // log_uint256(address(dai).balanceOf(alice));
    }

    function test_Deal() public {
        address alice = makeAddr("alice");
        emit log_address(alice);
        deal(address(dai), alice, 1 ether);
        console.log(dai.balanceOf(alice));
        console.log("address of dai :", address(dai));
        // log_uint256(address(dai).balanceOf(alice));
    }
}
