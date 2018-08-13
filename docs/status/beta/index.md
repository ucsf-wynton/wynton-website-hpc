# Wynton Dashboard

<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>

<p>
  <a class="btn btn-primary" data-toggle="collapse" href="#system-metrics" role="button" aria-expanded="false" aria-controls="system-metrics">System Metrics</a>
  <a class="btn btn-primary" data-toggle="collapse" href="#job-metrics"    role="button" aria-expanded="false" aria-controls="job-metrics">Job Metrics</a>
</p>

<div class="collapse in multi-collapse" id="system-metrics">
  <h2>System Metrics</h2>
  
  <div class="status-panel" style="border: 1px solid #dec000; padding: 2ex; margin-bottom: 2ex;">
   <div style="font-size: 150%; font-weight: bold;">
    <span>Active Nodes</span><span style="float: right;">80%</span>
   </div>
   <div id="ActiveNodes"></div>
  </div>
  
  <div class="status-panel" style="border: 1px solid #dec000; padding: 2ex; margin-bottom: 2ex;">
   <div style="font-size: 150%; font-weight: bold;">
    <span>Core Usage</span><span style="float: right;">80%</span>
   </div>
   <div id="CoreUsage"></div>
  </div>
  
  <div class="status-panel" style="border: 1px solid #dec000; padding: 2ex; margin-bottom: 2ex;">
   <div style="font-size: 150%; font-weight: bold;">
    <span>Memory Usage</span><span style="float: right;">80%</span>
   </div>
   <div id="MemoryUsage"></div>
  </div>
</div>


<div class="collapse in multi-collapse" id="job-metrics">
  <h2>Job Metrics</h2>

  <div class="status-panel" style="border: 1px solid #dec000; padding: 2ex;">
   <div style="font-size: 150%; font-weight: bold;">
    <span>Active Jobs</span><span style="float: right;">15 jobs</span>
   </div>
   <div id="ActiveJobs"></div>
  </div>
  
  <div class="status-panel" style="border: 1px solid #dec000; padding: 2ex;">
   <div style="font-size: 150%; font-weight: bold;">
    <span>Queue Backlog</span><span style="float: right;">15 jobs</span>
   </div>
   <div id="QueueBacklog"></div>
  </div>
</div>


<script>
Plotly.d3.csv("https://raw.githubusercontent.com/plotly/datasets/master/finance-charts-apple.csv", function(err, rows) {
  function unpack(rows, key) {
    return rows.map(function(row) { return row[key]; });
  }

  var active_nodes = {
    type: "scatter",
    mode: "lines",
    name: 'Active Nodes',
    x: unpack(rows, 'Date'),
    y: unpack(rows, 'AAPL.High'),
    line: {color: '#23527c'}
  }

  var core_usage = {
    type: "scatter",
    mode: "lines",
    name: 'Core Usage',
    x: unpack(rows, 'Date'),
    y: unpack(rows, 'AAPL.High'),
    line: {color: '#23527c'}
  }

  var memory_usage = {
    type: "scatter",
    mode: "lines",
    name: 'Memory Usage',
    x: unpack(rows, 'Date'),
    y: unpack(rows, 'AAPL.High'),
    line: {color: '#23527c'}
  }

  var active_jobs = {
    type: "scatter",
    mode: "lines",
    name: 'Active Jobs',
    x: unpack(rows, 'Date'),
    y: unpack(rows, 'AAPL.High'),
    line: {color: '#23527c'}
  }

  var queued_jobs = {
    type: "scatter",
    mode: "lines",
    name: 'Queued Jobs',
    x: unpack(rows, 'Date'),
    y: unpack(rows, 'AAPL.High'),
    line: {color: '#23527c'}
  }

  var data = [active_nodes];
  
  var layout = {
    height: 150,
    margin: { l: 50, r: 30, b: 30, t: 30, pad: 4 },
    xaxis: {
      autorange: true,
      range: ['2015-02-17', '2017-02-16'],
      rangeselector: {buttons: [
          {
            count: 1,
            label: '1h',
            step: 'month',
            stepmode: 'backward'
          },
          {
            count: 3,
            label: '1d',
            step: 'month',
            stepmode: 'backward'
          },
          {
            count: 10,
            label: '1w',
            step: 'week',
            stepmode: 'backward'
          },
          {
            count: 20,
            label: '1m',
            step: 'month',
            stepmode: 'backward'
          },
          {
            count: 30,
            label: '1y',
            step: 'month',
            stepmode: 'backward'
          },
          {
	    step: 'all'
	  }
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
  Plotly.newPlot('CoreUsage', data, layout);
  Plotly.newPlot('MemoryUsage', data, layout);
  Plotly.newPlot('ActiveJobs', data, layout);
  Plotly.newPlot('QueueBacklog', data, layout);
})
</script>
