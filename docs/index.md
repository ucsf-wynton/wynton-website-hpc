<div class="alert alert-warning" role="alert">
2020-03-16: We will do our best to keep the Wynton HPC environment up and running within the restrictions imposed by UCSF and local governments. Minor issues (like node crashes) will be dealt with at a later date.  Major issues will be dealt with on a best-effort basis and may result in longer than normal outages (especially if they require someone to be on site). Email response times are likely to be slower, as well, as we all struggle to adapt to the impacts of COVID-19.
</div>

<div class="alert alert-info" role="alert">
<strong>NEWS</strong>: (<em>For upcoming and current incidents, see the <a href="{{ '/status/index.html' | relative_url }}">Status</a> page</em>)<br/>
2020-02-26: Website moved to <a href="https://wynton.ucsf.edu/hpc/">https://wynton.ucsf.edu/hpc/</a>.<br/>
2020-02-05: The QB3-legacy NetApp storage (`/netapp/`), deprecated with a deadline on December 2019, crashed on 2020-02-05 and was declared non-recoverable without further resource/funding.<br/>
2019-12-13: Status page now include <a href="{{ '/status/index.html' | relative_url }}">GPU queue metrics</a>.<br/>
2019-11-12: Added support for <a href="{{ '/scheduler/email-notifications.html' | relative_url }}">email notifications</a> when a job starts running or ends.<br/>
2019-09-13: Added another three <a href="{{ '/about/specs.html' | relative_url }}">communal GPU nodes with a total of 12 GPUs</a>.<br/>
2019-09-12 Added a second <a href="{{ '/about/specs.html' | relative_url }}">data transfer node</a>.<br/>
2019-08-15 Legacy NetApp storage locations `/scrapp` and `/scrapp2` used for global scratch have been removed - use `/wynton/scratch` instead.<br/>
2019-07-27 Legacy NetApp storage locations `/scrapp` and `/scrapp2` used for global scratch are now deprecated - use `/wynton/scratch` instead.  The deprecated mounts will become read-only on 2019-08-01 and removed on 2019-08-09.<br/>
2019-06-13: <a href="{{ '/software/software-repositories.html' | relative_url }}">Contributed Software Repositories</a> are now available and documented.<br/>
2019-04-30: <a href="{{ '/about/shares.html' | relative_url }}">Contributing Member Shares</a> are now explained and listed online.<br/>
<a href="{{ '/about/news.html' | relative_url }}">More ...</a>
</div>


# Wynton HPC - UCSF Research Computing at Scale

Wynton is a large, shared high-performance compute (HPC) cluster underlying UCSF's Research Computing Capability. Funded and administered cooperatively by UCSF campus IT and key research groups, it is available to all UCSF researchers, and consists of different profiles suited to various biomedical and health science computing needs.  Researchers can participate using the "co-op" model of resource contribution and sharing.

**The Wynton HPC environment is available for _free_ to all UCSF researchers**.  To join, please follow the [instructions for requesting an account]({{ '/about/join.html' | relative_url }}).

The Wynton HPC environment keeps growing as more users discover it and more groups buy into the co-op model.  <a href="{{ '/about/shares.html' | relative_url }}">Each contributing member brings more resources and compute power for everyone based on a fair-share model where contributors get higher access priority than non-contributing members</a>.  **Contributions to the Wynton HPC environment are non-expiring and valid for life!** Several UCSF centers have already joined contributing a large amount of compute power to the cluster, e.g. Memory and Aging Center and QB3.  Additional centers are lined up to merge their existing hardware into the Wynton HPC.  For more details on where we are heading, please see the [Wynton HPC Roadmap]({{ '/about/roadmap.html' | relative_url }}).

**Please note**: The current Wynton HPC environment is *not* certified for use with Protected Health Information (PHI).  Data containing PHI must not be transferred to, mounted on, or processed with any Wynton cluster resources.  If you have questions regarding the security status of your data, please contact the [UCSF Privacy Office].


[UCSF Privacy Office]: https://hipaa.ucsf.edu/
