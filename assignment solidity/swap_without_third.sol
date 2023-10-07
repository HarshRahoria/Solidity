//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;

contract swap{
    uint public num1 = 23;
    uint public num2 = 34;
    function swapping() public {
        num1 = num1 + num2;
        num2 = num1 - num2;
        num1 = num1 - num2;
    }
}