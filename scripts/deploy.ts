import { ethers } from "hardhat";

async function main() {

  const meta = await ethers.deployContract("MetaTask");

  await meta.waitForDeployment();

  console.log(
    `MetaCrafterSchool contract deployed to ${meta.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
