# the full version
deployed version : BSC testnet -> [here](https://testnet.bscscan.com/address/0x1e2adb685159c692c4c4468bf70ec63212365cf2) 

more info [here](https://github.com/mosi-sol/live-contract-s3/tree/main/05-Tokenize) 

### shop ledger
for get data & information about shop ledger for any purpeses, add code in below intoo the contract:

```solidity
function totalSell() external view virtual returns (uint256)
  {
      return _totalSell; // ledger counter
  }

function totalValue() external view virtual returns (uint256)
  {
      return _totalValue; // ledger value
  }
```
