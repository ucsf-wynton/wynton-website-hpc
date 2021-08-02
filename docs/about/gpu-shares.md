# Contributing Member GPU Shares

Below table shows the which labs have access to dedicated Graphical Processing Unit (GPU) compute nodes.


<script src="https://d3js.org/d3.v3.min.js"><!-- ~150 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"><!-- ~80 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"><!-- 2 kB --></script>

<table id="hosttable">
</table>

<script type="text/javascript" charset="utf-8">
d3.text("{{ '/assets/data/gpu_shares.tsv' | relative_url }}", "text/csv", function(host_table) {
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
  
  /* For each row */
  var nentries = 0;
  host_table.forEach(function(row0) {
    var row = [row0["project"], row0["nbr_of_hosts"], row0["hosts"]];

    if (nentries == 0) {
      tr = table.append("thead").append("tr");
      tr.append("th").text("Lab Group");
      tr.append("th").text("Number of GPU Nodes");
      tr.append("th").text("GPU Nodes");
      tbody = table.append("tbody");
    }

    tr = tbody.append("tr");
    for (key in row) td = tr.append("td").text(row[key]);
    nodes_total += parseInt(row[1]);

    nentries += 1;
  });

  tr = table.append("tfoot").append("tr");
  tr.append("td").text("Total");
  tr.append("td").text(nodes_total + " nodes");
  tr.append("td");

  $(document).ready(function() {
    $('#hosttable').DataTable({
      "pageLength": 50,
      "order": [[ 0, "desc" ]]
    });
  });
});
</script>

Source: [gpu_shares.tsv]({{ '/assets/data/gpu_shares.tsv' | relative_url }}) produced on <span id="compute-shares-timestamp"></span>.  These data were compiled from the current SGE configuration (`qconf -srqs shared_gpu_limits` and `qconf -shgrp <project>`).

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
