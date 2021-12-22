<div class="alert alert-warning" role="alert">
2020-03-16: We will do our best to keep the {{ site.cluster.name }} environment up and running within the restrictions imposed by UCSF and local governments. Minor issues (like node crashes) will be dealt with at a later date.  Major issues will be dealt with on a best-effort basis and may result in longer than normal outages (especially if they require someone to be on site). Email response times are likely to be slower, as well, as we all struggle to adapt to the impacts of COVID-19.
</div>

<div class="alert alert-info" role="alert">
<strong>NEWS</strong>: (<em>For upcoming and current incidents, see the <a href="{{ '/status/index.html' | relative_url }}">Status</a> page</em>)<br/>
2021-12-17: <a href="{{ '/about/wynton-phi.html' | relative_url }}">Wynton PHI</a> is now available to all UCSF researchers and affiliates to process computing jobs involving PHI<br/>
2021-10-01: Added four <a href="{{ '/about/specs.html' | relative_url }}">communal GPU nodes</a> each with four Nvidia A40 GPUs (48 GiB GPU RAM) and a 32-core CPU and 512 GB RAM<br/>
2021-09-22: Added 2,048 cores (+20%) via 16 huge-memory nodes (128 cores and 1 TiB of RAM)<br/>
2021-05-28: GPU development node gpudev1 has been upgraded to a machine with 32 CPU cores, 128 GiB RAM, and NVIDIA Tesla K80 (was 12 cores, 48 GiB RAM, and GeForce GTX 980 Ti)<br/>
2021-05-28: Development node dev1 has been upgraded to a machine with 72 CPU cores and 384 GiB RAM (was 8 cores and 16 GiB RAM).<br/>
2021-04-05: We have improved the purchasing and accounting workflow for <a href="{{ '/about/pricing-storage.html' | relative_url }}">lab storage orders</a> resulting in shorter waiting times.<br/>
2021-03-12: Zsh is now also available in addition to the officially supported Bash, our default shell, Csh, and Tcsh.<br/>
2021-01-25: We now offer weekly <a href="{{ '/support/index.html' | relative_url }}">Office Hours</a>.<br/>
<a href="{{ '/about/news.html' | relative_url }}">More ...</a>
</div>


# {{ site.cluster.name }} - UCSF Research Computing at Scale

{{ site.cluster.name }} is a large, shared high-performance compute (HPC) cluster underlying UCSF's Research Computing Capability. Funded and administered cooperatively by UCSF campus IT and key research groups, it is available to all UCSF researchers, and consists of different profiles suited to various biomedical and health science computing needs.  Researchers can participate using the "co-op" model of resource contribution and sharing.

**The {{ site.cluster.name }} environment is available for _free_ to all UCSF researchers**.  To join, please follow the [instructions for requesting an account]({{ '/about/join.html' | relative_url }}).

The {{ site.cluster.name }} environment keeps growing as more users discover it and more groups buy into the co-op model.  <a href="{{ '/about/shares.html' | relative_url }}">Each contributing member brings more resources and compute power for everyone based on a fair-share model where contributors get higher access priority than non-contributing members</a>.  **Contributions to the {{ site.cluster.name }} environment are non-expiring and valid for life!** Several UCSF centers have already joined contributing a large amount of compute power to the cluster, e.g. Memory and Aging Center and QB3.  Additional centers are lined up to merge their existing hardware into the {{ site.cluster.name }}.  For more details on where we are heading, please see the [{{ site.cluster.name }} Roadmap]({{ '/about/roadmap.html' | relative_url }}).

**Please note**: The current {{ site.cluster.name }} environment is *not* certified for use with Protected Health Information (PHI) unless you have a Wynton PHI account.  Data containing PHI must not be transferred to, mounted on, or processed with any {{ site.cluster.name }} cluster resources other than in the Wynton PHI environment.  If you have questions regarding the security status of your data, please contact the [UCSF Privacy Office]. If you want to request access to Wynton PHI, please submit [this form](https://ucsf.service-now.com/ucsfit?id=ucsf_sc_cat_item&sys_id=68f9651f1bf47c50683e0ed8624bcbac&sysparm_category=40c0305b7b92d000e2dc8180984d4d9f).


[UCSF Privacy Office]: https://hipaa.ucsf.edu/
