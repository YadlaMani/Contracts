//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0;
contract Payable{
    uint public amount=0;
    function deposit() public payable{
        amount+=msg.value;
    }
    function withdraw(address payable recipient) public{
        payable(recipient).transfer(amount);
        amount=0;
    }
    function getBlance() public view returns (uint256){
        return address(this).balance;
    }
}