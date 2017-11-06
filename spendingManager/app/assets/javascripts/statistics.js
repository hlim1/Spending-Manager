google.charts.load('current', {'packages':['corechart']});

google.charts.setOnLoadCallback(piechart_for_spending_types);
google.charts.setOnLoadCallback(linechart_for_monthly_spending);

function piechart_for_spending_types() {

  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Type');
  data.addColumn('number', 'Frequency');
  data.addRows(gon.spendingTypes);

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
