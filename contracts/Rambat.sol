// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "erc721a/contracts/ERC721A.sol";

contract Rambat is ERC721A {
    address public owner;

    uint256 public maxLimit = 5;

    string baseUrl =
        "https://gateway.pinata.cloud/ipfs/QmbGv2EgvbsBWKjF2oJU5yQ2Q6H165fnkUiuPqfyBT74fq";

    string public prompt = "Ram Man VS Batman, conceptual art, cinematic, poster. ";

    constructor() ERC721A("Rambat", "IGS") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Can be performed by the owner only.");
        _;
    }

    function mint(uint256 quantity) external payable onlyOwner {
        require(
            totalSupply() + quantity <= maxLimit,
            "You can not mint more than 5 NFTs"
        );
        _mint(msg.sender, quantity);
    }

    function getBalance(address _owner) external view returns (uint256) {
        return balanceOf(_owner);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseUrl;
    }

    function promptDescription() external view returns (string memory) {
        return prompt;
    }
}