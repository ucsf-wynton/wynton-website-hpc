# Lab-Specific Compute node and GPU Pricing Model

_Example specifications and pricing as of February 2021_


## Compute nodes

* CPU: (2) Intel Xeon Gold 6240 2.6 GHz 18-core processors
* Memory: 384 GiB
* Quote: 23,645 USD


## GPU

<div class="alert alert-info" role="alert">
{{ site.cluster.name }} has {{ site.data.specs.gpu_nodes }} GPU nodes with a total of {{ site.data.specs.gpus }} GPUs available to all users. Among these, {{ site.data.specs.gpu_nodes | minus: site.data.specs.communal_gpu_nodes }} GPU nodes, with a total of {{ site.data.specs.gpus | minus: site.data.specs.communal_gpus }} GPUs, were contributed by different research groups. GPU jobs are limited to 2 hours in length when run on GPUs not contributed by the running user's lab.  In contrast, <a href="{{ '/scheduler/queues.html' | relative_url }}">contributors are <em>not</em> limited to 2-hour GPU jobs on nodes they contributed</a>.
There is also one GPU development node that is available to all users.
</div>

* CPU: (1) AMD EPYC 7502P 2.5 GHz 32-core processor
* GPU: (4) NVidia RTX 3090
* Memory: 512 GiB
* Quote: 17,837 USD


## Summary

* To purchase compute nodes or GPUs, please contact [{{ site.cluster.email_support }}](mailto:{{ site.cluster.email_support }}) to discuss the specifics (requirements, pricing, availability and current lead times)

* Single GPU cards cannot be purchased, only a full GPU node. However purchase requests can be pooled towards a full system.
