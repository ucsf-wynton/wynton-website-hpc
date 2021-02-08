# Lab-Specific HPC GPU Pricing Model

<div class="alert alert-info" role="alert">
{{ site.cluster.name }} has {{ site.data.specs.gpu_nodes }} GPU nodes with a total of {{ site.data.specs.gpus }} GPUs available to all users. Among these, {{ site.data.specs.gpu_nodes | minus: site.data.specs.communal_gpu_nodes }} GPU nodes, with a total of {{ site.data.specs.gpus | minus: site.data.specs.communal_gpus }} GPUs, were contributed by different research groups. GPU jobs are limited to 2 hours in length when run on GPUs not contributed by the running user's lab.  In contrast, <a href="{{ '/scheduler/queues.html' | relative_url }}">contributors are <em>not</em> limited to 2-hour GPU jobs on nodes they contributed</a>.
There is also one GPU development node that is available to all users.
</div>

## Summary

* To purchase GPUs, please contact [{{ site.cluster.email_support }}](mailto:{{ site.cluster.email_support }}) to discuss the specifics (requirements, pricing, availability and current lead times)


