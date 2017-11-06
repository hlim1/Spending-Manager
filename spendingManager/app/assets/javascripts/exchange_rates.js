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
  var currency = document.getElementById("currencies").value;
  var balance = document.getElementById("balances").innerHTML;
  var rate = gon.exchange_rate[currency];
  document.getElementById("convertedBalance").innerHTML = addCommas((balance * rate).toFixed(3));

  /*
  var newTableData = createElement("td");
  var convertedBalance = document.createTextNode(addCommas((balance * rate).toFixed(3)));
  newTableData.appendChild(convertedBalance);
  var row = document.getElementById("account-currency-info");
  row.appendChild(newTableData);
  */
}
