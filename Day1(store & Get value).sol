pragma solidity >=0.8.2 <0.9.0;

contract NewContract{
    uint value;

    //function to store value
    function set(uint x)public{
        value = x;
    }

    //function to retrieve value
    function get() public view returns(uint){
        return value;
    }
}
