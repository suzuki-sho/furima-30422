// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

function memo() {
  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profitPrice = document.getElementById("profit");

  priceInput.addEventListener('keyup',function(){
    var price_input = priceInput.value;
    var tax_price = price_input * 0.1
    taxPrice.innerHTML = tax_price
    var profit_price = price_input - tax_price
    profitPrice.innerHTML = profit_price
  });
};
window.addEventListener("load", memo);