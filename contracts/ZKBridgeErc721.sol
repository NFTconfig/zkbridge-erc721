// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ZKBridgeErc721 is ERC721, Ownable {
    uint16 public nativeChainId;
    bytes32 public nativeContractAddress;
    address public bridge;
    mapping(uint256 => string) private _tokenURIs;

    constructor(
        string memory name_,
        string memory symbol_,
        uint16  nativeChainId_,
        bytes32 nativeContract_,
        address bridge_
    ) ERC721(name_, symbol_) {
        nativeChainId = nativeChainId_;
        nativeContractAddress = nativeContract_;
        bridge = bridge_;
    }

    modifier onlyBridge() {
        require(msg.sender == bridge, "Must be bridge");
        _;
    }

    function mint(address to, uint256 tokenId, string memory tokenURI_) public onlyBridge {
        _mint(to, tokenId);
        _setTokenURI(tokenId, tokenURI_);
    }

    function burn(uint256 tokenId) public onlyBridge {
        require(_exists(tokenId), "Burn of nonexistent token");
        _burn(tokenId);
        delete _tokenURIs[tokenId];
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "URI query for nonexistent token");
        return _tokenURIs[tokenId];
    }

    function _setTokenURI(uint256 tokenId, string memory tokenURI_) internal {
        require(_exists(tokenId), "URI set of nonexistent token");
        _tokenURIs[tokenId] = tokenURI_;
    }

    function chainId() public view returns (uint16) {
        return nativeChainId;
    }

    function nativeContract() public view returns (bytes32) {
        return nativeContractAddress;
    }
}