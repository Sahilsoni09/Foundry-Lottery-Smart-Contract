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
    error Raffle__SendMoreToEnterRaffle(); // add prefix to know from which contract this error is coming 

    uint256 private immutable i_entranceFee;
    //@dev the duration of the lottery in seconds
    uint256 private immutable i_interval; 
    address payable[] private s_players; // to keep track of players who enter raffle 
    uint256 private s_lastTimeStamp; 

    /**Events */
    event RaffleEntered(address indexed player); 

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    // external function are more gas efficient than public functions
    function enterRaffle() external payable{
        // require( msg.value >= i_entranceFee, "Not enough ETH Sent!");

        // in solidity version 0.8.4, Custom errors are more gas efficient inspite of storing strings
        if(msg.value < i_entranceFee){
            revert Raffle__SendMoreToEnterRaffle();
        }

        // in solidity version 0.8.26, custom error in require statement, but above way is more gas efficient 
        // require(msg.value >= i_entranceFee, Raffle__SendMoreToEnterRaffle()); 
        
        s_players.push(payable(msg.sender)); // Rule of thumb whenever you update storage variable emit events


        // Reason for using events:
        //1.  Makes migration easier
        //2. makes frontend indexing easier
        emit RaffleEntered(msg.sender);
    }

    // Get a Rnadom Number
    // use random number to pick a player
    // automatically call pickWinner function
    function pickWinner() external {
        // check to see if enough time has passed
        if((block.timestamp - s_lastTimeStamp) < i_interval){
            revert();
        }
    }

    /**Getter function */
    function getEntranceFee() public view returns (uint256){
        return i_entranceFee;
    }
}