//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;

contract average{
    function calAverage(uint a, uint b, uint c) pure public returns(string memory, uint){
        uint avg = (a+b+c) / 3;
        string memory response = "Average is: ";
        return (response, avg);
    }
}