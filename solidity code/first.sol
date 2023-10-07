//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;
contract first{
    uint public number;
    // uint  number;
    constructor()  {
      number  = 1000000;
    }
    // function getter()  public view returns(uint){
    //     return number;
    // }
    function transact(uint amount) public {
        number = number - amount;
    }

}
