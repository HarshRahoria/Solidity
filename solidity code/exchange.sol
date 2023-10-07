//SPDX-License-Identifier: UNLICENSED
pragma solidity <=0.7.0 <0.9.0;

contract exchange{
    address payable public  receiver;
    function addReceiver(address payable recv) public {
        receiver = recv;
    }
    function payEther() payable public {
        uint eth = address(this).balance - 2 wei ;
        receiver.transfer(eth);
    }

}