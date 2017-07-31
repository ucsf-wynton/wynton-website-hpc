# Interactive Usage

Although you should always run analyses via the job scheduler, there are times when you may need to do it interactively at the command-line prompt.  For instance, you may need to install some software, a few R packages, or run some quick tests on your new pipeline.  Wynton provides _interactive nodes_ dedicated for such short-term usages and that are configured identically to the compute nodes.


## Instructions

To access an _interactive node_, assuming your username is `alice`,

1. make sure you are [logged in to the cluster], and

2. type `ssh alice@{{ site.interactive.hostname }}` and press ENTER.


### Example

When logging in from a login node, you should see something like:

```sh
[alice@{{ site.login.name }} ~]$ 
{local}$ ssh alice@{{ site.interactive.hostname }}
[alice@{{ site.interactive.name }} ~]$ 
```


[logged in to the cluster]: {{ '/get-started/access-cluster.html' | relative_url }}




<div class="alert alert-warning" role="alert">
<strong>Please do not run your real-world analysis on the interactive nodes.</strong>  Instead run it as a job via the scheduler - this will assert that your analysis runs as fast as possible and with all the resources it needs.  For further instruction, see the getting-started page <a href="{{ 'get-started/submit-job.html' | relative_url }}">Submit Job to Cluster</a>.
</div>
