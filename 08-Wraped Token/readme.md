# Wrapped ERC20 Token
wrappedToken use for all ERC20 token, example: **WETH** for **ETH**.

### deploy
- copy ERC20 address (for example deploy erc20 Mock)
- paste address as value in Wrapped contract constructor + name + symbol
- before anything: approve wrapped contract as/is spender from base erc20 token
- `deposit` : make wrapped token and locked base token
- `withdraw` : burn wrapped and return locked token to the life cycle
- other functions same an ERC20

### develop
- using `IWrapped` interface is custom/optional : if using this intrface, then inherit erc165 & inherite Wrapped contract. need to register

### libraries
in this example use @openzeppelin/contracts --> sub --> erc20

**if you like to use flat version, use** [this](https://testnet.bscscan.com/address/0x33a1ef3987181e09d3e498ba1c1d53f380b46426#code) 

#

> 07-12-2022 live stream

---

### ready/deployed
- [ERC20 Token](https://testnet.bscscan.com/address/0x22ac23beba298a839657949d1279f886b7a4df50) 
- [Wrapped Token](https://testnet.bscscan.com/address/0x33a1ef3987181e09d3e498ba1c1d53f380b46426) 

---

### contract info 

|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     └      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **Wrapped** | Implementation | ERC20 |||
| └ | <Constructor> | Public ❗️ | 🛑  | ERC20 |
| └ | isBalanced | Internal 🔒 |   | |
| └ | returnDecimals | Public ❗️ |   |NO❗️ |
| └ | returnBalances | Public ❗️ |   |NO❗️ |
| └ | returnDeposited | Public ❗️ |   |NO❗️ |
| └ | returnDeposited | Public ❗️ |   |NO❗️ |
| └ | deposit | External ❗️ | 🛑  |NO❗️ |
| └ | withdraw | External ❗️ | 🛑  |NO❗️ |
| └ | withdraw | External ❗️ | 🛑  |NO❗️ |
| └ | refund | External ❗️ | 🛑  |NO❗️ |
| └ | _terminate | Internal 🔒 | 🛑  | |
| └ | mint | Internal 🔒 | 🛑  | |
| └ | burn | Internal 🔒 | 🛑  | |
| └ | _decimals | Private 🔐 |   | |
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
| **IERC20** | Interface |  |||
| └ | totalSupply | External ❗️ |   |NO❗️ |
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | transfer | External ❗️ | 🛑  |NO❗️ |
| └ | allowance | External ❗️ |   |NO❗️ |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | External ❗️ | 🛑  |NO❗️ |
||||||
| **CrowdfundingFactory** | Implementation |  |||
| └ | create | Public ❗️ | 🛑  |NO❗️ |
| └ | conterbute | Public ❗️ |  💵 |NO❗️ |
| └ | refund | Public ❗️ | 🛑  |NO❗️ |
| └ | finalize | Public ❗️ | 🛑  |NO❗️ |
| └ | balanceOfCampagin | Public ❗️ |   |NO❗️ |
| └ | balance | Public ❗️ |   |NO❗️ |
| └ | version | Public ❗️ |   |NO❗️ |
||||||
| **Crowdfunding** | Implementation |  |||
| └ | _onlyAdmin | Private 🔐 |   | |
| └ | _onlyFundRaiser | Private 🔐 |   | |
| └ | _isNotEnded | Private 🔐 |   | |
| └ | _areValidToPay | Private 🔐 |   | |
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | <Receive Ether> | External ❗️ |  💵 |NO❗️ |
| └ | <Fallback> | External ❗️ |  💵 |NO❗️ |
| └ | create | Public ❗️ | 🛑  | onlyAdmin |
| └ | conterbute | Public ❗️ |  💵 | isNotEnded |
| └ | refund | Public ❗️ | 🛑  | onlyFundRaiser isNotEnded noReentrant |
| └ | revoke | Public ❗️ | 🛑  | onlyAdmin |
| └ | finalize | Public ❗️ | 🛑  | onlyAdmin |
| └ | _isContract | Internal 🔒 |   | |
| └ | balance | Public ❗️ |   |NO❗️ |
| └ | balanceOf | Public ❗️ |   |NO❗️ |
| └ | balanceOfCampagin | Public ❗️ |   |NO❗️ |
| └ | changeNeedTimer | Public ❗️ |   | onlyAdmin |
| └ | theVersion | Public ❗️ |   |NO❗️ |
| └ | changeVersion | Public ❗️ | 🛑  | onlyAdmin |
||||||
| **IERC20** | Interface |  |||
| └ | totalSupply | External ❗️ |   |NO❗️ |
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | allowance | External ❗️ |   |NO❗️ |
| └ | transfer | External ❗️ | 🛑  |NO❗️ |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | External ❗️ | 🛑  |NO❗️ |
||||||
| **Recurit** | Implementation | Ownable |||
| └ | finish | Public ❗️ | 🛑  |NO❗️ |
| └ | depositsOf | Public ❗️ |   |NO❗️ |
| └ | deposit | External ❗️ |  💵 | onlyOwner |
| └ | withdraw | External ❗️ | 🛑  | onlyOwner |
| └ | _deposit | Internal 🔒 | 🛑  | onlyOwner |
| └ | _withdraw | Internal 🔒 | 🛑  | onlyOwner |


 Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |

  
  ### signature hash
  
|  Sighash   |   Function Signature | 
| ---- | ---- | 
| cb03a464  |  isBalanced() | 
| e5347ed9  |  returnDecimals(address) | 
| a3496274  |  returnBalances() | 
| f61ecc61  |  returnDeposited() | 
| 146cf9fb  |  returnDeposited(address) | 
| b6b55f25  |  deposit(uint256) | 
| 2e1a7d4d  |  withdraw(uint256) | 
| f3fef3a3  |  withdraw(address,uint256) | 
| 590e1ae3  |  refund() | 
| 510e01ac  |  _terminate() | 
| a0712d68  |  mint(uint256) | 
| 42966c68  |  burn(uint256) | 
| d51f0f47  |  _decimals(address) | 
