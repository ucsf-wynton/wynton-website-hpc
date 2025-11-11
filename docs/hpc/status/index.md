---
title: Wynton HPC Status
---

<!-- markdownlint-disable-file MD024 MD025 -->

# UCSF {{ site.cluster.name }} Status


## Queue Metrics

{% assign periods = "day,week,month,year" | split: ',' %}

<ul class="nav nav-pills">
{% for period in periods %}
  <li{% if period == periods[0] %} class="active"{% endif %}><a data-toggle="pill" href="#by-{{ period }}"><span style="font-weight: bold;">{{ period }}</span></a></li>
{% endfor %}
</ul>
<div class="tab-content" style="margin-top: 1ex;">
{% for period in periods %}
  <div id="by-{{ period }}" class="tab-pane fade in{% if period == periods[0] %} active{% endif %}">
    <img src="{{ site.assets.status_root_path }}/status/figures/queues-{{ period }}.png" alt="queues usage during the last {{ period }}"/><br>
    <img src="{{ site.assets.status_root_path }}/status/figures/gpuq-{{ period }}.png" alt="GPU queues usage during the last {{ period }}"/><br>
  </div>
{% endfor %}
</div>


## File-System Metrics

Last known heartbeat: <span id="last-heartbeat">Loading…</span>
<button id="reload-heartbeat" title="Reload">⟲</button>

  <div class="status-panel" style="border: 1px solid #dec000; padding: 2ex; margin-bottom: 2ex;">
   <div style="font-size: 150%; font-weight: bold;">
    <span>/wynton/scratch/ lagginess</span><span style="float: right;"></span>
   </div>
   <div id="BeeGFSLoad_devX__wynton_scratch_hb"></div>
  </div>

  <div class="status-panel" style="border: 1px solid #dec000; padding: 2ex; margin-bottom: 2ex;">
   <div style="font-size: 150%; font-weight: bold;">
    <span>/wynton/home/ lagginess</span><span style="float: right;"></span>
   </div>
   <div id="BeeGFSLoad_devX__wynton_home_cbi_hb"></div>
  </div>

  <div class="status-panel" style="border: 1px solid #dec000; padding: 2ex; margin-bottom: 2ex;">
   <div style="font-size: 150%; font-weight: bold;">
    <span>/wynton/group/ lagginess</span><span style="float: right;"></span>
   </div>
   <div id="BeeGFSLoad_devX__wynton_group_cbi_hb"></div>
  </div>

_Figure: The total, relative processing time on the logarithmic scale for one benchmarking run to complete over time. The values presented are relative to the best case scenario when there is no load, in case the value is 1.0. The larger the relative time is, the more lag there is on file system. 
Annotation of lagginess ranges: 1-2: excellent (light green), 2-5: good (green), 5-20: sluggish (orange), 20-100: bad (red), 100 and above: critical (purple)._

