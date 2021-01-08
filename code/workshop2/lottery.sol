pragma solidity ^0.5.11;
contract aaa{
    address public contractOwner;
    uint public price;
    uint public copy;
    struct Lottery{
        address[] lotteryOwner;
        uint sellCount;
    }   
    Lottery[1000000] public lottery;
    constructor (uint _copy, uint _price)public{
        copy = _copy;
        price = _price; 
        contractOwner = msg.sender;
    }
    function getOwner(uint _number) public view returns(address[] memory){
        return lottery[_number].lotteryOwner;
    }
    function howManyLeft(uint _number)public view returns(uint){
        require(_number<1000000,"we do not have the number");
        return copy - lottery[_number].sellCount;
    }
     function buyLottery(uint _number)public payable{
        require(msg.sender != address(0),"address(0) is not allowed");
        require(msg.value == price,"payment must be equal to price");
        require(lottery[_number].sellCount < copy,"soldout");
        require(_number<1000000,"we do not have the number");
        lottery[_number].lotteryOwner.push(msg.sender);
        lottery[_number].sellCount ++;
    }
}