// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.
contract PomNFT is ERC721URIStorage {
    // Magic given to us by OpenZeppelin to help us keep track of tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // We need to pass the name of our NFTs token and its symbol.
    constructor() ERC721("Persona of the Metaverse", "POM") {
        console.log("This is my NFT contract. Woah!");
    }

    // A function our user will hit to get their NFT.
    function makeAnEpicNFT() public {
        // Get the current tokenId, this starts at 0.
        uint256 newItemId = _tokenIds.current();

        // Actually mint the NFT to the sender using msg.sender.
        _safeMint(msg.sender, newItemId);

        // Set the NFTs data.
        _setTokenURI(
            newItemId,
            "data:application/json;base64,ewoibmFtZSI6ICJFcGljTG9yZEhhbWJ1cmdlciIsCiJkZXNjcmlwdGlvbiI6ICJBbiBORlQgZnJvbSB0aGUgaGlnaGx5IGFjY2xhaW1lZCBzcXVhcmUgY29sbGVjdGlvbiIsCiJpbWFnZSI6ICJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJaeUI0Yld4dWN6MGlhSFIwY0RvdkwzZDNkeTUzTXk1dmNtY3ZNakF3TUM5emRtY2lJSEJ5WlhObGNuWmxRWE53WldOMFVtRjBhVzg5SW5oTmFXNVpUV2x1SUcxbFpYUWlJSFpwWlhkQ2IzZzlJakFnTUNBek5UQWdNelV3SWo0S0lDQWdJRHh6ZEhsc1pUNHVZbUZ6WlNCN0lHWnBiR3c2SUd4cFoyaDBaM0psWlc0N0lHWnZiblF0Wm1GdGFXeDVPaUJ6WlhKcFpqc2dabTl1ZEMxemFYcGxPaUF4TkhCNE95QjlQQzl6ZEhsc1pUNEtJQ0FnSUR4eVpXTjBJSGRwWkhSb1BTSXhNREFsSWlCb1pXbG5hSFE5SWpFd01DVWlJR1pwYkd3OUltSnNZV05ySWlBdlBnb2dJQ0FnUEhSbGVIUWdlRDBpTlRBbElpQjVQU0kxTUNVaUlHTnNZWE56UFNKaVlYTmxJaUJrYjIxcGJtRnVkQzFpWVhObGJHbHVaVDBpYldsa1pHeGxJaUIwWlhoMExXRnVZMmh2Y2owaWJXbGtaR3hsSWo1RmNHbGpURzl5WkVoaGJXSjFjbWRsY2p3dmRHVjRkRDRLUEM5emRtYysiCn0="
        );

        // Increment the counter for when the next NFT is minted.
        _tokenIds.increment();

        console.log(
            "An NFT w/ ID %s has been minted to %s",
            newItemId,
            msg.sender
        );
    }
}
