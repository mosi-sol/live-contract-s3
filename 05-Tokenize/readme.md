# Tokenize real word assets + shop core

### how to run:
- deploy `tokenize.sol` with dependencies

### how to change :
- import `tokenize.sol` (jewelery shop), copy the functions and change them. i use `virtual` for this purpes.

### included:
- `ierc20` for communication with all erc20 token, but not add functions in this bootcamp lecture
- added `flat version` for friendly deploying
- `ierc165` for communication by other **tokenized shop** like this has maked by `ishop.sol`


## more info:
- when an item create by `create` function, an event called and tell new item `mint`ed from address(0). this item now tokenized from real world to the blockchain.
- when the item created, a hash code generate for:
- - tracking (holders, warehouse, veritification)
- creator of item is the `shop address`
- after that `listing` the item for sell
- or can transfer by shop address to any other address
- when item is listed, can't transfer. need to cancel listing
- after anyone `buy`ing the item, that item transfer to customer
- now customer can `list` again
- and each time you can run `verify` function for know that item is not fake

### fixed version:
- ***full & fixed***: **look at** [this](https://github.com/mosi-sol/live-contract-s3/tree/main/05-Tokenize/full-functions) 

### need to fix:
- `_totalSell` : use this on `buy function`, add 1 unit. like => `_totalValue += 1;`
- `_totalValue` : use this on `buy function`, add *value* . like => `_totalValue += msg.value;` 
- `_shopBalance` : use this on `receive function`, add *value* . like => `_totalValue += msg.value;`

***like this example***
```solidity
      receive() payable external 
      {
        _shopBalance += _msgValue(); // <------- this line
      }

      function withdraw() external payable onlyShop  // <------- this function
      {
        uint256 val = _shopBalance;
        _shopBalance = 0;
        (bool sent, ) = payable(_msgSender()).call{value: val}("");
        require(sent);
      }
  
  function buy(uint256 id) external payable virtual override 
    {
        require(_msgSender() != _jewels[id].owner, "gas spending is not allow");
        uint256 val = _msgValue();
        address oldOwner_ = _jewels[id].owner;
        require(val >= _jewels[id].price, "not enought fund for buy, check your funds");
        (bool sent, ) = oldOwner_.call{value: val}("");
        bool success = _buy(id);
        require(success && sent);
        if(_jewels[id].secondaryMarket == false){ _jewels[id].secondaryMarket = true; }
        _totalSell += 1;      // <--------------------------------------------------- here
        _totalValue += val;   // <--------------------------------------------------- here
        emit Transfer(id, oldOwner_, _msgSender(), _itemCertify[id], block.timestamp);
    }

```

---

### p.s:
- how to tokenize real world into blockchain, without erc721/erc1155
- how to make market/shop based on smart contracts

*this tokenize contract : i teaching afew days ago from second bootcamp*

**Example = https://mumbai.polygonscan.com/address/0x6908180432b6ac89ae349447f87d9575ab630aac#code**

> 07-07-2022
