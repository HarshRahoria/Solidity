//SPDX-License-Identifier: UNLICENSED
pragma solidity <=0.7.0 <0.9.0;

contract array{
    uint[5] public arr = [10,20,30,40,50];
    
    function setter(uint index, uint value) public {
        arr[index] = value;
    }
    function length() public view returns(uint){
        return arr.length;
    }
}