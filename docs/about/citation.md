# How to Cite

## Grant Applications

Below are a few examples on how to give details on the {{ site.cluster.name }} HPC environment in a grant application.  _Please note that the node and CPU cores counts are automatically updated on a daily basis._

### Example 1

> Wynton HPC is a distributed high-performance computing cluster with nodes
> in many different data centers on the UCSF campus.  All Wynton sites are
> connected by multiple 40 Gbps network connections.  Wynton currently
> contains {{ site.data.specs.nodes }} nodes with over
> {{ site.data.specs.physical_cores }} CPU cores.
> RAM in the nodes ranges from {{ site.data.specs.ram_min }} to
> {{ site.data.specs.ram_max }} GiB with an average RAM-to-core ratio of over 10 GiB.
> There are also {{ site.data.specs.gpu_nodes}} nodes containing a total of
> {{ site.data.specs.gpus }} GPUs.
> Storage is provided by a parallel filesystem providing 400 TB of mirrored
> home space and 500 TB of global scratch space.
> 
> Wynton is shared by many research groups at UCSF.  Load balancing on the
> cluster is achieved through SGE (originally Sun Grid Engine). The
> computing power of the cluster guaranteed to any given research group is
> directly proportional to the funds that the group contributed to the
> cluster. The balance of the computing power not used by the contributors
> is available to other registered groups (including other contributors) on
> a first-come, first-served basis.


### Example 2

> Wynton HPC is a computational research cluster shared by investigators at 
> UCSF.  The cluster is run as a co-op, with access for all and priority 
> given to those who have contributed funds or hardware.  Support is 
> also provided by UCSF Research IT.  The cluster currently consists of
> {{ site.data.specs.nodes }} nodes with {{ site.data.specs.physical_cores }} cores
> operating at {{ site.data.specs.cpu_min }}-{{ site.data.specs.cpu_max }} GHz.
> Each node has at least {{ site.data.specs.ram_min }} GiB of RAM and
> total home storage is {{ site.data.specs.home_size_total }} TiB.
