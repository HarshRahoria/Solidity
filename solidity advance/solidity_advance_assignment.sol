//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.9.0;

contract ConcateStrings{
    function stringConcate(string calldata str1, string calldata str2) public pure returns(string memory){
        return string.concat(str1, str2);
    }
} 

contract CompareStrings{
    function stringCompare(string calldata str1, string calldata str2) public pure returns(string memory, bool){
        if(keccak256(abi.encodePacked(str1)) == keccak256(abi.encodePacked(str2))){
            return ("Strings are equal", true);
        }
        else{
            return ("Strings are not equal", false);
        }
    }
}

function linearSearch(uint[] calldata arr, uint value) pure returns(uint, bool) {
    for(uint i=0; i<arr.length; i++){
        if(arr[i] == value){
            return(i,true);
        }
    }
    return(0, false);
}
contract searchNumber{
    function checkValue(uint[] calldata arr, uint value) pure public returns(string memory, int){
        uint index;
        bool status;
        (index, status) = linearSearch(arr, value);
        if(status == true){
            return ("Element is present at index ", int(index));
        }
        else{
            return ("Element is not present!!", -1);
        }
    }
}

    

contract ReverseArray{
    function reverseArray(uint[] memory arr) public pure returns(uint[] memory){
        for(uint i=0; i<arr.length /2; i++){
            (arr[i], arr[arr.length -1 -i]) = ( arr[arr.length -1 -i], arr[i]);
        }
        return arr;
    }
}
contract InsertAtLocation{
    function insertValue(uint element, uint location) public pure returns(uint[3] memory){
        uint[3] memory arr;
        arr[location] = element;
        return arr;
    }
}

struct student{
    string name; 
    uint rollNO;
    uint age;

}

contract studentDetails{

    student s1;
    function insertDetails(string calldata _name, uint _rollNo, uint _age) public {
        s1 = student(_name, _rollNo, _age);
    }
    function getDetails() public view returns(student memory){
        return s1;
    }
}

contract multipleStudentDetails{
    student[] s;
    function insertDetails(string calldata _name, uint _rollNo, uint _age) public {
        s.push(student(_name, _rollNo, _age));
    }
    function getDetails() public view returns(student[] memory){
        return s;
    }
}

contract MappingMarks{
    mapping (address => uint[3]) marks;
    function enterMarks(address person, uint maths, uint english, uint history) public{
        marks[person] = [maths, english, history];
    }
    function returnMarks(address person) public view returns(uint[3] memory){
        uint[3] storage PersonMarks = marks[person];
        return PersonMarks;
    }
}

contract MappingStudents{
    mapping (address => student) Students;
    function insertDetails(string memory _name, uint _rollNo, uint _age) public {
        Students[msg.sender] = student(_name, _rollNo, _age);
    }
    function returnDetails() public view returns(student memory){
        return Students[msg.sender];
    }
}

contract Ownership{
    mapping(address => mapping (address => bool)) ownership;
    function transferOwnership(address _to, bool status) public {
        ownership[msg.sender][_to] = status;
    }
    function ownershipStatus(address _to) public view returns(bool){
        return ownership[msg.sender][_to];
    }
}

contract DynamicArray{
    uint[] arr;
    function Insert(uint value) public {
        arr.push(value);
    }
    function Pop() public{
        arr.pop();
    }
    function getArray() public view returns(uint[] memory){
        return arr;
    }
}

contract SumArray{
    function Sum(uint[] calldata arr) public pure returns(uint){
        uint  sum;
        for(uint i=0; i<arr.length;i++){
            sum += arr[i];
        }
        return sum;
    }
}

contract Sort{
    function sortArray(uint[] memory arr) public pure returns(uint[] memory){
        for(uint i=0; i<arr.length; i++){
            for(uint j=0; j<arr.length-1-i; j++){
                if(arr[j] > arr[j+1]){
                    (arr[j], arr[j+1]) = (arr[j+1], arr[j]);
                }
            }
        }
        return arr;
    }
}

contract EnumHouse{
    enum House {SMALL, MEDIUM, LARGE }

    House choice;
    function setHouse(House _choice) public{
        choice = _choice;
    }
    function returnHouse() public view returns(House){
        return choice;
    }

}