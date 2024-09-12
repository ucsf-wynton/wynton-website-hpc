### Operational Summary for 2024 (this far)

* Full downtime:

  - Scheduled: 32.0 hours (= 1.3 days)
  - Unscheduled: 142.3 hours (= 5.9 days)
  - Total: 174.3 hours (= 7.3 days)
  - External factors: 0% of the above downtime, corresponding to 0.0
    hours (= 0.0 days), were due to external factors

#### Scheduled maintenance downtimes

* Impact: No file access, no compute resources available
* Damage: None
* Occurrences:
  - 2024-06-17 -- 2024-06-18 (32.0 hours)
* Total downtime: 32.0 hours

#### Scheduled kernel maintenance

* Impact: Fewer compute nodes than usual until rebooted
* Damage: None
* Occurrences:
  - 2024-04-03 (~500 hours)

#### Unscheduled downtimes due to power outage

* Impact: No file access, no compute resources available
* Damage: Running jobs (<= 14 days) failed, file-transfers failed,
  possible file corruptions
* Occurrences:
  - N/A
* Total downtime: 0.0 hours of which 0.0 hours were due to external
  factors
  
#### Unscheduled downtimes due to file-system failures

* Impact: No file access
* Damage: Running jobs (<= 14 days) may have failed, file-transfers
  may have failed, cluster not accessible
* Occurrences:
  - 2024-03-14 (13.0 hours)
  - 2024-03-17 (15.0 hours)
  - 2024-05-31  (2.3 hours)
  - 2024-06-15 -- 2024-06-21 (112.0 hours; excluding 32 hours scheduled maintenance)
* Total downtime: 142.3 hours of which 0.0 hours were due to external
  factors

#### Unscheduled downtimes due to other reasons

* Impact: Less compute resources
* Damage: Running jobs (<= 14 days) may have failed, file-transfers
  may have failed, cluster not accessible
* Occurrences:
  - N/A
* Total downtime: 0.0 hours of which 0.0 hours were due to external
  factors


### September 12, 2024

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: All interactive nodes have been updated and deployed with the new CGroups limits.
<br><span class="timestamp">September 13, 13:00 PT</span>

**Notice**: All interactive nodes will be shutdown and rebooted on Thursday September 12 at 12:30 to update Linux kernels and deploy CGroups-controlled CPU and memory user limits. To avoid data loss, please save your work and logout before. Queued and running jobs are not affected.
<br><span class="timestamp">September 11, 09:15 PT</span>


### June 15-25, 2024

#### <span style="color: orange;">File-system unreliable</span>

**Resolved**: 14,000 compute slots are now available, which
corresponds to the majority of compute nodes.
<br><span class="timestamp">June 25, 00:30 PT</span>

**Update**: We will go ahead and re-enable the remaining compute 
nodes.
<br><span class="timestamp">June 24, 13:00 PT</span>

**Update**: Development nodes are available. We have also opened up
100 compute nodes. We will keep monitoring BeeGFS over the weekend
with the plan to re-enable the remaining compute nodes if all go well.
<br><span class="timestamp">June 21, 19:15 PT</span>

**Update**: The login and data-transfer nodes are available. We will
continue to validate BeeGFS during the day with the intent to open up
the development nodes and a portion of the compute nodes before the
weekend.
<br><span class="timestamp">June 21, 12:45 PT</span>

**Update**: We decided to replace the problematic chassis with a
spare. The RAID file system has two failing drives, which are
currently being restored. We expect this to finish up in the
morning. Then, we will replace those two failing drives and proceed
with another restore. If that succeeds, we plan to open up the login
nodes to make files available again. After that, the goal is to slowly
open up the queue and compute nodes over the weekend.
<br><span class="timestamp">June 20, 23:30 PT</span>

**Update**: We had folks onsite today to complete some preventative
maintenance on all of the disk chassis (and, in a fit of optimism,
bring up all of the nodes to prepare for a return to production).  As
this maintenance involved new firmware, we had some hope that it might
sort out our issues with the problematic chassis.  Unfortunately, our
testing was still able to cause an issue (read: crash). We've sent
details from this latest crash to the vendor and we'll be pushing hard
to work with them tomorrow Thursday to sort things out.
<br><span class="timestamp">June 20, 00:15 PT</span>

**Update**: The vendor is still working on diagnosing our disk chassis
issue.  That work will resume after Wednesday's holiday.  So,
unfortunately, we will not be able to bring Wynton up on Wednesday.
We hope to come up on Thursday, but it all depends on our testing and
the vendor's investigation.
<br><span class="timestamp">June 19, 01:00 PT</span>

**Update**: We are working with both the system and chassis vendors to
diagnose this and determine what the problem is and how to fix
it. This process is taking much longer than we'd like, and it is
looking increasingly unlikely that we'll be in a position to bring
Wynton back online today.
<br><span class="timestamp">June 18, 14:00 PT</span>

**Update**: A disk chassis that hosts part of `/wynton/home` appears
to be failing. It works for a while and then fails, which brings down
`/wynton`.  We are trying to keep it running as much as possible, but
can't make any promises.
<br><span class="timestamp">June 16, 00:15 PT</span>

**Notice**: Wynton is currently down due to an unknown issue. The
problem started around 15:00 on Saturday 2024-06-15.
<br><span class="timestamp">June 15, 23:15 PT</span>

