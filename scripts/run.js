const main = async () => {
	const nftContractFactory = await hre.ethers.getContractFactory("PomNFT");
	const nftContract = await nftContractFactory.deploy();
	await nftContract.deployed();
	console.log("Contract deployed to:", nftContract.address);

	let test_nft = await nftContract.makeAnEpicNFT()
	await test_nft.wait()

	test_nft = await nftContract.makeAnEpicNFT()
	await test_nft.wait()
};

const runMain = async () => {
	try {
		await main();
		process.exit(0);
	} catch (error) {
		console.log(error);g
		process.exit(1);
	}
};

runMain();
