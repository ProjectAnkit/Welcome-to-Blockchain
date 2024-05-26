pragma solidity >=0.8.2 <0.9.0;

contract will{
    address owner;
    uint fortune;
    bool isdead = false;

    constructor() payable {
         owner = msg.sender; 
         fortune = msg.value;
         isdead = false;    
    }

    modifier isDead{
        require(isdead==true);
        _;
    }

    modifier isowner{
        require(msg.sender==owner);
        _;
    }

     address payable[] familyWallets;
    mapping (address => uint) inheritance;
   
    
    function setInheritance(address payable wallet, uint amount) public payable isowner{
         uint ethervalue = amount * 1 ether;
         familyWallets.push(wallet);
         inheritance[wallet] = ethervalue;
    }

    function makeWillsuccess() private isDead{
        for(uint i=0; i < familyWallets.length; i++){
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
        }
    }

    function executeWill() public isowner{
        isdead = true;
        makeWillsuccess();
    }
}
