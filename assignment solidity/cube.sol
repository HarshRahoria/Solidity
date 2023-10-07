//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;

contract cube{
    function calculateCube(uint num) public pure returns(uint){
        return num*num*num;
    }
}