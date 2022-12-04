// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract OpenSci is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;

    uint price = 0.1 ether;

    event PaperPublished(address indexed user, uint tokenId, uint timestamp);

    constructor() ERC721("OpenSci", "OSCI") {}

    function mint(string memory uri) external payable returns(uint256) {
        require(msg.value >= price, "Not enough ETH");
        address user = msg.sender;
        _tokenIds.increment();
        uint id = _tokenIds.current();
        _mint(user, id);
        _setTokenURI(id, uri);
        _tokenIds.increment();
        emit PaperPublished(user, id, block.timestamp);
        return id;
    }

    function setPrice(uint _price) external onlyOwner {
        price = _price;
    }

    function getPrice() external view returns(uint) {
        return price;
    }

    function withdraw() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://ipfs.io/ipfs/";
    }

    
}