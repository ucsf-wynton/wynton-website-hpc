# Cluster Specifications

## Overview

<dl id="hosttable-summary" class="dl-horizontal">
  <dt>Compute nodes</dt><dd id="hosttable-summary-nodes">{{ site.data.specs.nodes }}</dd>
  <dt>Physical cores</dt><dd id="hosttable-summary-cores">{{ site.data.specs.physical_cores }}</dd>
  <dt>GPUs</dt><dd>{{ site.data.specs.gpus }} GPUs on {{ site.data.specs.gpu_nodes }} GPU nodes ({{ site.data.specs.communal_gpus }}/{{ site.data.specs.communal_gpu_nodes }} GPUs/nodes are communal and {{ site.data.specs.gpus | minus: site.data.specs.communal_gpus }}/{{ site.data.specs.gpu_nodes | minus: site.data.specs.communal_gpu_nodes }} GPUs/nodes are prioritized for GPU contributors)</dd>
  <dt>RAM</dt><dd id="hosttable-summary-ram">{{ site.data.specs.ram_min }}-{{ site.data.specs.ram_max }} GiB/node</dd>
  <dt>Local scratch</dt><dd id="hosttable-summary-local-scratch">{{ site.data.specs.local_scratch_size_min }}-{{ site.data.specs.local_scratch_size_max }} TiB/node</dd>
  <dt>Global scratch</dt><dd id="hosttable-summary-global-scratch">{{ site.data.specs.global_scratch_size_total }} TiB</dd>
  <dt>User home storage</dt><dd>500 GiB/user ({{ site.data.specs.home_size_total }} TiB in total)</dd>
  <dt>Group storage</dt><dd>{{ site.data.specs.group_size_total | divided_by: 1000.0 }} PB</dd>
  <dt>Number of accounts</dt><dd>{{ site.data.users.nbr_of_accounts }} of which {{ site.data.users.nbr_of_phi_accounts }} are approved for PHI</dd>
  <dt>Number of projects</dt><dd>{{ site.data.users.nbr_of_projects }}</dd>
</dl>


## Summary of Compute Environment

| Feature     | Login Nodes | Transfer Nodes          | Development Nodes | Compute Nodes |
| ---- | ---------- | ----------------------- | ------------ | ---- |
| Hostname | `log[1-2].wynton.ucsf.edu`, `plog1.wynton.ucsf.edu` | `dt[1-2].wynton.ucsf.edu`, `pdt[1-2].wynton.ucsf.edu` | `dev[1-3]`, `gpudev1`, `pdev[1-2]`, `pgpudev1` | … |
| Accessible via SSH from outside of cluster | ✓ (2FA if outside of UCSF) | ✓ (2FA if outside of UCSF) | no                                                          | no |
| Accessible via SSH from within cluster | ✓ | ✓ | ✓ | no |
| Outbound access | Within UCSF only: SSH and SFTP | HTTP/HTTPS, FTP/FTPS, SSH, SFTP, Globus | Via proxy: FTP, HTTP/HTTPS, GIT+SSH(\*) | no |
| Network speed | 1 Gbps | 10 Gbps | 1 Gbps | 1,10,40 Gbps |
| Core software | Minimal | Minimal | Same as compute nodes + compilers and source-code packages | CentOS and EPEL  packages                   |
| modules (software stacks) | no | no | ✓ | ✓ |
| Global file system | ✓ | ✓ | ✓ | ✓ |
| Job submission | ✓ | no | ✓ | ✓ |
| Purpose | Submit and query jobs. SSH to development nodes. File management. | Fast in- & outbound file transfers. File management. | Compile and install software. Prototype and test job scripts. Submit and query jobs. Version control (clone, pull, push). File management. | Running short and long-running job scripts. |                                                     

(\*) GIT+SSH access on development nodes is restricted to git.bioconductor.org, bitbucket.org, gitea.com, github.com / gist.github.com, gitlab.com, cci.lbl.gov, and git.ucsf.edu.

