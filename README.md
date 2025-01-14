# Follow @Dimensionless Developments and head to our website www.dimensionlessdevelopments.com
# Avalanche-Token
We will be building our very own ERC20 token in Solidity programming language and then deploy it on Avalanche blockchain. This project is important as it equips you with necessary knowledge to begin your exciting journey of coding in Avalanche using Solidity.  Let’s look at how you will be interacting with the token by the end of the course.


# Getting Started
Requirements of this project:
- Install git
You'll know you did it right if you can run git --version and you see a response like git version x.x.x
- Install foundry
You'll know you did it right if you can run forge --version and you see a response like forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)

- Alternatively you can simply use the online remix IDE and build on there using this code through to deployment

# Quickstart
-git clone my repositry
cd Avalanche-Token
forge install 
forge build
Optional Gitpod

-If you can't or don't want to run and install locally, you can work with this repo in Gitpod. If you do this, you can skip the clone this repo part.

-Open in Gitpod

Usage
OpenZeppelin
OpenZeppelin Contracts Docs

OpenZeppelin GitHub Repo

Installing OpenZeppelin Contracts Package
forge install OpenZeppelin/openzeppelin-contracts --no-commit

# Simulating a blockchain or deploy onchain 
Start a local node
make anvil
Deploy
This will default to your local node. You need to have it running in another terminal in order for it to deploy.

make deploy
Deploy - Other Network
See below

# Testing: 
-There are four tests you could for your project:

Unit
Integration
Forked
Staging


forge test
or

forge test --fork-url $FUJI_RPC_URL
Test Coverage
forge coverage

# Deployment
-Deployment to a testnet or mainnet
Setup environment variables
You'll want to set your FUJI_RPC_URL and PRIVATE_KEY as environment variables. You can add them to a .env file, similar to what you see in .env.example.

PRIVATE_KEY: The private key of your account (like from metamask). NOTE: FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
You can learn how to export it here.
FUJI_RPC_URL: This is url of the sepolia testnet node you're working with. You can get setup with one for free from Alchemy
Optionally, add your ETHERSCAN_API_KEY if you want to verify your contract on Etherscan.

Get testnet AVAX:
-Head over to https://faucet.avax.network/, paste your copied address to the Address field and click on. You should see the AVAX show up in your metamask.

Deploy:
To deploy on the fuji testnet use "make deploy-fuji" 
or
make deploy ARGS="--network fuji"
Scripts
After deploy to a testnet or local net, you can run the scripts.

Using cast deployed locally example:

cast send <ERC20_CONTRACT_ADDRESS> "transfer()"  --value 0.1ether --private-key <PRIVATE_KEY> --rpc-url $FUJI_RPC_URL
or, to create a ChainlinkVRF Subscription:

make createSubscription ARGS="--network fuji"
Estimate gas
You can estimate how much gas things cost by running:

forge snapshot
And you'll see and output file called .gas-snapshot

Formatting
To run code formatting:

forge fmt
Thank you!

# If you appreciated this, follow @Dimensionless Developments and head to our website www.dimensionlessdevelopments.com
