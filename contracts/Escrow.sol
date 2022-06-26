// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/utils/escrow/ConditionalEscrow.sol";

contract TokenKVN is ConditionalEscrow {

    constructor() {}

    function withdrawalAllowed(address payee) public view override virtual returns (bool) {
        return false;
    }

}
