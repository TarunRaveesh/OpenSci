import { ethers } from "hardhat";

async function main() {
 
  const OpenSci = await ethers.getContractFactory("OpenSci");
  const opensci = await OpenSci.deploy();

  await opensci.deployed();

  console.log(`Lock deployed to ${opensci.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

