import '@nomiclabs/hardhat-waffle';
import * as dotenv from 'dotenv';
import { HardhatUserConfig } from 'hardhat/config';
import 'hardhat-deploy';
import '@nomiclabs/hardhat-ethers';
import '@nomiclabs/hardhat-etherscan';
import 'hardhat-contract-sizer';
import '@openzeppelin/hardhat-upgrades';

dotenv.config({ path: './.env' });
const defaultNetwork = 'hardhat';

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
const config: HardhatUserConfig = {
  defaultNetwork,
  solidity: {
    version: '0.8.13',
    settings: {
      optimizer: {
        enabled: true,
        runs: 1000,
      },
    },
  },
  networks: {
    hardhat: {
      initialBaseFeePerGas: 0,
      gasPrice: 20000000000,
    },
    mumbai: {
      chainId: 80001,
      url: `https://polygon-mumbai.g.alchemy.com/v2/${process.env.NEXT_PUBLIC_ALCHEMY_ID}`,
      accounts: [`${process.env.PRIVATE_KEY}`],
      gasPrice: 20000000000,
    },
    scrollSepolia: {
      chainId: 534351,
      url: 'https://scroll-sepolia.blockpi.network/v1/rpc/public',
      accounts: [`${process.env.PRIVATE_KEY}`],
      gasPrice: 20000000000,
    },
    scroll: {
      chainId: 534352,
      url: `https://rpc.scroll.io`,
      accounts: [`${process.env.PRIVATE_KEY}`],
      gasPrice: 500000000,
    }
  },
  etherscan: {
    apiKey: {
      polygonMumbai: process.env.POLYSCAN_API_KEY as string,
      polygon: process.env.POLYSCAN_API_KEY as string,
    },
  },
  paths: {
    sources: './contracts', // Specify the correct path to your Solidity source files
  },
};

export default config;