All nodes on the cluster runs [CentOS] 7 which is updated on a regular basis.
The job scheduler is SGE 8.1.9 ([Son of Grid Engine]) which provides [queues](/hpc/scheduler/queues.html) for both communal and lab-priority tasks.



## Details

### Login Nodes

The [cluster can be accessed](/hpc/get-started/access-cluster.html) via SSH to one of the login nodes:

1. `{{ site.login1.hostname }}`
2. `{{ site.login2.hostname }}`
1. `p{{ site.login1.hostname }}` (for PHI users)


### Data Transfer Nodes

For transferring large data files, it is recommended to use one of the dedicate data transfer nodes:

1. `{{ site.transfer1.hostname }}`
2. `{{ site.transfer2.hostname }}`
1. `p{{ site.transfer1.hostname }}` (for PHI users)
2. `p{{ site.transfer2.hostname }}` (for PHI users)

which have a 10 Gbps connection - providing a file transfer speed of up to (theoretical) 1.25 GB/s = 4.5 TB/h.  As for the login nodes, the transfer nodes can be accessed via SSH.

_Comment_: You can also transfer data via the login nodes, but since those only have 1 Gbps connections, you will see much lower transfer rates.


### Development Nodes

The cluster has development nodes for the purpose of validating scripts, prototyping pipelines, compiling software, and more.  Development nodes [can be accessed from the login nodes](/hpc/get-started/development-prototyping.html).

Node                               | Physical Cores |      RAM | Local `/scratch` | CPU x86-64 level |                          CPU  |                GPU |
-----------------------------------|---------------:|---------:|-----------------:|-----------------:|------------------------------:|-------------------:|
`{{ site.dev1.hostname }}`     |             72 |  384 GiB |         0.93 TiB | x86-64-v4        | Intel Gold 6240 2.60GHz       |                    |
`{{ site.dev2.hostname }}`     |             48 |  512 GiB |         0.73 TiB | x86-64-v3        | Intel Xeon E5-2680 v3 2.50GHz |                    |
`{{ site.dev3.hostname }}`     |             48 |  256 GiB |         0.73 TiB | x86-64-v3        | Intel Xeon E5-2680 v3 2.50GHz |                    |
`{{ site.gpudev1.hostname }}`  |             32 |  128 GiB |         0.82 TiB | x86-64-v3        | Intel Xeon E5-2640 v3 2.60GHz | NVIDIA Tesla K80   |
`p{{ site.dev1.hostname }}` (for PHI users)    |              ?  |    ? GiB |              TiB | x86-64-v?        | Intel ? |                    |
`p{{ site.dev2.hostname }}` (for PHI users)    |              ?  |    ? GiB |              TiB | x86-64-v?        | Intel ? |                    |
`p{{ site.gpudev1.hostname }}` (for PHI users) |             ?  |    ? GiB |               TiB | x86-64-v?        | Intel ? | ?   |

_Comment:_
Please use the GPU development node only if you need to build or prototype GPU software.
The CPU x86-64 level is the [x86-64 microarchitecture levels] supported by the nodes CPU.
<!--
Source: `nproc --all`, `free -ht`, `df -B /scratch`, `lscpu`, and `lspci | grep 3D`
-->


### Compute Nodes

The majority of the compute nodes have Intel processors, while a few have AMD processes.  Each compute node has a local `/scratch` drive (see above for size), which is either a hard disk drive (HDD), a solid state drive (SSD), or even a Non-Volatile Memory Express (NVMe) drive. Each node has a tiny `/tmp` drive ({{ site.data.specs.local_tmp_size_min }}-{{ site.data.specs.local_tmp_size_max }} GiB).

The compute nodes can only be utilized by [submitting jobs via the scheduler](/hpc/scheduler/submit-jobs.html) - it is _not_ possible to explicitly log in to compute nodes.


## File System

### Scratch Storage

