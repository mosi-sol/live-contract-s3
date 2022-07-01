# SWAP *ERC20*
- deploy `erc20mock` contract , 2 times for `token a` & `token b`
- deploy `swap` contract , put that 2 address as value's
- don't forget to `approve` the *swap address* on that *2 mock* as *spender*
- run `createValuetion` function as liquidity pool
- with your test account or other account run `swap` function
##
- for clear liquidity run `clearValuetion` function
##
- for using another token for pair's, deploy `SWAP` contract again with *new pairs* OR
- - use factory pattern - [example](https://github.com/mosi-sol/live-contracts/tree/main/episode-3) 
- - use proxy pattern - [example](https://github.com/mosi-sol/live-contracts/tree/main/episode-23) 
- - use create2 pattern - [example](https://github.com/mosi-sol/live-contract-s3/tree/main/03-%20Create2)  
##

> BootCamp (solidity rush) - 8 hour solidity from scratch
BootCamp weeks ago, language farsi/persian
