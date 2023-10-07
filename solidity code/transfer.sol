//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.9.0;

contract payment{
    address payable public receiver;
    uint contractBalance = 0 wei;
    function addReceiver(address payable rec) public {
        receiver = rec;
        payable(receiver);
    }
    function payContract() payable public{

    }
    function getBalance() private view returns(uint){
        
        return address(this).balance - 2000 wei;
    } 
    function tranferEther() public{
        
        receiver.transfer(getBalance());
    }

}