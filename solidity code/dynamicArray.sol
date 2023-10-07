// SPDX-License-Identifier: UNLICENSED
pragma solidity <=0.7.0 <0.9.0;

contract dynamicArray{
    uint[] public array;

    function pushElement(uint element) public {
        array.push(element);
    }
    function popElement() public {
        array.pop();
    }
    function lengthArray() public view returns(uint){ 
        return array.length;
    }

}