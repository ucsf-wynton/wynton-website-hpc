{% include_relative warning-hold-on-storage-requests.md %}


# Pricing for Extra Storage

Research groups can purchase additional storage on {{ site.cluster.nickname }} beyond the user-specific storage that is free to all.

## Summary

* All user accounts come with a quota of non-expandable 500 GiB of storage in `/wynton/home` or `/wynton/protected/home`, which is free of charge

* Global `/wynton/scratch` and `/wynton/protected/scratch` (for Wynton Protected users) may be used for smaller, short-term project needs of a few TBs with the caveat that [files older than two weeks are deleted automatically](/hpc/about/specs.html#scratch-storage)

* Additional, long-term storage can be purchased in `/wynton/group`, `/wynton/protected/group` (for Wynton Protected users), or in `/wynton/protected/project` (for specific Wynton Protected projects) at $160/TiB (one-time fee).  Both will count towards a lab's storage quota total.

* After 5 years from purchase, when the warranty runs out, a small "maintenance fee" might be introduced

* To purchase more storage, please contact [{{ site.cluster.email_storage }}](mailto:{{ site.cluster.email_storage }}?subject=Request%20to%20purchase%20dedicated%20storage)

<br>


## Lab-Specific HPC Storage Pricing Model

We are currently offering the ability for research labs to purchase additional storage at a one-time charge of $160/TiB for RAID 6 equivalent storage (or $320/TiB for mirrored RAID 6).  In contrast to `/wynton/home`, purchased storage will be mounted on `/wynton/group`, `/wynton/protected/group`, or `/wynton/protected/project` and dedicated to the lab that bought it -- no oversubscription will occur.  The purchased storage will have similar performance to the rest of the BeeGFS infrastructure (e.g. `/wynton/scratch`, `/wynton/protected/scratch`, `/wynton/home`, and `/wynton/protected/home`).

Please note, storage in `/wynton/group/`, `/wynton/protected/group`, and `/wynton/protected/project` count towards a lab's storage quota total.

Given prices of hard drives, the stated rate might seem high, but there are three mitigating factors. First, we have enabled ZFS compression, so the actual available space might be significantly more. Second, the price includes the cost of the networking, metadata servers, storage server, maintenance, and administration. Third, we have proven that the performance of our BeeGFS infrastructure is much higher than the typical NFS server (in some respects, the performance is more than an order of magnitude faster). In the future, if absolutely necessary, we may also charge a “maintenance fee” for storage after the initial 5-year hardware warranty expires, but nothing has been decided as of yet. Similarly, any future storage purchases may be priced differently than that described here, to reflect the situation present at that time.

There are some additional parameters:

* Unlike nodes, the storage cannot be extracted from the system once it’s been brought online. Once a lab or a group has “bought in”, they will not be able to retrieve their portion of storage hardware if they choose to leave {{ site.cluster.nickname }} (unlike compute nodes/shares).

* The storage is not available for mounting outside of the cluster.

* The storage is not backed up.


## Frequently Asked Questions

### Q: If I already have purchased group storage, can I also use that storage quota for Wynton Protected data in `/wynton/protected/group`?

A: Yes, but Wynton Protected data must not be stored in `/wynton/group`.  We can create group folders for you under `/wynton/protected` for Wynton Protected data storage and collaboration. If you choose to have your current storage allocation updated to include Wynton Protected storage, you have three options:

1. We can create a group folder in both `/wynton/group` and `/wynton/protected/group`. Both folders will share the same quota. In this case, the same quota will be applied to two folders, so it can be tricky to track where the group’s quota usage is, Wynton Protected or Wynton Regular.

2. We can create a group folder in `/wynton/group` and a folder with a separate sub-quota subtracted from the group quota in `/wynton/protected/group`, for example, `/wynton/protected/group/group-phi`. This makes it easier to track separate Wynton Protected and Wynton Regular group quota usage.

3. If the group using the Wynton Protected data does not include the whole lab group membership, or includes members from outside of the group, then a folder in `/wynton/protected/project` can be created and the child quota subtracted from the parent group.

Only members of the lab group with Wynton Protected access will be able to access files stored under `/wynton/protected`.


### Q: Does purchasing additional group storage increase the quotas available to lab users in `/wynton/home` or `/wynton/protected/home`?

A: No, the home directory quotas are managed separately from group quotas and additional purchased group space cannot be applied to home directories.


## Background

We have an immediate need to provide for {{ site.cluster.name }} storage expansion to meet the demands of various research groups on campus. Given the difficulty of predicting longer-term costs and issues, the current pricing is considered short-term and may change as we understand the evolving needs and operational realities of {{ site.cluster.name }}. This model is based on some assumptions that are important to understand:

* Various components of the shared storage environment are considered “infrastructure” and are currently funded from the ongoing support provided by the campus.  These components include the networking infrastructure, and management and metadata servers that are part of the overall storage infrastructure. We don’t know with certainty that these components will continue to be funded by the campus and this introduces additional uncertainty as to the future pricing for storage, beyond the current offering described here.

* The $160/TiB price is for non-mirrored, potentially non-geographically redundant storage.  While we hope to always purchase storage servers in pairs, providing failover between servers, there is no guarantee that we will always be able to do that. If you wish to protect your data beyond the level of RAID 6 (allows for two failed disks), we suggest you consider purchasing mirrored storage which completely duplicates data using a separate set of (RAID 6) disk drives.

* Any new storage will be added to our existing BeeGFS installation and will not use separate instances of BeeGFS (which would significantly increase the potential costs, if not in hardware, certainly in terms of personnel effort).


## Price calculations

* We assume that purchases during 2019 represented a reasonable scalable unit of storage.  This purchase provided 1,200 TB (raw) storage and two storage servers.  At ~$112,500, this results in a cost of $93/TB (raw) or $136/TB after accounting for RAID-Z2 and BeeGFS filesystem costs. We also need to add two additional metadata servers at a cost of $20,000. Taken together, this results in the $160/TB price.

* The current storage hardware increment is ~$160,000, which may result in some delay between the first contributions and an actual purchase, although there is already pent-up demand and hence we are trying to proceed with the purchase as quickly as possible.

* Update 2024-07-29: We have sold storage in units of TB = 1000^4 bytes, but allocated in units of TiB = 1024^4 bytes, which is a 10% over-allocation. That said, given that prices has been going down, we have made the decision to change the charge to $160/TiB.  There is also current work in revisit the storage price, so the current price might be adjusted again.

_Last updated: July 29, 2024_
