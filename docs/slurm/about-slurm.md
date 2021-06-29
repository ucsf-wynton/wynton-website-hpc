### Slurm Pilot

[Slurm] is currently being piloted on a small subset of Wynton nodes. If you are interested in being part of the pilot, contact the _{{ site.cluster.nickname }}_ support staff at [{{ site.cluster.email_support }}](mailto:{{ site.cluster.email_support }}).

Following the successful test and validation for our environment it will be made available to the wider campus community.

[Slurm] is an open source, fault-tolerant, and highly scalable cluster management and job scheduling system for large and small Linux clusters currently in testing at the UCSF Wynton organization. We will be gradually cutting groups over to [Slurm] as resources are allocated to the new cluster.

[Slurm] requires no kernel modifications for its operation and is relatively self-contained. As a cluster workload manager, Slurm has three key functions. First, it allocates exclusive and/or non-exclusive access to resources (compute nodes) to users for some duration of time so they can perform work. Second, it provides a framework for starting, executing, and monitoring work (normally a parallel job) on the set of allocated nodes. 

Finally, it arbitrates contention for resources by managing a queue of pending work. Optional plugins can be used for accounting, advanced reservation, gang scheduling (time sharing for parallel jobs), backfill scheduling, topology optimized resource selection, resource limits by user or bank account, and sophisticated multifactor job prioritization algorithms.

[Slurm]: {{ 'https://slurm.schedmd.com/' }}
