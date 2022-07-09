// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract CollectionKVN is ERC721 {

  constructor() ERC721("CollectionKVN", "KVNFT") {}

}
