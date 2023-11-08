### Operational Summary for 2020

* Full downtime:

  - Scheduled: 123 hours = 5.1 days = 1.4%
  - Unscheduled: 91.5 hours = 3.8 days = 1.0%
  - Total: 214.5 hours = 8.9 days = 2.4%
  - External factors: 12% of the above downtime, corresponding to 26.5 hours (=1.1 days), were due to external factors


#### Scheduled maintenance downtimes

* Impact: No file access, no compute resources available
* Damage: None
* Occurrences:
  1. 2020-08-10 (93 hours)
  1. 2020-12-07 (30 hours)
* Total downtime: 123 hours

#### Scheduled kernel maintenance

* Impact: Fewer compute nodes than usual until rebooted
* Damage: None
* Occurrences:
  1. 2020-06-11 (up to 14 days)
  1. 2020-12-11 (up to 14 days)

#### Unscheduled downtimes due to power outage

* Impact: No file access, no compute resources available
* Damage: Running jobs (<= 14 days) failed, file-transfers failed, possible file corruptions
* Occurrences:
  - None
* Total downtime: 0 hours

#### Unscheduled downtimes due to file-system failures

* Impact: No file access
* Damage: Running jobs (<= 14 days) may have failed, file-transfers may have failed, cluster not accessible
* Occurrences:
  1. 2020-01-22 (2.5 hours) - BeeGFS failure to failed upgrade
  1. 2020-01-29 (1.0 hours) - BeeGFS non-responsive
  1. 2020-02-05 (51.5 hours) - Legacy NetApp file system failed
  1. 2020-05-22 (0.5 hours) - BeeGFS non-responsive to failed upgrade
  1. 2020-08-19 (1.5 hours) - BeeGFS non-responsive
  1. 2020-10-21 (3 hours) - BeeGFS non-responsive
  1. 2020-11-05 (3 hours) - BeeGFS non-responsive
* Total downtime: 63.0 hours


#### Unscheduled downtimes due to other reasons

* Impact: Less compute resources
* Damage: Running jobs (<= 14 days) may have failed, file-transfers may have failed, cluster not accessible
* Occurrences:
  1. 2020-05-28 (26.5 hours) - MSG Data Center outage affecting many GPU compute nodes
  1. 2020-07-04 (2 hours) - SGE scheduler failed
  1. 2020-11-04 (288 hours) - ~80 compute nodes lost due to network switch failure
* Total downtime: 28.5 hours of which 26.5 hours were due to external factors


#### Accounts

* Number of user account: 864 (change: +386 during the year)


### December 8-17, 2020

#### <span style="color: orange;">Limited accessibility of Login node log1</span>

**Resolved**: Login node 'log1.wynton.ucsf.edu' can again be accessed from outside of the UCSF network.
<br><span class="timestamp">December 17, 14:20 PT</span>

**Notice**: Login node 'log1.wynton.ucsf.edu' is only accessible from within UCSF network. This is a side effect of the recent network upgrades. We are waiting for The UCSF IT Network to resolve this for us.  Until resolved, please use the alternative 'log2.wynton.ucsf.edu' login node when connecting from outside of the UCSF network.
<br><span class="timestamp">December 8, 23:00 PT</span>


### December 11-16, 2020

#### <span style="color: orange;">Rebooting compute nodes</span>

**Resolved**: All compute nodes have been rebooted.
<br><span class="timestamp">December 16, 05:00 PT</span>

**Notice**: The new BeeGFS setting introduced during the upgrades earlier this week caused problems throughout the system and we need to roll them back.  The compute nodes will no longer take on new jobs until they have been rebooted. A compute node will be automatically rebooted as soon as all of its running jobs have completed.  Unfortunately, we have to kill jobs that run on compute nodes that are stalled and suffer from the BeeGFS issues.
<br><span class="timestamp">December 11, 13:50 PT</span>


### December 11, 2020

#### <span style="color: orange;">Rebooting login and development nodes</span>

**Resolved**: All login and development nodes have been rebooted.
<br><span class="timestamp">December 12, 17:00 PT</span>

**Notice**: Login node 'log1.wynton.ucsf.edu' and all the development nodes will be rebooted at 4:30 PM today Friday.  This is needed in order to roll back the new BeeGFS setting introduced during the upgrades earlier this week.
<br><span class="timestamp">December 11, 13:50 PT</span>


### December 7-8, 2020

#### <span style="color: orange;">Major upgrades (full downtime)</span>

**Resolved**: The upgrade has been completed.  The cluster back online, including all of the login, data-transfer, and development nodes, as well as the majority of the compute nodes.  The scheduler is processing jobs again.  All hosts now run CentOS 7.9.
<br><span class="timestamp">December 8, 16:30 PT</span>

