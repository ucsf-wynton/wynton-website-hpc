# Pricing for Extra Compute

_Example specifications and pricing as of February 2021_


## Pricing for prioritized compute ("CPU")

Cluster compute nodes are purchased by Wynton in units which contain 4 Compute Nodes in a single chassis. Partial nodes can be purchased and contributions will be pooled towards a full system.

* CPU/node: 2 × Intel Xeon Gold 6336Y 2.4 GHz 24-core processors
* RAM/node: 256 GiB

**Price per 4 compute node unit: 33,405 USD (for 4 nodes in a 2U chassis)**

Based on the above pricing, the pricing for CPU contributions is about $173 per CPU/Slot/Share.

## Pricing for Graphics Processing Unit (GPU)

<div class="alert alert-info" role="alert" markdown="1">
{{ site.cluster.name }} has {{ site.data.specs.gpu_nodes }} GPU nodes with a total of {{ site.data.specs.gpus }} GPUs available to all users. Among these, {{ site.data.specs.gpu_nodes | minus: site.data.specs.communal_gpu_nodes }} GPU nodes, with a total of {{ site.data.specs.gpus | minus: site.data.specs.communal_gpus }} GPUs, were contributed by different research groups. GPU jobs are limited to 2 hours in length when run on GPUs not contributed by the running user's lab.  In contrast, [contributors are _not_ limited to 2-hour GPU jobs on nodes they contributed](/hpc/scheduler/queues.html). There is also one GPU development node that is available to all users.
</div>

* CPU: 1 × AMD EPYC 7543P 2.8 GHz 32-core processor
* GPU: 4 × Nvidia A40
* RAM: 512 GiB/node

**Price per GPU node:  25,412 USD**


## How to purchase

To purchase compute nodes or GPUs, please contact [{{ site.cluster.email_compute }}](mailto:{{ site.cluster.email_compute }}?subject=Request%20to%20purchase%20compute) to discuss the specifics (requirements, pricing, availability and current lead times).
Single GPU cards cannot be purchased, only a full GPU node. However, just like partial compute nodes can be purchased, GPU purchase requests can also be pooled towards a full system.
