//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;

contract Armstrong{
    function checkArmstrong(uint num) public pure returns(string memory){
        uint digit = digitCalculate(num);
        uint armstrongNumber = calculateNum(num, digit);
        if(num == armstrongNumber){
            return ("Number is armstrong");
        }
        else{
            return ("Number is not arm-strong");
        }
    }
    function digitCalculate(uint number) private pure returns(uint){
        uint digit;
        while(number != 0){
            digit++;
            number = number/10;
        }
        return digit;
    }
    function calculateNum(uint Num, uint digit) private pure returns(uint){
        uint temp;
        while(Num != 0){
            temp = temp + calculatepower(Num%10, digit);
            Num = Num/10;
        }
        return temp;
    }
    function calculatepower(uint a, uint power) private pure returns(uint){
        uint result =1;
        for(uint i=0; i<power; i++){
            result *= a;
        }
        return result;
    }
}