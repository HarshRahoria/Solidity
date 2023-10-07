//SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.7.0 < 0.9.0;

contract DigitsSum{
    function sumDigit(uint num) public pure returns(uint){
        uint temp;
        while(num !=0){
            temp = temp + num%10;
            num /= 10;
        }
        return temp;
    }
}