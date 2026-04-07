document.addEventListener("DOMContentLoaded", function() {
  document.querySelectorAll('.filtros input[type="checkbox"]').forEach(chk => chk.checked = false);
  
  let filterCheckboxes = document.querySelectorAll('.filtros input[type="checkbox"]');
  filterCheckboxes.forEach(chk => {
    chk.addEventListener("change", filterWines);
  });
  
  let priceRange = document.getElementById("priceRange");
  if (priceRange) {
      priceRange.addEventListener("input", function() {
         document.getElementById("priceValue").textContent = "Até R$" + priceRange.value;
         filterWines();
      });
  }
  filterWines();
  
  document.getElementById("btnMaisVendidos").addEventListener("click", function(){
      let wineItems = document.querySelectorAll(".product-vinhos");
      wineItems.forEach(function(item) {
          // Comparação case-insensitive usando data-type
          let wineType = (item.getAttribute("data-type") || "").trim().toLowerCase();
          if (wineType === "tinto") {
              item.style.display = "flex";
          } else {
              item.style.display = "none";
          }
      });
  });
  
  document.getElementById("btnMenorPreco").addEventListener("click", function(){
      let wineItems = Array.from(document.querySelectorAll(".product-vinhos"));
      let minPrice = Infinity;
      wineItems.forEach(function(item) {
          let rawPrice = item.getAttribute("data-price") || "";
          rawPrice = rawPrice.replace(",", ".").replace(/[^\d.]/g, "");
          let price = parseFloat(rawPrice);
          if (!isNaN(price) && price < minPrice) {
              minPrice = price;
          }
      });
      wineItems.forEach(function(item) {
          let rawPrice = item.getAttribute("data-price") || "";
          rawPrice = rawPrice.replace(",", ".").replace(/[^\d.]/g, "");
          let price = parseFloat(rawPrice);
          if (!isNaN(price) && price === minPrice) {
              item.style.display = "flex";
          } else {
              item.style.display = "none";
          }
      });
  });
  
  document.getElementById("btnMaiorPreco").addEventListener("click", function(){
      let wineItems = Array.from(document.querySelectorAll(".product-vinhos"));
      let maxPrice = -Infinity;
      wineItems.forEach(function(item) {
          let rawPrice = item.getAttribute("data-price") || "";
          rawPrice = rawPrice.replace(",", ".").replace(/[^\d.]/g, "");
          let price = parseFloat(rawPrice);
          if (!isNaN(price) && price > maxPrice) {
              maxPrice = price;
          }
      });
      wineItems.forEach(function(item) {
          let rawPrice = item.getAttribute("data-price") || "";
          rawPrice = rawPrice.replace(",", ".").replace(/[^\d.]/g, "");
          let price = parseFloat(rawPrice);
          if (!isNaN(price) && price === maxPrice) {
              item.style.display = "flex";
          } else {
              item.style.display = "none";
          }
      });
  });
});

function filterWines() {
  let selectedTypes = Array.from(document.querySelectorAll('input[name="tipo"]:checked'))
                          .map(el => el.value.trim().toLowerCase());
  let selectedCountries = Array.from(document.querySelectorAll('input[name="pais"]:checked'))
                              .map(el => el.value.trim().toLowerCase());
  let selectedUvas = Array.from(document.querySelectorAll('input[name="uva"]:checked'))
                         .map(el => el.value.trim().toLowerCase());
  
  let priceRange = document.getElementById("priceRange");
  let selectedPrice = priceRange ? parseFloat(priceRange.value) : Infinity;
  
  let wineItems = document.querySelectorAll('.product-vinhos');
  
  wineItems.forEach(item => {
    let itemType = (item.getAttribute("data-type") || "").trim().toLowerCase();
    let itemCountry = (item.getAttribute("data-country") || "").trim().toLowerCase();
    let itemUva = (item.getAttribute("data-grape") || "").trim().toLowerCase();
    
    let rawPrice = item.getAttribute("data-price") || "";
    rawPrice = rawPrice.replace(",", ".").replace(/[^\d.]/g, "");
    let itemPrice = parseFloat(rawPrice);
    
    let typeMatch = (selectedTypes.length === 0 || selectedTypes.includes(itemType));
    let countryMatch = (selectedCountries.length === 0 || selectedCountries.includes(itemCountry));
    let uvaMatch = (selectedUvas.length === 0 || selectedUvas.includes(itemUva));
    let priceMatch = isNaN(itemPrice) || itemPrice <= selectedPrice;
    
    if (typeMatch && countryMatch && uvaMatch && priceMatch) {
        item.style.display = "flex";
    } else {
        item.style.display = "none";
    }
  });
}
