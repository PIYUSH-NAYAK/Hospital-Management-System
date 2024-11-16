// utils/web3.js

import Web3 from "web3";

// Check if the window.ethereum object is available (for MetaMask or any other Ethereum provider)
let web3;

if (typeof window !== "undefined" && typeof window.ethereum !== "undefined") {
  // If we are in the browser and the user has MetaMask installed
  web3 = new Web3(window.ethereum);
  // Request user to connect MetaMask
  window.ethereum.request({ method: "eth_requestAccounts" });
} else {
  console.log("Ethereum provider is not available. Please install MetaMask.");
  // Fallback Web3 provider (e.g., Infura, Alchemy, etc.)
  web3 = new Web3(new Web3.providers.HttpProvider("https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID"));
}

export default web3;
