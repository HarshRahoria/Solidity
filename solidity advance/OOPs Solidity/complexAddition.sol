//SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;
import "./complex.sol";

contract ComplexOperations {
    ComplexNumber public  num1 = new ComplexNumber();
    ComplexNumber public  num2 = new ComplexNumber();
    
    function setNumbers() public {
        num1.setComplexNumber(10, 20);
        num2.setComplexNumber(20, 50);
    }

    function getNumbers() public view returns(uint, uint){
        // uint real1;
        // uint  imaginary1;
        // (real1, imaginary1) = num1.getComplexNumber();
        num1.getComplexNumber();
    }
    
}