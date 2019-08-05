# Roadmap & Accomplishments

_The below "timeline" is a rough outline on when we can expect different milestones to be accomplished - the order does not reflect their relative priorities or the amount of effort spent_.


## In progress

* Expansion: Migrate QB3 users and QB3 compute nodes (~4,000 physical cores) over to Wynton HPC

* Storage: Migrate home directories from the NetApp server (`/netapp/home/`) to the new, faster BeeGFS parallel file system (`/wynton/home/`)

* Storage: Increase the default size of users' home directories - currently 200 GiB per user

* Deprecation: The NetApp storage (which includes `/netapp`, `/scrapp` and `/scrapp2`) is being deprecated in favor of new BeeGFS storage (which includes `/wynton/home` and `/wynton/scratch`).

* GPU compute: Add an additional 12 communal GPUs


## Soon

* Pricing model: Contributors to Wynton get access to a larger compute share of the cluster (beyond what is available for free).  Details on how to contribute with new hardware (amount in USD) and how to contribute with existing hardware (minimum technical requirements) will be given


## Near future

* Storage: Requirements for mounting lab-owned storage into Wynton

* Scheduler: Support interactive jobs (`qlogin`)

* Support: A User Issue Tracker


## On the horizon

* Compliance: Support for restricted data analysis

* Network: Add a Globus endpoint for efficient, secure data transfers (ingress and egress)


## Planned deprecation

* N/A


## Accomplished milestones

* Pricing model: Description on how to purchase (amount in USD) additional storage space (beyond what is available for free)

* Storage: Global scratch storage on BeeGFS parallel file system

* Development: Dedicated 10 Gbps transfer node for faster file transfers in to and out from Wynton

* Development: Additional development nodes for building software to take load off the current development node

* Migration: The UCSF Memory and Aging Center (MAC) have joined Wynton by contributing new nodes

* Migration: The UCSF Macromolecular Structure Group (MSG) compute cluster (~1,300 physical cores) is incorporated into Wynton

* GPU compute: Four communal GPU nodes with a total of 12 GPUs (from the QB3 cluster)

* Development: A dedicated Graphics Processing Unit (GPU) development node for building GPU software

* Software stacks: Support for sharing software installations between groups via environment modules (e.g. `module load CBI`)


See also [News].



[QB3]: https://salilab.org/qb3cluster/
[BeeGFS]: https://www.beegfs.io/
[Globus]: https://www.globus.org/
[News]: {{ '/about/news.html' | relative_url }}
