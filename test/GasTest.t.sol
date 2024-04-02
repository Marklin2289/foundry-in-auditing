// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

contract GasUsage is Test {
    uint256 public count = 0;

    function test_incrementWithGasCalculation() public returns (uint256) {
        uint256 startGas = gasleft();
        console.log("Start gas: ", startGas);

        for (uint256 i = 0; i < 100; i++) {
            count++;
        }

        uint256 endGas = gasleft();
        console.log("End gas: ", endGas);
        uint256 gasUsed = startGas - endGas;
        console.log("Gas used: ", gasUsed);

        return gasUsed;
    }
}
