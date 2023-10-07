//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;

struct complexNumber{
    uint real;
    uint imaginary;
}
contract structure{
    complexNumber public number;
    constructor(uint real, uint imaginary){
        number.real = real;
        number.imaginary = imaginary;
    }
    function change(uint real, uint imaginary) public {
        complexNumber memory  newNumber = complexNumber(
            {
                real: real,
                imaginary: imaginary
            }
        );
        number = newNumber;
    }
}