# Create2 factory pattern

### `target` contract pre-computed 
- TargetContract 

### `create target` - use 1 of these
- Create2Factory 
- Create2Proxy

#

- calculed: keccak256( 0xff ++ senderAddress ++ salt ++ keccak256(init_code))[12:]
- nonce  is not zero - init_code 0x00 is danger
- gas: 32000  -> 20000 or any num
- SELFDESTRUCT (0xff)
- nonce made by: gas, salt, address
- in this example, address is msg.sender
- can add after salt {salt: bytes32(_salt)}
- https://github.com/ethereum/EIPs/blob/master/EIPS/eip-1014.md
# 

### included example's
- `nodejs` solution create2
- `ethersjs` example

---

### can use openzeppelin
import "@openzeppelin/contracts/utils/Create2.sol";

- deploy(amount, salt, bytecode)
- computeAddress(salt, bytecodeHash)
- computeAddress(salt, bytecodeHash, deployer)
