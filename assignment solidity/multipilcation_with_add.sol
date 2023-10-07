//SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.7.0 < 0.9.0;
contract Multiplication{
    function multiplication(uint a, uint b) public pure returns(uint){
       uint temp;
        for(uint i=0; i<a; i++){
            temp = temp + b;
        }
        return temp;
    }
}