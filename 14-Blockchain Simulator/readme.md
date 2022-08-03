# Blockchain Simulation

this is an example for how to blockchain work technicly, but if you deep looking you can watch the core of all dapp's.

##

### how to run:
- deploy by putting a price as fee
- owner run contract by using `starting` function
- `claim` function need fee, everyone can do that
- just testing others.
- **enjoy it**

### usecases:
- for selling digital thing's
- sell ticket
- combaining with nft's
- etc...

> live stream at: 3 Aug 2022

---

### bug fix:
line 89 add: `require(start == false, "rule: the chain in proccess");`

### test example:

- "id":       number
- "past":     last block (bytes16) generated
- "present":  new block (bytes16) generated
- "creator":  creator of new block (wonner)
- "proof":    creator of the last created block

**id: 0**, = *GENESIS BLOCK* --> 0x55490298abbf910353747a85a9d6992d

```json

"id": "0",
"past": "0x00000000000000000000000000000000",
"present": "0x55490298abbf910353747a85a9d6992d",
"creator": "0x417Bf7C9dc415FEEb693B6FE313d1186C692600F",
"proof": "0x0000000000000000000000000000000000000000"

"id": "1",
"past": "0x55490298abbf910353747a85a9d6992d",
"present": "0xd03bea9b8fa5a1f61150ec1de716be60",
"creator": "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2",
"proof": "0x417Bf7C9dc415FEEb693B6FE313d1186C692600F"

"id": "2",
"past": "0xd03bea9b8fa5a1f61150ec1de716be60",
"present": "0x17346d51e6bfbee1ff489f20ecf4026a",
"creator": "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2",
"proof": "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2"

"id": "3",
"past": "0x17346d51e6bfbee1ff489f20ecf4026a",
"present": "0x7ae739fef68ab182713e75637f7550ad",
"creator": "0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db",
"proof": "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2"

"id": "4",
"past": "0x7ae739fef68ab182713e75637f7550ad",
"present": "0xce8b55063a8643d1a8a324dc63253fcc",
"creator": "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
"proof": "0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db"

```

**this type of validate/verify is semi-snapshot, not same as merkle**

---

### live on BSC testne:
https://testnet.bscscan.com/address/0xf2b53f01e10b12e0db81834d066b4cd8dd2f7fa9#code
