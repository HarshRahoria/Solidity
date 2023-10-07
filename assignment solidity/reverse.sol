//SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.7.0 < 0.9.0;
contract Reverse{
    function reverse(uint num) public pure returns(uint ){
        uint temp;
        while(num != 0){
            temp = (10*temp) + num%10;
            num = num/10;
        }
        return temp;
    }
}