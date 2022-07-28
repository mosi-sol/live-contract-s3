# ICO - IDO - IPO

> tester: 0xc58522826208D07A4fDAC68FEa01bE618b25685A

- mock erc20 (PICO) : [block explorer](https://testnet.bscscan.com/address/0x0dc313c7659fd02e1c7d247faa1075ec50f163c8#code)
- mock ico token (TICO) : [block explorer](https://testnet.bscscan.com/address/0xe9205ecb3c32bad2335e0e2c1a8014c9ba9ad095#code)
- ICO : [block explorer](https://testnet.bscscan.com/address/0xdc4227f7be667a65bd5f72b4332de1784d4b5334#code)

### how to deploy:
- choose an erc20 or deploy `PICO`
- deploy `ico`, set purchase token address -> pico
- deploy `TICO`, set address `ico`
- into `ico` set function `targetIco(tico)`
- into `ico` run function `release`

*dont forget to approve `ico` address from purchased `pico`*

*you can change amount of `tico` in `constructor` for ico*
