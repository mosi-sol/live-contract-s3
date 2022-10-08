# Hardhat Tutorial
- this tutorial for my students in iran, broadcasted before #IranianWomanProtest2022 .
- full content on [HARDHAT](https://hardhat.org/tutorial) .
- you find more information on [DOCUMENTS](https://hardhat.org/docs) .

### recomended
- nodejs [download](https://nodejs.org/en/download/)
- npm

### simple how to
- mkdir hardhat-project
- cd hardhat-project
- npm init
- npm install --save-dev hardhat
- npx hardhat
- **choose:** *Create an empty hardhat.config.js*
- **---**
- *built-in plugin*
- npm install --save-dev @nomicfoundation/hardhat-toolbox
- *in `hardhat.config.js` first line copy line in below*
- require("@nomicfoundation/hardhat-toolbox");
- **---**
- *make `contracts` folder, create a smartcontract (Test.sol) look like an ERC20 token*
- npx hardhat compile
- **---**
- *make `test` folder, create a smartcontract (Test.js) and copy script in below*
```js
const { expect } = require("chai");

describe("Token contract", function () {
  it("Deployment should assign the total supply of tokens to the owner", async function () {
    const [owner] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("Test");

    const hardhatToken = await Test.deploy();

    const ownerBalance = await hardhatTest.balanceOf(owner.address);
    expect(await hardhatTest.totalSupply()).to.equal(ownerBalance);
  });
});
```
- npx hardhat test
- **---**
- *make `scripts` folder, create `deploy.js` and copy code in below*
```js
async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  console.log("Account balance:", (await deployer.getBalance()).toString());

  const Test = await ethers.getContractFactory("Test");
  const test = await Test.deploy();

  console.log("Test Token address:", test.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
```
- npx hardhat run scripts/deploy.js
- **---**
- *tip: use on other chain like mainnet by --> `npx hardhat run scripts/deploy.js --network <network-name>`*
- *for this need to change `hardhat.config.js` like code in below*
```js
require("@nomicfoundation/hardhat-toolbox");

// Go to https://www.alchemyapi.io, sign up, create
// a new App in its dashboard, and replace "KEY" with its key
const ALCHEMY_API_KEY = "KEY";

// Replace this private key with your Goerli account private key
// To export your private key from Metamask, open Metamask and
// go to Account Details > Export Private Key
// Beware: NEVER put real Ether into testing accounts
// MOSI-SOL private key generator= https://mosi-sol.github.io/Wallet-Web3/
const GOERLI_PRIVATE_KEY = "YOUR GOERLI PRIVATE KEY";

module.exports = {
  solidity: "0.8.9",
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
      accounts: [GOERLI_PRIVATE_KEY]
    }
  }
};
```
- *use [this link](https://mosi-sol.github.io/Wallet-Web3/) for generating private key for test.*
- * `goreli` chain & `alchemy api` just for tutorial*
- *exaple:* `npx hardhat run scripts/deploy.js --network goerli`
- *for more security using `.env`*

