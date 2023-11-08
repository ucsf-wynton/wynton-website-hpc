### Operational Summary for 2018 Q3-Q4

* Full downtime:

  - Scheduled: 0 hours = 0.0%
  - Unscheduled: 84 hours = 3.5 days = 1.9%
  - Total: 84 hours = 3.5 days = 1.9%
  - External factors: 100% of the above downtime, corresponding to 84 hours (=3.5 days), were due to external factors
  

#### Scheduled maintenance downtimes

* Impact: No file access, no compute resources available
* Damage: None
* Occurrences:
  - None
* Total downtime: 0.0 hours

#### Scheduled kernel maintenance

* Impact: Fewer compute nodes than usual until rebooted
* Damage: None
* Occurrences:
  1. 2018-09-28 (up to 14 days)


#### Unscheduled downtimes due to power outage

* Impact: No file access, no compute resources available
* Damage: Running jobs (<= 14 days) failed, file-transfers failed, possible file corruptions
* Occurrences:
  1. 2018-06-17 (23 hours) - Campus power outage
  1. 2018-11-08 (19 hours) - Byers Hall power maintenance without notice
  1. 2018-12-14 (42 hours) - Sandler Building power outage
* Total downtime: 84 hours of which 84 hours were due to external factors

#### Unscheduled downtimes due to file-system failures

* Impact: No file access
* Damage: Running jobs (<= 14 days) may have failed, file-transfers may have failed, cluster not accessible
* Occurrences:
  - None.
* Total downtime: 0.0 hours


#### Accounts

* Number of user account: 198 (change: +103 during the year)



### December 21, 2018

#### <span style="color: orange;">Partial file system failure</span>

**Resolved**: Parts of the new BeeGFS file system was non-functional for approx. 1.5 hours during Friday December 21 when a brief maintenance task failed.
<br><span class="timestamp">Dec 21, 20:50 PT</span>

<!--
start: 2018-12-21T12:00:00
stop: 2018-12-21T13:30:00
length: 1.5 hours
severity: major-outage
affected: jobs, beegfs, *
reason: internal
 -->


### December 12-20, 2018

#### <span style="color: orange;">Nodes down</span>

