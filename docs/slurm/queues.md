# Available Slurm Queues/Partitions

The cluster provides different partitions ("running areas") that each is optimized for a different purpose.

The partitions available to the Slurm schedule on Wynton are:

* **long.q**:
  - Maximum runtime: 2 weeks (336 hours)
  - Process priority: 19 (lowest)
  - Availability: all compute nodes
  - Quota: Unlimited (all users)
  - Purpose: General needs

* **member.q**:
  - Maximum runtime: 2 weeks (336 hours)
  - Process priority: 0 (highest)
  - Availability: all compute nodes except institutionally purchased nodes
  - Compute power: {{ site.data.specs.pu_total }} processing units
  - Number of slots: {{ site.data.specs.member_q_total }}
  - Quota: Proportional to [your lab's contributed share]({{ '/about/shares.html' | relative_url }}) on the cluster.  When a lab has exhausted all its available member.q slots, additional jobs scheduled by lab members will spill over to the long.q queue
  - Purpose: Research groups who need more computational resources than the above communal queues can contribute resources to the {{ site.cluster.name }} cluster and gain priority access corresponding to the contribution

_Comment_: Here "runtime" means "walltime", i.e. the runtime of a job is how long it runs according to the clock on the wall, not the amount of CPU time.


## Usage

There is often _no need_ to explicitly specify what queue your job should be submitted to.  Instead, it is sufficient to [specify the resources] that your jobs need, e.g. the maximum processing time (e.g. `--time=00:10:00` for ten minutes), the maximum memory usage (e.g. `--mem_per_cpu=1G` for 1 GiB of RAM), and the number of cores (e.g. `--ntasks=2` for two cores).  When the scheduler knows about your job's resource need, it will allocate your job to a compute node that better fits your needs and your job is likely to finish sooner.

Only in rare cases there should be a need to specify through what queue your job should run.  To do this, you can use the `--partition=<name>` option of `sbatch`, e.g. `sbatch --partition=long.q my_script`.



[steering committee]: http://wynton.ucsf.edu/
[specify the resources]: {{ '/slurm/submit-jobs.html' | relative_url }}

<!--
NOTES:

To list available partitions and their status, do:

    sinfo 
-->
