const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("PomNFT Contract", function () {
	let owner;
	let TestContract;
	let Contract;

	let firstWords = [
		"Bhutan",
		"Naruto",
		"Tanjiro",
		"Photosynthesis",
		"Luffy",
		"Hello",
	];

	let secondWords = ["World", "Awesome", "Pistol", "Japan", "Saw", "See"];

	let thirdWords = ["Pencil", "BMW", "Lambo", "Zenitsu", "Word", "Coke"];

	beforeEach(async function () {
		[owner, user] = await ethers.getSigners();
		TestContract = await ethers.getContractFactory("PomNFT");
		Contract = await TestContract.deploy();
	});

	describe("Deployment", async function () {
		it("should have the correct owner", async function () {
            console.log('Owner address: ', owner.address)
            await expect(Contract.owner()).to.equal(owner.address)
        });
	});

	describe("Random number", async function () {
		it("returns a random number", async function () {
			const presentInArray = firstWords.includes(
				await Contract.pickRandomFirstWord(1)
			);

			expect(presentInArray).to.be.true;
		});
	});

	describe("Mint an Epic NFT", async function () {
		it("asfasf", async function () {
		});
	});
});
