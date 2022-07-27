## NFTs Platform
#### Smart Contract, Solidity, OpenZeppelin & HardHat

- [collectionkvn.eth](https://app.ens.domains/name/collectionkvn.eth/details)
- [Smart Contract Address](https://rinkeby.etherscan.io/address/0x5eb362dDF7737F111FEC978019205AE7359427A9)
- [OpenSea NFTs](https://testnets.opensea.io/collection/collectionkvn)

##### Run project

- `npm install`
- `npx hardhat compile`
- `npx hardhat test test/CollectionKVN.test.js`

##### Deploy to Rinkeby

- `cp .env.example .env`
- `npx hardhat run scripts/CollectionKVN.deploy.js --network rinkeby`
- `npx hardhat flatten > flattened.sol`
