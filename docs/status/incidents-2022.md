### Operational Summary for 2022 (this far)

* Full downtime:

  - Scheduled: 53.5 hours (= 2.3 days)
  - Unscheduled: 154 hours (= 6.4 days)
  - Total: 207.5 hours (= 8.6 days)
  - External factors: 23% of the above downtime, corresponding to 48 hours (=2.0 days), were due to external factors


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
  - 2022-03-28 (1 hours): Major BeeGFS issues
  - 2022-03-26 (5 hours): Major BeeGFS issues
  - 2022-03-18 (100 hours): Major BeeGFS issues
* Total downtime: 106.0 hours of which 0 hours were due to external factors

#### Unscheduled downtimes due to other reasons

* Impact: Less compute resources
* Damage: Running jobs (<= 14 days) may have failed, file-transfers may have failed, cluster not accessible
* Occurrences:
  - 2022-03-26 (48 hours): Data-center cooling issues
* Total downtime: 48 hours of which 48 hours were due to external factors



### March 26, 2022

#### <span style="color: orange;">Job scheduler is disabled due to cooling issues</span>

**Resolved**: The compute nodes and the job scheduler are up and running again.
<br><span class="timestamp">March 26, 11:00 PDT</span>

**Notice**: The job scheduler as disabled and running jobs where terminated on Saturday 2022-03-26 around 09:00. This was done due to an emergency shutdown because the ambient temperature in the data center started to rise around 08:00 and at 09:00 it hit the critical level, where our monitoring system automatically shuts down compute nodes to prevent further damage. This resulted in the room temperature coming down to normal levels again. We are waiting on UCSF Facilities to restore cooling in the data center.
<br><span class="timestamp">March 26, 10:30 PDT</span>

<!--
start: 2022-03-26T03:00:00
stop: 2022-03-26T09:00:00
length: 6 hours
severity: major-outage
affected: jobs
reason: external
 -->




### March 26, 2022

#### <span style="color: orange;">Major BeeGFS issues</span>

**Resolved**: Just after 03:00 on Saturday 2022-03-26 morning BeeGFS hung. Recover actions were taken at 07:30 and the problem was resolved before 08:00. We have tracked down the problem occur when a user runs more than one `rm -r /wynton/path/to/folder` concurrently on the same folder. This is a bug in BeeGFS that vendors is aware of.
<br><span class="timestamp">March 26, 10:30 PDT</span>

<!--
start: 2022-03-26T03:00:00
stop: 2022-03-26T08:00:00
length: 5.0 hours
severity: major-outage
affected: jobs, beegfs, compute
reason: beegfs
 -->


### March 18-22, 2022

#### <span style="color: orange;">Job scheduler is disabled because of BeeGFS issues</span>

**Resolved**: We have re-enabled the job scheduler, which now processes all queued jobs. We will keep working with the BeeGFS vendor to find a solution to avoid this issue from happening again.
<br><span class="timestamp">March 22, 16:30 PDT</span>

**Update**: The BeeGFS issue has been identified. We identified a job that appears to trigger a bug in BeeGFS, which we can reproduce. The BeeGFS vendor will work on a bug fix. The good news is that the job script that triggers the problem can be tweaked to avoid hitting the bug. This means we can enable the job scheduler as soon as all BeeGFS metadata servers have synchronized, which we expect to take a few hours.
<br><span class="timestamp">March 22, 12:00 PDT</span>

**Update**: The BeeGFS file system troubleshooting continues. The job queue is still disabled. You might experience login and non-responsive prompt issues while we troubleshoot this. We have met with the BeeGFS vendors this morning and we are collecting debug information to allow them to troubleshoot the problem on their end. At the same time, we hope to narrow in on the problem further on our end by trying to identify whether there is a particular job or software running on the queue that might cause this. Currently, we have no estimate when this problem will be fixed. We have another call scheduled with the vendor tomorrow morning.
<br><span class="timestamp">March 21, 11:45 PDT</span>

**Update**: The BeeGFS file system is back online and the cluster can be accessed again. However, we had to put SGE in maintenance mode, which means no jobs will be started until the underlying problem, which is still unknown, has been identified and resolved.  The plan is to talk to the BeeGFS vendor as soon as possible after the weekend.  Unfortunately, in order to stabilize BeeGFS, we had to kill, at 16:30 today, all running jobs and requeue them on the SGE job scheduler. They are now listed as status 'Rq'. For troubleshooting purposes, please do _not_ delete any of your 'Rq' jobs.
<br><span class="timestamp">March 18, 17:05 PDT</span>

**Notification**: The Wynton environment cannot be accessed at the moment. This is because the global file system, BeeGFS, is experiencing issues. The problem, which started around 11:45 today, is being investigated.
<br><span class="timestamp">March 18, 11:55 PDT</span>

<!--
start: 2022-03-18T11:45:00
stop: 2022-03-22T15:45:00
length: 100.0 hours
severity: major-outage
affected: jobs, beegfs, compute
reason: beegfs
 -->


### March 14-15, 2022

#### <span style="color: orange;">Brief network outage</span>

**Noticed**: UCSF Network IT will be performing maintenance on several network switches in the evening and overnight on Monday March 14.  This will _not_ affect jobs running on the cluster. One of the switches is the one which provides Wynton with external network access. When that switch is rebooted, Wynton will be inaccessible for about 15 minutes. This is likely to happen somewhere between 22:00 and 23:00 that evening, but the outage window extends from 21:00 to 05:00 the following morning, so it could take place anywhere in that window.
<br><span class="timestamp">March 11, 10:15 PST</span>


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

