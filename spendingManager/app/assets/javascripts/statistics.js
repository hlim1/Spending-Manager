google.charts.load('current', {'packages':['corechart']});

google.charts.setOnLoadCallback(piechart_for_spending_types);
google.charts.setOnLoadCallback(linechart_for_monthly_spending);
google.charts.setOnLoadCallback(barchart_for_current_balances);

function piechart_for_spending_types() {

  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Type');
  data.addColumn('number', 'Frequency');
  data.addRows(gon.spendingTypes);
  data.addRows([["thing 1",1],["thing 2",3]]);

  var options = {
    title: 'Expenses on Types',
    titleTextStyle: { color: 'black',
                      fontSize: 20,
                      bold: true},
    is3D: true
  };

  var chart = new google.visualization.PieChart(document.getElementById('piechart_for_spending_types'));
  chart.draw(data, options);
}

function linechart_for_monthly_spending() {

  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Month');
  data.addColumn('number', 'Total');
  data.addRows(gon.mTotals);

  var options = {
    title: 'Monthly Total Spending',
    hAxis: {
      title: 'Month',
      titleTextStyle: { color: 'black',
                        bold: true
                      }
    },
    vAxis: {
      title: 'Amount ($)',
      titleTextStyle: { color: 'black',
                        bold: true
                      },
      gridlines: {
        count: 10
      }
    },
    titleTextStyle: { color: 'black',
                      fontSize: 20 }
  };

  var chart = new google.visualization.LineChart(document.getElementById('linechart_for_monthly_spending'));

  chart.draw(data, options);
}

function barchart_for_current_balances() {

  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Institution');
  data.addColumn('number', 'Current Balance');
  data.addRows(gon.balanceSummary);

  var options = {
    title: 'Current Balance by Institution',
    titleTextStyle: { color: 'black',
                      fontSize: 20,
                      bold: true
                    },
    chartArea: {width: '50%'},
    hAxis: {
      title: 'Currenct Balance',
      titleTextStyle: { color: 'black',
                        bold: true
                      },
      minValue: 0
    },
    vAxis: {
      title: 'Institutions',
      titleTextStyle: { color: 'black',
                        bold: true
                      }
    },
  };

  var chart = new google.visualization.BarChart(document.getElementById('barchart_for_current_balances'));

  chart.draw(data, options);
}

// Tester
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
  var data = google.visualization.arrayToDataTable([
    ['Task', 'Hours per Day'],
    ['Work',     11],
    ['Eat',      2],
    ['Commute',  2],
    ['Watch TV', 2],
    ['Sleep',    7]
  ]);

  var options = {
    title: 'My Daily Activities',
    pieHole: 0.4,
  };
  console.log("Drawing chart...");
  var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
  chart.draw(data, options);
  console.log(chart);
}
