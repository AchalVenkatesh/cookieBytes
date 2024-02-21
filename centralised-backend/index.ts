import Web3 from 'web3';
import { abi } from "./abi";

const contract_address = "0x5D5A754bfE4A458DA086A794482E7d01291a8ADf"
const provider_URL = "https://eth-mainnet.g.alchemy.com/v2/oxDhoJg-mJ7sPfHOAoivU7NegVcYzErw"

const web3 = new Web3(new Web3.providers.WebsocketProvider(provider_URL));
const contract = new web3.eth.Contract(abi, contract_address);

//@ts-ignore
contract.events.NewAgreement({
    fromBlock: 0
})
.on('data', async function(event) {
    console.log(`New Agreement created. Adding to Firebase`);
    //connect to firebase
})

contract.methods.getAllAgreements().call()
  .then(value => {
    console.log(`The value is ${value}`);
    //connect to firebase
  })
  .catch(error => {
    console.error('Error calling contract function:', error);
});

contract.methods.getAllPayments().call()
  .then(value => {
    console.log(`The value is ${value}`);
  })
  .catch(error => {
    console.error('Error calling contract function:', error);
  });




