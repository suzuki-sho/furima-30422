function memo() {
  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profitPrice = document.getElementById("profit");

  priceInput.addEventListener('input', (e)=> {
    const price_input = priceInput.value;
    const tax_price = Math.floor(price_input * 0.1);
    taxPrice.innerHTML = tax_price
    const profit_price = Math.floor(price_input - tax_price)
    profitPrice.innerHTML = profit_price
  });
}
window.addEventListener("load", memo);