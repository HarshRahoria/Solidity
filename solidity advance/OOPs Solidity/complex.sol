//SPDX-License-Identifier: Harsh Rahoria
pragma solidity >0.7.0 <0.9.0;

contract RealNumber{
    uint private realPart;
    
    function setRealPart(uint _realPart) internal {
        realPart = _realPart;
    }
    function returnRealPart() internal view returns(uint){
        return realPart;
    }
}

contract ImaginaryNumber{
    uint private imaginaryPart;

    function setImaginaryPart(uint _imaginaryPart) internal {
        imaginaryPart = _imaginaryPart;
    }
    function returnImaginaryPart() internal view returns(uint){
        return imaginaryPart;
    }
}

contract ComplexNumber is RealNumber, ImaginaryNumber{
    function setComplexNumber(uint _real , uint _imaginary) public {
        setRealPart(_real);
        setImaginaryPart(_imaginary);
    }
    function getComplexNumber() public view returns(uint, uint){
        return(returnRealPart(),  returnImaginaryPart());
    }
    function getReal() public view returns(uint){
        return returnRealPart();
    }
    function getImaginary() public view  returns(uint){
        return returnImaginaryPart();
    }
}