**Resolved**: All of the `msg-* compute nodes but one are operational.
<br><span class="timestamp">Dec 20, 16:40 PT</span>

**Notice**: Starting Wednesday December 12 around 11:00, several `msg-*` compute nodes went down (~200 cores in total).  The cause of this is unknown.  Because it might be related to the BeeGFS migration project, the troubleshooting of this incident will most likely not start until the BeeGFS project is completed, which is projected to be done on Wednesday December 19.
<br><span class="timestamp">Dec 17, 17:00 PT</span>

<!--
start: 2018-12-20T16:40:00
stop: 2018-12-17T17:00:00
length: 72 hours
severity: partial-outage
affected: jobs, compute, *
reason: internal
 -->


### December 18, 2018

#### <span style="color: orange;">Development node does not respond</span>

**Resolved**: Development node `qb3-dev1` is functional.
<br><span class="timestamp">Dec 18, 20:50 PT</span>

**Investigating**: Development node `qb3-dev1` does not respond to SSH. This will be investigated the first thing tomorrow morning (Wednesday December 19).  In the meanwhile, development node `qb3-gpudev1`, which is "under construction", may be used.
<br><span class="timestamp">Dec 18, 16:30 PT</span>


### November 28-December 19, 2018

#### <span style="color: orange;">Installation of new, larger, and faster storage space</span>

**Resolved**: `/wynton/scratch` is now back online and ready to be used.
<br><span class="timestamp">Dec 19, 14:20 PT</span>

**Update**: The plan is to bring `/wynton/scratch` back online before the end of the day tomorrow (Wednesday December 19).  The planned SGE downtime has been rescheduled to Wednesday January 9.  Moreover, we will start providing the new 500-GiB `/wynton/home/` storage to users who explicitly request it (before Friday December 21) and who also promise to **move** the content under their current `/netapp/home/` to the new location.  Sorry, users on both QB3 and {{ site.cluster.name }} will _not_ be able to migrate until the QB3 cluster has been incorporated into {{ site.cluster.name }} (see [Roadmap](/hpc/about/roadmap.html)) or they giving up their QB3 account.
<br><span class="timestamp">Dec 18, 16:45 PT</span>

**Update**: The installation and migration to the new BeeGFS parallel file servers is on track and we expect to go live as planned on Wednesday December 19. We are working on fine tuning the configuration, running performance tests, and resilience tests.
<br><span class="timestamp">Dec 17, 10:15 PT</span>

**Update**: `/wynton/scratch` has been taken offline.
<br><span class="timestamp">Dec 12, 10:20 PT</span>

**Reminder**: All of `/wynton/scratch` will be taken offline and completely wiped starting Wednesday December 12 at 8:00am.
<br><span class="timestamp">Dec 11, 14:45 PT</span>

**Notice**: On Wednesday December 12, 2018, the global scratch space `/wynton/scratch` will be taken offline and completely erased.  Over the week following this, we will be adding to and reconfiguring the storage system in order to provide all users with new, larger, and faster (home) storage space.  The new storage will served using BeeGFS, which is a new much faster file system - a system we have been prototyping and tested via `/wynton/scratch`.  Once migrated to the new storage, a user's home directory quota will be increased from 200 GiB to 500 GiB.  In order to do this, the following upgrade schedule is planned:

* Wednesday November 28-December 19 (21 days): **To all users, please refrain from using `/wynton/scratch` - use local, node-specific `/scratch` if possible (see below).  The sooner we can take it down, the higher the chance is that we can get everything in place before December 19.**

* Wednesday December 12-19 (8 days): **`/wynton/scratch` will be unavailable and completely wiped**.  For computational scratch space, please [use local `/scratch` unique to each compute node](/hpc/scheduler/using-local-scratch.html).  For _global_ scratch needs, the old and much slower `/scrapp` and `/scrapp2` may also be used.

* ~~Wednesday December 19, 2018 (1/2 day): The {{ site.cluster.name }} scheduler (SGE) will be taken offline.  No jobs will be able to be submitted until it is restarted.~~

* Wednesday December 19, 2018: The upgraded {{ site.cluster.name }} with the new storage will be available including `/wynton/scratch`.

* Wednesday January 9, 2019 (1/2 day): The {{ site.cluster.name }} scheduler (SGE) will be taken offline temporarily.  No jobs will be able to be submitted until it is restarted.

It is our hope to be able to keep the user's home accounts, login nodes, the transfer nodes, and the development nodes available throughout this upgrade period.

_NOTE: If our new setup proves more challenging than anticipated, then we will postpone the SGE downtime to after the holidays, on Wednesday January 9, 2019.  {{ site.cluster.name }} will remain operational over the holidays, though without `/wynton/scratch`._
<br><span class="timestamp">Dec 6, 14:30 PT [edited Dec 18, 17:15 PT]</span>

<!--
start: 2018-12-12T10:20:00
stop: 2018-12-19T14:20:00
length: 172 hours
severity: under-maintenance
affected: beegfs-scratch, *
reason: scheduled
 -->



### December 12-14, 2018

#### <span style="color: orange;">Power failure</span>

**Resolved**: All `mac-*` compute nodes are up and functional.
<br><span class="timestamp">Dec 14, 12:00 PT</span>

**Investigating**: The compute nodes named `mac-*` (in the Sandler building) went down due to power failure on Wednesday December 12 starting around 05:50.  Nodes are being rebooted.
<br><span class="timestamp">Dec 12, 09:05 PT</span>

<!--
start: 2018-12-12T05:50:00
stop: 2018-12-14T12:00:00
length: 42 hours
severity: partial-outage
affected: jobs, compute
reason: external
 -->


### November 8, 2018

#### <span style="color: orange;">Partial shutdown due to planned power outage</span>

**Resolved**: The cluster is full functional.  It turns out that none of the compute nodes, and therefore none of the running jobs, were affected by the power outage.
<br><span class="timestamp">Nov 8, 11:00 PT</span>

**Update**: The queue-metric graphs are being updated again.
<br><span class="timestamp">Nov 8, 11:00 PT</span>

**Update**: The login nodes, the development nodes and the data transfer node are now functional.
<br><span class="timestamp">Nov 8, 10:10 PT</span>

**Update**: Login node `wynlog1` is also affected by the power outage.  Use `wynlog2` instead.
<br><span class="timestamp">Nov 8, 09:10 PT</span>

**Notice**: Parts of the {{ site.cluster.name }} cluster will be shut down on November 8 at 4:00am.  This shutdown takes place due to the UCSF Facilities shutting down power in the Byers Hall.  Jobs running on affected compute nodes will be terminated abruptly.  Compute nodes with battery backup or in other buildings will not be affected.  Nodes will be rebooted as soon as the power comes back. ~~To follow the reboot progress, see the 'Available CPU cores' curve (target 1,832 cores) in the graph above.~~  Unfortunately, the above queue-metric graphs cannot be updated during the power outage.
<br><span class="timestamp">Nov 7, 15:45 PT</span>

<!--
start: 2018-11-08T04:00:00
stop: 2018-11-08T23:00:00
length: 19 hours
severity: under-maintenance, partial-outage
affected: jobs, compute, *
reason: scheduled, external
 -->


### September 28 - October 11, 2018

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: The compute nodes has been rebooted and are accepting new jobs.  For the record, on day 5 approx. 300 cores were back online, on day 7 approx. 600 cores were back online, on day 8 approx. 1,500 cores were back online, and on day 9 the majority of the 1,832 cores were back online.
<br><span class="timestamp">Oct 11, 09:00 PT</span>

**Notice**: On September 28, a kernel update was applied to all compute nodes. To begin running the new kernel, each node must be rebooted.  To achieve this as quickly as possible and without any loss of running jobs, the queues on the nodes were all disabled (i.e., they stopped accepting new jobs).  Each node will reboot itself and re-enable its own queues as soon as all of its running jobs have completed.  Since the maximum allowed run time for a job is two weeks, it may take until October 11 before all nodes have been rebooted and accepting new jobs.  In the meanwhile, there will be fewer available slots on the queue than usual.  To follow the progress, see the 'Available CPU cores' curve (target 1,832 cores) in the graph above.
<br><span class="timestamp">Sept 28, 16:30 PT</span>


### October 1, 2018

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: The login, development, and data transfer hosts have been rebooted.
<br><span class="timestamp">Oct 1, 13:30 PT</span>

**Notice**: On Monday October 1 at 01:00, all of the login, development, and data transfer hosts will be rebooted.
<br><span class="timestamp">Sept 28, 16:30 PT</span>


### September 13, 2018

#### <span style="color: orange;">Scheduler unreachable</span>

**Resolved**: Around 11:00 on Wednesday September 12, the SGE scheduler (“qmaster”) became unreachable such that the scheduler could not be queried and no new jobs could be submitted. Jobs that relied on run-time access to the scheduler may have failed. The problem, which was due to a misconfiguration being introduced, was resolved early morning on Thursday September 13.
<br><span class="timestamp">Sept 13, 09:50 PT</span>

<!--
start: 2018-09-12T11:00:00
stop: 2018-09-13T08:00:00
length: 21 hours
severity: partial-outage
affected: jobs, scheduler, compute, *
reason: internal
 -->


### August 1, 2018

#### <span style="color: orange;">Partial shutdown</span>

**Resolved**: Nodes were rebooted on August 1 shortly after the power came back.
<br><span class="timestamp">Aug 2, 08:15 PT</span>

**Notice**: On Wednesday August 1 at 6:45am, parts of the compute nodes (msg-io{1-10} + msg-*gpu) will be powered down. They will be brought back online within 1-2 hours.  The reason is a planned power shutdown affecting one of {{ site.cluster.name }}'s server rooms.
<br><span class="timestamp">Jul 30, 20:45 PT</span>

<!--
start: 2018-08-01T07:15:00
stop: 2018-08-01T06:45:00
length: 0.5 hours
severity: scheduled, partial-outage
affected: jobs, scheduler, compute, *
reason: external
 -->

### July 30, 2018

#### <span style="color: orange;">Partial shutdown</span>

**Resolved**: The nodes brought down during the July 30 partial shutdown has been rebooted.  Unfortunately, the same partial shutdown has to be repeated within a few days because the work in server room was not completed. Exact date for the next shutdown is not known at this point.
<br><span class="timestamp">Jul 30, 09:55 PT</span>

**Notice**: On Monday July 30 at 7:00am, parts of the compute nodes (msg-io{1-10} + msg-*gpu) will be powered down. They will be brought back online within 1-2 hours.  The reason is a planned power shutdown affecting one of {{ site.cluster.name }}'s server rooms.
<br><span class="timestamp">Jul 29, 21:20 PT</span>


### June 16-26, 2018

#### <span style="color: orange;">Power outage</span>

**Resolved**: The Nvidia-driver issue occurring on some of the GPU compute nodes has been fixed.
<br><span class="timestamp">Jun 26, 11:55 PT</span>

**Update**: Some of the compute nodes with GPUs are still down due to issues with the Nvidia drivers.
<br><span class="timestamp">Jun 19, 13:50 PT</span>

**Update**: The login nodes and and the development nodes are functional. Some compute nodes that went down are back up, but not all.
<br><span class="timestamp">Jun 18, 10:45 PT</span>

**Investigating**: The UCSF Mission Bay Campus experienced a power outage on Saturday June 16 causing parts of {{ site.cluster.name }} to go down.  One of the login nodes (wynlog1), the development node (qb3-dev1), and parts of the compute nodes are currently non-functional.
<br><span class="timestamp">Jun 17, 15:00 PT</span>

<!--
start: 2018-06-17T15:00:00
stop: 2018-06-19T13:50:00
length: 23 hours
severity: partial-outage
affected: jobs, scheduler, compute, *
reason: external
 -->
