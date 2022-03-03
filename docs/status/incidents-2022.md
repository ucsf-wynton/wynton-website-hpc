### Operational Summary for 2022 (this far)

* Full downtime:

  - Scheduled: 53.5 hours (= 2.3 days)
  - Unscheduled: 0 hours (= 0.0 days)
  - Total: 53.5 hours (= 2.3 days)
  - External factors: 0% of the above downtime, corresponding to 0 hours (=0.0 days), were due to external factors


#### Scheduled maintenance downtimes

* Impact: No file access, no compute resources available
* Damage: None
* Occurrences:
  - 2022-02-08 (53.5 hours)
* Total downtime: 53.5 hours

#### Scheduled kernel maintenance

* Impact: Fewer compute nodes than usual until rebooted
* Damage: None
* Occurrences:

#### Unscheduled downtimes due to power outage

* Impact: No file access, no compute resources available
* Damage: Running jobs (<= 14 days) failed, file-transfers failed, possible file corruptions
* Occurrences:
  - N/A
* Total downtime: 0 hours of which 0 hours were due to external factors
  
#### Unscheduled downtimes due to file-system failures

* Impact: No file access
* Damage: Running jobs (<= 14 days) may have failed, file-transfers may have failed, cluster not accessible
* Occurrences:
  - N/A
* Total downtime: 0 hours of which 0 hours were due to external factors

#### Unscheduled downtimes due to other reasons

* Impact: Less compute resources
* Damage: Running jobs (<= 14 days) may have failed, file-transfers may have failed, cluster not accessible
* Occurrences:
  - N/A
* Total downtime: 0 hours of which 0 hours were due to external factors


### February 28-March 2, 2022

#### <span style="color: orange;">Full downtime</span>

**Resolved**: Wynton is available again.
<br><span class="timestamp">March 2, 15:30 PST</span>

**Update**: The Wynton environment is now offline for maintenance work.
<br><span class="timestamp">February 28, 10:00 PST</span>

**Clarification**: The shutdown will take place early Monday morning February 28, 2022.  Also, this is on a Monday and not on a Tuesday (as previously written below).
<br><span class="timestamp">February 22, 11:45 PST</span>

**Update**: We confirm that this downtime will take place as scheduled.
<br><span class="timestamp">February 14, 15:45 PST</span>

**Notice**: We are planning a full file-system maintenance starting on ~~Tuesday~~ Monday February 28, 2022.  As this requires a full shutdown of the cluster environment, we will start decreasing the job queue, on February 14, two weeks prior to the shutdown. On February 14, jobs that requires 14 days or less to run will be launched. On February 15, only jobs that requires 13 days or less will be launched, and so on until the day of the downtime. Submitted jobs that would go into the downtime window if launched, will only be launched after the downtime window.
<br><span class="timestamp">November 22, 11:45 PST</span>


<!--
start: 2022-02-28T10:00:00
stop: 2022-03-02T15:30:00
length: 53.5 hours
severity: under-maintenance
affected: jobs, beegfs, compute, *
reason: scheduled
 -->

