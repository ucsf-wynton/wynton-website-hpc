# Available Queues

The cluster provides different queues each optimized for different purposes.

* **member.q**:

  - Maximum runtime: 2 weeks
  - Process priority: 0 (higest)
  - Quota: Proportional to your labs share on the cluster (priority users only)
  - Purpose: Research groups who need more computational resources than the above communal queues can contribute resources to the Wynton cluster and gain priority access corresponding to the contribution
  - Usage: `qsub -q member.q ...`

* **long.q**:

  - Maximum runtime: 2 weeks
  - Process priority: 19 (lowest)
  - Quota: Unlimited (all users)
  - Purpose: General needs
  - Usage: `qsub -q long.q ...`

* **short.q**:

  - Maximum runtime: 30 minutes
  - Process priority: 10 (medium)
  - Quota: 200 (queued or active) jobs per user (all users)
  - Purpose: Low-latency needs, e.g. pipeline prototyping and quick turn-around analysis
  - Usage: `qsub -q short.q ...`

* **ondemand.q**:

  - Maximum runtime: Per agreement
  - Process priority: 0 (higest)
  - Quota: Available upon application and approval by the [steering committee].
  - Purpose: Intended for scheduled, high-priority computing needs and / or temporary paid priority access.
  - Usage: `qsub -q ondemand.q ...`


[steering committee]: http://wynton.ucsf.edu/


<!--
NOTES:

To list available queues, do:

    qstat -f | grep -F "@" | sed -E 's/@.*//g' | sort -u
-->
