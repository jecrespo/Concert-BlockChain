var Concert = artifacts.require("./Concert.sol");

module.exports = function(deployer){
    deployer.deploy(Concert,"metallica",3);
}