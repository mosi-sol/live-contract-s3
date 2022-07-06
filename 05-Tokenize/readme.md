# Tokenize real word assets + shop core

### how to run:
- deploy `tokenize.sol` with dependencies

### how to change :
- import `tokenize.sol` (jewelery shop), copy the functions and change them. i use `virtual` for this purpes.

included:
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
- now customer cam `list` again
- and each time you can run `verify` function for know that item is not fake

---

- how to tokenize real world into blockchain, without erc721/erc1155
- how to make market/shop based on smart contracts

*this tokenize contract : i teaching afew days ago from second bootcamp*

**Example = https://mumbai.polygonscan.com/address/0x6908180432b6ac89ae349447f87d9575ab630aac#code**
