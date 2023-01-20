# Development / Prototyping

Although you should always run analyses via the job scheduler, there are times when you may need to develop parts of it interactively at the command-line prompt.  For instance, you may need to install some software, a few R packages, or run some quick tests on your new pipeline.  {{ site.cluster.name }} provides _development nodes_ dedicated for such short-term usages and that are configured similarly to the compute nodes.

<div class="alert alert-danger" role="alert" style="margin-top: 3ex" markdown="1">
**Please do not run your real-world analysis on the development nodes.**  Instead run it as a job via the scheduler - this will assert that your analysis runs as fast as possible and with all the resources it needs.  For further instruction, see the getting-started page [Submit Job to Cluster].
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
Any shell session that has been idle for more than eight hours will timeout and exit automatically.
</div>

## List of Development Nodes

<div class="non-phi" markdown="1">
 * {{ site.dev1.hostname }}
 * {{ site.dev2.hostname }}
 * {{ site.dev3.hostname }}
 * {{ site.gpudev1.hostname }}
</div>
<div class="phi" markdown="1">
The following development nodes are available to PHI users:

 * p{{ site.dev1.hostname }}
 * p{{ site.dev2.hostname }}
 * p{{ site.gpudev1.hostname }}
</div>

## Instructions

To access one of the _development node_, say, {{ site.devel.hostname }},

1. make sure you are [logged in to the cluster], and

2. type `ssh {{ site.devel.hostname }}` and press <kbd>ENTER</kbd>.


### Example

From one of the login nodes, do:

```sh
[alice@{{ site.login.name }} ~]$ ssh {{ site.devel.hostname }}
alice1@{{ site.devel.name }}:s password: XXXXXXXXXXXXXXXXXXX
[alice@{{ site.devel.name }} ~]$ 
```

<div class="alert alert-info" role="alert" style="margin-top: 3ex" markdown="1">
As from the login nodes, it is possible to submit jobs also from the development nodes.
</div>

[logged in to the cluster]: /hpc/get-started/access-cluster.html
[Submit Job to Cluster]: /hpc/get-started/hello-world-job.html

