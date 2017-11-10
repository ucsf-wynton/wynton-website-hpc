# Cluster Specifications

## Software environment

All nodes on the cluster runs [CentOS] 7.4 which is updated on a regular basis.
The job scheduler is SGE 8.1.9 ([Son of Grid Engine]) which provides [queues]({{ '/scheduler/queues.html' | relative_url }}) for both communal and lab-priority tasks.


## Hardware

### Compute Nodes

Node      | # Physical Cores |       CPU |      RAM | Local `/scratch` | Local `/tmp` |
----------|-----------------:|----------:|---------:|-----------------:|-------------:|
cc-hmid1  |               24 |  2.50 GHz |  512 GiB |          1.5 TiB |      4.0 GiB |
cc-id1    |               24 |  2.50 GHz |  256 GiB |          1.5 TiB |      4.0 GiB |
cc-id2    |               24 |  2.50 GHz |  256 GiB |          1.5 TiB |      4.0 GiB |
cc-id3    |               24 |  2.50 GHz |  256 GiB |          1.5 TiB |      4.0 GiB |
cin-hmid1 |               24 |  2.50 GHz |  512 GiB |          1.5 TiB |      4.0 GiB |
cin-id1   |               24 |  2.50 GHz |  256 GiB |          1.5 TiB |      4.0 GiB |
cin-id2   |               24 |  2.50 GHz |  256 GiB |          1.5 TiB |      4.0 GiB |
cin-id3   |               24 |  2.50 GHz |  256 GiB |          1.5 TiB |      4.0 GiB |
qb3-hmid1 |               24 |  2.50 GHz |  512 GiB |          1.5 TiB |      4.0 GiB |
qb3-id1   |               24 |  2.50 GHz |  256 GiB |          1.5 TiB |      4.0 GiB |
qb3-id2   |               24 |  2.50 GHz |  256 GiB |          1.5 TiB |      4.0 GiB |
qb3-id3   |               24 |  2.50 GHz |  256 GiB |          1.5 TiB |      4.0 GiB |
**Total** |          **288** |           |          |                  |              |

All compute nodes have Intel Xeon CPU E5-2680 v3 @ 2.50 GHz processors and local solid state drives (SSDs).

The compute nodes can only be utilized by submitting jobs via the scheduler - it is _not_ possible to explicitly log in to compute nodes.


### Login Nodes

The [cluster can be accessed]({{ '/get-started/access-cluster.html' | relative_url }}) via SSH to one of two login nodes:

1. {{ site.login.name  }}: `{{ site.login.hostname }}`
2. {{ site.login2.name }}: `{{ site.login2.hostname }}`

The login nodes can only be accessed from within the UCSF network.


### Interactive Nodes

The cluster has interactive nodes for the purpose of validating scripts, prototyping pipelines, compiling software, and more.  Interactive nodes [can be accessed using SSH]({{ '/get-started/interactive-usage.html' | relative_url }}) and only from the login nodes.

Node                        | # Physical Cores |       CPU |      RAM | Local `/scratch` | Local `/tmp` |
----------------------------|-----------------:|----------:|---------:|-----------------:|-------------:|
{{ site.interactive.name }} |                8 |  2.66 GHz |   16 GiB |        0.125 TiB |      4.0 GiB |

The interactive nodes have Intel Xeon CPU E5430 @ 2.66 GHz processors and local solid state drives (SSDs).


## Storage

Each user may use up to 200 GiB disk space in the home directory.  Research groups can add additional storage space by either mounting their existing storage or purchase new.


## Network

The compute nodes are connected using 10 Gbps Ethernet.
The cluster connects to NSF’s [Pacific Research Platform] at a speed of 100 Gbps.


Source: `qhost`, `cat /proc/cpuinfo`, and `cat /etc/centos-release`.


<style>
table {
  margin-top: 2ex;
  margin-bottom: 2ex;
}
tr:last-child { border-top: 2px solid #000; }
</style>

[CentOS]: https://www.centos.org/
[Son of Grid Engine]: https://arc.liv.ac.uk/trac/SGE
[Pacific Research Platform]: https://ucsdnews.ucsd.edu/pressrelease/nsf_gives_green_light_to_pacific_research_platform
