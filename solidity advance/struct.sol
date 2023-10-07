//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;
contract Struct{
    struct Car{
        string modelName;
        uint year;
        uint price;
        bool preBooked;
    }

    Car public Audi;
    function setValues(string calldata _modelName, uint _year, uint _price, bool _preBooked) public{
        // Audi.modelName = _modelName;
        // Audi.year = _year;
        // Audi.price = _price;
        // Audi.preBooked = _preBooked;
        Audi = Car(_modelName, _year, _price, _preBooked);
    }
    function returnStruct() view public returns(Car memory){
        return Audi;
    }

}