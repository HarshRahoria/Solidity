//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;
contract demo{
    
    address payable receiver =  payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    function payContract() payable public {

    }
    function getBalanceContract() public view returns(uint){
        return address(this).balance;
    }
    function payReceiver() public {
        receiver.transfer(3 ether);
    }
    function receiverBalance() public view returns(uint){
        return address(receiver).balance;
    }
}