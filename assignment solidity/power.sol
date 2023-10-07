//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;

contract Power{
    function calculatepower(uint num, uint power) public pure returns(uint){
        uint result =1;
        for(uint i=0; i<power; i++){
            result *= num;
        }
        return result;
    }
}