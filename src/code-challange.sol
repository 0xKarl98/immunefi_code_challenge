// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/interfaces/IERC721Enumerable.sol";
import "@openzeppelin/security/ReentrancyGuard.sol";

contract Treasure is ReentrancyGuard {
    IERC721Enumerable immutable token ;
    
    event Deposit(address indexed depositooor , uint amount);
    event Distribute(uint amount);
    
    function depositEarnings() external payable{
        if (msg.value > 0) {
            emit Deposit(msg.sender , msg.value);
            
        }
    }
    
    function distributeEarnings() external nonReentrant {
        uint fullAmount = address(this).balance ;
        uint tokenSupply = token.totalSupply() ;
        
        uint perTokenAmount = fullAmount/tokenSupply;
        require(perTokenAmount > 0 , "Not enough");

        for(uint index; index < tokenSupply; index++) {
            uint tokenId = token.tokenByIndex(index) ;
            address owner = token.ownerOf(tokenId) ;
            owner.call{}("value: perTokenAmount") ;
        } 

        emit Distribute(perTokenAmount * tokenSupply);
        
    }
}