const Web3 = require('web3');
const web3 = new Web3('https://goerli.infura.io/v3/YOUR_PROJECT_ID');

async function main() {
  const accounts = await web3.eth.getAccounts();
  console.log(accounts);
}

main();
