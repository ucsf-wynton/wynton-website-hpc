# Interactive Usage

Although you should always run analyses via the job scheduler, there are times when you may need to do it interactively at the command-line prompt.  For instance, you may need to install some software, a few R packages, or run some quick tests on your new pipeline.  Wynton provides _interactive nodes_ dedicated for such short-term usages and that are configured identically to the compute nodes.

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong>Please do not run your real-world analysis on the interactive nodes.</strong>  Instead run it as a job via the scheduler - this will assert that your analysis runs as fast as possible and with all the resources it needs.  For further instruction, see the getting-started page <a href="{{ 'get-started/hello-world-job.html' | relative_url }}">Submit Job to Cluster</a>.
</div>


## Instructions

To access an _interactive node_,

1. make sure you are [logged in to the cluster], and

2. type `ssh {{ site.interactive.hostname }}` and press ENTER.


### Example

From one of the login nodes, do:

```sh
[alice@{{ site.login.name }} ~]$ ssh {{ site.interactive.hostname }}
[alice@{{ site.interactive.name }} ~]$ 
```

<div class="alert alert-info" role="alert" style="margin-top: 3ex">
As from the login nodes, it is possible to submit jobs also from the interactive nodes.
</div>

[logged in to the cluster]: {{ '/get-started/access-cluster.html' | relative_url }}
