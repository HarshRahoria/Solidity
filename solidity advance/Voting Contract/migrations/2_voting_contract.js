
const Voting_Contract = artifacts.require("Voting_Contract");

module.exports = function(deployer) {


  deployer.deploy(Voting_Contract);
};
