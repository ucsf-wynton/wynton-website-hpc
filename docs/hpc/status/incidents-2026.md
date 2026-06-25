### Operational Summary for 2026 (this far)

* Full downtime:

  - Scheduled: 22.0 hours (= 0.9 days)
  - Unscheduled: 69.25 hours (= 2.9 days)
  - Total: 118.25 hours (= 4.9 days)
  - External factors: 99% of the above downtime, corresponding to 117.0
    hours (= 4.9 days), were due to external factors

* Partial downtime:

  - Scheduled: 0.0 hours (= 0.0 days)
  - Unscheduled: 39.5 hours (= 1.6 days)
  - Total: 39.5 hours (= 1.6 days)
  - External factors: 0% of the above downtime, corresponding to 0.0
    hours (= 0.0 days), were due to external factors


#### Scheduled maintenance downtimes

* Impact: No file access, no compute resources available
* Damage: None
* Occurrences:
  - 2026-06-23 -- 2026-06-24 (22.0 hours)
* Total downtime: 22.0 hours


#### Scheduled kernel maintenance

* Impact: Fewer compute nodes than usual until rebooted
* Damage: None
* Occurrences:
  - N/A


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
  - 2026-01-01 -- 2026-01-05 (95.0 hours)
  - 2026-01-07 (1.25 hours)
  - 2026-01-15 -- 2026-01-16 (12.5 hours) [partial]
  - 2026-01-25 -- 2026-01-27 (27.0 hours) [partial]
  - 2026-02-20 -- 2026-03-24 (238.75 hours) [partial]
  
* Total downtime: 374.5 hours of which 95.0 hours were due to external
  factors


#### Unscheduled downtimes due to other reasons

* Impact: Less compute resources
* Damage: Running jobs (<= 14 days) may have failed, file-transfers
  may have failed, cluster not accessible
* Occurrences:
  - N/A
* Total downtime: 0.0 hours of which 0.0 hours were due to external
  factors



### February 20-March 24, 2026

#### <span class="incident-title">BeeGFS storage outage</span>

**Resolved**: All BeeGFS storage servers are now fully functional.
<br><span class="timestamp">March 24, 07:30 PT</span>

**Notice**: One pool on BeeGFS storage server bss16 is offline.
<br><span class="timestamp">March 12, 13:00 PT</span>

**Notice**: All BeeGFS storage servers are available again.
<br><span class="timestamp">March 10, 18:00 PT</span>

**Notice**: BeeGFS storage servers bss15 and bss16 are experiencing
issues again. This affects some users' group storage resulting in
stalled file access and possible timeouts.
<br><span class="timestamp">March 3, 18:45 PT</span>

**Notice**: All BeeGFS storage servers are stable again.
<br><span class="timestamp">March 3, 13:15 PT</span>

**Notice**: BeeGFS storage servers bss15 and bss16 are experiencing
issues. This affects some users' group storage resulting in stalled
file access and possible timeouts.
<br><span class="timestamp">March 2, 15:15 PT</span>

**Notice**: Jobs and the job queue have been resumed. The status of
BeeGFS metadata and storage servers is now all okay. We will keep
monitoring the file system as load is ramping up.
<br><span class="timestamp">February 28, 18:00 PT</span>

**Notice**: Status quo - all jobs and the job queue remain suspended.
A definitive root cause has not yet been identified. In the meanwhile,
storage drive pairs keep being re-synchronized.
<br><span class="timestamp">February 27, 10:30 PT</span>

**Notice**: All jobs and the job queue are suspended. The Wynton Team
is working with support vendors and the UCSF networking team to
troubleshoot.
<br><span class="timestamp">February 24, 18:00 PT</span>

**Notice**: Jobs and the job queue have been resumed. The root cause
is still being investigated. There is a risk for subsequential file
system issues resulting in job hanging.
<br><span class="timestamp">February 23, 17:45 PT</span>

**Notice**: All jobs and the job queue remain suspended. The Wynton Team
is working on this as a top priority.
<br><span class="timestamp">February 23, 10:30 PT</span>

**Notice**: The Wynton Team has been working throughout the weekend to
monitor and mitigate issues with the BeeGFS storage servers.
<br><span class="timestamp">February 23, 09:30 PT</span>

**Notice**: All jobs have been paused. They will be automatically
resumed when the file system is stable again.
<br><span class="timestamp">February 20, 21:30 PT</span>

**Notice**: BeeGFS is experiencing issues since Friday at 17:55.
<br><span class="timestamp">February 20, 19:00 PT</span>

