//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;
contract Mapping{
    mapping (uint=>string) public student;

    function create(uint roll_number, string memory name) public {
        student[roll_number] = name;
    }
}

/* 
     mapping it will create as
                student 
        roll_number            name
        1                       kusum
        2                       sirish
        7                       jatin
        400                     nayan
    mapping dont have to be sequential like arrays they can be random

    */
