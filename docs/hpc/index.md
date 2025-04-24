{% include banner-phi-freeze.md %}

{% include_relative status/incidents-upcoming.md %}

<div class="alert alert-info" role="alert" markdown="1">
**NEWS**: (_For upcoming and current incidents, see the
[Status](/hpc/status/index.html) page_)

2025-04-22: PHI Freeze: Effective immediately, we are pausing requests for new projects that process P4 data, specifically Protected Health Information (PHI).

2025-01-16: The memory limit on development nodes was decreased from 68 GiB to 48 GiB, in order to further lower the risk for these machines to run low on memory resulting in non-responsiveness.

[More ...](/hpc/about/news.html)
</div>


# {{ site.cluster.name }} - UCSF Research Computing at Scale

{{ site.cluster.name }} is a large, shared high-performance compute (HPC) cluster underlying UCSF's Research Computing Capability. Funded and administered cooperatively by UCSF campus IT and key research groups, it is available to all UCSF researchers, and consists of different profiles suited to various biomedical and health science computing needs.  Researchers can participate using the "co-op" model of resource contribution and sharing.

**The {{ site.cluster.name }} environment is available for _free_ to all UCSF researchers**.  To join, please follow the [instructions for requesting an account](/hpc/about/join.html).

The {{ site.cluster.name }} environment keeps growing as more users discover it and more groups buy into the co-op model.  [Each contributing member brings more resources and compute power for everyone based on a fair-share model where contributors get higher access priority than non-contributing members](/hpc/about/shares.html).  **Contributions to the {{ site.cluster.name }} environment are non-expiring and valid for life!**  In addition, several UCSF centers have joined by contributing a large amount of their compute hardware to the cluster, e.g. Memory and Aging Center and QB3.  For more details on where we are heading, please see the [{{ site.cluster.name }} Roadmap](/hpc/about/roadmap.html).

**Please note**: The {{ site.cluster.name }} environment is _not_ certified for use with Protected Health Information (PHI) _unless you have a Wynton PHI account_.  Data containing PHI must not be transferred to, mounted on, or processed with any {{ site.cluster.name }} cluster resources other than in the Wynton PHI environment.  For more information or to apply for a PHI account, see [Protected Health Information (PHI) on Wynton].


[UCSF Privacy Office]: https://hipaa.ucsf.edu/
[Protected Health Information (PHI) on Wynton]: /hpc/about/wynton-phi.html
[Rocky 8]: /hpc/software/rocky-8-linux.html
