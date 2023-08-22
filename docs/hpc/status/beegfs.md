---
title: Wynton HPC Status Dashboard
---

## {{ site.cluster.name }} Dashboard

<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>

<p>
  <a class="btn btn-primary" data-toggle="collapse" href="#beegfs-metrics" role="button" aria-expanded="false" aria-controls="beegfs-metrics">BeeGFS Metrics</a>
</p>

<div class="collapse in multi-collapse" id="beegfs-metrics">
  <h3>BeeGFS Metrics</h3>

  <div class="status-panel" style="border: 1px solid #dec000; padding: 2ex; margin-bottom: 2ex;">
   <div style="font-size: 150%; font-weight: bold;">
    <span>BeeGFS profiling of dev1:/wynton/scratch/ (seconds)</span><span style="float: right;"></span>
   </div>
   <div id="BeeGFSLoad_dev1.wynton.ucsf.edu__wynton_scratch_hb"></div>
  </div>

  <div class="status-panel" style="border: 1px solid #dec000; padding: 2ex; margin-bottom: 2ex;">
   <div style="font-size: 150%; font-weight: bold;">
    <span>BeeGFS profiling of dev1:/wynton/home/ (seconds)</span><span style="float: right;"></span>
   </div>
   <div id="BeeGFSLoad_dev1.wynton.ucsf.edu__wynton_home_cbi_hb"></div>
  </div>

  <div class="status-panel" style="border: 1px solid #dec000; padding: 2ex; margin-bottom: 2ex;">
   <div style="font-size: 150%; font-weight: bold;">
    <span>BeeGFS profiling of dev1:/wynton/group/ (seconds)</span><span style="float: right;"></span>
   </div>
   <div id="BeeGFSLoad_dev1.wynton.ucsf.edu__wynton_group_cbi_hb"></div>
  </div>
</div>

<script>
host = "dev1.wynton.ucsf.edu"
drives = ["wynton_scratch_hb", "wynton_home_cbi_hb", "wynton_group_cbi_hb"];
url_path = "https://raw.githubusercontent.com/UCSF-HPC/wynton-slash2/master/wynton-bench"

drives.forEach(function(drive) {
  var name = host + "__" + drive;
  var id = "BeeGFSLoad_" + name;
  var file = "wynton-bench_" + name + ".tsv";
  var url = url_path + "/" + file;

  Plotly.d3.tsv(url, function(err, rows) {
    function unpack(rows, key) {
      return rows.map(function(row) { return row[key]; });
    }

    var beegfs_load = {
      type: "scatter",
      mode: "lines",
      name: 'BeeGFS Load',
      x: unpack(rows, 'timestamp'),
      y: unpack(rows, 'duration'),
      line: {color: '#23527c'}
    }
  
    var data = [beegfs_load];
  
    var layout = {
      height: 250,
      margin: { l: 50, r: 30, b: 30, t: 30, pad: 4 },
      xaxis: {
        autorange: true,
        rangeselector: {buttons: [
            {
              count: 1,
              label: '1d',
              step: 'day',
              stepmode: 'backward'
            },
            {
              count: 7,
              label: '1w',
              step: 'day',
              stepmode: 'backward'
            },
            {
              count: 1,
              label: '1m',
              step: 'month',
              stepmode: 'backward'
            },
            {
              count: 12,
              label: '1y',
              step: 'month',
              stepmode: 'backward'
            },
            {
              step: 'all'
            }
          ]},
        type: 'date'
      },
      yaxis: {
        autorange: false,
        range: [0, 500],
        type: 'linear'
      }
    };
    
    Plotly.newPlot(id, data, layout);
  })
});
</script>