**Update**: The upgrade is paused and will resume tomorrow.  We hope to be bring all of the cluster back online by the end of tomorrow.  For now, login node 'log2' (but not 'log1'), and data-transfer nodes 'dt1', and 'dt2' are back online and can be used for accessing files.  Development nodes 'dev1' and 'dev3' are also available (please make sure to leave room for others).  The scheduler remains down, i.e. it is is not be possible to submit jobs.
<br><span class="timestamp">December 7, 17:00 PT</span>

**Update**: The upgrades have started.  Access to Wynton HPC has been disable as of 10:30 this morning.  The schedulers stopped launching queued jobs as of 23:30 last night.
<br><span class="timestamp">December 7, 10:30 PT</span>

**Revised notice**: We have decided to hold back on upgrading BeeGFS during
the downtime and only focus on the remain parts including operating system
and network upgrades.
The scope of the work is still non-trivial.  There is a risk that the
downtime will extend into Thursday December 10.  However, if everything go
smoothly, we hope that Wynton HPC will be back up by the end of Monday or
during the Tuesday.  There will only be one continuous downtime, that is,
when the cluster comes back up, it will stay up.
<br><span class="timestamp">December 3, 09:00 PT</span>

**Notice**: Starting early Monday December 7, the cluster will be powered down
entirely for maintenance and upgrades, which includes upgrading the operating
system, the network, and the BeeGFS file system.  We anticipate that the
cluster will be available again by the end of Tuesday December 8, when load
testing of the upgraded BeeGFS file system will start.  If these tests fail,
we will have to unroll the BeeGFS upgrade, which in case we anticipate that
the cluster is back online by the end of Wednesday December 9.
<br><span class="timestamp">November 23, 16:50 PT</span>

<!--
start: 2020-12-07T10:30:00
stop: 2020-12-08T16:30:00
length: 30 hours
severity: under-maintenance
affected: jobs, beegfs, compute, *
reason: scheduled
 -->


### November 4-16, 2020

#### <span style="color: orange;">Compute nodes not serving jobs (due to network switch failure)</span>

**Resolved**: All 74 compute nodes that were taken off the job scheduler on 2020-11-04 are back up and running
<br><span class="timestamp">November 16, 12:00 PT</span>

**Notice**: 74 compute nodes, including several GPU nodes, were taken off the job scheduler around 14:00 on 2020-11-04 due to a faulty network switch. The network switch needs to be replaced in order to resolve this.
<br><span class="timestamp">November 4, 16:10 PT</span>

<!--
start: 2020-11-04T16:50:00
stop: 2020-11-16T16:30:00
length: 360 hours
severity: partial-outage
affected: jobs, network, compute, ...
reason: external
 -->


### November 5, 2020

#### <span style="color: orange;">Cluster inaccessible (due to BeeGFS issues)</span>

**Resolved**: Our BeeGFS file system was non-responsive during 01:20-04:00 on 2020-11-05 because one of the meta servers hung.
<br><span class="timestamp">November 5, 08:55 PT</span>

<!--
start: 2020-11-05T01:20:00
stop: 2020-11-05T04:00:00
length: 3 hours
severity: major-outage
affected: jobs, beegfs, ...
reason: internal
 -->



### October 21, 2020

#### <span style="color: orange;">Cluster inaccessible (due to BeeGFS issues)</span>

**Resolved**: Our BeeGFS file system was non-responsive because one of its meta servers hung, which now has been restarted.
<br><span class="timestamp">October 21, 11:15 PT</span>

**Notice**: The cluster is currently inaccessible for unknown reasons. The problem was first reported around 09:30 today.
<br><span class="timestamp">October 21, 10:45 PT</span>

<!--
start: 2020-10-21T09:30:00
stop: 2020-10-21T11:15:00
length: 3.0 hours
severity: major-outage
affected: jobs, beegfs, ...
reason: internal
 -->


### August 19, 2020

#### <span style="color: orange;">Cluster inaccessible (due to BeeGFS issues)</span>

**Resolved**: Our BeeGFS file system was non-responsive between 17:22 and 18:52 today because one of its meta servers hung while the other attempted to synchronize to it.
<br><span class="timestamp">August 19, 19:00 PT</span>

**Notice**: The cluster is currently inaccessible for unknown reasons. The problem was first reported around 17:30 today.
<br><span class="timestamp">August 19, 18:15 PT</span>

<!--
start: 2020-08-19T17:22:00
stop: 2020-08-19T18:52:00
length: 1.5 hours
severity: major-outage
affected: jobs, beegfs, ...
reason: internal
 -->


### August 10-13, 2020

#### <span style="color: orange;">Network and hardware upgrades (full downtime)</span>

**Resolved**: The cluster is fully back up and running.  Several compute nodes still need to be rebooted but we consider this upgrade cycle completed.  The network upgrade took longer than expected, which delayed the processes.  We hope to bring the new lab storage online during the next week.
<br><span class="timestamp">August 13, 21:00 PT</span>

