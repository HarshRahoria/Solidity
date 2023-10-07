//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;

contract even_odd{
    function evenOdd(uint num) public pure returns(string memory){
        string memory response;
        if(num%2 ==0){
            response = "Even number";
            return response;
        }
        else{
            response = "odd number";
            return response;
        }
    }
}