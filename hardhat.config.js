require("@nomiclabs/hardhat-waffle");

module.exports = {
  solidity: "0.8.0",
  paths: {
    sources: "./contracts",
    tests: "./tests",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  networks: {
    hardhat: {
      chainId: 1337
    },
    mumbai: {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: [`0x${process.env.PRIVATE_KEY}`]
    },
    polygon: {
      url: "https://rpc-mainnet.maticvigil.com",
      accounts: [`0x${process.env.PRIVATE_KEY}`]
    },
    mainnet: {
      url: "https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID",
      accounts: [`0x${process.env.PRIVATE_KEY}`]
    },
    defiOracleMetaMainnet: {
      url: "https://rpc.defi-oracle.io",
      accounts: [`0x${process.env.PRIVATE_KEY}`]
    },
    polygonPoS: {
      url: "https://rpc-mainnet.matic.network",
      accounts: [`0x${process.env.PRIVATE_KEY}`]
    },
    ethereumMainnet: {
      url: "https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID",
      accounts: [`0x${process.env.PRIVATE_KEY}`]
    }
  }
};
