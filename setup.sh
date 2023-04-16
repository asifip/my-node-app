#!/bin/bash

# Update and install node.js
sudo apt-get update && sudo apt-get install -y nodejs npm

# Install ganache-cli globally
npm install -g ganache-cli

# Create a new Node.js app and install web3
mkdir my-node-app && cd my-node-app && npm init && npm install web3

# Create app.js with code to connect to Goerli testnet
touch app.js
echo "const Web3 = require('web3');
const web3 = new Web3('https://goerli.infura.io/v3/YOUR_PROJECT_ID');

async function main() {
  const accounts = await web3.eth.getAccounts();
  console.log(accounts);
}

main();" > app.js

# Create a new web app and index.html
mkdir my-web-app && cd my-web-app && touch index.html
echo "<html>
  <head>
    <title>My Web App</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
      $(function() {
        $.get('/accounts', function(data) {
          $('#output').text(data);
        });
      });
    </script>
  </head>
  <body>
    <div id="output"></div>
  </body>
</html>"

# Create server.js with code to handle web app requests
touch server.js
echo "const express = require('express');
const app = express();

app.get('/accounts', async function(req, res) {
  const accounts = await web3.eth.getAccounts();
  res.send(accounts);
});

app.listen(3000, function() {
  console.log('Listening on port 3000!');
});" > server.js
