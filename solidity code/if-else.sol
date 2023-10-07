//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;
contract if_else{
    // if-else also written in function than directly

    function check_number(int number)  public pure returns(string memory){
        string memory str;

        if(number < 0){
            str = "Number is negative";
        }
        else if(number == 0){
            str = "Number is 0";
        }
        else{
            str = "Number is positive";
        }
        return str;
    }
}