//SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.7.0 < 0.9.0;
contract Fibonacci{
    uint[] public series;
    function fibonacci(uint num) public {
        uint a = 0;
        uint b = 1;
        series.push(b);
        uint temp;
        while(num !=0){
            temp = a+b;
            a = b;
            b = temp;
            series.push(temp);
            num--;
        }
    }
}