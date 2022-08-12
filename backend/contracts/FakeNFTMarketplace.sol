//SPDX-License-Identifier
pragma solidity ^0.8.11;

contract FakeNFTMarketplace {
    mapping(uint256 => address) public tokens;
    uint256 nftPrice = 0.01 ether;

    function purchase(uint256 tokenId) external payable {
        require(msg.value >= nftPrice, "Required Amount is more than provided");
        tokens[tokenId] = msg.sender;
    }

    function available(uint256 tokenId) external view returns (bool) {
        return !(tokens[tokenId] == address(0));
    }

    function getPrice() external view returns (uint256) {
        return nftPrice;
    }
}
