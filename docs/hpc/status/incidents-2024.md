### Operational Summary for 2024 (this far)

* Full downtime:

  - Scheduled: 0.0 hours (= 0.0 days)
  - Unscheduled: 30.3 hours (= 1.3 days)
  - Total: 0.0 hours (= 0.0 days)
  - External factors: 0% of the above downtime, corresponding to 0.0
    hours (= 0.0 days), were due to external factors

#### Scheduled maintenance downtimes

* Impact: No file access, no compute resources available
* Damage: None
* Occurrences:
  - N/A
* Total downtime: 0.0 hours

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
* Total downtime: 30.3 hours of which 0.0 hours were due to external
  factors

#### Unscheduled downtimes due to other reasons

* Impact: Less compute resources
* Damage: Running jobs (<= 14 days) may have failed, file-transfers
  may have failed, cluster not accessible
* Occurrences:
  - N/A
* Total downtime: 0.0 hours of which 0.0 hours were due to external
  factors



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

