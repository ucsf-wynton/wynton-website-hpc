# GPU Compute Nodes

Several of {{ site.cluster.name}} compute nodes have Graphics Processing Units (GPUs):

<dl id="hosttable-summary" class="dl-horizontal">
  <dt>GPU nodes</dt><dd>{{ site.data.specs.gpu_nodes }} GPU compute nodes ({{ site.data.specs.communal_gpu_nodes }} communal and {{ site.data.specs.gpu_nodes | minus: site.data.specs.communal_gpu_nodes }} contributed nodes)</dd>
  <dt>GPUs</dt><dd>{{ site.data.specs.gpus }} GPUs ({{ site.data.specs.communal_gpus }} communal and {{ site.data.specs.gpus | minus: site.data.specs.communal_gpus }} contributed GPUs)</dd>
</dl>

The tables below contain the list of the {{ site.cluster.nickname}} GPU compute nodes and whether the node is contributed by a lab or a communal node contributed by the institution.  Members of groups with contributed GPUs have [extra privileges](/hpc/scheduler/queues.html) on the job scheduler for jobs running on their GPU nodes.  If you are a lab interested in contributing a GPU node, please see the [Pricing for Extra Compute](/hpc/about/pricing-compute.html) page.


<script src="https://d3js.org/d3.v3.min.js"><!-- ~150 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"><!-- ~80 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"><!-- 2 kB --></script>

<table id="hosttable">
</table>

<!-- markdownlint-disable-file MD011 MD052 -->
<script type="text/javascript" charset="utf-8">
d3.text("/hpc/assets/data/gpu_nodes.tsv", "text/csv", function(host_table) {
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
  var gpus;
  var gpus_total = 0;
  var communal_nodes_total = 0;
  var communal_gpus_total = 0;
  
  /* For each row */
  var nentries = 0;
  host_table.forEach(function(row0) {
    var nvme = row0["NVME /scratch"];
    nvme = nvme.replace("true", "✓");
    nvme = nvme.replace("false", "no");
    var contributor = row0["Contributor"];
    contributor = contributor.replace("communal", "(communal)");
    var row = [row0["Node"], row0["GPU"], row0["GPU RAM"], row0["#GPUs"], row0["RAM"], contributor, nvme];

    if (nentries == 0) {
      tr = table.append("thead").append("tr");
      tr.append("th").text("Node");
      tr.append("th").text("GPU");
      tr.append("th").text("GPU RAM");
      tr.append("th").text("#GPUs");
      tr.append("th").text("RAM");
      tr.append("th").text("Ownership");
      tr.append("th").text("NVME /scratch");
      tbody = table.append("tbody");
    }

    tr = tbody.append("tr");
    for (key in row) td = tr.append("td").text(row[key]);
    gpus = parseInt(row[3]);
    gpus_total += gpus;
    
    if (row[5] == "(communal)") {
      communal_nodes_total += 1;
      communal_gpus_total += gpus;
    }

    nentries += 1;
  });

  tr = table.append("tfoot").append("tr");
  tr.append("td").text("Total");
  tr.append("td");
  tr.append("td");
  tr.append("td").text(gpus_total + " GPUs");
  tr.append("td");
  tr.append("td").text(communal_nodes_total + " communal nodes (" + communal_gpus_total + " GPUs)");
  tr.append("td");

  $(document).ready(function() {
    $('#hosttable').DataTable({
      "pageLength": 50,
      "order": [[ 0, "desc" ]]
    });
  });
});
</script>

Source: [gpu_nodes.tsv](/hpc/assets/data/gpu_nodes.tsv) produced on <span id="compute-shares-timestamp"></span>.  These data are manually updated.