Details: These benchmarks are run every ten minutes from different hosts and toward different types of the file system. These metrics are based on a [set of commands](https://github.com/ucsf-wynton/wynton-bench/blob/d96937b51e6ee3a421afec3c793accb0acd82c51/bench-scripts/bench-files-tarball.sh#L93-L129), part of the **[wynton-bench](https://github.com/ucsf-wynton/wynton-bench)** tool, that interacts with the file system that is being benchmarked.  The relevant ones are: reading a large file from `/wynton/home/`, copying that large archive file to and from the BeeGFS path being benchmarked, extracting the archive to path being benchmarked, find one file among the extracted files, calculating the total file size, and re-archiving and compressing the extracted files.  When there's minimal load on `/wynton`, the processing time is ~19 seconds. In contrast, when benchmarking local `/scratch`, the total processing time is about three seconds.

When BeeGFS struggles to keep up with metadata and storage requests, the BeeGFS lagginess goes up. We can use `beegfs-ctl --serverstats --perserver --nodetype=meta` and `beegfs-ctl --serverstats --perserver --nodetype=storage` to see the amount of BeeGFS operations that are queued up (`qlen`) per metadata and storage server. When things run smoothly, the queue lengths should be near zero (`qlen` less than ten). When BeeGFS struggles to keep up, we typically find large `qlen` values for one or more servers. To see if the BeeGFS load is high due to file storage or metadata I/O performed by specific users, we can use `beegfs-ctl --userstats ...`. For example, `beegfs-ctl --userstats --names --interval=10 --maxlines=5 --nodetype=storage` summarizes _storage_ operations every ten seconds and list the five users with the most operations. Similarly, `beegfs-ctl --userstats --names --interval=10 --maxlines=5 --nodetype=meta` shows _metadata_ operations per user.


## Miscellaneous Metrics

Detailed statistics on the file-system load and other cluster metrics can be found on the [{{ site.cluster.name }} Grafana Dashboard](https://mon.wynton.ucsf.edu/grafana).  To access this, make sure you are on the UCSF network.  Use your {{ site.cluster.name }} credential to log in.


## Compute Nodes

<div id="hosttablediv">
<div id="hosttablemessage">Status on compute nodes unknown, which happens when for instance the job scheduler is down.</div>
</div>


## Upcoming Incidents

{% include_relative incidents-upcoming.md %}


## Current Incidents

{% include_relative incidents-current.md %}


## Past Incidents

{% assign current_year = site.time | date: "%Y" | plus: 0 %}

<ul class="nav nav-pills">
{% for year in (2018..current_year) reversed %}
  <li{% if year == current_year %} class="active"{% endif %}><a data-toggle="pill" href="#{{ year }}"><span style="font-weight: bold;">{{ year }}</span></a></li>
{% endfor %}
</ul>

<div class="tab-content" style="margin-top: 1ex;">
{% for year in (2018..current_year) reversed %}
<div id="{{ year }}" class="tab-pane {% if year == current_year %}fadein active{% else %}fade{% endif %}">
<section markdown="1">
{% include_relative incidents-{{ year }}.md %}
</section>
</div>
{% endfor %}



<!-- DO NOT EDIT ANYTHING BELOW -->


<!-------------------------------------------------------------------------
   Heartbeat
 -------------------------------------------------------------------------->
<span id="last-heartbeat">loading…</span>
<button id="reload-heartbeat">Reload</button>

<script>
(async function initHeartbeatFromTSV() {
  const urls = [
    "https://raw.githubusercontent.com/UCSF-HPC/wynton-slash2/master/wynton-bench/wynton-bench_dev1.wynton.ucsf.edu__wynton_scratch_hb.tsv",
    "https://raw.githubusercontent.com/UCSF-HPC/wynton-slash2/master/wynton-bench/wynton-bench_dev2.wynton.ucsf.edu__wynton_scratch_hb.tsv",
    "https://raw.githubusercontent.com/UCSF-HPC/wynton-slash2/master/wynton-bench/wynton-bench_dev3.wynton.ucsf.edu__wynton_scratch_hb.tsv",
  ];

  const el = document.getElementById("last-heartbeat");
  const reloadBtn = document.getElementById("reload-heartbeat");
  if (!el) return;

  const MAX_BUFFER = 32 * 1024; // keep only the last ~32KB per file

  function pad(n) { return String(n).padStart(2, "0"); }
  function toLocalIsoSeconds(d) {
    const t = new Date(Math.floor(d.getTime() / 1000) * 1000);
    const yyyy = t.getFullYear();
    const mm = pad(t.getMonth() + 1);
    const dd = pad(t.getDate());
    const hh = pad(t.getHours());
    const mi = pad(t.getMinutes());
    const ss = pad(t.getSeconds());
    const tzOffMin = -t.getTimezoneOffset();
    const sign = tzOffMin >= 0 ? "+" : "-";
    const offH = pad(Math.floor(Math.abs(tzOffMin) / 60));
    const offM = pad(Math.abs(tzOffMin) % 60);
    return `${yyyy}-${mm}-${dd}T${hh}:${mi}:${ss}${sign}${offH}:${offM}`;
  }

  async function readLastLine(url) {
    const res = await fetch(url + "?t=" + Date.now(), { cache: "no-store" });
    if (!res.ok || !res.body) throw new Error(`HTTP ${res.status} for ${url}`);
    const reader = res.body.getReader();
    const decoder = new TextDecoder("utf-8");
    let buf = "";

    while (true) {
      const { value, done } = await reader.read();
      if (done) break;
      buf += decoder.decode(value, { stream: true });
      if (buf.length > MAX_BUFFER) {
        // Keep only tail; try not to cut inside a line
        const cutFrom = buf.length - MAX_BUFFER;
        const nl = buf.indexOf("\n", cutFrom);
        buf = nl >= 0 ? buf.slice(nl + 1) : buf.slice(cutFrom);
      }
    }
    buf += decoder.decode();

    const lines = buf.split(/\r?\n/).filter(line => line.trim().length > 0);
    if (lines.length === 0) throw new Error("No non-empty lines");
    const lastLine = lines[lines.length - 1];

    // TSV preferred; fallback to CSV if needed
    const delim = lastLine.includes("\t") ? "\t" : ",";
    const [tsRaw, durRaw] = lastLine.split(delim);

    const ts = (tsRaw || "").replace(/^"|"$/g, "");
    const start = new Date(ts);
    const durSec = Number((durRaw || "").trim());
    const validStart = !Number.isNaN(start.getTime());
    const validDur = !Number.isNaN(durSec);

    const end = validStart ? new Date(start.getTime() + (validDur ? durSec * 1000 : 0)) : null;

    return { url, start: validStart ? start : null, end, durationSec: validDur ? durSec : null };
  }

  // Hmm ... v.start appears to be the actual "end" timestamp, not v.end.
  // This was discovered when the latency was >200x. /HB 2025-08-26
  async function updateHeartbeat() {
    el.textContent = "loading…";
    try {    
      const results = await Promise.allSettled(urls.map(readLastLine));
      const ok = results.filter(r => r.status === "fulfilled").map(r => r.value).filter(v => v.start);
      if (ok.length === 0) {
        el.textContent = "—";
        el.title = "No valid (timestamp+duration) found";
        return;
      }
      // Pick newest end time (timestamp + duration)
      const newest = ok.reduce((a, b) => (a.start > b.start ? a : b));

      const localIso = toLocalIsoSeconds(newest.start);

      // Age as "XmYYs ago"
      const diff_ms = Date.now() - newest.start.getTime();
      const diff_s = diff_ms / 1000;
      const hours = Math.floor(diff_s / 3600);
      const mins = Math.floor((diff_s - 3600 * hours) / 60);
      const secs = Math.floor((diff_s - 3600 * hours - 60 * mins));
      var ageStr;
      if (hours > 0) {
        ageStr = `${hours}h${mins.toString().padStart(2, "0")}m${secs.toString().padStart(2, "0")}s ago`;
      } else {
        ageStr = `${mins}m${secs.toString().padStart(2, "0")}s ago`;
      }

      el.textContent = `${ageStr} (${localIso})`;
      const tipParts = [`from: ${newest.url}`];
      if (newest.durationSec != null) tipParts.push(`duration: ${newest.durationSec}s`);
      el.title = tipParts.join(" | ");
    } catch (err) {
      console.error("Failed to aggregate heartbeats:", err);
      el.textContent = "—";
    }
  }

  // Initial load
  updateHeartbeat();

  // Reload button
  if (reloadBtn) reloadBtn.addEventListener("click", updateHeartbeat);
})();
</script>


<!-------------------------------------------------------------------------
   Compute Nodes Status Table
 -------------------------------------------------------------------------->

<script src="https://d3js.org/d3.v3.min.js"><!-- ~150 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"><!-- ~80 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"><!-- 2 kB --></script>

<!-- markdownlint-disable-file MD052 -->
<script type="text/javascript" charset="utf-8">
d3.text("/hpc/assets/data/host_table.tsv", "text/csv", function(host_table) {
  // drop header comments
  host_table = host_table.replace(/^[#][^\r\n]*[\r\n]+/mg, '');
  host_table = d3.tsv.parse(host_table);

  d3.text("https://raw.githubusercontent.com/UCSF-HPC/wynton-slash2/master/status/qstat_nodes_in_state_au.tsv", "text/csv", function(host_status) {
    host_status = d3.tsv.parse(host_status);

    var tbody, tr, td, td_status;
    var value;
    var nodes = 0, gpu_nodes = 0;
    var cores = 0, gpu_cores = 0;
    var nodes_with_issues = 0, cores_with_issues = 0;
    var gpu_nodes_with_issues = 0, gpu_cores_with_issues = 0;
    var cores_node;
    var hostname;
    
    /* For each row */
    host_table.forEach(function(row) {
      hostname = row["Node"];
      
      nodes += 1;
      cores_node = parseInt(row["Physical Cores"]);
      cores += cores_node;

      if (hostname.includes("gpu")) {
        gpu_nodes += 1;
        gpu_cores += cores_node;
      }
      
      // No issues?
      if (host_status.filter(function(d) { return d.queuename == hostname }).length == 0) return;

      /* Ignore column on /tmp size, iff it exists */
      delete row["Local `/tmp`"];

      if (nodes_with_issues == 0) {
        var table = d3.select("#hosttablediv").append("details").append("table");
        table.id = "hosttable";
        tr = table.append("thead").append("tr");
        tr.append("th").text("Status");
        for (key in row) tr.append("th").text(key.replace(/\`/g, ""));
        tbody = table.append("tbody");
      }

      nodes_with_issues += 1;      
      cores_with_issues += cores_node;
      if (hostname.includes("gpu")) {
        gpu_nodes_with_issues += 1;      
        gpu_cores_with_issues += cores_node;
      }
  
      tr = tbody.append("tr");
      td_status = tr.append("td").text("⚠");  // "⚠" or "✖"
      for (key in row) td = tr.append("td").text(row[key]);
    });


    /* WORKAROUND: The host table is not updates; instead pull in the static information. /HB 2020-12-16 */
    nodes = {{ site.data.specs.nodes }};
    cores = {{ site.data.specs.physical_cores }};
    gpu_nodes = {{ site.data.specs.gpu_nodes }};
    
    var div = document.getElementById("hosttablemessage");
    div.innerText = "";
    if (nodes_with_issues > 0) {
      var text = document.createTextNode("Currently, " + nodes_with_issues + " (" + (100*nodes_with_issues/nodes).toFixed(1) + "%) " +  " of " + nodes + " compute nodes, corresponding to " + cores_with_issues + " (" + (100*cores_with_issues/cores).toFixed(1) + "%) " + " of " + cores + " CPU cores, are unavailable. Out of these, " + gpu_nodes_with_issues + " (" + (100*gpu_cores_with_issues/gpu_cores).toFixed(1) + "%) of " + gpu_nodes + " GPU compute nodes are unavailable.");
      div.appendChild(text);
      text = document.createTextNode(" A compute node is considered unavailable when its queuing state is \"disabled\" (d), \"unheard/unreachable\" (u), or \"error\" (E) (according to ");
      div.appendChild(text);
      var code = document.createElement("code");
      code.innerText = "qstat -f -qs duE";
      div.appendChild(code);
      text = document.createTextNode(" queried every five minutes), which means they will not take on any new jobs.");
      div.appendChild(text);
    } else {
      var text = document.createTextNode("All " + nodes + " nodes, with a total of " + cores + " cores, are functional.");
      div.appendChild(text);
    }
    
    $(document).ready(function() {
      $('#hosttable').DataTable({
        paging: false,
        searching: false,
        order: [[ 1, "asc" ]]
      });
    });
  });
});
</script>



<!-------------------------------------------------------------------------
   BeeGFS Lagginess Graphs
 -------------------------------------------------------------------------->
 
<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>

<script>
function date_to_string(d) {
  var YY = d.getFullYear().toString();
  var mm = (d.getMonth()+1).toString().length==2?(d.getMonth()+1).toString():"0"+(d.getMonth()+1).toString();
  var dd = d.getDate().toString().length==2?d.getDate().toString():"0"+d.getDate().toString();
  var HH = d.getHours().toString().length==2?d.getHours().toString():"0"+d.getHours().toString();
  var MM = (parseInt(d.getMinutes()/5)*5).toString().length==2?(parseInt(d.getMinutes()/5)*5).toString():"0"+(parseInt(d.getMinutes()/5)*5).toString();
  var SS = "00";
  return YY + "-" + mm + "-" + dd + " " + HH + ":" + MM + ":" + SS;
}


url_path = "https://raw.githubusercontent.com/UCSF-HPC/wynton-slash2/master/wynton-bench";
host_set = "devX";
hosts = ["dev1", "dev2", "dev3"];
drives = ["wynton_scratch_hb", "wynton_home_cbi_hb", "wynton_group_cbi_hb"];
// Baseline is when there is no load on the file system (rough estimate)
baseline = 19.0;
var multiple_beegfs_tracks = true;

var now = new Date();
var from = new Date(now - 24 * 60 * 60 * 1000);

var max_lagginess = 1000;

var beegfs_load = {
  type: "scatter",
  mode: "lines",
  name: 'BeeGFS Load',
  x: [],
  y: [],
  line: {color: '#23527c'}
}

var layout = {
  height: 300,
  margin: { l: 50, r: 30, b: 40, t: 60, pad: 4 },
  xaxis: {
    autorange: false,
    range: [date_to_string(from), date_to_string(now)],
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
          step: 'all',
          label: 'all'
        }
      ]},
    type: 'date'
  },
  yaxis: {
    autorange: false,
    range: [-0.1, Math.log10(max_lagginess)],
    type: 'log'
  }
};

function unpack(rows, key) {
  return rows.map(function(row) { 
    var value = row[key];
    if (key == "duration") {
      value = parseFloat(value);
      value = value / baseline;
      if (value < 1/2) {
        // Unreasonable value?
        value = null;
      } else if (value < 1.0) {
        // Round up to baseline
        value = 1.0;
      }
    }
    return value;
  });
}

var data = [];

drives.forEach(function(drive) {
  var id = "BeeGFSLoad_" + host_set + "__" + drive;
  
  var url = url_path + "/" + "wynton-bench_" + hosts[0] + ".wynton.ucsf.edu__" + drive + ".tsv";
  Plotly.d3.tsv(url, function(err, rows) {
    // Lagginess data
    var trace = JSON.parse(JSON.stringify(beegfs_load));
    trace.name = hosts[0];
    trace.x = unpack(rows, 'timestamp');
    trace.y = unpack(rows, 'duration');
    trace.line = { color: '#23527c', width: 3 };

    // Pain-level annotations (excellent, good, sluggish, bad, critical)
    var painTicks = [2, 5, 20, 100, 10000];
    var painLabels = ['', '', '', '', ''];
          
    var painTrace = {
      x: trace.x,
      y: painTicks,
      yaxis: 'y2',
      mode: 'markers',
      marker: { opacity: 0 },
      showlegend: false,
      hoverinfo: 'skip'
    };
    
    var updatedLayout = Object.assign({}, layout, {
      yaxis2: {
        overlaying: 'y',
        side: 'right',
        tickvals: painTicks,
        ticktext: painLabels,
        showgrid: false,
        zeroline: false
      },
      shapes: [
        { type: 'rect', xref: 'paper', x0: 0, x1: 1, yref: 'y', y0: 1, y1: painTicks[1], fillcolor: 'rgba(0, 200, 0, 0.2)', line: { width: 0 }, layer: 'below' },                 // Excellent
        
        { type: 'rect', xref: 'paper', x0: 0, x1: 1, yref: 'y', y0: painTicks[0], y1: painTicks[1], fillcolor: 'rgba(255, 215, 0, 0.3)', line: { width: 0 }, layer: 'below' },    // Good
        
        { type: 'rect', xref: 'paper', x0: 0, x1: 1, yref: 'y', y0: painTicks[1], y1: painTicks[2], fillcolor: 'rgba(255, 140, 0, 0.3)', line: { width: 0 }, layer: 'below' },    // Sluggish
        
        { type: 'rect', xref: 'paper', x0: 0, x1: 1, yref: 'y', y0: painTicks[2], y1: painTicks[3], fillcolor: 'rgba(255, 0, 0, 0.4)', line: { width: 0 }, layer: 'below' },      // Bad
        
        { type: 'rect', xref: 'paper', x0: 0, x1: 1, yref: 'y', y0: painTicks[3], y1: max_lagginess, fillcolor: 'rgba(200, 100, 255, 0.4)', line: { width: 0 }, layer: 'below' }  // Critical
      ]
    });  

    Plotly.newPlot(id, [trace, painTrace], updatedLayout);
  })

  // Change to 'true' to show multiple traces
  if (multiple_beegfs_tracks) {
    if (hosts.length >= 2) {
      var url = url_path + "/" + "wynton-bench_" + hosts[1] + ".wynton.ucsf.edu__" + drive + ".tsv";
      Plotly.d3.tsv(url, function(err, rows) {
        var trace = JSON.parse(JSON.stringify(beegfs_load));
        trace.name = hosts[1];
        trace.x = unpack(rows, 'timestamp');
        trace.y = unpack(rows, 'duration');
        trace.line = { color: '#F88379', width: 3 };
        Plotly.addTraces(id, [trace]);
      })
    }
  
    if (hosts.length >= 3) {
      var url = url_path + "/" + "wynton-bench_" + hosts[2] + ".wynton.ucsf.edu__" + drive + ".tsv";
      Plotly.d3.tsv(url, function(err, rows) {
        var trace = JSON.parse(JSON.stringify(beegfs_load));
        trace.name = hosts[2];
        trace.x = unpack(rows, 'timestamp');
        trace.y = unpack(rows, 'duration');
        trace.line = { color: '#9dc183', width: 3 };
        Plotly.addTraces(id, [trace]);
      })
    }
  }  
});
</script>
