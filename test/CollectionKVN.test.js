const { expect } = require('chai');
const { ethers } = require('hardhat');

// npx hardhat test test/CollectionKVN.test.js

describe('CollectionKVN Contract Test', () => {

  let Contract;

  before(async function() {
    const CollectionKVN = await ethers.getContractFactory('CollectionKVN');

    Contract = await CollectionKVN.deploy(10);
  });

  it('Get Current tokenId == 2', async () => {

    const [owner, addr1, addr2] = await ethers.getSigners();

    await Contract.connect(addr1).mint();
    await Contract.connect(addr2).mint();

    expect(2).to.be.equal(await Contract.getCurrentCounter());
  });


  it('Get Image URI', async () => {

    const [owner, addr1, addr2] = await ethers.getSigners();

    await Contract.mint();
    const tokenURI = await Contract.tokenURI(0);

    const base64JSON = tokenURI.replace('data:application/json;base64,', '');
    const strJSON = Buffer.from(base64JSON, 'base64').toString('ascii');

    const metadata = JSON.parse(strJSON);

    expect(metadata).to.have.all.keys("name", "description", "image");
  });

});
