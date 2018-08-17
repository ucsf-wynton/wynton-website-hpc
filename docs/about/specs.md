# Cluster Specifications

## Software environment

All nodes on the cluster runs [CentOS] 7 which is updated on a regular basis.
The job scheduler is SGE 8.1.9 ([Son of Grid Engine]) which provides [queues]({{ '/scheduler/queues.html' | relative_url }}) for both communal and lab-priority tasks.


## Hardware

### Compute Nodes

<dl id="hosttable-summary" class="dl-horizontal">
  <dt>Compute nodes</dt><dd id="hosttable-summary-nodes">{{ site.specs.nodes }}</dd>
  <dt>Physical cores</dt><dd id="hosttable-summary-cores">{{ site.specs.physical_cores }}</dd>
  <dt>CPU</dt><dd id="hosttable-summary-cpu">{{ site.specs.cpu_range }}</dd>
  <dt>RAM</dt><dd id="hosttable-summary-ram">{{ site.specs.ram_range }}</dd>
  <dt>Local <code>/scratch</code></dt><dd id="hosttable-summary-scratch">{{ site.specs.local_scratch_size_range }}</dd>
  <dt>Local <code>/tmp</code></dt><dd id="hosttable-summary-tmp">{{ site.specs.local_tmp_size }}</dd>
</dl>

Most compute nodes have Intel processors, while others have AMD processes.  Each compute node has a local drive, which is either a hard disk drive (HDD), a solid state drive (SSD), or even a Non-Volatile Memory Express (NVMe) drive.
For additional details on the compute nodes, see the <a href="#details">Details</a> section below.

The compute nodes can only be utilized by [submitting jobs via the scheduler]({{ '/scheduler/submit-jobs.html' | relative_url }}) - it is _not_ possible to explicitly log in to compute nodes.


### Login Nodes

The [cluster can be accessed]({{ '/get-started/access-cluster.html' | relative_url }}) via SSH to one of two login nodes:

1. {{ site.login1.name }}: `{{ site.login1.hostname }}`
2. {{ site.login2.name }}: `{{ site.login2.hostname }}`


### Data Transfer Nodes

For transfering large data files, it is recommended to use the dedicate data transfer node:

1. {{ site.transfer.name }}: `{{ site.transfer.hostname }}`

which has a 10 Gbs connection - providing a file transfer speed of up to (theoretical) 1.25 GB/s = 4.5 TB/h.  As the login nodes, the transfer node can be accessed via SSH.

_Comment_: You can also transfer data via the login nodes, but since those only have 1 Gbs connections, you will see much lower transfer rates.


### Development Nodes

The cluster has development nodes for the purpose of validating scripts, prototyping pipelines, compiling software, and more.  Development nodes [can be accessed from the login nodes]({{ '/get-started/development-prototyping.html' | relative_url }}).

Node                        | # Physical Cores |       CPU |      RAM | Local `/scratch` |
----------------------------|-----------------:|----------:|---------:|-----------------:|
{{ site.devel.name }} |                8 |  2.66 GHz |   16 GiB |        0.125 TiB |

The development nodes have Intel Xeon CPU E5430 @ 2.66 GHz processors and local solid state drives (SSDs).


## Scratch Storage

The Wynton cluster provides two types of scratch storage:

* Local `/scratch/` - <span id="hosttable-summary-scratch2"></span> storage unique to each compute node (can only be accessed from the specific compute node).

