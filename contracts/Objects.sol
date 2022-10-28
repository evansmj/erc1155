//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Objects is ERC1155 {
    uint256 public constant SQUARE = 0;
    uint256 public constant CIRCLE = 1;
    uint256 public constant TRIANGLE = 2;

    constructor() public ERC1155("ipfs://bafybeihhjaawhhy4fg4ls224vv2rhsfbx42s6lbsddzqzsy4wp7ht6ruou") {
        _mint(msg.sender, SQUARE, 3, "");
        _mint(msg.sender, CIRCLE, 3, "");
        _mint(msg.sender, TRIANGLE, 3, "");
    }

    function uri(uint256 _tokenId) override public view returns (string memory) {
        return string(
            abi.encodePacked("ipfs://bafybeihhjaawhhy4fg4ls224vv2rhsfbx42s6lbsddzqzsy4wp7ht6ruou/sample-metadata",
            Strings.toString(_tokenId),
            ".json"
            )
        );
    }
}
