//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;

// Armstrong Number

contract Armstrong{
    function checkArmstrong(uint num) public pure returns(string memory){
        uint digit = digitCalculate(num);
        uint armstrongNumber = calculateNum(num, digit);
        if(num == armstrongNumber){
            return ("Number is armstrong");
        }
        else{
            return ("Number is not arm-strong");
        }
    }
    function digitCalculate(uint number) private pure returns(uint){
        uint digit;
        while(number != 0){
            digit++;
            number = number/10;
        }
        return digit;
    }
    function calculateNum(uint Num, uint digit) private pure returns(uint){
        uint temp;
        while(Num != 0){
            temp = temp + calculatepower(Num%10, digit);
            Num = Num/10;
        }
        return temp;
    }
    function calculatepower(uint a, uint power) private pure returns(uint){
        uint result =1;
        for(uint i=0; i<power; i++){
            result *= a;
        }
        return result;
    }
}

// Average 

contract average{
    function calAverage(uint a, uint b, uint c) pure public returns(string memory, uint){
        uint avg = (a+b+c) / 3;
        string memory response = "Average is: ";
        return (response, avg);
    }
}

// cube
contract cube{
    function calculateCube(uint num) public pure returns(uint){
        return num*num*num;
    }
}

//Even or odd

contract even_odd{
    function evenOdd(uint num) public pure returns(string memory){
        string memory response;
        if(num%2 ==0){
            response = "Even number";
            return response;
        }
        else{
            response = "odd number";
            return response;
        }
    }
}

// Factorial

contract Factorial{
    function factotial(uint num) public pure returns(uint){
        if(num ==0 || num ==1){
            return 1;
        }
        else{
            return num * factotial(num-1);
        }
    }
}

//Fibonacci

contract Fibonacci{
    uint[] public series;
    function fibonacci(uint num) public {
        uint a = 0;
        uint b = 1;
        series.push(b);
        uint temp;
        while(num !=0){
            temp = a+b;
            a = b;
            b = temp;
            series.push(temp);
            num--;
        }
    }
}

//Greatest Among 3 numbers

contract Greatest{
    function greatest(uint a, uint b, uint c) public pure returns(string memory, uint ){
        if(a>b ){
            if(b>c){

            return ("largest num is" , a);
            }
            else{
                if(c>a){
                    return ("largest num is", c);
                }
                else{
                    return("largest num is", a);
                }
            }
        }
        else{
            if(b>c){
                return ("largest num is", b);
            }
            else{
                return ("largest num is", c);
            }
        }

    }
}

// Multiplication with addtion

contract Multiplication{
    function multiplication(uint a, uint b) public pure returns(uint){
       uint temp;
        for(uint i=0; i<a; i++){
            temp = temp + b;
        }
        return temp;
    }
}

// Pallindrome

contract Pallindrome{
    function checkPallindrome(uint num) public pure returns(string memory){
        uint rev = reverse(num);
        if (num == rev){
            return ("Number is pallindrome");
        }
        else{
            return ("Number is not pallindrome");
        }
    }
    function reverse(uint num) private pure returns(uint ){
        uint temp;
        while(num != 0){
            temp = (10*temp) + num%10;
            num = num/10;
        }
        return temp;
    }
}

// power

contract Power{
    function calculatepower(uint num, uint power) public pure returns(uint){
        uint result =1;
        for(uint i=0; i<power; i++){
            result *= num;
        }
        return result;
    }
}

// prime number

contract prime{
    function calculatePrime(uint num) public pure returns(uint ){
        uint flag = 1 ;
        for(uint i = 2; i < num; i++){
            if(num%i == 0){
                flag = 0;
            }
        }
        return flag;
    }
}

// Reverse
contract Reverse{
    function reverse(uint num) public pure returns(uint ){
        uint temp;
        while(num != 0){
            temp = (10*temp) + num%10;
            num = num/10;
        }
        return temp;
    }
}

//Sum of digits

contract DigitsSum{
    function sumDigit(uint num) public pure returns(uint){
        uint temp;
        while(num !=0){
            temp = temp + num%10;
            num /= 10;
        }
        return temp;
    }
}

// Swap

contract swap{
    uint public num1 = 23;
    uint public num2 = 34;
    function swapping() public {
        uint temp;
        temp = num1;
        num1 = num2;
        num2 = temp;
    }
}

//Swap without 3rd variable

contract swapWithoutThirdVariable{
    uint public num1 = 23;
    uint public num2 = 34;
    function swapping() public {
        num1 = num1 + num2;
        num2 = num1 - num2;
        num1 = num1 - num2;
    }
}