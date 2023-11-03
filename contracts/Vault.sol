// SPDX-License-Identifier: UNLICENSED
pragma solidity <=0.8.19;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";

contract Vault is AccessControlEnumerable, Ownable {
    IERC20 private token;
    uint256 public maxWithDrawAmount;
    bool public withDrawEnable;
    bytes32 public constant WITHDRAWROLE = keccak256("WITHDRAWER_ROLE");

    function setWithDrawEnable(bool _isEnable) public onlyOwner {
        withDrawEnable = _isEnable;
    }

    function setMaxWithDrawAmount(uint256 _amount) public onlyOwner {
        maxWithDrawAmount = _amount;
    }

    function setToken(IERC20 _token) public onlyOwner {
        token = _token;
    }

    constructor() {
        _setupRole("DEFAULT_ADMIN_ROLE", _msgSender());
    }

    function withdraw(uint256 _amount, address _to) external onlyWithdrawer {
        require(withDrawEnable, "Withdraw is not available");
        require(_amount <= maxWithDrawAmount, "Exceed maximim amount");
        token.transfer(_to, _amount);
    }

    function deposit(uint256 _amount) external {
        require(
            token.balanceOf(msg.sender) >= _amount,
            "Insufficient account balance"
        );
        SafeERC20.safeTransferFrom(token, msg.sender, address(this), _amount);
    }

    modifier onlyWithdrawer() {
        require(
            owner() == _msgSender() || hasRole(WITHDRAWROLE, _msgSender()),
            "Caller is not withdraw"
        );
        _;
    }
}
