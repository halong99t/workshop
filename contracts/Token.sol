// SPDX-License-Identifier: UNLICENSED
pragma solidity <=0.8.19;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Dogebitrum is ERC20("Dogebitrum", "DOGEB"), ERC20Burnable, Ownable {
    uint256 private cap = 1_000_000_000_000 * 10 ** 18;

    constructor() {
        _mint(msg.sender, cap);
        transferOwnership(msg.sender);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(ERC20.totalSupply() + amount <= cap);
        _mint(to, amount);
    }
}
