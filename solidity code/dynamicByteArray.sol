// SPDX-License-Identifier: MIT
pragma solidity <=0.7.0 < 0.9.0;

contract dynamicBytesArray{
    bytes public arr = "abc";
    function pushElement() public{
        arr.push('d');
    }
    function getElement(uint index) view public returns(bytes1){
        return arr[index];
    }
    function getLength() view public returns(uint){
        return arr.length;
    }
    function popElement() public {
        arr.pop();
    }
    
}