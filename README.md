Hospital Management System 🏥

A decentralized Hospital Management System built using smart contracts on the Ethereum blockchain. This system allows secure and transparent handling of appointments, doctors, and patient records using Solidity.

📋 Features

🩺 Doctor & Patient Registration

📅 Appointment Booking via Smart Contracts

🔐 Secure Medical Record Storage

📊 Blockchain-powered Transparency

🧠 Extensible for insurance, payments, and more

🛠️ Tech Stack

Smart Contracts: Solidity

Blockchain Platform: Ethereum (EVM-compatible)

Development Environment: Hardhat / Remix

Contract Files:

Hospital.sol: Core hospital logic

Appointment.sol: Manages patient appointments

🚀 Getting Started
📦 Prerequisites

Node.js and npm

Hardhat (npm install --save-dev hardhat)

MetaMask wallet or similar

Optional: Ganache or any local Ethereum node

⚙️ Installation & Compilation
# Clone the repository
git clone https://github.com/saloni1902/Hospital-Management-System.git
cd Hospital-Management-System

# Install dependencies
npm install

# Compile smart contracts
npx hardhat compile

🧪 Running Tests
npx hardhat test

🚀 Deploying Contracts
npx hardhat run scripts/deploy.js --network <network-name>


Replace <network-name> with localhost, sepolia, or any other configured network.

📁 Project Structure
Hospital-Management-System/
├── artifacts/               # Compiled contract files
├── contracts/
│   ├── Hospital.sol         # Main hospital logic
│   └── Appointment.sol      # Appointment system
├── scripts/
│   └── deploy.js            # Deployment script
├── test/                    # Smart contract tests
├── hardhat.config.js        # Hardhat configuration
└── README.md                # Project documentation

👩‍⚕️ Future Enhancements

Token-based billing and payments

Role-based access control for admins and staff

Integration with external EMR systems

On-chain insurance claim processing
