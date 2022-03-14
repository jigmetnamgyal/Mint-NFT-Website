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
});
