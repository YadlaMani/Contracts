
//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0;
contract Storage{
    uint public num;
    constructor(uint _num){
        num=_num;
    }
    function getNum() public  view returns(uint){
        return num;
    }
    function add() public{
        num=num+1;
    }
}
