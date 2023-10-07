// SPDX-License-Identifier: MIT
pragma solidity <=0.7.0 < 0.9.0;

contract bytesArray{
    bytes4 public b4; // we have allocted 4 bytes in array fashion

    function setter() public {
        b4 = "abc+"; // returns the result of inputed value in ASCII form (heaxadecimal form)
        
        /* b4[2] = "f";
        throws error: 
        bytesArray.sol:9:9: TypeError: Single bytes in fixed bytes arrays cannot be modified
        */
        
    }
    // bytes array are immutable i.e value can not be changed after creation only for single 
    //bytes but if entire array is changed it will allow it to chnage
    function next() public{
        b4 = "qwer";
    }
}