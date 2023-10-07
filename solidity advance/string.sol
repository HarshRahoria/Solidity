//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;
contract Strings{
    string str = "Ye ek string hai";
    function compareStrings(string calldata s1, string calldata s2) public pure returns(string memory, bool){
        if(keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2))){
            return ("Strings are equal", true);
        } else{
            return ("Strings are not equal", false);
        }
    }
    function concatStrings(string calldata s1, string calldata s2) public pure returns (string memory){
        string memory s = string.concat(s1, " ", s2);
        return s;
    }
}