//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0;
contract Token{
    address public owner;
    mapping(address=>uint)balances;
    uint public totalSupply=0;
    constructor(){
        owner=msg.sender;
    }
    modifier isOwner(){
        require(msg.sender==owner,"Only owner can do this operation");
        _;
    }
    //mint function
    function mintToken(uint _amount)public isOwner{
        balances[owner]+=_amount;
        totalSupply+=_amount;

    }
    //mintTo
    function mintToToken(address _recipient,uint _amount)public isOwner{
       
        balances[_recipient]+=_amount;
        totalSupply+=_amount;
       

    }
    //transfer
    function transfer(address _recipient,uint _amount)public {
         require(balances[msg.sender]>=_amount,"Not enough tokens to transfer");
        balances[_recipient]+=_amount;
        balances[msg.sender]-=_amount;
    }
    //blances
    function balance()public view  returns (uint){
        return balances[msg.sender];
    }
    //supply
    function currSupply()public view returns (uint){
        return totalSupply;
    }
}