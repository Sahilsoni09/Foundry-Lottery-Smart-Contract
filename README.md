# Fully Automated Lottery Smart Contract 

## About
This code is designed to create a Proveably random lottery smart contract 

## What we want it to do 
1. Users should able to enter the raffle by paying for a ticket. The ticket fees will become the price for the winner
2. After centain Interval Random winner is selected automatically.
3. Random winner is selected by genrating random number using chainlink VRF
4. Contract automatically reset after declaring a winner and new round is automatically started using Chainlink Automation 

## Tests!
1. Write Deploy Script 
    note: these will not work on zkSync
2. Write tests
    1. Local chain
    2. forked testnet
    3. forked mainnet