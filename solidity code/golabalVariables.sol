//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 < 0.9.0;

contract builtInVariables{
    function variables() public view returns(uint blockNo, uint timestamp, address sender, uint limit, uint id){
        return(block.number, block.timestamp, msg.sender, block.gaslimit, block.chainid);
}
}