{% include banner-phi-freeze.md %}

<div class="alert alert-info" role="alert" markdown="1">
**NEWS**: (_For upcoming and current incidents, see the
[Status](/hpc/status/index.html) page_)

2025-07-08: Termination of Wynton Support for P4/PHI data. Starting today, all work on P4/PHI level data must be ceased and all P4/PHI data removed from Wynton.

2025-04-22: PHI Freeze: Effective immediately, we are pausing requests for new projects that process P4 data, specifically Protected Health Information (PHI).

2025-01-16: The memory limit on development nodes was decreased from 68 GiB to 48 GiB, in order to further lower the risk for these machines to run low on memory resulting in non-responsiveness.

[More ...](/hpc/about/news.html)
</div>


# {{ site.cluster.name }} - Wynton's Future
Wynton HPC has been a vital resource for UCSF’s computational research, providing shared HPC capabilities to support diverse scientific projects. However, Wynton HPC is being gradually phased out to align with UCSF’s evolving research infrastructure strategy.

While Wynton will remain operational for the near term, researchers are encouraged to plan for its eventual absorption into the FAC and CoreHPC. UCSF is committed to supporting researchers during this transition and ensuring continued access to robust computational resources.

For more details on the upcoming changes, visit the [Wynton HPC Transition Announcement](https://ars.ucsf.edu/news/announcement-wynton-hpc-transition).

Learn about the [Facility for Advanced Computing (FAC)](https://it.ucsf.edu/service/facility-advanced-computing-fac), including pricing options for [FAC Capacity Storage](https://it.ucsf.edu/how-to/fac-capacity-storage).

# {{ site.cluster.name }} - UCSF Research Computing at Scale

{{ site.cluster.name }} is a large, shared high-performance compute (HPC) cluster underlying UCSF's Research Computing Capability. Funded and administered cooperatively by UCSF campus IT and key research groups, it is available to all UCSF researchers, and consists of different profiles suited to various biomedical and health science computing needs.  Researchers can participate using the "co-op" model of resource contribution and sharing.

**The {{ site.cluster.name }} environment is available for _free_ to all UCSF researchers**.  To join, please follow the [instructions for requesting an account](/hpc/about/join.html).

The {{ site.cluster.name }} environment grew as more users discovered it and more groups bought into the co-op model.  [Each contributing member brings more resources and compute power for everyone based on a fair-share model where contributors get higher access priority than non-contributing members](/hpc/about/shares.html).  In addition, several UCSF centers have joined by contributing a large amount of their compute hardware to the cluster, e.g. Memory and Aging Center and QB3.

**Please note**: P4 data, which includes PHI, is prohibited.  P3 data may only be used in "[Wynton Protected]" via a "protected" account. Refer to [UCSF Policy 650-16 Addendum F, UCSF Data Classification Standard](https://it.ucsf.edu/standard-guideline/ucsf-policy-650-16-addendum-f-ucsf-data-classification-standard). For compliant alternatives for working with P4 data, please visit our UCSF Data Storage for Research Page found here: https://secureresearch.ucsf.edu/ucsf-data-storage-research, or contact our cloud services team for a consultation: https://it.ucsf.edu/service/secured-enterprise-cloud-aws.

[UCSF Privacy Office]: https://hipaa.ucsf.edu/
[Wynton Protected]: /hpc/about/wynton-protected.html
[Rocky 8]: /hpc/software/rocky-8-linux.html
