# Available queues

The cluster provides different queues each optimized for different purposes.

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

* **lab.q**:

  - Maximum runtime: 2 weeks
  - Process priority: 0 (higest)
  - Quota: Proportional to your labs share on the cluster (priority users only)
  - Purpose: Research groups who need more computational resources than the above communal queues can contribute resources to the Wynton cluster and gain priority access corresponding to the contribution
