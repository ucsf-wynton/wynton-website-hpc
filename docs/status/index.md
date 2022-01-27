---
title: Wynton HPC Status
---

<!-- markdownlint-disable-file MD024 MD025 -->

# UCSF {{ site.cluster.name }} Status

<!-- To display the 'broadcast' icon in the navbar, edit assets/css/broadcast.css -->

{% if site.cluster.status == "inaccessible" %}
<div class="alert alert-danger" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} is experiencing significant issues</strong>
</div>
{% elsif site.cluster.status == "problematic" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
File transfers via Globus does not work on <strong>{{ site.cluster.name }}</strong> due to issues with data-transfer node dt1.wynton.ucsf.edu
</div>
{% elsif site.cluster.status == "recovering" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} is operational with parts of the compute resources being recovered</strong>
</div>
{% elsif site.cluster.status == "kernel-upgrade" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} has fewer slots available than usual due to kernel upgrades</strong><br>
</div>
{% elsif site.cluster.status == "full-outage" %}
<div class="alert alert-danger" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} environment non-operational</strong><br>
<em>Complete outage due to scheduled maintenance during December 7-10, 2020</em>
</div>
{% elsif site.cluster.status == "partial-outage" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} is operational but experiencing partial problems</strong><br>
</div>
{% elsif site.cluster.status == "notice" %}
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} environment operational</strong><br>
<em>The cluster will be shut down completely on May 25, 2021 for maintenance. Starting May 11, the maximum job runtime will be decreased on a daily basis from the current 14 days so that jobs finish in time.</em><br>
</div>
{% else %}
<div class="alert alert-info" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} environment operational</strong>
</div>
{% endif %}


## Queue Metrics

<ul class="nav nav-pills">
  <li class="active"><a data-toggle="pill" href="#by-day">Day</a></li>
  <li><a data-toggle="pill" href="#by-week">Week</a></li>
  <li><a data-toggle="pill" href="#by-month">Month</a></li>
  <li><a data-toggle="pill" href="#by-year">Year</a></li>
</ul>
<div class="tab-content" style="margin-top: 1ex;">
  <div id="by-day" class="tab-pane fade in active">
    <img src="{{ site.assets.status_root_path }}/status/figures/queues-day.png" alt="queues usage during the last day"/><br>
    <img src="{{ site.assets.status_root_path }}/status/figures/gpuq-day.png" alt="GPU queues usage during the last day"/><br>
<!--    
    <img src="{{ site.assets.status_root_path }}/status/figures/grafana_storage_totals-day.png" alt="BeeGFS I/O throughput during the last day"/><br>
-->
  </div>
  <div id="by-week" class="tab-pane fade">
    <img src="{{ site.assets.status_root_path }}/status/figures/queues-week.png" alt="queues usage during the last week"/><br>
    <img src="{{ site.assets.status_root_path }}/status/figures/gpuq-week.png" alt="GPU queues usage during the last week"/><br>
<!--    
    <img src="{{ site.assets.status_root_path }}/status/figures/grafana_storage_totals-week.png" alt="BeeGFS I/O throughput during the last week"/><br>
-->    
  </div>
  <div id="by-month" class="tab-pane fade">
    <img src="{{ site.assets.status_root_path }}/status/figures/queues-month.png" alt="queues usage during the last month"/><br>
    <img src="{{ site.assets.status_root_path }}/status/figures/gpuq-month.png" alt="GPU queues usage during the last month"/><br>
<!--    
    <img src="{{ site.assets.status_root_path }}/status/figures/grafana_storage_totals-month.png" alt="BeeGFS I/O throughput during the last month"/><br>
-->    
  </div>
  <div id="by-year" class="tab-pane fade">
    <img src="{{ site.assets.status_root_path }}/status/figures/queues-year.png" alt="queues usage during the last year"/><br>
    <img src="{{ site.assets.status_root_path }}/status/figures/gpuq-year.png" alt="GPU queues usage during the last year"/><br>
<!--    
    <img src="{{ site.assets.status_root_path }}/status/figures/grafana_storage_totals-year.png" alt="BeeGFS I/O throughput during the last year"/><br>
