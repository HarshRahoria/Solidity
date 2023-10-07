//SPDX-License-Identifier: UNLICENSED
pragma solidity >= 0.7.0 < 0.9.0;
contract Pallindrome{
    function checkPallindrome(uint num) public pure returns(string memory){
        uint rev = reverse(num);
        if (num == rev){
            return ("Number is pallindrome");
        }
        else{
            return ("Number is not pallindrome");
        }
    }
    function reverse(uint num) private pure returns(uint ){
        uint temp;
        while(num != 0){
            temp = (10*temp) + num%10;
            num = num/10;
        }
        return temp;
    }
}
