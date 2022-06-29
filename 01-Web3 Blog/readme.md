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

### enjoy it!

---
> live stream : 06-29-2022

##
requirments for make a **micro blog system**:
- edit post --> [calling the post id and updating data] 
- add comment section --> [look like post add, referencing the post id] 
- user role --> [example](https://docs.openzeppelin.com/contracts/2.x/access-control#using-roles) 
- limitation for post's & comment's --> [look here](https://github.com/mosi-sol/live-contracts/blob/cf841ccf04a12560d93302e2b7132eb6f53aaca8/episode-18/string.sol#L6) 
- like system --> [example](https://github.com/mosi-sol/live-contracts-s2/tree/main/10-like-system) 
- recomended to add `receive() payable external{}` & a **withdraw** function --> [example 1](https://github.com/mosi-sol/live-contracts/tree/main/episode-1) - [example 2](https://github.com/mosi-sol/live-contracts/tree/main/episode-20) 
- etc...
