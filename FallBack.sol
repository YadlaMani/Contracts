//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";
contract StorageProxy is Ownable{
    uint public num;
    address implementation;
    constructor(address _implementation) Ownable(msg.sender){
        implementation=_implementation;
    }
    fallback() external payable{
        (bool sucess,)=implementation.delegatecall(msg.data);
        require(sucess,"DelegateCall failed");
    }
    function setImplementation(address _implementation)public onlyOwner{
        implementation=_implementation;
    }
}
//logic contract
contract Implementation1{
    address owner;
    uint public num;
    address public implementation;
    function setNum(uint _num)public{
        num=_num;
    }
    function add(uint _num)public{
        num+=_num;
    }
}
contract implementation2{
    address owner;
    uint public num;
    address public implementation;
    function setNum(uint _num) public{
        num=_num;
    }
    function sub(uint _num) public{
        num-=_num;
    }
}
