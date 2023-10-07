// SPDX-License-Identifier: MIT

pragma solidity <=0.7.0 < 0.9.0;
contract loops{
    uint[10] public  arr;
    // loops are always written inside a function

    function whileLoop() public {
        // stores table of 2
        uint count = 1;
        uint index = 0;
        while(count <= arr.length){
            arr[index] = 2 * count;
            count++;
            index++;
        }
    }

    function forLoop() public {
        // stores table of 3
        for(uint index =0; index<arr.length; index++){
            arr[index] = 3 * (index+1);
        }
    }
    
    function doWhileLoop() public {
        // stores table of 4
        uint count = 1;
        uint index = 0;
        do{
            arr[index] = 4 * count;
            count++;
            index++;
        }while(count <= arr.length);
    }
}