<!--
start: 2024-06-15T15:00:00
stop: 2024-06-21T19:00:00
length: 144 hours - 32.0 hours scheduled maintenance = 112 hours
severity: major-outage
affected: jobs, beegfs, compute, *
reason: beegfs
 -->


### June 17-18, 2024

#### <span style="color: orange;">Full downtime</span>

**Update**: All but one of the planned maintenance upgrades were
completed during this scheduled maintenance. The remain upgrade does
not require a downtime and will be done in a near future without
disrupting the cluster.
<br><span class="timestamp">June 18, 17:00 PT</span>

**Update**: Wynton is down for maintenance as of 09:00 on Monday
2024-06-17.
<br><span class="timestamp">June 17, 09:00 PT</span>

**Notice**: The cluster will be shut down for maintenance from 9 pm on Monday June 17 until 5:00 pm on Tuesday June 18, 2024. Starting June 3, the maximum job runtime will be decreased on a daily basis from the current 14 days so that jobs finish in time. Jobs with runtimes going into the maintenance window, will be started after the downtime.
<br><span class="timestamp">June 5, 09:00 PT</span>

<!--
comment: Scheduled downtime
start: 2024-06-17T09:00:00
stop: 2024-06-18T17:00:00
length: 32 hours
severity: under-maintenance
affected: jobs, beegfs, compute, *
reason: scheduled
 -->


### June 7-June 10, 2024

#### <span style="color: orange;">Development nodes are inaccessible</span>

**Resolved**: Development nodes are available again.
<br><span class="timestamp">June 10, 10:25 PT</span>

**Notice**: Development nodes are inaccessible since Friday June 7
at 17:00. We will investigate the problem on Monday.
<br><span class="timestamp">June 8, 05:45 PT</span>

<!--
start: 2024-06-07T17:05:00
stop: 2024-06-10T10:25:00
length: 65.0 hours
severity: major
affected: development-nodes
reason: unknown
 -->


### May 31, 2024

#### <span style="color: orange;">File-system failures</span>

**Resolved**: The BeeGFS issue has been resolved. Wynton is
operational again.
<br><span class="timestamp">May 31, 09:20 PT</span>

**Notice**: Wynton is currently down due to an unknown issue with the
BeeGFS filesystem. The problem started around 06:00. We're working on
it and will post updates as we know more.
<br><span class="timestamp">May 31, 08:45 PT</span>

<!--
start: 2024-05-31T07:00:00
stop: 2024-05-31T09:20:00
length: 2.3 hours
severity: major-outage
affected: jobs, beegfs, compute, *
reason: beegfs
 -->


### April 3-25, 2024

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: All compute nodes have been rebooted.
<br><span class="timestamp">April 25, 09:00 PT</span>

**Update**: Login, data-transfer, and development nodes have been rebooted.
<br><span class="timestamp">April 4, 11:15 PT</span>

**Update**: A new set of kernel updates will be rolled out.  Login, data-transfer, and development nodes will be rebooted briefly on Thursday April 11 at 11:00.  All compute nodes will also have to be drained and rebooted, which might take up to two weeks. Some of the compute have been draining since last week, meaning that will only have been drain for at most another week.
<br><span class="timestamp">April 10, 16:00 PT</span>

**Update**: Hosts `dt1` and `plog1` are now also available.
<br><span class="timestamp">April 4, 12:15 PT</span>

**Update**: Login, data-transfer, and development nodes have been rebooted. It will take some more time before `dt1` and `plog1` are available again, because they did not come back as expected after the reboot.
<br><span class="timestamp">April 4, 11:15 PT</span>

**Notice**: New operating-system kernels are deployed. Login, data-transfer, and development nodes will be rebooted on Thursday April 4 at 11:00. Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). During this update period, there will be fewer than usual slots available on the queues.
<br><span class="timestamp">April 3, 17:30 PT</span>


### March 17-18, 2024

#### <span style="color: orange;">File-system failures</span>

**Resolved**: Wynton and BeeGFS is back up and running again after a
full reboot of the BeeGFS servers. Root cause is still unknown.
<br><span class="timestamp">March 18, 10:30 PT</span>

**Notice**: Wynton is currently down due to an unknown BeeGFS
issues. The problem started around 19:30 on 2024-03-17. We're working
on it and will post updates as we know more.
<br><span class="timestamp">March 18, 09:00 PT</span>

<!--
start: 2024-03-17T19:30:00
stop: 2024-03-18T10:30:00
length: 15.0 hours
severity: major-outage
affected: jobs, beegfs, compute, *
reason: beegfs
 -->


### March 14, 2024

#### <span style="color: orange;">File-system failures</span>

**Resolved**: Wynton and BeeGFS is back up and running again after a
full reboot of the BeeGFS servers. Root cause is still unknown.
<br><span class="timestamp">March 14, 15:15 PT</span>

**Notice**: Wynton is currently down due to an unknown issue with the
BeeGFS filesystem. The problem started at 02:11 this morning. We're
working on it and will post updates as we know more.
<br><span class="timestamp">March 14, 09:15 PT</span>

<!--
start: 2024-03-14T02:11:00
stop: 2024-03-14T15:15:00
length: 13.0 hours
severity: major-outage
affected: jobs, beegfs, compute, *
reason: beegfs
 -->

