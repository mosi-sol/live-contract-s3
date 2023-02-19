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

> BootCamp (solidity rush) - 8 hour solidity from scratch - 
BootCamp weeks ago, language farsi/persian

---

### contract info

|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     └      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **NoFeeSwap2Pairs** | Implementation |  |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | _lock | Private 🔐 | 🛑  | |
| └ | _release | Private 🔐 | 🛑  | |
| └ | _hold | Private 🔐 | 🛑  | |
| └ | createValuetion | External ❗️ | 🛑  |NO❗️ |
| └ | clearValuetion | External ❗️ | 🛑  |NO❗️ |
| └ | swap | External ❗️ | 🛑  | isValidToken |
| └ | _min | Private 🔐 |   | |
| └ | _sqrt | Private 🔐 |   | |
| └ | sqrt_ | Private 🔐 |   | |
| └ | _this | Internal 🔒 |   | |
| └ | _msgSender | Internal 🔒 |   | |
| └ | _msgData | Internal 🔒 |   | |
| └ | _msgValue | Internal 🔒 |   | |
||||||
| **Cipher** | Implementation |  |||
| └ | compare | Internal 🔒 |   | |
| └ | morse_to_char | Internal 🔒 |   | |
| └ | char_to_morse | Internal 🔒 |   | |
| └ | hash | Internal 🔒 |   | |
| └ | dehash | Internal 🔒 |   | |
||||||
| **Test** | Implementation | Cipher |||
| └ | receiveMsg | Public ❗️ |   |NO❗️ |
| └ | sendMsg | Public ❗️ |   |NO❗️ |
||||||
| **TestWord** | Implementation | Cipher |||
| └ | concat | Internal 🔒 |   | |
| └ | morse | Public ❗️ |   |NO❗️ |
||||||
| **Cipher** | Implementation |  |||
| └ | compare | Internal 🔒 |   | |
| └ | char_to_morse_code | Internal 🔒 |   | |
||||||
| **Test** | Implementation | Cipher |||
| └ | morse | Public ❗️ |   |NO❗️ |
||||||
| **Cipher** | Implementation |  |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | _design1 | Internal 🔒 | 🛑  | |
| └ | _design2 | Internal 🔒 | 🛑  | |
| └ | _T | Internal 🔒 |   | |
| └ | concat | Internal 🔒 |   | |
| └ | _generate | Internal 🔒 |   | |
| └ | _pattern_1 | Internal 🔒 | 🛑  | |
| └ | _pattern_2 | Internal 🔒 | 🛑  | |
||||||
| **TestWord** | Implementation | Cipher |||
| └ | unMerge | Public ❗️ |   |NO❗️ |
| └ | generate | Public ❗️ |   |NO❗️ |
| └ | table | Public ❗️ |   |NO❗️ |
| └ | pattern_1 | Public ❗️ | 🛑  |NO❗️ |
| └ | pattern_2 | Public ❗️ | 🛑  |NO❗️ |
||||||
| **Cipher** | Implementation |  |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | _design | Private 🔐 | 🛑  | |
| └ | _T | Internal 🔒 |   | |
| └ | concat | Internal 🔒 |   | |
| └ | _generate | Internal 🔒 |   | |
||||||
| **TestWord** | Implementation | Cipher |||
| └ | generate | Public ❗️ |   |NO❗️ |
| └ | table | Public ❗️ |   |NO❗️ |
||||||
| **Cipher** | Implementation |  |||
| └ | compare | Internal 🔒 |   | |
| └ | _T | Internal 🔒 |   | |
| └ | T | Public ❗️ |   |NO❗️ |
| └ | isValid | Public ❗️ |   |NO❗️ |
||||||
| **IERC20** | Interface |  |||
| └ | totalSupply | External ❗️ |   |NO❗️ |
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | transfer | External ❗️ | 🛑  |NO❗️ |
| └ | allowance | External ❗️ |   |NO❗️ |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | External ❗️ | 🛑  |NO❗️ |


 Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |

### signature hash

| Sighash   |   Function Signature |
| ---- | ---- |
| 1f73668d  |  _lock(address,uint256) |
| 0495ff94  |  _release(address,uint256) |
| ea366720  |  _hold(uint256,uint256) |
| 6f577473  |  createValuetion(uint256,uint256) |
| 94f02fc4  |  clearValuetion(uint256) |
| d004f0f7  |  swap(address,uint256) |
| ac023b75  |  _min(uint256,uint256) |
| 6a263f02  |  _sqrt(uint256) |
| 5378ae36  |  sqrt_(uint256) |
| 2b5ab84a  |  _this() |
| 119df25f  |  _msgSender() |
| 8b49d47e  |  _msgData() |
| 45ec9354  |  _msgValue() |
