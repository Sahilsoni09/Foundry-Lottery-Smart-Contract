// Layout of the contract file:
// version
// imports
// errors
// interfaces, libraries, contract

// Inside Contract:
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private

// view & pure functions

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/**
* @title A sample raffle contract
* @author Sahil Soni
* @notice This contract is for creating a smaple raffle
* @dev It implement Chainlink VRF V2.5 & Chainlink Automation  
 */

contract Raffle {

    /*Errors */
    error SendMoreToEnterRaffle();

    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable{
        // require( msg.value >= i_entranceFee, "Not enough ETH Sent!");

        // in solidity version 0.8.4, Custom errors are more gas efficient inspite of storing strings
        if(msg.value < i_entranceFee){
            revert SendMoreToEnterRaffle();
        }

        // in solidity version 0.8.26, custom error in require statement, but above way is more gas efficient 
        // require(msg.value >= i_entranceFee, SendMoreToEnterRaffle()); 
        
    }

    function pickWinner() public {}

    /**Getter function */
    function getEntranceFee() public view returns (uint256){
        return i_entranceFee;
    }
}