// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./ZKBridgeErc721.sol";

contract TemplateErc721 is ZKBridgeErc721 {
    constructor(
        string memory name_,
        string memory symbol_,
        uint16 nativeChainId_,
        bytes32 nativeContract_,
        address bridge_
    )
        ZKBridgeErc721(name_, symbol_, nativeChainId_, nativeContract_, bridge_)
    {}

    //...other code
}
