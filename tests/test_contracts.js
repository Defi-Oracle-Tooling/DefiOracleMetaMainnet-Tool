const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('BridgeContract', function () {
  it('should deposit tokens', async function () {
    const [owner] = await ethers.getSigners();
    const BridgeContract = await ethers.getContractFactory('BridgeContract');
    const bridge = await BridgeContract.deploy();
    await bridge.deployed();

    await bridge.deposit(100, 1);
    expect(await bridge.getBalance(owner.address)).to.equal(100);
  });

  it('should withdraw tokens', async function () {
    const [owner] = await ethers.getSigners();
    const BridgeContract = await ethers.getContractFactory('BridgeContract');
    const bridge = await BridgeContract.deploy();
    await bridge.deployed();

    await bridge.deposit(100, 1);
    await bridge.withdraw(100, 1, '0x');
    expect(await bridge.getBalance(owner.address)).to.equal(0);
  });
});
