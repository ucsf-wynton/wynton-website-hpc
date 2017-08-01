# Cluster Specifications

## Software environment

All nodes on the cluster runs [CentOS 7.3] which is updated on a regular basis.
The job scheduler is SGE 8.1.9 ([Son of Grid Engine]) which provides [queues]({{ '/scheduler/queues.html' | relative_url }}) for both communal and lab-priority tasks.


## Hardware

Node      | Number of Cores |       CPU |      RAM | Local Scratch |
----------|----------------:|----------:|---------:|--------------:|
cc-hmid1  |              48 |  2.50 GHz |  512 GiB |       1.5 TiB |
cc-id1    |              48 |  2.50 GHz |  256 GiB |       1.5 TiB |
cc-id2    |              48 |  2.50 GHz |  256 GiB |       1.5 TiB |
cc-id3    |              48 |  2.50 GHz |  256 GiB |       1.5 TiB |
cin-hmid1 |              48 |  2.50 GHz |  512 GiB |       1.5 TiB |
cin-id1   |              48 |  2.50 GHz |  256 GiB |       1.5 TiB |
cin-id2   |              48 |  2.50 GHz |  256 GiB |       1.5 TiB |
cin-id3   |              48 |  2.50 GHz |  256 GiB |       1.5 TiB |
qb3-hmid1 |              48 |  2.50 GHz |  512 GiB |       1.5 TiB |
qb3-id1   |              48 |  2.50 GHz |  256 GiB |       1.5 TiB |
qb3-id2   |              48 |  2.50 GHz |  256 GiB |       1.5 TiB |
**Total** |         **528** |           |          |               |

All compute nodes have Intel Xeon CPU E5-2680 v3 @ 2.50GHz processors and local solid state drives (SSDs).


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

[CentOS 7.3]: https://www.centos.org/
[Son of Grid Engine]: https://arc.liv.ac.uk/trac/SGE
[Pacific Research Platform]: https://ucsdnews.ucsd.edu/pressrelease/nsf_gives_green_light_to_pacific_research_platform