* [BETA] Global `/wynton/scratch/` - approx. 200 TiB storage ([BeeGFS](https://www.beegfs.io/content/)) accessible from everywhere.

There are no per-user quotas in these scratch spaces.  Files left untouched for two weeks will be automatically deleted.

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong>
The global scratch storage is available for <em>beta testing</em> as of 2018-07-25.  During the test phase, there is a risk that it will be taken offline in order to optimize it further before going into full-production mode.</strong>
</div>


## User and Lab Storage

Each user may use up to 200 GiB disk space in the home directory.  Research groups can add additional storage space by either mounting their existing storage or purchase new.


## Network

The compute nodes are connected using 10 Gbps Ethernet.
The cluster connects to NSF’s [Pacific Research Platform] at a speed of 100 Gbps.


## Details

### All Compute Nodes

<script src="https://d3js.org/d3.v3.min.js"><!-- ~150 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"><!-- ~80 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"><!-- 2 kB --></script>

<table id="hosttable">
</table>

<script type="text/javascript" charset="utf-8">
d3.tsv("{{ '/assets/data/host_table.tsv' | relative_url }}", function(error, data) {
  if (error) throw error;

  var table = d3.select("#hosttable");
  var thead, tbody, tfoot, tr;
  var value;
  var cores = 0, coreMin = 1e9, coreMax = -1e9;
  var cpuMin = 1e9, cpuMax = -1e9;
  var ramMin = 1e9, ramMax = -1e9;
  var scratchMin = 1e9, scratchMax = -1e9;

  /* For each row */
  var count = 0;
  data.forEach(function(row) {
    /* Ignore column on /tmp size, iff it exists */
    delete row["Local `/tmp`"];
  
    if (count == 0) {
      tr = table.append("thead").append("tr");
      for (key in row) {
        value = key.replace(/\`/g, "");
	    tr.append("th").text(value);
	  }
      tbody = table.append("tbody");
	}
    tr = tbody.append("tr");
    for (key in row) { tr.append("td").text(row[key]); }
	
	/* Cores */
	value = parseInt(row["# Physical Cores"]);
	cores += value;
	if (value <= coreMin) coreMin = value;
	if (value >= coreMax) coreMax = value;

	/* CPU */
	value = parseFloat(row["CPU"].match(/[\d.]+/));
	if (value <= cpuMin) cpuMin = value;
	if (value >= cpuMax) cpuMax = value;

	/* RAM */
	value = parseFloat(row["RAM"].match(/[\d.]+/));
	if (value <= ramMin) ramMin = value;
	if (value >= ramMax) ramMax = value;

	/* Scratch */
	value = parseFloat(row["Local `/scratch`"].match(/[\d.]+/));
	if (value <= scratchMin) scratchMin = value;
	if (value >= scratchMax) scratchMax = value;

    count += 1;	
  });

  var addFooter = false;
  if (addFooter) tr = table.append("tfoot").append("tr");
  value = count + " nodes";
  if (addFooter) tr.append("td").text(value);
  d3.select("#hosttable-summary-nodes").text(value);

  value = cores + " cores (" + coreMin + "-" + coreMax + " per node)";
  if (addFooter) tr.append("td").text(value);
  d3.select("#hosttable-summary-cores").text(value);

  value = cpuMin + "-" + cpuMax + " GHz";
  if (addFooter) tr.append("td").text(value);
  d3.select("#hosttable-summary-cpu").text(value);

  value = ramMin + "-" + ramMax + " GiB";
  if (addFooter) tr.append("td").text(value);
  d3.select("#hosttable-summary-ram").text(value);

  value = scratchMin + "-" + scratchMax + " TiB";
  if (addFooter) tr.append("td").text(value);
  d3.select("#hosttable-summary-scratch").text(value);
  d3.select("#hosttable-summary-scratch2").text(value);

  $(document).ready(function() {
    $('#hosttable').DataTable({
      "pageLength": 25
	});
  });
});
</script>

Source: [host_table.tsv] (produced from `qhost`, `cat /proc/cpuinfo`, and `cat /etc/centos-release`).


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

[CentOS]: https://www.centos.org/
[Son of Grid Engine]: https://arc.liv.ac.uk/trac/SGE
[Pacific Research Platform]: https://ucsdnews.ucsd.edu/pressrelease/nsf_gives_green_light_to_pacific_research_platform
[host_table.tsv]: {{ '/assets/data/host_table.tsv' | relative_url }}
