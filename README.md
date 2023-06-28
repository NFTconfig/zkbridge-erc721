1. Execute the `npm install` command in the root directory of your project to install the necessary dependencies.
    
2. Create a file named `.privateKey` in the project's root directory and fill in your private key information.
    
3. Open the `scripts/deploy.js` file and configure the deployment parameters.
    

```javascript
  const name = "your nft name"; // Contract name
  const symbol = "your nft symbol"; // Contract symbol
  const nativeChainId = 'your native chainId'; // Native chain ID, e.g., 42
  const nativeContractString = "your native nft address"; // e.g., 0xBa2863c494E37Bd2f66eae809A3db1cfb1fA9f06
  const bridgeAddress = "zkBridge contract address"; // Bridge address
```

4. Open the `hardhat.config.js` file and configure the network where you want to deploy the contract under the `networks` section.

```javascript
module.exports = {
  networks: {
    // Configure the network where you want to deploy
    yourConfigNetwork: {
      url: "https://your-config-network-rpc-url.com", // Replace with the RPC URL of your network
      accounts: [privateKey],
    },
    // Other network configurations...
  },
  // Other configurations...
};
```

5. Execute the following command to deploy the contract: `npx hardhat run scripts/deploy.js --network "yourConfigNetwork"`