// based on ethersjs

document.getElementById("myBtn2").addEventListener("click", function(){
    const Nwallet = ethers.Wallet.createRandom();
    document.getElementById("adr").innerHTML = Nwallet.address; // public key
    document.getElementById("nmn").innerHTML = Nwallet.mnemonic.phrase; // nmemonic
    document.getElementById("pri").innerHTML = Nwallet.privateKey; // private key
});
        
