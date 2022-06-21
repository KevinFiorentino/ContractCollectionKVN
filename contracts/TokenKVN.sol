// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract TokenKVN is AccessControl, ERC20("Kevin Token", "KVN"), ERC20Burnable, Pausable {

    bytes32 public constant ROL_ADMIN = keccak256("ROL_ADMIN");

    constructor() {
        _grantRole(ROL_ADMIN, msg.sender);
        _mint(msg.sender, 1000);
    }

    modifier onlyAdmin {
        require(hasRole(ROL_ADMIN, msg.sender), "You need to be a Admin for this project.");
        _;
    }

    function burnKVN(uint256 amount) public {
        require(!paused(), "The contract is paused.");
        burn(amount);
    }

    function pause() public onlyAdmin {
        _pause();
    }

    function unpause() public onlyAdmin {
        _unpause();
    }

}