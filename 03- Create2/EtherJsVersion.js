
// ethersjs example
const walletAddress = "0xanaddress.....";
    const nonce = 0;
    let deployedAddress = ethers.utils.getAddress(ethers.utils.getContractAddress({from: walletAddress, nonce}));
    console.log(deployedAddress);
