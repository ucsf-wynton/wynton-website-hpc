<div class="alert alert-danger" role="alert">
<strong>This is a mockup page!</strong>
</div>

# Roadmap

## Soon

* Storage: Migrate home directories from the NetApp server (`/netapp/home/`) to the new, faster BeeGFS parallel file system (`/wynton/home/`)

* Storage: Increase the default size of user's home directory - currently 200 GiB per user

* Development: A GPU development node for building GPU software

* Software stacks: Support for sharing software installations between groups via environment modules (e.g. `module load CBI`)

* Expansion: Migrate QB3 users and QB3 compute nodes over to Wynton HPC


## On the horizon

* Pricing model: Detailed description on how buy into Wynton, e.g. pricing models for adding extra storage and compute resources

* Scheduler: Support interactive jobs (`qlogin`)

* Support: A User Issue Tracker

* Compute: Communal access to compute on Graphics Processing Units (GPUs) - currently only available to investigators who contributed with their own GPU nodes


## Planned deprecation

* Storage: When new parallel file system (`/wynton`) is fully deployed, discontinue the NetApp storage (e.g. deprecate usage of `/netapp`) as well as `/scrapp/`.


## Long-term objectives

* Network: Add a Globus endpoint for efficient, secure data transfers (ingress and egress)

* Compliance: Support for restricted data analysis, e.g. protected health information (PHI) and clinical data


[QB3]: https://salilab.org/qb3cluster/
[BeeGFS]: https://www.beegfs.io/
[Globus]: https://www.globus.org/
