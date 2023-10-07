//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;

contract prime{
    function calculatePrime(uint num) public pure returns(uint ){
        uint flag = 1 ;
        for(uint i = 2; i < num; i++){
            if(num%i == 0){
                flag = 0;
            }
        }
        return flag;
    }
}