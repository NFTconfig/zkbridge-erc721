require("@nomicfoundation/hardhat-toolbox");
const fs = require('fs');
const privateKey = fs.readFileSync('.privateKey').toString().trim();
module.exports = {
  solidity: "0.8.9",
  networks: {
    eth_goerli: {
      accounts: [privateKey],
      url: "https://rpc.ankr.com/eth_goerli",
      chainId: 5,
      gas: 3000000,
      gasPrice: "auto",
    },
  },
};
