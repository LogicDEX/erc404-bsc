require('dotenv').config();

require('@nomicfoundation/hardhat-toolbox');
require('hardhat-gas-reporter');
require('@nomiclabs/hardhat-solhint');

// import hardhat CLI tasks
require('./tasks/my-erc404');

// eslint-disable-next-line prefer-destructuring
const ACCOUNT_PRIVATE_KEY = process.env.ACCOUNT_PRIVATE_KEY;

module.exports = {
  solidity: {
    version: '0.8.20',
    settings: {
      optimizer: {
        enabled: true,
        runs: 1000,
      },
    },
  },
  networks: {
    hardhat: {
      chainId: 1337,
    },
    mainnet: {
      url: `https://eth-mainnet.alchemyapi.io/v2/${process.env.ALCHEMY_MAINNET_API_KEY}`,
      accounts: [`${ACCOUNT_PRIVATE_KEY}`],
      chainId: 1,
      gas: 'auto',
    },
    sepolia: {
      url: `https://eth-sepolia.alchemyapi.io/v2/${process.env.ALCHEMY_SEPOLIA_API_KEY}`,
      accounts: [`${ACCOUNT_PRIVATE_KEY}`],
      chainId: 11155111,
      gas: 'auto',
    },
    polygon: {
      url: `https://polygon-mainnet.alchemyapi.io/v2/${process.env.ALCHEMY_POLYGON_API_KEY}`,
      accounts: [`${ACCOUNT_PRIVATE_KEY}`],
      chainId: 137,
      gas: 'auto',
    },
    polygonMumbai: {
      url: `https://polygon-mumbai.alchemyapi.io/v2/${process.env.ALCHEMY_MUMBAI_API_KEY}`,
      accounts: [`${ACCOUNT_PRIVATE_KEY}`],
      chainId: 80001,
      gas: 'auto',
    },
    bscMainnet: {
      url: 'https://bsc-dataseed.binance.org/',
      accounts: [`${ACCOUNT_PRIVATE_KEY}`],
      chainId: 56,
      gas: 'auto',
    },
    bscTestnet: {
      url: `https://bsc-testnet.nodereal.io/v1/${process.env.NODEREAL_API_KEY}`,
      accounts: [`${ACCOUNT_PRIVATE_KEY}`],
      chainId: 97,
      gas: 'auto',
      gasPrice: 10000000000,
    },
    // add more networks here
  },
  etherscan: {
    apiKey: {
      mainnet: process.env.ETHERSCAN_API_KEY,
      sepolia: process.env.ETHERSCAN_API_KEY,
      polygon: process.env.POLYGONSCAN_API_KEY,
      polygonMumbai: process.env.POLYGONSCAN_API_KEY,
      // Add BSCscan API keys here if you have them
      bsc: process.env.BSCSCAN_API_KEY,
      bscTestnet: process.env.BSCSCAN_API_KEY,
    },
  },
  gasReporter: {
    enabled: true,
  },
};