-->    
  </div>
</div>


## Compute Nodes

<div id="hosttablediv">
<p id="hosttablemessage">All compute nodes are functional.</p>
</div>


## {{ site.cluster.name }} Grafana Dashboard

Detailed statistics on the file-system load and other cluster metrics can be found on the [{{ site.cluster.name }} Grafana Dashboard](https://mon.wynton.ucsf.edu/grafana).  To access this, make sure you are on the UCSF network.  Use your {{ site.cluster.name }} credential to log in.


## Current Incidents

{% include_relative incidents-current.md %}


## Upcoming incidents

{% include_relative incidents-upcoming.md %}


## Past Incidents

{% assign years = "2022,2021,2020,2019,2018" | split: ',' %}

<ul class="nav nav-pills">
{% for year in years %}
  <li{% if year == years[0] %} class="active"{% endif %}><a data-toggle="pill" href="#{{ year }}"><span style="font-weight: bold;">{{ year }}</span></a></li>
{% endfor %}
</ul>

<div class="tab-content" style="margin-top: 1ex;">
{% for year in years %}
<div id="{{ year }}" class="tab-pane {% if year == years[0] %}fadein active{% else %}fade{% endif %}">
<section markdown="1">
{% include_relative incidents-{{ year }}.md %}
</section>
</div>
{% endfor %}




<!-- DO NOT EDIT ANYTHING BELOW -->

<script src="https://d3js.org/d3.v3.min.js"><!-- ~150 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"><!-- ~80 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"><!-- 2 kB --></script>

<script type="text/javascript" charset="utf-8">
d3.text("{{ '/assets/data/host_table.tsv' | relative_url }}", "text/csv", function(host_table) {
  // drop header comments
  host_table = host_table.replace(/^[#][^\r\n]*[\r\n]+/mg, '');
  host_table = d3.tsv.parse(host_table);

  d3.text("https://raw.githubusercontent.com/UCSF-HPC/wynton-slash2/master/status/qstat_nodes_in_state_au.tsv", "text/csv", function(host_status) {
    
    // drop header comments
    host_status = host_status.replace(/^[#][^\r\n]*[\r\n]+/mg, '');
    host_status = d3.tsv.parse(host_status);

    var tbody, tr, td, td_status;
    var value;
    var cores = 0, cores_node;
    var nodes_with_issues = 0, cores_with_issues = 0;
  
    /* For each row */
    var nodes = 0;
    host_table.forEach(function(row) {
      nodes += 1;
      cores_node = parseInt(row["Physical Cores"]);
      cores += cores_node;

      // No issues?
      if (host_status.filter(function(d) { return d.queuename == row["Node"] }).length == 0) return;

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
  
      tr = tbody.append("tr");
      td_status = tr.append("td").text("⚠");  // "⚠" or "✖"
      for (key in row) td = tr.append("td").text(row[key]);
    });


    /* WORKAROUND: The host table is not updates; instead pull in the static information. /HB 2020-12-16 */
    nodes = {{ site.data.specs.nodes }};
    cores = {{ site.data.specs.physical_cores }};
    
    var p = d3.select("#hosttablemessage");
    if (nodes_with_issues > 0) {
      p.text("Currently, " + (100*nodes_with_issues/nodes).toFixed(1) + "% (" + nodes_with_issues + " of " + nodes + ") of the nodes, corresponding to " + (100*cores_with_issues/cores).toFixed(1) + "% (" + cores_with_issues + " of " + cores + ") of the cores, are reported to have a queuing state 'unheard/unreachable' or 'error' (according to \'qstat -f -qs uE\' queried every five minutes), which means they will not take on any new jobs.");
    } else {
      p.text("All " + nodes + " nodes, with a total of " + cores + " cores, are functional.");
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


<style>
table {
  margin-top: 2ex;
  margin-bottom: 2ex;
}
tfoot {
  border-top: 2px solid #000;
  font-weight: bold;
}
ttr:last-child { border-top: 2px solid #000; }
</style>