<!--
period: 2026-02-20T17:45:00/2026-02-23T17:45:00 (72.0 hours)
period: 2026-03-03T18:45:00/2026-03-10T18:30:00 (166.75 hours)
period: 2026-03-13T13:00:00/2026-03-24T07:30:00 (258.5 hours; partial)
total_length: 238.75 hours (excluding the 258.5 hours of partial avaialbility)
severity: minor-outage
affected: beegfs, jobs, hosts
reason: beegfs
 -->


### January 25-27, 2026

#### <span class="incident-title">Partial BeeGFS storage failure</span>

**Update**: One section (bss9) of the BeeGFS file system went offline
since 17:45 on 2026-01-26. It was resolved on 2026-01-27 at 08:15.
Users experiences errors such as "Communication error on send".
<br><span class="timestamp">January 26, 08:30 PT</span>

**Update**: One section (bss16) of the BeeGFS file system went offline
since 20:15 on 2026-01-25. It was resolved on 2026-01-26 at
08:15. Users experiences errors such as "Communication error on send".
<br><span class="timestamp">January 25, 08:30 PT</span>

<!--
period: 2026-01-25T20:15:00/2026-01-26T08:45:00 (12.5 hours)
period: 2026-01-26T17:45:00/2026-01-27T08:15:00 (14.5 hours)
total_length: 27.0 hours
severity: minor-outage
affected: beegfs, jobs, hosts
reason: beegfs
 -->


### January 15-16, 2026

#### <span class="incident-title">Partial BeeGFS storage failure</span>

**Update**: All of the BeeGFS file system is available again.
<br><span class="timestamp">January 15, 09:45 PT</span>

**Notice**: One section (bss16) of the BeeGFS file system is offline
since 00:00 on 2026-01-26.
<br><span class="timestamp">January 16, 09:15 PT</span>

**Update**: All of the BeeGFS file system is available again.
<br><span class="timestamp">January 15, 09:30 PT</span>

**Notice**: Two sections (bss6 and bss16) of the BeeGFS file system
are offline since 06:45-07:00 this morning.
<br><span class="timestamp">January 15, 08:30 PT</span>

<!--
period: 2026-01-15T06:45:00/2026-01-15T09:30:00 (2.75 hours)
period: 2026-01-16T00:00:00/2026-01-16T09:45:00 (9.75 hours)
total_length: 12.5 hours
severity: minor-outage
affected: beegfs, jobs, hosts
reason: beegfs
 -->


### January 7, 2026

#### <span class="incident-title">BeeGFS issue</span>

**Resolved**: BeeGFS issues are resolved after rebooting a storage
server. This incidents requires some resynchronization, which will
induce some lagginess until finished.
<br><span class="timestamp">January 7, 12:50 PT</span>

**Notice**: BeeGFS experiences issues.
<br><span class="timestamp">January 7, 11:35 PT</span>

<!--
start: 2026-01-07T11:35:00
stop: 2026-01-07T12:50:00
length: 1.25 hours
severity: major
affected: beegfs
reason: unscheduled
 -->


### January 1-5, 2026

#### <span class="incident-title">Cluster unavailable</span>

**Resolved**: All interactive nodes but `pdt1` are available. We
consider the original incident resolved.
<br><span class="timestamp">January 7, 9:30 PT</span>

**Update**: Interactive nodes `log1`, `dt1`, and `plog1` are available
again. Th
<br><span class="timestamp">January 6, 15:00 PT</span>

**Update**: The cluster is resumed, except interactive nodes `log1`,
`dt1`, `plog1`, and `pdt1`.
<br><span class="timestamp">January 5, 14:30 PT</span>

**Update**: Wynton jobs are paused until a network switch issue can be
addressed on Monday 2026-01-05. Users can still log in, but will not
be able to run jobs. The cluster will be shut down (no logins) on
Monday morning at 09:00 with a plan to make it available again the
same evening, but the outage may extend through Tuesday afternoon.
<br><span class="timestamp">January 2, 17:45 PT</span>

**Update**: The cluster will be sporadically unavailable for extended
periods of time due to ongoing BeeGFS resynchronization.
<br><span class="timestamp">January 2, 14:30 PT</span>

**Update**: The cluster is available, except interactive nodes `log1`,
`dt1`, and `pdt1`. Jobs are suspended until BeeGFS resynchronizations
have stabilized.
<br><span class="timestamp">January 2, 10:30 PT</span>

**Notice**: The cluster is unavailable since 2026-01-01 15:30. It is
not possible to access the login or the data-transfer nodes.  Initial
investigation suggests that network issues caused BeeGFS issues.
<br><span class="timestamp">January 2, 09:45 PT</span>

<!--
start: 2026-01-01T15:30:00
stop: 2026-01-05T14:30:00
length: 95.0 hours
severity: major-outage
affected: beegfs, jobs, hosts
reason: beegfs, network, external
 -->
