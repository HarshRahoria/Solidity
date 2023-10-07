//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;
contract Referenced{
    uint[3]  public  arr = [10,23,34];
    function changeArray(uint[3] memory brr) view public returns(uint[3] memory){
        brr = arr;
        return brr;
    }
    function changeOriginalArray(uint  index, uint value) public returns(uint[3] memory){
        uint[3] storage crr = arr;
        crr[index] = value;
        return crr;
    }
    function returnArr() public view returns (uint[3] memory){
        return arr;
    }
}