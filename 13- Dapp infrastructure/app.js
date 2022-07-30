let provider;
let signer;
let accounts;
// {in product use const and stay in one chain} ==> const DEFAULT_CHAIN = 97;
let DEFAULT_CHAIN = 97; // 97=bsc testnet  - 1 = eth mainnet

window.onload = function() {
    if(window.ethereum) {
        this.ethereum.on('accountsChanged', accountChange);
        window.ethereum.request({ 
            method: 'eth_accounts' })
            .then(accountChange)
            .catch((err) => {
                console.log(err);
            });
            provider = new ethers.providers.Web3Provider(window.ethereum, DEFAULT_CHAIN);
    }
    else{
        console.log("please install metamask");
    }
}

function initialize() {
    start();
    acc();
    balances();
    accountChange();    
}
window.addEventListener('DOMContentLoaded', initialize);


// === not use alchemy in this examle dapp, this just for training === \\
const alchemyConstructor = async () => {
    // Use the mainnet
    const network = "homestead";
    // ethers.providers.getNetwork( aNetworkish ) ⇒ Network
    // getNetwork("homestead");
    // getNetwork(1);
    // exam:  await ....
    // network = ethers.providers.getNetwork("rinkeby");

    const provider = ethers.getDefaultProvider(network, {
        alchemy: "https://eth-mainnet.alchemyapi.io/v2/123123123123",
        /*
        // Connect to mainnet (homestead)
        provider = new AlchemyProvider();

        // Connect to the ropsten testnet
        // (see EtherscanProvider above for other network examples)
        provider = new AlchemyProvider("ropsten");

        // Connect to mainnet with an API key (these are equivalent)
        provider = new AlchemyProvider(null, apiKey);
        provider = new AlchemyProvider("homestead", apiKey);

        // Connect to the Alchemy WebSocket endpoints with a WebSocketProvider
        provider = AlchemyProvider.getWebSocketProvider()
        */
    });
    console.log(network , " - ", provider);
}

const accountChange = (a) => {
    accounts = a;
    display(connect, "connected", "Not able to connect");
}

const start = async () => {
    provider = new ethers.providers.Web3Provider(window.ethereum, DEFAULT_CHAIN) 

    await provider.send("eth_requestAccounts", []);

    signer = provider.getSigner()
}

const acc = async () => {
    accounts = await ethereum.request({ method: 'eth_accounts' });
    display(theAccount, accounts[0], "Not able to get accounts");
}

const balances = async () => {
    const accounts = await ethereum.request({ method: 'eth_accounts' });
    const val = await provider.getBalance(accounts[0]);
    display(theBalance, ethers.utils.formatUnits(val, 18), "Not able signature");
}

connect.addEventListener('click', async () => {
    try {
        await start();
    } catch (error) {
        console.error(error);
    }
    display(connect, "connected", "Not able to connect");
});

theAccount.addEventListener('click', async () => {
    try {
        await acc();
    } catch (error) {
        console.error(error);
    }
    display(theAccount, accounts[0], "Not able to get accounts");
});

theBalance.addEventListener('click', async () => {
    try {
        await balances();
    } catch (error) {
        console.error(error);
    }
});

function changeChainId(newChainId) {
    DEFAULT_CHAIN = newChainId;
}
chain1.addEventListener('click', async () => {
    changeChainId(1);
    start();
    display(chainDisplay, "chain: "+DEFAULT_CHAIN, "!!!");
});
chain97.addEventListener('click', async () => {
    changeChainId(97);
    start();
    display(chainDisplay, "chain: "+DEFAULT_CHAIN, "!!!");
});


// ======= make organized workflow =========
// helper ==================================
function displayer(where, some) {
    document.getElementById(`${where}`).innerHTML = some;
}

function display(where, cur, fal) { // cur = true answer, fal = false answer(error)
    where.innerHTML = `${cur}` || `${fall}`;
}
