//SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.8.0;
//proxy contract
contract Storage{
    uint public num;
    address implementation;
    constructor(address _implementation){
        num=0;
        implementation=_implementation;
    }
    function setNum(uint _num) public{
        (bool sucess,)=implementation.delegatecall(abi.encodeWithSignature("setNum(uint256)", _num));
        require(sucess,"Error while delegating call");
    }
    function setImplementation(address _implementation)public{
        implementation=_implementation;
    }
}
//logic contract
contract Implementation1{
    uint public num;
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
