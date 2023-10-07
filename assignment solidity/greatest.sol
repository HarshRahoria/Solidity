//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;

contract Greatest{
    function greatest(uint a, uint b, uint c) public pure returns(string memory, uint ){
        if(a>b ){
            if(b>c){

            return ("largest num is" , a);
            }
            else{
                if(c>a){
                    return ("largest num is", c);
                }
                else{
                    return("largest num is", a);
                }
            }
        }
        else{
            if(b>c){
                return ("largest num is", b);
            }
            else{
                return ("largest num is", c);
            }
        }

    }
}