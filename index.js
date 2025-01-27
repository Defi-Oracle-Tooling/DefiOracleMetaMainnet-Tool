// ...existing code...
const { Alchemy, Network } = require('alchemy-sdk');

const settings = {
  apiKey: 'your-api-key', // Replace with your Alchemy API key
  network: Network.ETH_MAINNET, // Replace with the network you want to use
};

const alchemy = new Alchemy(settings);

// Example usage
alchemy.core.getBlockNumber().then(console.log);
// ...existing code...
