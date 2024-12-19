//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0;
contract Will{
    address owner;
    address  reciptent;
    uint public amount=0;
    uint public unlockTime;
    constructor(address _reciptent){
        owner=msg.sender;
        reciptent=_reciptent;
    }
    modifier isOwner(){
        require(msg.sender==owner,"Only owner can call this function");
        _;
    }
    function addAmount()public isOwner payable{
        amount+=msg.value;
    } 
    function changeReciptent(address _reciptent)public  isOwner{
        reciptent=_reciptent;
    }
    function ping(uint secondsUntilUnlock)public isOwner{
        require(secondsUntilUnlock>0,"Unlock time should be greater than 0 ");
        unlockTime=block.timestamp+secondsUntilUnlock;
    }
    function drain() public {
        require(msg.sender==reciptent,"Only the recipient can withdraw");
        require(block.timestamp>=unlockTime,"Time didnt expire yet");
        uint balance=address(this).balance;
        require(balance>0,"No funds to withdraw");
        payable(reciptent).transfer(balance);
        amount=0;
    }


}
