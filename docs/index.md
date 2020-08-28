<div class="alert alert-warning" role="alert">
2020-03-16: We will do our best to keep the {{ site.cluster.name }} environment up and running within the restrictions imposed by UCSF and local governments. Minor issues (like node crashes) will be dealt with at a later date.  Major issues will be dealt with on a best-effort basis and may result in longer than normal outages (especially if they require someone to be on site). Email response times are likely to be slower, as well, as we all struggle to adapt to the impacts of COVID-19.
</div>

<div class="alert alert-info" role="alert">
<strong>NEWS</strong>: (<em>For upcoming and current incidents, see the <a href="{{ '/status/index.html' | relative_url }}">Status</a> page</em>)<br/>
2020-08-21: Deployed four BeeGFS storage bricks for the group storage '/wynton/group' to 5.6 PB (was 3.8 PB).  Groups who purchased storage have had their new group quotas updated.<br/>
2020-08-21: Increased global '/wynton/scratch' to 615 TiB (was 492 TiB).<br/>
2020-08-21: Prefix qb3- has been dropped from the development node names, which are now named dev1, dev2, dev3, and gpudev1.<br/>
2020-05-22: Added 2,016 cores (+27%) via 48 standard nodes (36 cores and 384 GiB of RAM), 4 high-memory nodes (36 cores and 756 GiB of RAM), and 4 huge-memory nodes (36 cores and 1.5 TiB of RAM).<br/>
2020-04-14: Progress until the next round of storage purchase can be found on <a href="{{ '/about/pricing-storage.html' | relative_url }}">About -> Storage Pricing</a>.<br/>
2020-04-03: Added support for <a href="{{ '/transfers/globus.html' | relative_url }}">file transfers via the Globus service</a>.<br/>
2020-02-26: Website moved to <a href="https://wynton.ucsf.edu/hpc/">https://wynton.ucsf.edu/hpc/</a>.<br/>
2020-02-05: The QB3-legacy NetApp storage ('/netapp/'), deprecated with a deadline on December 2019, crashed on 2020-02-05 and was declared non-recoverable without further resource/funding.<br/>
2019-12-13: Status page now include <a href="{{ '/status/index.html' | relative_url }}">GPU queue metrics</a>.<br/>
2019-11-12: Added support for <a href="{{ '/scheduler/email-notifications.html' | relative_url }}">email notifications</a> when a job starts running or ends.<br/>
<a href="{{ '/about/news.html' | relative_url }}">More ...</a>
</div>


# {{ site.cluster.name }} - UCSF Research Computing at Scale

{{ site.cluster.name }} is a large, shared high-performance compute (HPC) cluster underlying UCSF's Research Computing Capability. Funded and administered cooperatively by UCSF campus IT and key research groups, it is available to all UCSF researchers, and consists of different profiles suited to various biomedical and health science computing needs.  Researchers can participate using the "co-op" model of resource contribution and sharing.

**The {{ site.cluster.name }} environment is available for _free_ to all UCSF researchers**.  To join, please follow the [instructions for requesting an account]({{ '/about/join.html' | relative_url }}).

The {{ site.cluster.name }} environment keeps growing as more users discover it and more groups buy into the co-op model.  <a href="{{ '/about/shares.html' | relative_url }}">Each contributing member brings more resources and compute power for everyone based on a fair-share model where contributors get higher access priority than non-contributing members</a>.  **Contributions to the {{ site.cluster.name }} environment are non-expiring and valid for life!** Several UCSF centers have already joined contributing a large amount of compute power to the cluster, e.g. Memory and Aging Center and QB3.  Additional centers are lined up to merge their existing hardware into the {{ site.cluster.name }}.  For more details on where we are heading, please see the [{{ site.cluster.name }} Roadmap]({{ '/about/roadmap.html' | relative_url }}).

**Please note**: The current {{ site.cluster.name }} environment is *not* certified for use with Protected Health Information (PHI).  Data containing PHI must not be transferred to, mounted on, or processed with any {{ site.cluster.name }} cluster resources.  If you have questions regarding the security status of your data, please contact the [UCSF Privacy Office].


[UCSF Privacy Office]: https://hipaa.ucsf.edu/
