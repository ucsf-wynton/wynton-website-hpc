# Wynton Dashboard

<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>

## System Metrics

<div class="status-panel" style="border: 1px solid #dec000; padding: 2ex; margin-bottom: 2ex;">
 <div style="font-size: 150%; font-weight: bold;">
  <span>Active Nodes</span><span style="float: right;">80%</span>
 </div>
 <div id="ActiveNodes"></div>
</div>

<div class="status-panel" style="border: 1px solid #dec000; padding: 2ex;">
 <div style="font-size: 150%; font-weight: bold;">
  <span>Backlog</span><span style="float: right;">15 jobs</span>
 </div>
 <div id="Backlog"></div>
</div>

<script>
Plotly.d3.csv("https://raw.githubusercontent.com/plotly/datasets/master/finance-charts-apple.csv", function(err, rows) {
  function unpack(rows, key) {
    return rows.map(function(row) { return row[key]; });
  }

  var trace1 = {
    type: "scatter",
    mode: "lines",
    name: 'Active Nodes',
    x: unpack(rows, 'Date'),
    y: unpack(rows, 'AAPL.High'),
    line: {color: '#23527c'}
  }
  
  var data = [trace1];
  
  var layout = {
    height: 150,
    margin: { l: 50, r: 30, b: 30, t: 30, pad: 4 },
    xaxis: {
      autorange: true,
      range: ['2015-02-17', '2017-02-16'],
      rangeselector: {buttons: [
          {
            count: 1,
            label: '1m',
            step: 'month',
            stepmode: 'backward'
          },
          {
            count: 6,
            label: '6m',
            step: 'month',
            stepmode: 'backward'
          },
          {step: 'all'}
        ]},
/*      rangeslider: {range: ['2015-02-17', '2017-02-16']}, */
      type: 'date'
    },
    yaxis: {
      autorange: false,
      range: [0, 150],
      type: 'linear'
    }
  };
  
  Plotly.newPlot('ActiveNodes', data, layout);
})
</script>


<script>
Plotly.d3.csv("https://raw.githubusercontent.com/plotly/datasets/master/finance-charts-apple.csv", function(err, rows) {
  function unpack(rows, key) {
    return rows.map(function(row) { return row[key]; });
  }

  var trace1 = {
    type: "scatter",
    mode: "lines",
    name: 'Active Nodes',
    x: unpack(rows, 'Date'),
    y: unpack(rows, 'AAPL.High'),
    line: {color: '#23527c'}
  }
  
  var data = [trace1];
  
  var layout = {
    height: 150,
    margin: { l: 50, r: 30, b: 30, t: 30, pad: 4 },
    xaxis: {
      autorange: true,
      range: ['2015-02-17', '2017-02-16'],
      rangeselector: {buttons: [
          {
            count: 1,
            label: '1m',
            step: 'month',
            stepmode: 'backward'
          },
          {
            count: 6,
            label: '6m',
            step: 'month',
            stepmode: 'backward'
          },
          {step: 'all'}
        ]},
/*      rangeslider: {range: ['2015-02-17', '2017-02-16']}, */
      type: 'date'
    },
    yaxis: {
      autorange: false,
      range: [0, 150],
      type: 'linear'
    }
  };
  
  Plotly.newPlot('Backlog', data, layout);
})
</script>
