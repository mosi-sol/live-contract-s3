# Web3 Blog
**included:**
- blog name
- blog description
- post added by `string`
- post added by `bytes` - low gas solution
- can Tips to post writter
- used: eip-3722 & erc-165 (trakable)
- anyone can post
- no need to paye any fee for using to platform/admin
- demo on LUKSO blockchain [watch here](https://explorer.execution.l16.lukso.network/address/0x4cf1bD0AFF1f14651a91152380114a71123Dd329/contracts) {add 07-13-2022}

### enjoy it!

---
> live stream : 06-29-2022

##
### requirments for make a **micro blog system**:
- *edit post* --> ***calling the post id and updating data. how to? just copy create post without increment id*** 
- *add comment section* --> ***look like post add, referencing the post id*** 
- *user role* --> [example](https://docs.openzeppelin.com/contracts/2.x/access-control#using-roles) 
- *limitation for post's & comment's* --> [look here](https://github.com/mosi-sol/live-contracts/blob/cf841ccf04a12560d93302e2b7132eb6f53aaca8/episode-18/string.sol#L6) 
- *like system* --> [example](https://github.com/mosi-sol/live-contracts-s2/tree/main/10-like-system) 
- *recomended to add* `receive() payable external{}` & a **withdraw** function --> [example 1](https://github.com/mosi-sol/live-contracts/tree/main/episode-1) - [example 2](https://github.com/mosi-sol/live-contracts/tree/main/episode-20) 
- *using media (pic,video,music...) by [ipfs](https://ipfs.io)* --> [provier, helper 1](https://nft.storage) - [provier, helper 2](https://pinata.cloud) 
- *etc*...

##

<div align="right"> 
<a href="https://github.com/mosi-sol/live-contract-s3" target="blank">
  <img src="https://img.shields.io/badge/License-MIT-blue?style=flat" alt="cafe_pafe" /></a>  
</div>
