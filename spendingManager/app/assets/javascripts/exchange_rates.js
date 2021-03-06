// app/assets/javascripts/exchange_rates.js

// function referenced from http://www.mredkj.com/javascript/nfbasic.html
function addCommas(nStr)
{
  nStr += '';
  x = nStr.split('.');
  x1 = x[0];
  x2 = x.length > 1 ? '.' + x[1] : '';
  var rgx = /(\d+)(\d{3})/;
  while (rgx.test(x1)) {
    x1 = x1.replace(rgx, '$1' + ',' + '$2');
  }
  return x1 + x2;
}

function convert() {
  var balance = document.getElementsByClassName("balances"); 
  var currency = document.getElementsByClassName("currencies");

  for (i = 0; i < currency.length; i++) {
    var rate = gon.exchange_rate[currency[i].value];
    document.getElementsByClassName("convertedBalance")[i].innerHTML = currency[i].value + " " + addCommas((balance[i].innerHTML * rate).toFixed(3));
  }
}

function converted() {
  var amount = document.getElementById("amount").value;
  var to = document.getElementById("to").value;

  var toRate = gon.exchange_rate[to];

  document.getElementById("convertedAmount").innerHTML = to + " " + addCommas((amount * toRate).toFixed(3));
}
