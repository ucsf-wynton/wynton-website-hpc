<div class="alert alert-info" role="alert" markdown="1">
{{ site.cluster.name }} has {{ site.data.specs.gpu_nodes }} GPU nodes with a total of {{ site.data.specs.gpus }} GPUs available to all users. Among these, {{ site.data.specs.gpu_nodes | minus: site.data.specs.communal_gpu_nodes }} GPU nodes, with a total of {{ site.data.specs.gpus | minus: site.data.specs.communal_gpus }} GPUs, were contributed by different research groups. GPU jobs are limited to 2 hours in length when run on GPUs not contributed by the running user's lab.  In contrast, [contributors are _not_ limited to 2-hour GPU jobs on nodes they contributed](/hpc/scheduler/queues.html).
There is also one GPU development node that is available to all users.
</div>

# Contributing Member GPU Shares

Below table shows which labs have access to dedicated Graphical Processing Unit (GPU) compute nodes and how many.


<script src="https://d3js.org/d3.v3.min.js"><!-- ~150 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"><!-- ~80 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"><!-- 2 kB --></script>

<table id="hosttable">
</table>

<!-- markdownlint-disable-file MD011 MD052 -->
<script type="text/javascript" charset="utf-8">
d3.text("/hpc/assets/data/gpu_shares.tsv", "text/csv", function(host_table) {
  // extract date from header comments
  var timestamp = host_table.match(/^[#] Created on: [^\r\n]*[\r\n]+/mg, '')[0];
  timestamp = timestamp.replace(/^[#] Created on: /g, '');
  timestamp = timestamp.replace(/ [^ ]+/g, ''); // keep only the date
  timestamp = timestamp.trim();
  d3.select("#compute-shares-timestamp").text(timestamp);
  
  // drop header comments
  host_table = host_table.replace(/^[#][^\r\n]*[\r\n]+/mg, '');
  host_table = d3.tsv.parse(host_table);

  var table = d3.select("#hosttable");
  var thead, tbody, tfoot, tr, td, td_status;
  var value, value2;
  var nodes_total = 0;
  var hosts = "";
  
  /* For each row */
  var nentries = 0;
  host_table.forEach(function(row0) {
    var row = [row0["project"], row0["queue"], row0["nbr_of_hosts"], row0["hosts"]];

    if (nentries == 0) {
      tr = table.append("thead").append("tr");
      tr.append("th").text("Lab Group");
      tr.append("th").text("Queue");
      tr.append("th").text("#GPU Nodes");
      tr.append("th").text("GPU Nodes");
      tbody = table.append("tbody");
    }

    tr = tbody.append("tr");
    for (key in row) td = tr.append("td").text(row[key]);
    nodes_total += parseInt(row[2]);
    hosts = hosts.concat(" ").concat(row[3]);

    nentries += 1;
  });

  hosts = hosts.replace(/[, ]+/g, " ");
  hosts = hosts.replace(/(^ | $)/g, "");
  hosts = hosts.split(" ");
  const count = new Set(hosts).size;

  tr = table.append("tfoot").append("tr");
  tr.append("td").text("Total");
  tr.append("td");
  tr.append("td").text(nodes_total + " GPU nodes");
  tr.append("td").text(count + " unique GPU nodes");

  $(document).ready(function() {
    $('#hosttable').DataTable({
      "pageLength": 50,
      "order": [[ 0, "desc" ]]
    });
  });
});
</script>

Source: [gpu_shares.tsv](/hpc/assets/data/gpu_shares.tsv) produced on <span id="compute-shares-timestamp"></span>.  These data were compiled from the current SGE configuration (`qconf -srqs shared_gpu_limits` and `qconf -shgrp <project>`).
