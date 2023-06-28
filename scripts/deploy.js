const {ethers} = require("hardhat");

async function main() {
  // Get the deployer account
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contract using account:", deployer.address);

  // Deployment parameters
  const name = "MyNFT"; // Contract name
  const symbol = "NFT"; // Contract symbol
  const nativeChainId = 1234; // Native chain ID
  const nativeContractString = "0xBa2863c494E37Bd2f66eae809A3db1cfb1fA9f06"; // String representation of the native contract address
  const nativeContractBytes32 = ethers.utils.hexZeroPad(nativeContractString, 32);
  const bridgeAddress = "0xBa2863c494E37Bd2f66eae809A3db1cfb1fA9f06"; // Bridge address

  // Deploy the TemplateErc721 contract
  const TemplateErc721 = await ethers.getContractFactory("TemplateErc721");
  const templateErc721 = await TemplateErc721.deploy(
    name,
    symbol,
    nativeChainId,
    nativeContractBytes32,
    bridgeAddress
  );

  await templateErc721.deployed();

  console.log("TemplateErc721 contract deployed at address:", templateErc721.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