**Update**: All login, data-transfer, and development nodes are online.
Additional compute nodes are being upgraded and are soon part of the
pool serving jobs.
<br><span class="timestamp">August 13, 14:50 PT</span>

**Update**: Login node log1, data-transfer node dt2, and the development nodes
are available again.  Compute nodes are going through an upgrade cycle and
will soon start serving jobs again.  The upgrade work is taking longer than
expected and will continue tomorrow Thursday August 13.
<br><span class="timestamp">August 12, 16:10 PT</span>

**Notice**: All of the {{ site.cluster.name }} environment is down for maintenance
and upgrades.
<br><span class="timestamp">August 10, 00:00 PT</span>

**Notice**: Starting early Monday August 10, the cluster will be powered down
entirely for maintenance and upgrades, which includes upgrading the network
and adding lab storage purchased by several groups.  We anticipate that
the cluster will be available again by the end of Wednesday August 12.
<br><span class="timestamp">July 24, 15:45 PT</span>

<!--
start: 2020-08-10T00:00:00
stop: 2020-08-13T21:00:00
length: 93 hours
severity: under-maintenance
affected: jobs, beegfs, compute, *
reason: scheduled
 -->



### July 6, 2020

#### <span style="color: orange;">Development node failures</span>

**Resolved**: All three development nodes have been rebooted.
<br><span class="timestamp">July 6, 15:20 PT</span>

**Notice**: The three regular development nodes have all gotten themselves hung up on one particular process.  This affects basic system operations and preventing such basic commands as `ps` and `w`.  To clear this state, we'll be doing an emergency reboot of the dev nodes at about 15:15.
<br><span class="timestamp">July 6, 15:05 PT</span>


### July 5, 2020

#### <span style="color: orange;">Job scheduler non-working</span>

**Resolved**: The SGE scheduler produced errors when queried or when jobs were submitted or launched.  The problem started 00:30 and lasted until 02:45 early Sunday 2020-07-05.
<br><span class="timestamp">July 6, 22:00 PT</span>

<!--
start: 2020-07-06T00:30:00
stop: 2020-07-06T02:45:00
length: 2.0 hours
severity: partial-outage
affected: jobs, scheduler
reason: internal
 -->


### June 11-26, 2020

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: All compute nodes have been rebooted.
<br><span class="timestamp">June 26, 10:45 PT</span>

**Update**: Development node dev3 is back online.
<br><span class="timestamp">June 15, 11:15 PT</span>

**Update**: Development node dev3 is not available.  It failed to reboot and requires on-site attention, which might not be possible for several days.  All other log-in, data-transfer, and development nodes were rebooted successfully.
<br><span class="timestamp">June 11, 15:45 PT</span>

**Notice**: New operating-system kernels are deployed. Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). During this update period, there will be fewer than usual slots available on the queues. To follow the progress, see the green 'Available CPU cores' curve (target ~10,400 cores) in the graph above.  Log-in, data-transfer, and development nodes will be rebooted at 15:30 on Thursday June 11.
<br><span class="timestamp">June 11, 10:45 PT</span>


### June 5-9, 2020

#### <span style="color: orange;">No internet access on development nodes</span>

**Resolved**: Internet access from the development nodes is available again.  A new web-proxy server had to be built and deploy.
<br><span class="timestamp">June 9, 09:15 PT</span>

**Notice**: Internet access from the development nodes is not available.  This is because the proxy server providing them with internet access had a critical hardware failure around 08-09 this morning.  At the most, we cannot provide an estimate when we get to restore this server.
<br><span class="timestamp">June 5, 16:45 PT</span>


### May 18-22, 2020

#### <span style="color: orange;">File-system maintenance</span>

**Update**: The upgrade of the BeeGFS filesystem introduced new issues.
We decided to rollback the upgrade and we are working with the vendor.
There is no upgrade planned for the near term.
<br><span class="timestamp">June 8, 09:00 PT</span>

**Update**: The BeeGFS filesystem has been upgraded using a patch from the
vendor. The patch was designed to lower the amount of resynchronization needed
between the two metadata servers. Unfortunately, after the upgrade we observe
an increase of resynchronization.  We will keep monitoring the status.  If
the problem remains, we will consider a rollback to the BeeGFS version used
prior to May 18.
<br><span class="timestamp">May 22, 01:25 PT</span>

**Update**: For a short moment around 01:00 early Friday, both of our BeeGFS
metadata servers were down.  This may have lead to some applications
experiencing I/O errors around this time.
<br><span class="timestamp">May 22, 01:25 PT</span>

**Notice**: Work to improve the stability of the BeeGFS filesystem (`/wynton`)
will be conducted during the week of May 18-22. This involves restarting the
eight pairs of metadata server processes, which may result in several brief
stalls of the file system. Each should last less than 5 minutes and operations
will continue normally after each one.
<br><span class="timestamp">May 6, 15:10 PT</span>

