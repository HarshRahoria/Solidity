//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;

struct data {
    uint class;
    string name;
}
contract Mapping{
    mapping(uint=>data) public student;
    function create(uint rollNo, uint class, string memory name) public{
        student[rollNo] = data(class, name);
    }
}
/* mapping will look likw
            student
        rollNo                 data
                         class       name
        1                 8          ravi
        5                 9          suhani
        90                11         system
        */