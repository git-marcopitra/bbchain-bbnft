// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MundialToken is ERC721, Ownable {
    uint256 public tokenIdCounter;
    string public baseTokenURI;

    constructor(string memory _name, string memory _symbol, string memory _baseTokenURI) ERC721(_name, _symbol) {
        baseTokenURI = _baseTokenURI;
        tokenIdCounter = 1;
    }

    function mint(address _to) public onlyOwner {
        uint256 newTokenId = tokenIdCounter;
        _safeMint(_to, newTokenId);
        tokenIdCounter++;
    }
    
    function _baseURI() internal view override returns (string memory) {
        return baseTokenURI;
    }

    function setBaseTokenURI(string memory _inBaseURI) public onlyOwner {
        baseTokenURI = _inBaseURI;
    }
}
