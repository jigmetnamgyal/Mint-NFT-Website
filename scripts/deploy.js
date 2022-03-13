const main = async () => {
	const nftContractFactory = await hre.ethers.getContractFactory("PomNFT");
	const nftContract = await nftContractFactory.deploy();
	await nftContract.deployed();
	console.log("Contract have been deployed to: ", nftContract.address);

	let token = await nftContract.makeAnEpicNFT();
	await token.wait();

	token = await nftContract.makeAnEpicNFT();
	await token.wait();
};

const runMain = async () => {
	try {
		await main();
		process.exit(0);
	} catch (error) {
		console.log(error);
		process.exit(1);
	}
};

runMain();
