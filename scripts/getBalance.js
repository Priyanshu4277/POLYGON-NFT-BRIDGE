const hre = require("hardhat");
const tokenContractJSON = require("../artifacts/contracts/Rambat.sol/Rambat.json");

const tokenAddress = "0x3732f412BE5dbD464fbc5e2F22a5af175dC25604"; // Ethereum address of the deployed ERC721A contract
const tokenABI = tokenContractJSON.abi;
const walletAddress = "0x526F2d80c7dDACfc13Eb999e3438813E1eB2BF72"; // Ethereum public address for the wallet

async function main() {

    const token = await hre.ethers.getContractAt(tokenABI, tokenAddress);

    console.log("You now have a total number of: " + await token.balanceOf(walletAddress) + " tokens in the wallet.");
  }
  
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
