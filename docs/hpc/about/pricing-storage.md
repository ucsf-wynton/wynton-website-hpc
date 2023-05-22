<div class="alert alert-info" role="alert" style="margin-top: 3ex; margin-bottom: 3ex;" markdown="1">
2021-04-05: We have improved the purchasing and accounting workflow for lab storage orders.  This means that we can allocate lab storage much sooner than what was possible in the past.
</div>

# Pricing for Extra Storage

Research groups can purchase additional storage on {{ site.cluster.nickname }} beyond the user-specific storage that is free to all.

## Summary

* All user accounts come with a quota of non-expandable 500 GiB of storage in `/wynton/home` or `/wynton/protected/home`, which is free of charge

* Global `/wynton/scratch` and `/wynton/protected/scratch` (for PHI users) may be used for smaller, short-term project needs of a few TBs with the caveat that [files older than two weeks are deleted automatically](/hpc/about/specs.html#scratch-storage)

* Additional, long-term storage can be purchased in `/wynton/group`, `/wynton/protected/group` (for PHI users), or in `/wynton/protected/project` (for specific PHI projects) at $160/TB (one-time fee).  Both will count towards a lab's storage quota total.

* After 5 years from purchase, when the warranty runs out, a small "maintenance fee" might be introduced

* To purchase more storage, please contact [{{ site.cluster.email_storage }}](mailto:{{ site.cluster.email_storage }}?subject=Request%20to%20purchase%20dedicated%20storage)

<br>


## Lab-Specific HPC Storage Pricing Model

We are currently offering the ability for research labs to purchase additional storage at a one-time charge of $160/TB for RAID 6 equivalent storage (or $320/TB for mirrored RAID 6).  In contrast to `/wynton/home`, purchased storage will be mounted on `/wynton/group`, `/wynton/protected/group`, or `/wynton/protected/project` and dedicated to the lab that bought it -- no oversubscription will occur.  The purchased storage will have similar performance to the rest of the BeeGFS infrastructure (e.g. `/wynton/scratch`, `/wynton/protected/scratch`, `/wynton/home`, and `/wynton/protected/home`).

Please note, storage in `/wynton/group/`, `/wynton/protected/group/`, and `/wynton/protected/project` count towards a lab's storage quota total.

Given prices of hard drives, the stated rate might seem high, but there are three mitigating factors. First, we have enabled ZFS compression, so the actual available space might be significantly more. Second, the price includes the cost of the networking, metadata servers, storage server, maintenance, and administration. Third, we have proven that the performance of our BeeGFS infrastructure is much higher than the typical NFS server (in some respects, the performance is more than an order of magnitude faster). In the future, if absolutely necessary, we may also charge a “maintenance fee” for storage after the initial 5-year hardware warranty expires, but nothing has been decided as of yet. Similarly, any future storage purchases may be priced differently than that described here, to reflect the situation present at that time.

There are some additional parameters:

* Unlike nodes, the storage cannot be extracted from the system once it’s been brought online. Once a lab or a group has “bought in”, they will not be able to retrieve their portion of storage hardware if they choose to leave {{ site.cluster.nickname }} (unlike compute nodes/shares).

* The storage is not available for mounting outside of the cluster.

* At this point, the storage may not be used for PHI data (this may change in the future).

* The storage is not backed up.

## Frequently Asked Questions

#### Q: If I already have purchased group storage, can I also use that storage for PHI Data in /wynton/protected?

A: PHI Data should not be stored in /wynton/group. However, we can create separate storage for you under /wynton/protected. If you choose to have your current storage allocation updated to include PHI storage you have several options.

We can either:

1)	Create a group folder in both `/wynton/group` and `/wynton/protected/group`. In this case both folders will share the same quota. In this case, it can be tricky to figure out where the group’s quota usage is, phi or non-phi.
2)	Create a group folder in `/wynton/group` and a folder with a separate subquota subtracted from the group quota in `/wynton/protected/group/, for example`, `/wynton/protected/group/groupname-phi`. This makes it easier to separate PHI and non-PHI group usage.
3)	If the group using the PHI data does not include the whole lab group membership, or includes members from outside of the group, then a group in `/wynton/protected/project` can be created and the child quota subtracked from the parent group.

Only members of the group with PHI access will be able to access files stored under `/wynton/protected`.

#### Q: Does purchasing additional group storage increase the quotas available to Wynton users in `/wynton/home` or `/wynton/protected/home`?

A: No, the home directory quotas are managed separately from group quotas and purchasing additional group space cannot be applied to home directories.

## Background

We have an immediate need to provide for {{ site.cluster.name }} storage expansion to meet the demands of various research groups on campus. Given the difficulty of predicting longer-term costs and issues, the current pricing is considered short-term and may change as we understand the evolving needs and operational realities of {{ site.cluster.name }}. Thus, this pricing model will be re-evaluated at the beginning of the next fiscal year (July 1, 2019). This model is based on some assumptions that are important to understand:

* Various components of the shared storage environment are considered “infrastructure” and are currently funded from the ongoing support provided by the campus.  These components include the networking infrastructure, and management and metadata servers that are part of the overall storage infrastructure. We don’t know with certainty that these components will continue to be funded by the campus and this introduces additional uncertainty as to the future pricing for storage, beyond the current offering described here.

* The $160/TB price is for non-mirrored, potentially non-geographically redundant storage.  While we hope to always purchase storage servers in pairs, providing failover between servers, there is no guarantee that we will always be able to do that. If you wish to protect your data beyond the level of RAID 6 (allows for two failed disks), we suggest you consider purchasing mirrored storage which completely duplicates data using a separate set of (RAID 6) disk drives.

* Any new storage will be added to our existing BeeGFS installation and will not use separate instances of BeeGFS (which would significantly increase the potential costs, if not in hardware, certainly in terms of personnel effort).

* We assume that our last purchase represents a reasonable scalable unit of storage.  This purchase provided 1,200 TB (raw) storage and two storage servers.  At ~$112,500, this results in a cost of $93/TB (raw) or $136/TB after accounting for RAID-Z2 and BeeGFS filesystem costs. We also need to add two additional metadata servers at a cost of $20,000. Taken together, this results in the $160/TB price.

* The current storage hardware increment is ~$160,000, which may result in some delay between the first contributions and an actual purchase, although there is already pent-up demand and hence we are trying to proceed with the purchase as quickly as possible.


_Last updated: January 23, 2023_
