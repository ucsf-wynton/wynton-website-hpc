# Accomplishments

* Storage: Global scratch storage on BeeGFS parallel file system

* Development: Dedicated 10 Gpbs transfer node for faster file transfers in to and out from Wynton

See also [NEWS]({{ '/about/news.html' | relative_url }}).


# Roadmap

_The below "timeline" is a rough outline on when we can expect different milestones to be accomplished - it is not meant to convey their relative priorities or the amount of effort being put into them_.

## Soon

* Storage: Migrate home directories from the NetApp server (`/netapp/home/`) to the new, faster BeeGFS parallel file system (`/wynton/home/`)

* Storage: Increase the default size of users' home directories - currently 200 GiB per user

* Development: A Graphics Processing Unit (GPUs) development node for building GPU software

* Software stacks: Support for sharing software installations between groups via environment modules (e.g. `module load CBI`)

* Expansion: Migrate QB3 users and QB3 compute nodes over to Wynton HPC


## On the horizon

* Pricing model: Detailed description on how buy into or contribute with existing hardware to Wynton, e.g. pricing models for adding extra storage and compute resources.

* Scheduler: Support interactive jobs (`qlogin`)

* Support: A User Issue Tracker

* Compute: Add communal GPU nodes - currently only available to investigators who contributed with their own GPU nodes


## Long-term objectives

* Network: Add a Globus endpoint for efficient, secure data transfers (ingress and egress)

* Compliance: Support for restricted data analysis, e.g. protected health information (PHI) and clinical data


## Planned deprecation

* Storage: When new parallel file system (`/wynton`) is fully deployed, discontinue the NetApp storage (e.g. deprecate usage of `/netapp`) as well as `/scrapp/`.


[QB3]: https://salilab.org/qb3cluster/
[BeeGFS]: https://www.beegfs.io/
[Globus]: https://www.globus.org/
