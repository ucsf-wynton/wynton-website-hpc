# Pricing for Extra Compute

_Example specifications and pricing as of February 2021_


## Pricing for prioritized compute ("CPU")

Cluster compute nodes are purchased by Wynton in units which contain 4xCompute nodes in a single 2u chassis. Partial nodes can be purchased and contributions will be pooled towards a full system.

* CPU/node: 2 × Intel Xeon Gold 6240 2.6 GHz 18-core processors
* RAM/node: 384 GiB

**Price per 4 node unit: 23,645 USD for 4 nodes in a 2U chassis**



## Pricing for Graphics Processing Unit (GPU)

<div class="alert alert-info" role="alert">
{{ site.cluster.name }} has {{ site.data.specs.gpu_nodes }} GPU nodes with a total of {{ site.data.specs.gpus }} GPUs available to all users. Among these, {{ site.data.specs.gpu_nodes | minus: site.data.specs.communal_gpu_nodes }} GPU nodes, with a total of {{ site.data.specs.gpus | minus: site.data.specs.communal_gpus }} GPUs, were contributed by different research groups. GPU jobs are limited to 2 hours in length when run on GPUs not contributed by the running user's lab.  In contrast, <a href="{{ '/scheduler/queues.html' | relative_url }}">contributors are <em>not</em> limited to 2-hour GPU jobs on nodes they contributed</a>. There is also one GPU development node that is available to all users.
</div>

* CPU: 1 × AMD EPYC 7502P 2.5 GHz 32-core processor
* GPU: 4 × NVidia RTX 3090
* RAM: 512 GiB/node

**Price per GPU node: 17,837 USD**


## How to purchase

To purchase compute nodes or GPUs, please contact [{{ site.cluster.email_support }}](mailto:{{ site.cluster.email_support }}) to discuss the specifics (requirements, pricing, availability and current lead times).
Single GPU cards cannot be purchased, only a full GPU node. However, just like partial compute nodes can be purchased, GPU purchase requests can also be pooled towards a full system.
