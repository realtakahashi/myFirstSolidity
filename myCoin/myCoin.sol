pragma solidity ^0.4.23;

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-solidity/v1.9.0/contracts/token/ERC20/StandardToken.sol";

contract SEI is StandardToken {
    string public name = "SEIToken";
    string public symbol = "SEI";
    uint public decimals = 2;
    
    uint public remaingCoin = 0;
    
    address private fausetAddress = 0x81b7e08f65bdf5648606c89998a9cc8164397647;
    
    constructor(uint _initialSupply) public {
        totalSupply_ = _initialSupply;
        remaingCoin = _initialSupply;
    }
    
    function getCoin() public payable checkAmount checkBalance {
        uint coins = msg.value / 200000000000000000;
        balances[msg.sender] = balances[msg.sender] + coins;
        remaingCoin = remaingCoin - coins;
        
        fausetAddress.transfer(msg.value);
    }
    
    modifier checkAmount(){
        require(msg.value >= 0.2 ether);
        _;
    }
    
    modifier checkBalance(){
        uint coins = msg.value / 200000000000000000;
        require(remaingCoin >= coins);
        _;
    }

}
