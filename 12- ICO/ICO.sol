// SPDX-License-Identifier: MIT
pragma solidity 0.8;

// ------------------------------------------------------
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";

contract ICO is Ownable {
    using Math for uint;
    IERC20 tokenPurchase;
    IERC20 tokenIco;

    address payable admin;
    uint256 counter = 0;
    uint256 checker = (2**256)-1;
    uint256 maxPurchase; // availible for each account to buy/conterbute
    uint256 maxAvailable;
    uint256 decimal; // ico token decimals()
    uint256 price;
    uint256 duration; // 1 seconds, 1 minutes, 1 hours, 1 days, 1 weeks = 60 * 60 * 7
    uint256 end;
    bool isStart;
    bool setup;
    mapping(address => uint256) holder; // who -> amount
    mapping(uint256 => address) holders;

    // event \------
    event Claim(address indexed recipient, uint256 amount, uint256 time);

    // init \------
    constructor(uint256 _duration, address _tokenPurchase, uint256 _price, uint256 _maxPurchase, uint256 _decimal) {
        admin = payable(msg.sender);
        isStart = false;
        duration = _duration;
        require(_tokenPurchase != address(0), "make sure address is currect");
        tokenPurchase = IERC20(_tokenPurchase);
        setValue(_price);
        maxPurchase = _maxPurchase;
        decimal = _decimal;
    }

    receive() payable external {
        revert(); // native token not accepting/allowing
    }

    // CALCULATION \----------------------------------------------

    // start \------
    function release() public onlyOwner {
        require(!isStart, "ico has been run");
        require(setup == true, "target ico not set yet");
        isStart = true;
        end = block.timestamp + duration;
    }
    
    // change price before start \------
    function setValue(uint256 value) public onlyOwner {
        require(!isStart, "can not change price");
        price = value;
    }

    // draw \------
    function claim(uint256 amount) public payable returns (bool _success, address _holder) {
       require(isStart, "when? after run before end!");
        require(block.timestamp < end, "finished, thanks for your support");
        require(tokenPurchase.balanceOf(msg.sender) >= amount * price);
        if(holder[msg.sender] + amount <= maxPurchase) {
            require(tokenPurchase.approve(admin, amount * price)); // run by ethersjs as alternative this line of code
            // same value of 2 tokens -> amount * price <- like a wrapped :)
            // we change here: amount * price --> function setValue(....
            require(tokenPurchase.transferFrom(msg.sender, admin, amount * price)); 
            require(counter < checker, "amazing! holder full");
            holder[msg.sender] += amount;
            _success = true;
            _holder = msg.sender;
            holders[counter] = msg.sender;
            counter++;
            tokenIco.transfer(msg.sender, amount * 10 ** decimal);
            // tokenIco.transferFrom(address(this), msg.sender, amount * 10 ** decimal);
            emit Claim(msg.sender, amount, block.timestamp);            
         } else {
            _success = false;
            _holder = address(0);
        }
        wd();
    }

    function targetIco(address token) public onlyOwner {
         tokenIco = IERC20(token);
         maxAvailable = tokenIco.totalSupply();
         // require(tokenIco.transferFrom(token, address(this), maxAvailable));
         setup = true;
    }

    // holders \------
    function viewHolders() public view returns (address _holders) {
        uint len = counter;
        uint i = 0;
        while(i < len) {
            _holders = holders[i];
            i++;
        }
    }

    // automation draw \------
    function wd() private {
       (bool s, ) = admin.call{value: msg.value}("");
       require(s);
    }

}
