// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/Console.sol";

contract Safe {
    receive() external payable {}

    function withdraw() public {
        payable(msg.sender).transfer(address(this).balance);
    }
}

contract SafeTest is Test {
    Safe safe;

    receive() external payable {}

    function setUp() public {
        safe = new Safe();
    }

    function test_Withdraw() public {
        payable(address(safe)).transfer(1 ether);
        uint256 preBalance = address(this).balance;
        safe.withdraw();
        uint256 postBalance = address(this).balance;
        assertEq(postBalance, preBalance + 1 ether);
    }
    // The default amount of ether that the test contract is given is 2**96 wei (as in DappTools),
    // so we have to restrict the type of amount to uint96 to make sure we don’t
    // try to send more than we have:

    function testFuzz_Withdraw(uint96 amount) public {
        vm.assume(amount > 0.1 ether);
        payable(address(safe)).transfer(amount);
        uint256 preBalance = address(this).balance;
        safe.withdraw();
        uint256 postBalance = address(this).balance;
        assertEq(postBalance, preBalance + amount);
    }
}

contract ExampleContract1 {
    uint256 public val1;
    uint256 public val2;
    uint256 public val3;

    function addToA(uint256 amount) external {
        val1 += amount;
        val3 += amount;
    }

    function addToB(uint256 amount) external {
        val2 += amount;
        val3 += amount;
    }
}

contract InvariantExample1 is Test {
    ExampleContract1 example1;

    function setUp() public {
        example1 = new ExampleContract1();
    }

    function invariant_A() external {
        assertEq(example1.val1() + example1.val2(), example1.val3());
    }

    function invariant_B() external {
        assertEq(example1.val1() + example1.val2(), example1.val3());
    }

    // [FAIL. Reason: panic: arithmetic underflow or overflow (0x11)] when fail_on_revert = true
}
