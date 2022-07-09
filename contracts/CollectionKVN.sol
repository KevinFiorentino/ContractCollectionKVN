// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract CollectionKVN is ERC721, ERC721Enumerable {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("CollectionKVN", "KVNFT") {
        uint256 tokenId = _tokenIdCounter.current();
        _safeMint(msg.sender, tokenId);
        _tokenIdCounter.increment();
    }

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

    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

}
