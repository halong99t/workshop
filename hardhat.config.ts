import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
/** @type import('hardhat/config').HardhatUserConfig */

const ARBITRUM_GOERLI_PRIVATE_KEY =
  "c1c7c62c0e1aeb923d3ef59dda7f692a605b80aec5746a02473d8d14278d1e8a";

const METAMASK_PRIVATE_KEY =
  "31eeb8d8f753f84cf616e2ac018f48aa4e3f68a9cbe697564f2be090ec83b205";

const ARBITRUM_API_KEY: string = "FBBX9CFTCS3VNN49G4PFUAUYPG1F67XUF1";

module.exports = {
  solidity: "0.8.18",
  networks: {
    arbitrum_goerli: {
      url: `https://arb-goerli.g.alchemy.com/v2/9BVnu__8T4oNRo2-aGbCKuLz7YKWbkZ7`,
      accounts: [ARBITRUM_GOERLI_PRIVATE_KEY],
    },
    arbitrumOne: {
      url: `https://arb-mainnet.g.alchemy.com/v2/gZopN1UctmWs4cFc7Vw6uCZ0hHzg2dva`,
      accounts: [METAMASK_PRIVATE_KEY],
    },
  },
  etherscan: {
    apiKey: {
      arbitrumGoerli: ARBITRUM_API_KEY,
      arbitrumOne: ARBITRUM_API_KEY,
    },
  },
};
