// SPDX-License-Identifier: MIT
pragma solidity 0.8;

interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

contract ERC165 is IERC165 {
    function supportsInterface(bytes4 interfaceId) external virtual override view returns (bool) {
        return interfaceId == type(IERC165).interfaceId;
    }
}

/// @dev https://eips.ethereum.org/EIPS/eip-3722 <-- iposter
interface IPoster is IERC165 {
    event NewPost(address indexed user, string content, string indexed tag);
    function post(string calldata content, string calldata tag) external returns (uint);
}

contract Blog is ERC165, IPoster {

    address private immutable admin;
    mapping(uint => uint) private tipsBalances; // post id -> +tips
    mapping(uint => address) private writter; // post id -> who 
    mapping(uint => bytes) private postData; // post id -> entire
    uint postId = 0;
    string blogName;
    string blogDescription;

    event Tips(uint indexed id, address indexed sender, address recipiant, uint amount);
    event BytesPost(address indexed user, bytes content, bytes indexed tag);

    constructor(string memory _blogName, string memory _blogDescription) {
            blogName = _blogName;
            blogDescription = _blogDescription;
            admin = msg.sender;
    }

    function supportsInterface(bytes4 interfaceId) external virtual override(ERC165, IERC165) view returns (bool) {
        return interfaceId == type(IERC165).interfaceId || 
        interfaceId == type(IPoster).interfaceId ;
    }

    modifier idCurrection(uint _postId) {
        require(_postId > 0 && _postId <= postId, "not valid post");
        _;
    }

    modifier isAdmin() {
        require(_msgSender() == admin, "only admin is valid to change status");
        _;
    }

    // change blog status ----------------------------------
    function changeBlogName(string calldata newName) external isAdmin returns (string memory) {
        blogName = newName;
        return blogName;
    }
    
    function changeBlogDesc(string calldata newDesc) external isAdmin returns (string memory) {
        blogDescription = newDesc;
        return blogDescription;
    }

    // return requirments ----------------------------------
    function returnBlogName() external view returns (string memory) {
        return blogName;
    }
    
    function returnBlogDesc() external view returns (string memory) {
        return blogDescription;
    }
    
    function totalTipsBalance(uint _postId) external idCurrection(_postId) view returns (uint) {
        return tipsBalances[_postId];
    }
    
    function totalPostNumber() external view returns (uint) {
        return postId;
    }
    
    function postWritter(uint _postId) external idCurrection(_postId) view returns (address) {
        return writter[_postId];
    }
    
    // use this for validation, but i do nothing here
    function validPostData(uint _postId) external idCurrection(_postId) view returns (bytes memory) { 
        return postData[_postId];
    }

    // ----------------------------------------------------
    function postLowGas(bytes calldata content, bytes calldata tag) external returns (uint theId) {
        unchecked{ postId += 1; }
        writter[postId] = _msgSender();
        postData[postId] = _msgData();
        emit BytesPost(_msgSender(), content, tag); 
        theId = postId;    
    }
    
    function post(string calldata content, string calldata tag) external override returns (uint theId) {
        theId = _post(content, tag);
    }

    function _post(string calldata content, string calldata tag) internal returns (uint) {
        unchecked{ postId += 1; }
        writter[postId] = _msgSender();
        postData[postId] = _msgData();
        emit NewPost(_msgSender(), content, tag); 
        return postId;       
    }

    // financial (tips)
    function tips(uint256 _id) external idCurrection(_id) payable {
        require(_msgSender() != writter[_id], "why you want spend gas?");
        uint payed = _msgValue();
        (bool s, ) = writter[_id].call{value: payed}("");
        require(s);
        tipsBalances[_id] += payed;
        emit Tips(_id, _msgSender(), writter[_id], payed);
    }

    
    // helper libs ----------------------------------
    function stringToBytes(string calldata listener) external pure returns (bytes memory encryption) {
        encryption = bytes(abi.encode(listener));
    }
    
    function bytesToString(bytes calldata sniffer) external pure returns (string memory decryption) {
        decryption = abi.decode(sniffer, (string));
    }

    // libs ----------------------------------
    function _this() internal view virtual returns (address) {
        return address(this);
    }

    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    function _msgValue() internal view virtual returns (uint) {
        return msg.value;
    }  

}
