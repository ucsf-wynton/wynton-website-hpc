# Roadmap & Accomplishments

_The below "timeline" is a rough outline on when we can expect different milestones to be accomplished - the order does not reflect their relative priorities or the amount of effort spent_.

## Near future

* New job scheduler: Upgrade from SGE to Altair's AGE to improve scheduling performance, job observability, and GPU resource use experience. AGE also has paid support, which will allow us to make the best use of AGE, unlike the lack of support with SGE.

* Hardware refresh: Complete a thorough assessment of Wynton hardware assets, replace outdated hardware where possible, and develop a sustainable plan for future hardware replacement.

* Architecture and Data Assessment: Conduct a thorough review of the use cases, projects, and types of data stored within Wynton and review the architecture to ensure compliance and identify areas for improvement.


## Accomplished milestones

* Slurm pilot: Slurm was evaluated as a job scheduler instead of SGE.  The result of the test phase was that we cannot migrate to Slurm, because Slurm does not support our co-op model. 

* Migration: The UCSF Memory and Aging Center (MAC) have joined {{ site.cluster.name }} by contributing new nodes

* Migration: The UCSF Macromolecular Structure Group (MSG) compute cluster (~1,300 physical cores) is incorporated into {{ site.cluster.name }}

* Development: Dedicated 10 Gbps transfer node for faster file transfers in to and out from {{ site.cluster.name }} (2018-08-02)

* Storage: Global scratch storage on BeeGFS parallel file system (2018-08-20)

* Pricing model: Description on how to purchase (amount in USD) additional storage space beyond what is available for free (2019-01-15)

* Development: Additional development nodes for building software to take load off the current development node (2019-01-31)

* GPU compute: Four communal GPU nodes with a total of 12 GPUs from the QB3 cluster (2019-04-12)

* Development: A dedicated Graphics Processing Unit (GPU) development node for building GPU software (2019-04-15)

* Software stacks: Support for sharing software installations between groups via environment modules, e.g. `module load CBI` (2019-06-13)

* Storage: The QB3-legacy NetApp scratch storage `/scrapp` and `/scrapp2` has been removed in favor of the BeeGFS-based scratch storage `/wynton/scratch` (2019-08-15)

* Scheduler: ~~Support interactive jobs (`qlogin`)~~. The {{ site.cluster.name }} Team decided against this because it increases the risk of having stale jobs occupying the scheduler and overall underutilizing the HPC environment (Fall 2019)

* Network: A second data transfer node for faster file transfers in to and out from {{ site.cluster.name }} (2019-09-12)

* GPU compute: An additional 12 communal GPUs on three GPU nodes (2019-09-13)

* GPU policy: All GPU nodes, communal and contributed, are available to all users. When running on another contributors GPU node, run time is limited to 2 hours. (2019-09-20)

* Scheduler: Support for email notification upon job completion, e.g. `qsub -m bea` (2019-11-12)

* Storage: The QB3-legacy NetApp storage (including `/netapp/home`) was deprecated during 2019 with a deadline on December 2019.  The server was kept up after this deadline and, unfortunately, the server went down on 2020-02-05 and was declared non-recoverable without further resource/funding (2020-02-05)

* Storage: Migrate home directories from the NetApp server (`/netapp/home/`) to the new, faster BeeGFS parallel file system (`/wynton/home/`).  The migration effort ended on 2020-02-05 when the NetApp server failed (2020-02-05)

* Website: Move website from GitHub Pages (https&#58;//ucsf-hpc.github.io/wynton/) to on-premise <{{ site.organization.url }}/hpc/> (2020-02-26)

* Network: Add a Globus '{{ site.cluster.nickname }}' Endpoint for efficient, secure data transfers (ingress and egress) (2020-04-03)

* Access: Two-factor authentication (2FA) is required for accessing the cluster (2020-10-29)

* Compute: QB3 hardware migration to {{ site.cluster.name }} considered complete (approximately 5,500 out of 7,000 physical cores migrated) (2021-09-27)

* Compliance: Add support for restricted data analysis ("Wynton PHI") (2021-12-17)

* Network: Add a PHI-approved Globus endpoint (2022-05-02)

* Network: Support for using Globus transfers to and from UCSF Box via {{ site.cluster.nickname }} (2022-06-01)

* Website: Host website on GitHub Pages (2022-10-31)

* Operating system: Upgrade from CentOS 7 to Rocky 8 (2023-11-15).


See also [News].

[QB3]: https://salilab.org/qb3cluster/
[BeeGFS]: https://www.beegfs.io/
[Globus]: https://www.globus.org/
[News]: /hpc/about/news.html
