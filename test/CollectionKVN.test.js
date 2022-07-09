const { expect } = require('chai');
const { ethers } = require('hardhat');

// npx hardhat test test/CollectionKVN.test.js

describe('CollectionKVN Contract Test', function () {

  let kvn;

  before(async function() {
    const CollectionKVN = await ethers.getContractFactory('CollectionKVN');

    kvn = await CollectionKVN.deploy(12);       // Set maxSupply 12 tokens
  });

  it('Get Current tokenId == 2', async function () {

    const [owner, addr1, addr2] = await ethers.getSigners();

    await kvn.connect(addr1).mint();
    await kvn.connect(addr2).mint();

    expect(2).to.be.equal(await kvn.getCurrentCounter());
  });

});
