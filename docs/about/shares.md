# Contribution Shares

## Compute Shares

<script src="https://d3js.org/d3.v3.min.js"><!-- ~150 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"><!-- ~80 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"><!-- 2 kB --></script>

<table id="hosttable">
</table>

<script type="text/javascript" charset="utf-8">
d3.text("{{ '/assets/data/wynton_hpc_compute_shares.tsv' | relative_url }}", "text/csv", function(host_table) {
  // drop header comments
  host_table = host_table.replace(/^[#][^\r\n]*[\r\n]+/mg, '');
  host_table = d3.tsv.parse(host_table);

  var table = d3.select("#hosttable");
  var thead, tbody, tfoot, tr, td, td_status;
  var value, value2;
  var funits = 0, slots = 0, project = "";
  
  /* For each row */
  var nodes = 0;
  host_table.forEach(function(row) {
    /* Ignore column on /tmp size, iff it exists */
    delete row["queue_total"];
    
    if (nodes == 0) {
      tr = table.append("thead").append("tr");
      for (key in row) {
        value = key.replace(/\`/g, "");
	switch(value) {
	  case "funits":
	    value = "Functional Units (FU)";
	    break;
	  case "shares":
	    value = "Shares";
	    break;
	  case "queue_slots":
	    value = "Slots (member.q)";
	    break;
	  case "project":
	    value = "Group";
	    break;
	}
        tr.append("th").text(value);
      }
      tbody = table.append("tbody");
    }
    
    tr = tbody.append("tr");
    for (key in row) td = tr.append("td").text(row[key]);
      
    nodes += 1;
  });
  
  $(document).ready(function() {
    $('#hosttable').DataTable({
      "pageLength": 50,
      "order": [[ 2, "desc" ]]
    });
  });
});
</script>

Source: [wynton_hpc_compute_shares.tsv].


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

[wynton_hpc_compute_shares.tsv]: {{ '/assets/data/wynton_hpc_compute_shares.tsv' | relative_url }}
