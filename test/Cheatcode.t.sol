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

contract CheatCode {
    address public owner;

    // constructor() {
    //     owner = msg.sender;
    // }

    function withdraw() public view returns (bool s) {
        if (msg.sender == owner) {
            s = true;
        } else {
            s = false;
            revert("You are not the owner");
        }
    }
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

    // function test_vmPrank() public {
    //     address alice = makeAddr("alice");
    //     vm.prank(alice);
    //     emit log_address(alice);
    //     CheatCode cheatCode = new CheatCode();
    //     // cheatCode.withdraw();
    //     emit log_address(address(cheatCode));
    //     cheatCode.withdraw();
    // }
    // need to work on this
}

contract NumsContract {
    uint256 public num1 = 100; // slot 0
    uint256 public num2 = 200; // slot 1
}

contract NumsContractTest is Test {
    NumsContract numsContract;

    function setUp() public {
        numsContract = new NumsContract();
    }

    function test_vmRecord() public {
        vm.record();
        numsContract.num2();
        (bytes32[] memory reads, bytes32[] memory writes) = vm.accesses(address(numsContract));
        emit log_uint(uint256(reads[0])); // 1
    }
}
