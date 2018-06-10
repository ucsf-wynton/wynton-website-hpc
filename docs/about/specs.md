# Cluster Specifications

## Software environment

All nodes on the cluster runs [CentOS] 7 which is updated on a regular basis.
The job scheduler is SGE 8.1.9 ([Son of Grid Engine]) which provides [queues]({{ '/scheduler/queues.html' | relative_url }}) for both communal and lab-priority tasks.


## Hardware

### Compute Nodes

<dl id="hosttable-summary" class="dl-horizontal">
  <dt>Compute nodes</dt><dd id="hosttable-summary-nodes"></dd>
  <dt>Physical cores</dt><dd id="hosttable-summary-cores"></dd>
  <dt>CPU</dt><dd id="hosttable-summary-cpu"></dd>
  <dt>RAM</dt><dd id="hosttable-summary-ram"></dd>
  <dt>Local <code>/scratch</code></dt><dd id="hosttable-summary-scratch"></dd>
  <dt>Local <code>/tmp</code></dt><dd id="hosttable-summary-tmp"></dd>
</dl>
  
All compute nodes have Intel processors and local solid state drives (SSDs).  For full details, see the <a href="#details">Details</a> section below.

The compute nodes can only be utilized by submitting jobs via the scheduler - it is _not_ possible to explicitly log in to compute nodes.


### Login Nodes

The [cluster can be accessed]({{ '/get-started/access-cluster.html' | relative_url }}) via SSH to one of two login nodes:

1. {{ site.login.name  }}: `{{ site.login.hostname }}`
2. {{ site.login2.name }}: `{{ site.login2.hostname }}`


### Development Nodes

The cluster has development nodes for the purpose of validating scripts, prototyping pipelines, compiling software, and more.  Development nodes [can be accessed from the login nodes]({{ '/get-started/development-prototyping.html' | relative_url }}).

Node                        | # Physical Cores |       CPU |      RAM | Local `/scratch` | Local `/tmp` |
----------------------------|-----------------:|----------:|---------:|-----------------:|-------------:|
{{ site.devel.name }} |                8 |  2.66 GHz |   16 GiB |        0.125 TiB |      4.0 GiB |

The development nodes have Intel Xeon CPU E5430 @ 2.66 GHz processors and local solid state drives (SSDs).


## Storage

Each user may use up to 200 GiB disk space in the home directory.  Research groups can add additional storage space by either mounting their existing storage or purchase new.


## Network

The compute nodes are connected using 10 Gbps Ethernet.
The cluster connects to NSF’s [Pacific Research Platform] at a speed of 100 Gbps.


## Details

### All Compute Nodes

<script src="https://d3js.org/d3.v3.min.js"></script> <!-- ~150 kB -->

<table id="hosttable">
</table>

<script type="text/javascript" charset="utf-8">
d3.tsv("/assets/data/host_table.tsv", function(error, data) {
  if (error) throw error;

  var container = d3.select("#hosttable");
  var tr;
  var value;
  var cores = 0, coreMin = 1e9, coreMax = -1e9;
  var cpuMin = 1e9, cpuMax = -1e9;
  var ramMin = 1e9, ramMax = -1e9;
  var scratchMin = 1e9, scratchMax = -1e9;
  var tmpMin = 1e9, tmpMax = -1e9;

  /* For each row */
  var count = 0;
  data.forEach(function(row) {
    if (count == 0) {
      tr = container.append("tr");
      for (key in row) { tr.append("th").text(key); }
	}
    tr = container.append("tr");
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

	/* Tmp */
	value = parseFloat(row["Local `/tmp`"].match(/[\d.]+/));
	if (value <= tmpMin) tmpMin = value;
	if (value >= tmpMax) tmpMax = value;

    count += 1;	
  });

  tr = container.append("tr");
  value = count + " nodes";
  tr.append("td").text(value);
  d3.select("#hosttable-summary-nodes").text(value);

  value = coreMin + "-" + coreMax + " cores (total " + cores + ")";
  tr.append("td").text(value);
  d3.select("#hosttable-summary-cores").text(value);

  value = cpuMin + "-" + cpuMax + " GHz";
  tr.append("td").text(value);
  d3.select("#hosttable-summary-cpu").text(value);

  value = ramMin + "-" + ramMax + " GiB";
  tr.append("td").text(value);
  d3.select("#hosttable-summary-ram").text(value);

  value = scratchMin + "-" + scratchMax + " TiB";
  tr.append("td").text(value);
  d3.select("#hosttable-summary-scratch").text(value);

  if (tmpMin == tmpMax) {
    value = tmpMin + " GiB";
  } else {
    value = tmpMin + "-" + tmpMax + " GiB";
  }
  tr.append("td").text(value);
  d3.select("#hosttable-summary-tmp").text(value);
});
</script>

Source: [host_table.tsv] (produced from `qhost`, `cat /proc/cpuinfo`, and `cat /etc/centos-release`).


<style>
table {
  margin-top: 2ex;
  margin-bottom: 2ex;
}
tr:last-child { border-top: 2px solid #000; font-weight: bold; }
</style>

[CentOS]: https://www.centos.org/
[Son of Grid Engine]: https://arc.liv.ac.uk/trac/SGE
[Pacific Research Platform]: https://ucsdnews.ucsd.edu/pressrelease/nsf_gives_green_light_to_pacific_research_platform
[host_table.tsv]: /assets/data/host_table.tsv
