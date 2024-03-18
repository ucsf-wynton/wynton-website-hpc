### Operational Summary for 2024 (this far)

* Full downtime:

  - Scheduled: 0.0 hours (= 0.0 days)
  - Unscheduled: 13.0 hours (= 0.5 days)
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
  - 2024-03-14 (13.0 hours)
* Total downtime: 13.0 hours of which 0.0 hours were due to external
  factors

#### Unscheduled downtimes due to other reasons

* Impact: Less compute resources
* Damage: Running jobs (<= 14 days) may have failed, file-transfers
  may have failed, cluster not accessible
* Occurrences:
  - N/A
* Total downtime: 0.0 hours of which 0.0 hours were due to external
  factors


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

