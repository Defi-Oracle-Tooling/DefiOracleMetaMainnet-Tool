async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const Validator = await ethers.getContractFactory("Validator");
  const validator = await Validator.deploy();
  await validator.deployed();
  console.log("Validator deployed to:", validator.address);

  const Oracle = await ethers.getContractFactory("Oracle");
  const oracle = await Oracle.deploy(validator.address);
  await oracle.deployed();
  console.log("Oracle deployed to:", oracle.address);

  const ISOStandards = await ethers.getContractFactory("ISOStandards");
  const isoStandards = await ISOStandards.deploy(validator.address);
  await isoStandards.deployed();
  console.log("ISOStandards deployed to:", isoStandards.address);

  const Bridge = await ethers.getContractFactory("Bridge");
  const bridge = await Bridge.deploy(validator.address);
  await bridge.deployed();
  console.log("Bridge deployed to:", bridge.address);

  const AMB = await ethers.getContractFactory("AMB");
  const amb = await AMB.deploy(validator.address);
  await amb.deployed();
  console.log("AMB deployed to:", amb.address);

  const Token = await ethers.getContractFactory("Token");
  const token = await Token.deploy();
  await token.deployed();
  console.log("Token deployed to:", token.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
