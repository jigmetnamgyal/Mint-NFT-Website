// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.
contract PomNFT is ERC721URIStorage {
    // Magic given to us by OpenZeppelin to help us keep track of tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string baseSvg =
        "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><style>.base { fill: lightgreen; font-family: serif; font-size: 24px; }</style><rect width='100%' height='100%' fill='black' /><text x='50%' y='50%' class='base' dominant-baseline='middle' text-anchor='middle'>";

    // I create three arrays, each with their own theme of random words.
    // Pick some random funny words, names of anime characters, foods you like, whatever!
    string[] firstWords = [
        "Bhutan",
        "Naruto",
        "Tanjiro",
        "Photosynthesis",
        "Luffy",
        "Hello"
    ];
    string[] secondWords = [
        "World",
        "Awesome",
        "Pistol",
        "Japan",
        "Saw",
        "See"
    ];
    string[] thirdWords = ["Pencil", "BMW", "Lambo", "Zenitsu", "Word", "Coke"];

    // We need to pass the name of our NFTs token and its symbol.
    constructor() ERC721("Persona of the Metaverse", "POM") {
        console.log("This is my NFT contract. Woah!");
    }

    // I create a function to randomly pick a word from each array.
    function pickRandomFirstWord(uint256 tokenId)
        public
        view
        returns (string memory)
    {
        // I seed the random generator. More on this in the lesson.
        uint256 rand = random(
            string(abi.encodePacked("FIRST_WORD", Strings.toString(tokenId)))
        );
        // Squash the # between 0 and the length of the array to avoid going out of bounds.
        rand = rand % firstWords.length;
        return firstWords[rand];
    }

    function pickRandomSecondWord(uint256 tokenId)
        public
        view
        returns (string memory)
    {
        uint256 rand = random(
            string(abi.encodePacked("SECOND_WORD", Strings.toString(tokenId)))
        );
        rand = rand % secondWords.length;
        return secondWords[rand];
    }

    function pickRandomThirdWord(uint256 tokenId)
        public
        view
        returns (string memory)
    {
        uint256 rand = random(
            string(abi.encodePacked("THIRD_WORD", Strings.toString(tokenId)))
        );

        rand = rand % thirdWords.length;
        return thirdWords[rand];
    }

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    // A function our user will hit to get their NFT.
    function makeAnEpicNFT() public {
        // Get the current tokenId, this starts at 0.
        uint256 newItemId = _tokenIds.current();

        string memory first = pickRandomFirstWord(newItemId);
        string memory second = pickRandomSecondWord(newItemId);
        string memory third = pickRandomThirdWord(newItemId);

        string memory finalSvg = string(
            abi.encodePacked(baseSvg, first, second, third, "</text></svg>")
        );

        console.log("\n--------------------");
        console.log(finalSvg);
        console.log("--------------------\n");

        // Actually mint the NFT to the sender using msg.sender.
        _safeMint(msg.sender, newItemId);

        // I concatenate it all together, and then close the <text> and <svg> tags.

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
