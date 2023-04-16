const express = require('express');
const app = express();

app.get('/accounts', async function(req, res) {
  const accounts = await web3.eth.getAccounts();
  res.send(accounts);
});

app.listen(3000, function() {
  console.log('Listening on port 3000!');
});
