// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.13;

/**
 *
 * In this example, we have a library called ArrayUtils that provides two functions: sum and average. These functions operate on an array of uint256 values.
 *
 * The MyContract contract uses the ArrayUtils library by applying the using ArrayUtils for uint256[]; directive without the global keyword.
 *
 * The contract has a state variable numbers of type uint256[] and defines three functions:
 *
 * addNumber: Allows adding a number to the numbers array.
 * getSum: Retrieves the sum of all numbers in the numbers array by calling the sum function from the ArrayUtils library.
 * getAverage: Retrieves the average of all numbers in the numbers array by calling the average function from the ArrayUtils library.
 * In the getSum and getAverage functions, we can directly call the library functions sum and average on the numbers array using the dot notation (numbers.sum() and numbers.average()) because the library is applied to the uint256[] type within the contract.
 *
 * However, if we try to use the library functions on an array parameter in another function, such as doSomething, it will not compile. This is because the using directive without the global keyword only applies the library functions to the uint256[] type within the contract's top-level scope and its own functions.
 *
 * To make the library functions available for any uint256[] variable throughout the contract, including function parameters, we need to use the global keyword:
 */
library ArrayUtils {
    function sum(uint256[] memory arr) internal pure returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < arr.length; i++) {
            total += arr[i];
        }
        return total;
    }

    function average(uint256[] memory arr) internal pure returns (uint256) {
        return sum(arr) / arr.length;
    }
}

// this is file level outside of the contract
using ArrayUtils for uint256[] global;

contract GlobalUsing {
    uint256[] public numbers;

    function addNumber(uint256 num) public {
        numbers.push(num);
    }

    function getSum() public view returns (uint256) {
        return numbers.sum();
    }

    function getAverage() public view returns (uint256) {
        return numbers.average();
    }

    function doSomething(uint256[] memory arr) public pure returns (uint256) {
        // This will not compile if 'global' is not used
        return arr.sum();
    }
}
// contract MyContractFix {
//     // "global" can only be used at file level.
//     using ArrayUtils for uint256[] global;

//     // ...

//     function doSomething(uint256[] memory arr) public pure returns (uint256) {
//         // This will now compile with 'global'
//         return arr.sum();
//     }
// }

// ******************************************************************************
// FILE: SomeMath.sol

// import "./Math.sol";

// contract SomeMath {
//     function addNumbers(uint256 a, uint256 b) public pure returns (uint256) {
//         // Using the library function directly on uint256 variables
//         return a.add(b);
//     }
// }

// *******************************************************************************
