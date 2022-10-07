# Whitelist - Ver2
- no compute hash version
- bulk fail if any address add/remove before
- high performance for using in small projects
- double spending solved

### test:
use function `claim` after add address.

**Enjoy it!**

### decress gasfee
- from line 73
```solidity
function bulkAddToList(address[] memory newUsers) public onlyOwner {
        uint j = newUsers.length; // <-- this
        for(uint i =0; i < j; i++){
            require(_whiteList[newUsers[i]] != true, "can't add again");
            _whiteList[newUsers[i]] = true;
            emit AddWhiteList(newUsers[i]);
        }
    }

    function bulkRemoveFromList(address[] memory theUsers) public onlyOwner {        
        uint j = theUsers.length; // <-- this
        for(uint i =0; i < j; i++){
            require(_whiteList[theUsers[i]] == true, "address not listed");
            _whiteList[theUsers[i]] = false;
            emit RemoveWhiteList(theUsers[i]);
        }
    }
```
