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
