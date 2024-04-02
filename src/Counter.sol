// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "solmate/utils/LibString.sol";

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    // ... other math operations with safety checks ...
}

contract MyContract {
    using SafeMath for uint256;

    function safeIncrement(uint256 a) public pure returns (uint256) {
        return a.add(1); // Using SafeMath's add function directly on a uint
    }
}
