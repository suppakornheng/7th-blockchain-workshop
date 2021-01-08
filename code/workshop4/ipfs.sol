pragma solidity ^0.5.11;

contract hashStorage { 
    string public ipfsHash;
    address public owner;
    
    constructor()public{
        owner = msg.sender;
    }
    
    function addHash(string memory _ipfsHash)public {
        require(msg.sender == owner);
        ipfsHash=_ipfsHash;
    }
}    