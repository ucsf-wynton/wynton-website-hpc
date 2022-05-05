# Available Queues

The cluster provides different queues ("running areas") that each is optimized for a different purpose.

* **short.q**:
  - Maximum runtime: 30 minutes
  - Process priority: 10 (medium)
  - Availability: all compute nodes
  - Quota: 100 (queued or active) jobs per user (all users)
  - Purpose: Low-latency needs, e.g. pipeline prototyping and quick turn-around analysis

* **long.q**:
  - Maximum runtime: 2 weeks (336 hours)
  - Process priority: 19 (lowest)
  - Availability: all compute nodes
  - Quota: Unlimited (all users)
  - Purpose: General needs

* **member.q**:
  - Maximum runtime: 2 weeks (336 hours)
  - Process priority: 0 (highest)
  - Availability: all compute nodes except GPU and institutionally purchased nodes
  - Compute power: {{ site.data.specs.pu_total }} processing units
  - Number of slots: {{ site.data.specs.member_q_total }}
  - Quota: Proportional to [your lab's contributed share]({{ '/about/shares.html' | relative_url }}) on the cluster.  When a lab has exhausted all its available member.q slots, additional jobs scheduled by lab members will spill over to the long.q queue
  - Purpose: Research groups who need more computational resources than the above communal queues can contribute resources to the {{ site.cluster.name }} cluster and gain priority access corresponding to the contribution

* **gpu.q**:
  - Maximum runtime on communal GPU nodes: 2 weeks (336 hours)
  - Maximum runtime on contributed GPU nodes: 2 weeks (336 hours) if you are the contributor, otherwise 2 hours
  - Process priority: 0 (highest)
  - Availability: {{ site.data.specs.gpus }} GPUs on {{ site.data.specs.gpu_nodes }} GPU nodes ({{ site.data.specs.communal_gpus }}/{{ site.data.specs.communal_gpu_nodes }} GPUs/nodes are communal and {{ site.data.specs.gpus | minus: site.data.specs.communal_gpus }}/{{ site.data.specs.gpu_nodes | minus: site.data.specs.communal_gpu_nodes }} GPUs/nodes are contributed)
  - Number of GPU slots: {{ site.data.specs.gpus }}
  - Quota: Unlimited (all users)
  - Purpose: For software that utilize Graphics Processing Units (GPUs)

* **4gpu.q**:
  - Maximum runtime on contributed "4-GPU" nodes: 2 weeks (336 hours) if you are the contributor, otherwise 2 hours
  - Process priority: 0 (highest)
  - Availability: {{ site.data.specs.msg_4gpus }} GPUs on {{ site.data.specs.msg_4gpu_nodes }} GPU nodes (all are contributed nodes)
  - Number of GPU slots: {{ site.data.specs.msg_4gpu_nodes }}
  - Quota: Unlimited (all users)
  - Purpose: For software that need to exclusively, utilize all four Graphics Processing Units (GPUs) on the node
  - Comment: Only MSG members are contributors as of May 2022

* **ondemand.q**:
  - Maximum runtime: 2 weeks (336 hours)
  - Process priority: 0 (highest)
  - Availability: Institutionally purchased nodes only
  - Quota: Available upon application and approval by the Wynton Steering Committee
  - Purpose: Intended for scheduled, high-priority computing needs and / or temporary paid priority access


_Comment_: Here "runtime" means "walltime", i.e. the runtime of a job is how long it runs according to the clock on the wall, not the amount of CPU time.


## Usage

Except for [the gpu.q and 4gpu.q queues]({{ '/scheduler/gpu.html' | relative_url }}), there is often _no need_ to explicitly specify what queue your job should be submitted to.  Instead, it is sufficient to [specify the resources] that your jobs need, e.g. the maximum processing time (e.g. `-l h_rt=00:10:00` for ten minutes), the maximum memory usage (e.g. `-l mem_free=1G` for 1 GiB of RAM), and the number of cores (e.g. `-pe smp 2` for two cores).  When the scheduler knows about your job's resource need, it will allocate your job to a compute node that better fits your needs and your job is likely to finish sooner.

Only in rare cases there should be a need to specify through what queue your job should run.  To do this, you can use the `-q <name>` option of `qsub`, e.g. `qsub -q long.q my_script`.



[specify the resources]: {{ '/scheduler/submit-jobs.html' | relative_url }}

<!--
NOTES:

To list available queues, do:

$ qstat -f | grep -F "@" | sed -E 's/@.*//g' | sort -u
4gpu.q
gpu.q
long.q
member.q
ondemand.q
short.q
test.q
-->
