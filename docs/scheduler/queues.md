# Available Queues

The cluster provides different queues ("running areas") that each is optimized for a different purpose.

* **member.q**:
  - Maximum runtime: 2 weeks
  - Process priority: 0 (higest)
  - Quota: Proportional to your labs share on the cluster (priority users only)
  - Purpose: Research groups who need more computational resources than the above communal queues can contribute resources to the Wynton cluster and gain priority access corresponding to the contribution

* **long.q**:
  - Maximum runtime: 2 weeks
  - Process priority: 19 (lowest)
  - Quota: Unlimited (all users)
  - Purpose: General needs


* **short.q**:
  - Maximum runtime: 30 minutes
  - Process priority: 10 (medium)
  - Quota: 200 (queued or active) jobs per user (all users)
  - Purpose: Low-latency needs, e.g. pipeline prototyping and quick turn-around analysis


* **ondemand.q**:
  - Maximum runtime: Per agreement
  - Process priority: 0 (higest)
  - Quota: Available upon application and approval by the [steering committee].
  - Purpose: Intended for scheduled, high-priority computing needs and / or temporary paid priority access.


## Usage

There is often _no need_ to explicitly specify what queue your job should be submitted to.  Instead, it is sufficient to [specify the resources] that your jobs need, e.g. the maximum processing time (e.g. `-l h_rt=00:10:00` for ten minutes), the maximum memory usage (e.g. `-l mem_free=1G` for 1 GiB of RAM), and the number of cores (e.g. `-pe smp 2` for two cores).  When the scheduler knows about your job's resource need, it will allocate your job to a compute node that better fits your needs and your job is likely to finish sooner.

Only in rare cases there should be a need to specify through what queue your job should run.  To do this, you can use the `-q <name>` option of `qsub`, e.g. `qsub -q long.q my_script`.


[steering committee]: http://wynton.ucsf.edu/
[specify the resources]: {{ '/scheduler/submit-jobs.html' | relative_url }}

<!--
NOTES:

To list available queues, do:

    qstat -f | grep -F "@" | sed -E 's/@.*//g' | sort -u
-->
