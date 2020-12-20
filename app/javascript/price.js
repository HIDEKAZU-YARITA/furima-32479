function price (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const taxPrice = Math.round(itemPrice.value * 0.1);
    const addTaxPrice  = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${taxPrice}`;
  });
  itemPrice.addEventListener("keyup", () => {
    const profitPrice = itemPrice.value - Math.round(itemPrice.value * 0.1);
    const profit  = document.getElementById("profit");
    profit.innerHTML = `${profitPrice}`;
  });
}

window.addEventListener('load', price);
