<div class="alert alert-info" role="alert" style="margin-top: 3ex; margin-bottom: 3ex;">
{% assign progress = site.data.storage_requests.storage_request | times: 100 | divided_by: site.data.storage_requests.storage_per_brick %}
{% assign remain = site.data.storage_requests.storage_per_brick | minus: site.data.storage_requests.storage_request %}

Progress on next storage purchase: <strong>{{ progress }}% ({{ site.data.storage_requests.storage_request }} out of {{ site.data.storage_requests.storage_per_brick }} TB).</strong> Another {{ remain }} TB need to be requested before the next order can go out.
({{ site.data.storage_requests.last_updated }})
</div>

# Lab-Specific HPC Storage Pricing Model


## Summary

* All user accounts come with a quota of non-expandable 500 GiB of storage in `/wynton/home`, which is free of charge

* Global `/wynton/scratch` may be used for smaller, short-term project needs of a few TBs with the caveat that [files older than two weeks are deleted automatically]({{'/about/specs.html#scratch-storage' | relative_url }})

* Additional, long-term storage can be purchased in `/wynton/group` at $160/TB (one-time fee)

* After 5 years from purchase, when the warranty runs out, a small "maintenance fee" might be introduced

* To purchase more storage, please contact [{{ site.cluster.email_support }}](mailto:{{ site.cluster.email_support }}?subject=Request%20to%20purchase%20dedicated%20storage)

<br>


## Plan

We are currently offering the ability for research labs to purchase additional storage at a one-time charge of $160/TB for RAID 6 equivalent storage (or $320/TB for mirrored RAID 6).  In contrast to `/wynton/home`, purchased storage will be dedicated to the lab that bought it -- no oversubscription will occur.  The purchased storage will have similar performance to the rest of the BeeGFS infrastructure (`/wynton/scratch` and `/wynton/home`).

Given prices of hard drives, the stated rate might seem high, but there are three mitigating factors. First, we have enabled ZFS compression, so the actual available space might be significantly more. Second, the price includes the cost of the networking, metadata servers, storage server, maintenance, and administration. Third, we have proven that the performance of our BeeGFS infrastructure is much higher than the typical NFS server (in some respects, the performance is more than an order of magnitude faster). In the future, if absolutely necessary, we may also charge a “maintenance fee” for storage after the initial 5-year hardware warranty expires, but nothing has been decided as of yet. Similarly, any future storage purchases may be priced differently than that described here, to reflect the situation present at that time.

There are some additional parameters:

* Unlike nodes, the storage cannot be extracted from the system once it’s been brought online. Once a lab or a group has “bought in”, they will not be able to retrieve their portion of storage hardware if they choose to leave {{ site.cluster.nickname }} (unlike compute nodes/shares).

* The storage is not available for mounting outside of the cluster.

* At this point, the storage may not be used for PHI data (this may change in the future).

* The storage is not backed up.


## Background

We have an immediate need to provide for {{ site.cluster.name }} storage expansion to meet the demands of various research groups on campus. Given the difficulty of predicting longer-term costs and issues, the current pricing is considered short-term and may change as we understand the evolving needs and operational realities of {{ site.cluster.name }}. Thus, this pricing model will be re-evaluated at the beginning of the next fiscal year (July 1, 2019). This model is based on some assumptions that are important to understand:

* Various components of the shared storage environment are considered “infrastructure” and are currently funded from the ongoing support provided by the campus.  These components include the networking infrastructure, and management and metadata servers that are part of the overall storage infrastructure. We don’t know with certainty that these components will continue to be funded by the campus and this introduces additional uncertainty as to the future pricing for storage, beyond the current offering described here.

* The $160/TB price is for non-mirrored, potentially non-geographically redundant storage.  While we hope to always purchase storage servers in pairs, providing failover between servers, there is no guarantee that we will always be able to do that. If you wish to protect your data beyond the level of RAID 6 (allows for two failed disks), we suggest you consider purchasing mirrored storage which completely duplicates data using a separate set of (RAID 6) disk drives.

* Any new storage will be added to our existing BeeGFS installation and will not use separate instances of BeeGFS (which would significantly increase the potential costs, if not in hardware, certainly in terms of personnel effort).

* We assume that our last purchase represents a reasonable scalable unit of storage.  This purchase provided 1,200 TB (raw) storage and two storage servers.  At ~$112,500, this results in a cost of $93/TB (raw) or $136/TB after accounting for RAID-Z2 and BeeGFS filesystem costs. We also need to add two additional metadata servers at a cost of $20,000. Taken together, this results in the $160/TB price.

* The current storage hardware increment is ~$160,000, which may result in some delay between the first contributions and an actual purchase, although there is already pent-up demand and hence we are trying to proceed with the purchase as quickly as possible.


_Last updated: August 31, 2020_

