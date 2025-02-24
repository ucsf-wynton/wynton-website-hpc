### Operational Summary for 2025 (this far)

* Full downtime:

  - Scheduled: 0.0 hours (= 0.0 days)
  - Unscheduled: 83.0 hours (= 3.5 days)
  - Total: 83.0 hours (= 3.5 days)
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
  - 2025-01-17 -- 2025-01-22 (81.75 hours)
* Total downtime: 81.75 hours of which 0.0 hours were due to external
  factors

#### Unscheduled downtimes due to other reasons

* Impact: Less compute resources
* Damage: Running jobs (<= 14 days) may have failed, file-transfers
  may have failed, cluster not accessible
* Occurrences:
  - N/A
* Total downtime: 0.0 hours of which 0.0 hours were due to external
  factors


### February 22-24, 2025

#### <span style="color: orange;">Globus issues</span>

**Resolved**: The ‘Wynton HPC’ Globus endpoint used by non-PHI users
is available again after data-transfer node `dt1` coming online.
<br><span class="timestamp">February 24, 2025, 10:30 PT</span>

**Notice**: The ‘Wynton HPC’ Globus endpoint used by non-PHI users is
unavailable, because data-transfer node `dt1` is unavailable.
<br><span class="timestamp">February 22, 2025, 13:30 PT</span>


### February 18-24, 2025

#### <span style="color: orange;">Globus issues</span>

**Resolved**: The 'Wynton HPC UCSF Box Connector' for Globus and the
'Wynton HPC PHI Compatible' Globus endpoint are functional again.
<br><span class="timestamp">February 24, 2025, 09:30 PT</span>

**Update**: The vendor has escalated our support ticket.
<br><span class="timestamp">February 19, 2025, 13:30 PT</span>

**Notice**: The 'Wynton HPC UCSF Box Connector' for Globus and the
'Wynton HPC PHI Compatible' Globus endpoint are currently
unavailable. The former gives an error on "Unknown user or wrong
password", and the latter "Authentication Required - Identity set
contains an identity from an allowed domain, but it does not map to a
valid username for this connector". The regular 'Wynton HPC' Globus
endpoint is unaffected and available. The problem has been there since
at least 2025-02-14 at 22:36, when I user reported it.
<br><span class="timestamp">February 19, 2025, 12:00 PT</span>


### January 17-22, 2025

#### <span style="color: orange;">Cluster unavailable</span>

**Resolved**: Wynton is fully operational again. The BeeGFS file
system issue has been resolved. All data consistency has been
verified. Working with the vendor, we have identified a potential bug
in the BeeGFS quota system that caused the BeeGFS outage. That part is
still under investigation in order to minimize and remove the risk of
reoccurrence.
<br><span class="timestamp">January 22, 12:15 PT</span>

**Update**: The login and data-transfer nodes are available again.
<br><span class="timestamp">January 22, 11:00 PT</span>

**Update**: The third resynchronization completed successfully.
<br><span class="timestamp">January 21, 18:30 PT</span>

**Update**: Further investigation of the failed resynchronization this
morning indicated that the resynchronization did indeed keep running
while it stopped producing any output and the underlying BeeGFS
service was unresponsive. Because of this, we decided to not restart
the resynchronization, but instead let it continue in the hope it will
finish. But, by not restarting, Wynton will remain inaccessible. Our
first objective is to not jeopardize the cluster, the second objective
is to bring the system back online.
<br><span class="timestamp">January 21, 15:15 PT</span>

**Update**: The cluster is unavailable again. The past
resynchronization of the problematic BeeGFS metadata server failed
again, which triggers the problem. We are communicating with the
vendor for their support.
<br><span class="timestamp">January 21, 09:45 PT</span>

**Update**: The cluster is available again, but the scheduler has been
paused. No queued jobs are launched and running jobs have been
suspended, but will resume when the pause of scheduler is
removed. This is done to minimize the load on BeeGFS, which will
simplify troubleshooting and increase the chances to stabilize
BeeGFS. It is the same BeeGFS metadata server as before that is
experiencing problems.
<br><span class="timestamp">January 19, 13:45 PT</span>

**Update**: The cluster is unavailable again.
<br><span class="timestamp">January 19, 12:45 PT</span>

**Update**: The cluster is working again. We have started a
resynchronization of the problematic BeeGFS metadata server.
<br><span class="timestamp">January 18, 13:45 PT</span>

**Update**: First signs of the cluster coming back online again,
e.g. queued jobs are launched, and it is possible to access the
cluster via SSH.
<br><span class="timestamp">January 18, 06:00 PT</span>

**Update**: Identifies a specific BeeGFS metadata server that is
unresponsive. The BeeGFS vendor has been contacted.
<br><span class="timestamp">January 18, 01:00 PT</span>

**Update**: The underlying problem appears to be BeeGFS. The storage
servers are okay, but one or more metadata servers are unresponsive.
<br><span class="timestamp">January 17, 21:30 PT</span>

**Notice**: The cluster is unavailable, e.g. i is not possible to
access the login or the data-transfer nodes.
<br><span class="timestamp">January 17, 19:45 PT</span>

<!--
## When BeeGFS was down
start: 2025-01-21T09:45:00
stop: 2025-01-22T12:15:00
length: 27h30m
severity: major-outage
affected: beegfs
reason: beegfs

## When BeeGFS was down
start: 2025-01-19T12:45:00
stop: 2025-01-19T13:45:00
length: 1h00m
severity: major-outage
affected: beegfs
reason: beegfs

## When scheduler was down
start: 2025-01-19T12:45:00
stop: 2025-01-22T12:15:00
length: 71h30m
severity: major-outage
affected: jobs, beegfs, compute, *
reason: beegfs

## When scheduler was down
start: 2025-01-17T19:45:00
stop: 2025-01-18T06:00:00
length: 10h15m
severity: major-outage
affected: jobs, beegfs, compute, *
reason: beegfs

## total length on scheduler being down due to BeeGFS: 81h45m
 -->


### January 9, 2025

#### <span style="color: orange;">File-system emergency shutdown</span>

**Resolved**: The cluster full operational again. Suspended jobs have
been resumed. The BeeGFS issue has been resolved. Checked hardware and
cables. Rebooted affected BeeGFS server.
<br><span class="timestamp">January 9, 16:20 PT</span>

**Notice**: An issue with BeeGFS was detected. All Wynton jobs have
been paused until further notice.
<br><span class="timestamp">January 9, 15:10 PT</span>

<!--
start: 2025-01-09T15:10:00
stop: 2025-01-09T16:20:00
length: 1.2 hours
severity: major-outage
affected: jobs, beegfs, compute, *
reason: beegfs
 -->

