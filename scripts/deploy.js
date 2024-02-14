// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const BalanceFactory = await hre.ethers.getContractFactory("Balance");
  const ExternalCallerRecorderFactory = await hre.ethers.getContractFactory(
    "ExternalCallerRecorder"
  );
  const externalCaller = await ExternalCallerRecorderFactory.deploy();
  await externalCaller.deployed();
  console.log("ExternalCallerRecorder deployed to:", externalCaller.address);
  const balance = await BalanceFactory.deploy();
  await balance.deployed();
  console.log("Balance deployed to:", balance.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
