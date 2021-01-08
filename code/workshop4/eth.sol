pragma solidity ^0.5.11;
contract Storage{
    bytes public dataURL;
    bytes public a;
    
    function set(string memory _dataURL)public{
        a = bytes(_dataURL);
        for(uint i=0;i<a.length;i++){
            dataURL.push(a[i]);
        }
    }
    
    function clear()public{
        dataURL = "";
    }
}