<!--
start: 2020-05-22T01:00:00
stop: 2020-05-22T01:15:00
length: 0.5 hours
severity: partial-outage
affected: jobs, beegfs
reason: internal
 -->


### May 28-29, 2020

#### <span style="color: orange;">GPU compute nodes outage</span>

**Resolved**: The GPU compute nodes are now fully available to serve jobs.
<br><span class="timestamp">May 29, 12:00 PT</span>

**Update**: The GPU compute nodes that went down yesterday have been rebooted.
<br><span class="timestamp">May 29, 11:10 PT</span>

**Investigating**: A large number of GPU compute nodes in the MSG data center are currently down for unknown reasons.  We are investigating the cause.
<br><span class="timestamp">May 28, 09:35 PT</span>

<!--
start: 2020-05-28T09:35:00
stop: 2020-05-29T12:00:00
length: 26.5 hours
severity: partial-outage
affected: jobs, compute-gpu
reason: internal
 -->


### February 5-7, 2020

#### <span style="color: orange;">Major outage due to NetApp file-system failure</span>

**Resolved**: The {{ site.cluster.name }} system is considered fully functional again.  The legacy, deprecated NetApp storage was lost.
<br><span class="timestamp">February 10, 10:55 PT</span>

**Update**: The majority of the compute nodes have been rebooted and are now online and running jobs.  We will actively monitor the system and assess the how everything works before we considered this incident resolved.
<br><span class="timestamp">February 7, 13:40 PT</span>

**Update**: The login, development and data transfer nodes will be rebooted at 01:00 today Friday February 7.
<br><span class="timestamp">February 7, 12:00 PT</span>

**Update**: The failed legacy NetApp server is the cause to the problems, e.g. compute nodes not being responsive causing problems for SGE etc. Because of this, **all of the cluster - login, development, transfer, and computes nodes - will be rebooted tomorrow Friday 2020-02-07**.
<br><span class="timestamp">February 6, 10:00 PT</span>

**Notice**: {{ site.cluster.name }} is experience major issues due to NetApp file-system failure, despite this is being deprecated and not used much these days. The first user report on this came in around 09:00 and the job-queue logs suggests the problem began around 02:00.  It will take a while for everything to come back up and there will be brief BeeGFS outage while we reboot the BeeGFS management node.
<br><span class="timestamp">February 5, 10:15 PT</span>

<!--
start: 2020-02-05T10:15:00
stop: 2020-02-07T13:40:00
length: 51.5 hours
severity: major-outage
affected: jobs, compute, ...
reason: internal
 -->


### January 29, 2020

#### <span style="color: orange;">BeeGFS failure</span>

**Resolved**: The BeeGFS file-system issue has been resolved by rebooting two meta servers.
<br><span class="timestamp">January 29, 17:00 PT</span>

**Notice**: There's currently an issue with the BeeGFS file system.  Users reporting that they cannot log in.
<br><span class="timestamp">January 29, 16:00 PT</span>

<!--
start: 2020-01-29T16:00:00
stop: 2020-01-29T17:00:00
length: 1.0 hours
severity: major-outage
affected: jobs, beegfs, ...
reason: internal
 -->



### January 22, 2020

#### <span style="color: orange;">File-system maintenance</span>

**Resolved**: The BeeGFS upgrade issue has been resolved.
<br><span class="timestamp">Jan 22, 14:30 PT</span>

**Update**: The planned upgrade caused unexpected problems to the BeeGFS file system resulting in `/wynton/group` becoming unstable.
<br><span class="timestamp">Jan 22, 13:35 PT</span>

**Notice**: One of the BeeGFS servers, which serve our cluster-wide file system, will be swapped out starting at noon (11:59am) on Wednesday January 22, 2020 and the work is expected to last one hour.  We don't anticipate any downtime because the BeeGFS servers are mirrored for availability.
<br><span class="timestamp">Jan 16, 14:40 PT</span>

<!--
start: 2020-01-22T12:00:00
stop: 2020-01-22T14:30:00
length: 2.5 hours
severity: under-maintenance
affected: jobs, beegfs, *
reason: scheduled
 -->


### December 20, 2019 - January 4, 2020

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: All compute nodes have been updated and rebooted.
<br><span class="timestamp">Jan 4, 11:00 PT</span>

**Notice**: Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). During this update period, there will be fewer available slots on the queues than usual. To follow the progress, see the green 'Available CPU cores' curve (target ~7,500 cores) in the graph above.  Log-in, data-transfer, and development nodes will be rebooted at 15:30 on Friday December 20.  GPU nodes already run the new kernel and are not affected.
<br><span class="timestamp">December 20, 10:20 PT</span>
