// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "./CalculateDNA.sol";

contract CollectionKVN is ERC721, ERC721Enumerable {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    uint256 public maxSupply;

    constructor(uint256 _maxSupply) ERC721("CollectionKVN", "KVNFT") {
        maxSupply = _maxSupply;
    }

    function getCurrentCounter() public view returns (uint256) {
        return _tokenIdCounter.current();
    }

    function mint() public {
        uint256 tokenId = getCurrentCounter();

        require(tokenId < maxSupply, "No CollectionKVN left.");

        _safeMint(msg.sender, tokenId);
        _tokenIdCounter.increment();
    }


    /* ********** ERC721 Metadata ********** */

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "ERC721 Metadata: URI query for nonexistent token.");

        string memory jsonURI = Base64.encode(
            abi.encodePacked(
                '{',
                    '"name" "CollectionKVN #', tokenId, '",'
                    '"description": "CollectionKVN are randomized Avataaars stored on chain to teach DApp development on Platzi",',
                    '"image": "', '// TODO: BUILD IMAGE URL', '"'
                '}'
            )
        );

        return string(abi.encodePacked("data:application/json;base64,", jsonURI));
    }


    /* ********** Override ERC721Enumerable ********** */

    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

}
