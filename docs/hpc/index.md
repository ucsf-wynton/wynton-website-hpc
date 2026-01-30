<div class="alert alert-info" role="alert" markdown="1">
**NEWS**: (_For upcoming and current incidents, see the
[Status](/hpc/status/index.html) page_)

2026-01-30: Protected (P3 and P4) data and accounts have been decommissioned. Only Wynton Regular (P1-P2) accounts can use the cluster from now on.

2026-01-16: The maximum job run-time is now limited for all Protected users such that their jobs finish by January 29 at 01:00 am.

2025-12-01: No new Protected accounts are commissioned and existing Regular accounts can no longer be changed to Protected accounts.

2025-09-31: GPU compute nodes are now reserved for GPU tasks. Non-GPU jobs, that is, jobs that do not request `-q gpu.q`, will no longer end up on a GPU compute node. This removes the risk of CPU-only jobs starving out GPU jobs.

[More news](/hpc/about/news.html)
</div>


# {{ site.cluster.name }} - UCSF Research Computing at Scale

{{ site.cluster.name }} is a large, shared high-performance compute
(HPC) cluster underlying UCSF's Research Computing Capability. Funded
and administered cooperatively by UCSF campus IT and key research
groups, it is available to all UCSF researchers, and consists of
different profiles suited to various biomedical and health science
computing needs.  Researchers can participate using the "co-op" model
of resource contribution and sharing. The {{ site.cluster.name }}
environment grew as more users discovered it and more groups bought
into the co-op model.  [Each contributing member brings more resources
and compute power for everyone based on a fair-share model where
contributors get higher access priority than non-contributing
members](/hpc/about/shares.html).  In addition, several UCSF centers
have joined by contributing a large amount of their compute hardware
to the cluster, e.g. Memory and Aging Center and QB3.

**The {{ site.cluster.name }} environment is available for _free_ to all UCSF researchers**.  To join, please follow the [instructions for requesting an account](/hpc/about/join.html).


## Wynton's Future

Wynton HPC has been a vital resource for UCSF’s computational
research, providing shared HPC capabilities to support diverse
scientific projects. However, Wynton HPC is being gradually phased out
to align with UCSF’s evolving research infrastructure strategy.  While
Wynton will remain operational for the near term, researchers are
encouraged to plan for its eventual absorption into the [Facility for
Advanced Computing (FAC)] and [CoreHPC]. UCSF is committed to
supporting researchers during this transition and ensuring continued
access to robust computational resources.

For more details on the upcoming changes, visit the [Wynton Transition
Keeping You Informed] page.


[UCSF Privacy Office]: https://hipaa.ucsf.edu/
[Rocky 8]: /hpc/software/rocky-8-linux.html
[CoreHPC]: https://it.ucsf.edu/service/corehpc
[Facility for Advanced Computing (FAC)]: https://it.ucsf.edu/service/facility-advanced-computing-fac)
[Wynton Transition Keeping You Informed]: https://ars.ucsf.edu/wynton-transition-keeping-you-informed
