//SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.7.0 < 0.9.0;
contract Factorial{
    function factotial(uint num) public pure returns(uint){
        if(num ==0 || num ==1){
            return 1;
        }
        else{
            return num * factotial(num-1);
        }
    }
}