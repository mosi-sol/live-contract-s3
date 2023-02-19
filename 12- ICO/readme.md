# ICO - STO - IDO - IPO

> tester: 0xc58522826208D07A4fDAC68FEa01bE618b25685A

- mock erc20 (**PICO**) : [block explorer](https://testnet.bscscan.com/address/0x0dc313c7659fd02e1c7d247faa1075ec50f163c8#code)
- mock ico token (**TICO**) : [block explorer](https://testnet.bscscan.com/address/0xe9205ecb3c32bad2335e0e2c1a8014c9ba9ad095#code)
- **ICO** : [block explorer](https://testnet.bscscan.com/address/0xdc4227f7be667a65bd5f72b4332de1784d4b5334#code)

### how to deploy:
- choose an erc20 or deploy `PICO`
- deploy `ico`, set purchase token address -> pico
- deploy `TICO`, set address `ico`
- into `ico` set function `targetIco(tico)`
- into `ico` run function `release`

*dont forget to approve `ico` address from purchased `pico`*

*you can change amount of `tico` in `constructor` for ico*

#

**fix:**
- add `wd();` in line 86 of `ico.sol`

---

28 jul- 2022

---

### contract info 

|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     └      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **ICO** | Implementation | Ownable |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | <Receive Ether> | External ❗️ |  💵 |NO❗️ |
| └ | release | Public ❗️ | 🛑  | onlyOwner |
| └ | setValue | Public ❗️ | 🛑  | onlyOwner |
| └ | claim | Public ❗️ |  💵 |NO❗️ |
| └ | targetIco | Public ❗️ | 🛑  | onlyOwner |
| └ | viewHolders | Public ❗️ |   |NO❗️ |
| └ | wd | Private 🔐 | 🛑  | |
||||||
| **AuctionNFT** | Implementation | Ownable, ReentrancyGuard |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | startAuction | External ❗️ | 🛑  | onlyOwner |
| └ | bid | External ❗️ |  💵 |NO❗️ |
| └ | end | External ❗️ | 🛑  | onlyOwner |
| └ | _startAuction | Internal 🔒 | 🛑  | |
| └ | _bid | Internal 🔒 | 🛑  | |
| └ | _end | Internal 🔒 | 🛑  | |
| └ | withdraw | External ❗️ | 🛑  | nonReentrant |
| └ | onERC721Received | Public ❗️ | 🛑  |NO❗️ |
||||||
| **StakingRewards** | Implementation |  |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | rewardPerToken | Public ❗️ |   |NO❗️ |
| └ | earned | Public ❗️ |   |NO❗️ |
| └ | stake | External ❗️ | 🛑  | updateReward |
| └ | withdraw | External ❗️ | 🛑  | updateReward |
| └ | getReward | External ❗️ | 🛑  | updateReward |
||||||
| **IERC20** | Interface |  |||
| └ | totalSupply | External ❗️ |   |NO❗️ |
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | transfer | External ❗️ | 🛑  |NO❗️ |
| └ | allowance | External ❗️ |   |NO❗️ |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | External ❗️ | 🛑  |NO❗️ |
||||||
| **IERC721** | Interface |  |||
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | ownerOf | External ❗️ |   |NO❗️ |
| └ | safeTransferFrom | External ❗️ |  💵 |NO❗️ |
| └ | safeTransferFrom | External ❗️ |  💵 |NO❗️ |
| └ | transferFrom | External ❗️ |  💵 |NO❗️ |
| └ | approve | External ❗️ |  💵 |NO❗️ |
| └ | setApprovalForAll | External ❗️ | 🛑  |NO❗️ |
| └ | getApproved | External ❗️ |   |NO❗️ |
| └ | isApprovedForAll | External ❗️ |   |NO❗️ |
||||||
| **IERC165** | Interface |  |||
| └ | supportsInterface | External ❗️ |   |NO❗️ |
||||||
| **IERC721TokenReceiver** | Interface |  |||
| └ | onERC721Received | External ❗️ | 🛑  |NO❗️ |
||||||
| **IERC721Metadata** | Interface |  |||
| └ | name | External ❗️ |   |NO❗️ |
| └ | symbol | External ❗️ |   |NO❗️ |
| └ | tokenURI | External ❗️ |   |NO❗️ |
||||||
| **IERC721Enumerable** | Interface |  |||
| └ | totalSupply | External ❗️ |   |NO❗️ |
| └ | tokenByIndex | External ❗️ |   |NO❗️ |
| └ | tokenOfOwnerByIndex | External ❗️ |   |NO❗️ |


 Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |

### signature hash 

| Sighash   |   Function Signature | 
| ---- |  ---- | 
| 55241077  |  setValue(uint256) | 
| 86d1a69f  |  release() | 
| 379607f5  |  claim(uint256) | 
| f8c99ffa  |  setValue(....,admin,amount) | 
| c7ba2f0a  |  targetIco(address) | 
| 4afe9f1d  |  viewHolders() | 
| 8edec689  |  wd() | 
