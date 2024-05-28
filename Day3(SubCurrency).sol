pragma solidity >=0.8.2 <0.9.0;

contract NewCurrency{
    address minter;
    mapping (address => uint) public balances;

    constructor() payable {
        minter = msg.sender;
    }

    event sent(address from, address to, uint amount);

    function minting(address payable receiver, uint amount) public {
        require(msg.sender==minter);
        balances[receiver] += amount;
    }

    error ErrorMessage(uint reqAmount,uint availBalance);

    function Send(address receiver, uint amount) public {
        if(amount > balances[msg.sender]){
            revert ErrorMessage({
                reqAmount: amount,
                availBalance: balances[msg.sender]
            });
        }
        
        balances[msg.sender] -= amount;
        balances[receiver] += amount;

        emit sent(msg.sender, receiver, amount);
    }
}
