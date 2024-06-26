import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

import * as dotenv from "dotenv"

dotenv.config()

const config: HardhatUserConfig = {
  solidity: "0.8.17",
  
  networks: {
    mumbai: {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: [process.env.PRIVATE_KEY as string],
    }
  },

  etherscan: {
    apiKey: process.env.API as string,
  }
};

export default config;
