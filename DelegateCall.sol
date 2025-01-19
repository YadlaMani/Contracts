//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0;
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
//proxy contract
contract Storage is Ownable{
    //address owner (storage slot1)
    uint public num;//slot2
    address implementation;//slot3
    constructor(address _implementation)Ownable(msg.sender){
        num=0;
        implementation=_implementation;
    }
    function setNum(uint _num) public{
        (bool sucess,)=implementation.delegatecall(abi.encodeWithSignature("setNum(uint256)", _num));
        require(sucess,"Error while delegating call");
    }
    function setImplementation(address _implementation)public onlyOwner{
        implementation=_implementation;
    }
}
//logic contracts
contract Implementation1{
    address public owner;//storage slot0(dummy)
    uint public num;//slot1
    function setNum(uint _num)public{
        num=_num;

    }
}
contract Implementation2{
    uint public num;
    function setNum(uint _num)public{
        num=_num*2;
    }
}
contract Implementation3{
    uint public num;
    function setNum(uint _num)public{
        num=_num*3;
    }
}