The {{ site.cluster.name }} cluster provides two types of scratch storage:

 * Local `/scratch/` - <span id="hosttable-summary-local-scratch2">{{ site.data.specs.local_scratch_size_min }}-{{ site.data.specs.local_scratch_size_max }} TiB/node</span> storage unique to each compute node (can only be accessed from the specific compute node).
 * Global `/wynton/scratch/` and `/wynton/protected/scratch/` (for PHI users) - {{ site.data.specs.global_scratch_size_total }} TiB storage ([BeeGFS](https://www.beegfs.io/content/)) accessible from everywhere.

There are no per-user quotas in these scratch spaces.  **Files not added or modified during the last two weeks will be automatically deleted** on a nightly basis.  Note, files with old timestamps that were "added" to the scratch place during this period will _not_ be deleted, which covers the use case where files with old timestamps are extracted from a tar.gz file.  (Details: `tmpwatch --ctime --dirmtime --all --force` is used for the cleanup.)


### User and Lab Storage

 * `/wynton/home/` and `/wynton/protected/home/` (for PHI users): {{ site.data.specs.home_size_total }} TiB storage space
 * `/wynton/group/`, `/wynton/protected/group/` (for PHI users), and `/wynton/protected/projects/` (for PHI users): {{ site.data.specs.group_size_total }} TB (= {{ site.data.specs.group_size_total | divided_by: 1000.0 }} PB) storage space

Each user may use up to 500 GiB disk space in the home directory.  It is _not_ possible to expand user's home directory.  Research groups can add additional storage space under `/wynton/group/`, `/wynton/protected/group/`, and `/wynton/protected/projects/` by either mounting their existing storage or [purchase new](/hpc/about/pricing-storage.html).

<div class="alert alert-info" role="alert" style="margin-top: 3ex; margin-bottom: 3ex;" markdown="1">
While waiting to receive purchased storage, users may use the global scratch space, which is "unlimited" in size with the important limitation that files older than two weeks will be deleted automatically.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex;" markdown="1">
Importantly, note that **the {{ site.cluster.name }} storage is not backed up**.  Users and labs are responsible to back up their own data outside of {{ site.cluster.name }}.
</div>


## Network

The majority of the compute nodes are connected to the local network with 1 Gbps and 10 Gbps network cards while a few got 40 Gbps cards.

The cluster itself connects to NSF's [Pacific Research Platform] at a speed of 100 Gbps - providing a file transfer speed of up to (theoretical) 12.5 GB/s = 45 TB/h.


<!--

## Details

### All Compute Nodes

<script src="https://d3js.org/d3.v3.min.js"/>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"/>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"/>

<table id="hosttable" style="visibility: hidden">
</table>


<script type="text/javascript" charset="utf-8">
d3.text("/hpc/assets/data/host_table.tsv", "text/csv", function(host_table) {
  // extract date from header comments
  var timestamp = host_table.match(/^[#] Created on: [^\r\n]*[\r\n]+/mg, '')[0];
  timestamp = timestamp.replace(/^[#] Created on: /g, '');
  timestamp = timestamp.replace(/ [^ ]+/g, ''); // keep only the date
  timestamp = timestamp.trim();
  d3.select("#hosttable-timestamp").text(timestamp);

  // drop header comments
  host_table = host_table.replace(/^[#][^\r\n]*[\r\n]+/mg, '');
  host_table = d3.tsv.parse(host_table);

  d3.text("https://raw.githubusercontent.com/UCSF-HPC/wynton-slash2/master/status/qstat_nodes_in_state_au.tsv", "text/csv", function(host_status) {
    
    // drop header comments
    host_status = host_status.replace(/^[#][^\r\n]*[\r\n]+/mg, '');
    host_status = d3.tsv.parse(host_status);

    var table = d3.select("#hosttable");
    var thead, tbody, tfoot, tr, td, td_status;
    var value, value2, has_issue;
    var cores = 0, coreMin = 1e9, coreMax = -1e9;
    var ram = 0, ramMin = 1e9, ramMax = -1e9;
    var scratch = 0, scratchMin = 1e9, scratchMax = -1e9;
    var nodes_with_issue = 0, cores_with_issue = 0, ram_with_issue = 0;
  
    /* For each row */
    var nodes = 0;
    host_table.forEach(function(row) {
      /* Ignore column on /tmp size, iff it exists */
      delete row["Local `/tmp`"];

      if (nodes == 0) {
        tr = table.append("thead").append("tr");
        tr.append("th").text("Status");
        for (key in row) {
          value = key.replace(/\`/g, "");
          tr.append("th").text(value);
        }
        tbody = table.append("tbody");
      }
      tr = tbody.append("tr");

      td_status = tr.append("td");
      has_issue = (host_status.filter(function(d) { return d.queuename == row["Node"] }).length > 0);
      if (has_issue) {
        td_status.text("⚠");  // "⚠" or "✖"
        nodes_with_issue += 1;
      }

      for (key in row) td = tr.append("td").text(row[key]);
      
      /* Cores */
      value = parseInt(row["Physical Cores"]);
      cores += value;
      if (value <= coreMin) coreMin = value;
      if (value >= coreMax) coreMax = value;
      if (has_issue) cores_with_issue += value;

      /* RAM */
      value = parseFloat(row["RAM"].match(/[\d.]+/));
      ram += value;
      if (value <= ramMin) ramMin = value;
      if (value >= ramMax) ramMax = value;
      if (has_issue) ram_with_issue += value;

      /* Scratch */
      value = parseFloat(row["Local `/scratch`"].match(/[\d.]+/));
      scratch += value;
      if (value <= scratchMin) scratchMin = value;
      if (value >= scratchMax) scratchMax = value;
      
      nodes += 1;
    });
  
    var addFooter = false;
    if (addFooter) tr = table.append("tfoot").append("tr");
    value = nodes + " nodes";
    if (addFooter) tr.append("td").text(value);
    d3.select("#hosttable-summary-nodes").text(value);
  
    value = cores + " cores (" + coreMin + "-" + coreMax + " cores/node, avg. " + (cores/nodes).toFixed(1) + " cores/node)";
    if (addFooter) tr.append("td").text(value);
    d3.select("#hosttable-summary-cores").text(value);
  
    value = ramMin + "-" + ramMax + " GiB/node (" + (ram/1024).toFixed(1) + " TiB in total, avg. " + (ram/nodes).toFixed(1) + " GiB/node or " + (ram/cores).toFixed(1) + " GiB/core)";
    if (addFooter) tr.append("td").text(value);
    d3.select("#hosttable-summary-ram").text(value);
  
    value = scratchMin + "-" + scratchMax + " TiB/node";
    if (addFooter) tr.append("td").text(value);
    d3.select("#hosttable-summary-local-scratch2").text(value);
    value += " (avg. " + (scratch/nodes).toFixed(2) + " TiB/node or " + (scratch/cores).toFixed(3) + " TiB/core)";
    d3.select("#hosttable-summary-local-scratch").text(value);

/*
    value = "{{ site.data.specs.global_scratch_size }}";
    var global_scratch = parseFloat(value.split(" ")[0]);
    value += " (corresponding to " + (global_scratch/nodes).toFixed(2) + " TiB/node or " + (global_scratch/cores).toFixed(3) + " TiB/core)";
    d3.select("#hosttable-summary-global-scratch").text(value);
*/

    $(document).ready(function() {
      $('#hosttable').DataTable({
        "pageLength": 25
/*        "order": [[ 1, "asc" ]]  */
      });
    });
  });
});
</script>

Source: [host_table.tsv] produced on <span id="hosttable-timestamp"></span> using [wyntonquery] and [qstat_nodes_in_state_au.tsv](https://github.com/UCSF-HPC/wynton-slash2/blob/master/status/qstat_nodes_in_state_au.tsv).

-->

[CentOS]: https://www.centos.org/
[Son of Grid Engine]: https://web.archive.org/web/https://arc.liv.ac.uk/trac/SGE
[Pacific Research Platform]: https://ucsdnews.ucsd.edu/pressrelease/nsf_gives_green_light_to_pacific_research_platform
[x86-64 microarchitecture levels]: https://www.wikipedia.org/wiki/X86-64#Microarchitecture_levels
[wyntonquery]: https://ucsf-wynton.github.io/wyntonquery/
[host_table.tsv]: /hpc/assets/data/host_table.tsv
