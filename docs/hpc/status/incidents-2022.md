### Operational Summary for 2022

* Full downtime:

  - Scheduled: 94.0 hours = 3.9 days = 1.1%
  - Unscheduled: 220.0 hours = 9.2 days = 2.5%
  - Total: 314.0 hours = 13.1 days = 1.4%
  - External factors: 36% of the above downtime, corresponding to 114 hours (= 4.8 days), were due to external factors


#### Scheduled maintenance downtimes

* Impact: No file access, no compute resources available
* Damage: None
* Occurrences:
  - 2022-02-08 (53.5 hours)
  - 2022-09-27 (40.5 hours)
* Total downtime: 94.0 hours

#### Scheduled kernel maintenance

* Impact: Fewer compute nodes than usual until rebooted
* Damage: None
* Occurrences:
  1. 2022-08-05 (up to 14 days)

#### Unscheduled downtimes due to power outage

* Impact: No file access, no compute resources available
* Damage: Running jobs (<= 14 days) failed, file-transfers failed, possible file corruptions
* Occurrences:
  - 2022-09-06 (66 hours)
* Total downtime: 66 hours of which 66 hours were due to external factors
  
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

#### Accounts

* Number of user account: 1,643 (change: +369 during the year)


### November 2, 2022

#### <span style="color: orange;">Major BeeGFS issues</span>

**Resolved**: The BeeGFS issues have been resolved. At 05:29 this morning, a local file system hosting one of our 12 BeeGFS meta daemons crashed. Normally, BeeGFS detects this and redirects processing to a secondary, backup daemon. In this incident, this failback did not get activated and a manual intervention was needed.
<br><span class="timestamp">November 2, 09:30 PDT</span>

**Notice**: The BeeGFS file system started to experience issues early morning on Tuesday 2022-11-02. The symptoms are missing files and folders.
<br><span class="timestamp">November 2, 08:15 PDT</span>

<!--
start: 2022-11-02T05:30:00
stop: 2022-11-02T09:15:00
length: 3.75 hours
severity: partial-outage
affected: jobs, beegfs, compute
reason: beegfs
 -->


### November 1, 2022

#### <span style="color: orange;">Scheduler not available</span>

**Resolved**: The job scheduler is responsive again, but we are not
certain what caused the problem. We will keep monitoring the issue.
<br><span class="timestamp">November 1, 16:30 PDT</span>

**Notice**: The job scheduler, SGE, does not respond to user requests,
e.g. `qstat` and `qsub`.  No new jobs can be submitted at this time.
The first reports on problems came in around 09:00 this morning.  We
are troubleshooting the problem.
<br><span class="timestamp">November 1, 10:25 PDT</span>

<!--
start: 2022-11-01T07:16:30
stop: 2022-11-01T09:09:00
length: 7.5 hours
severity: partial-outage
affected: jobs, compute
reason: scheduler
 -->



### September 27-29, 2022

#### <span style="color: orange;">Full downtime</span>

**Resolved**: The cluster maintenance has completed and the cluster is now fully operational again.
<br><span class="timestamp">September 29, 13:30 PDT</span>

**Update**: The cluster has been shut down for maintenance.
<br><span class="timestamp">September 27, 21:00 PDT</span>

**Notice**: Wynton will be shut down on Tuesday September 27, 2022 at 21:00. We expect the cluster to be back up by the end of the workday on Thursday September 29. This is done to avoid file-system and hardware failures that otherwise may occur when the UCSF Facilities performs maintenance to the power system in Byers Hall.  We will take the opportunity to perform cluster maintenance after the completion of the power-system maintenance.
<br><span class="timestamp">September 14, 17:00 PDT</span>

<!--
start: 2022-09-27T21:00:00
stop: 2022-09-29T13:30:00
length: 40.5 hours
severity: under-maintenance
affected: jobs, beegfs, compute, *
reason: scheduled
 -->


### September 6-9, 2022

#### <span style="color: orange;">Outage following campus power glitch</span>

**Resolved**: As of 09:20 on 2022-09-09, the cluster is back in full operation. The queues are enabled, jobs are running, and the development nodes are accepting logins.
<br><span class="timestamp">September 9, 09:35 PDT</span>

**Update**: Login and data-transfer nodes are disabled to minimize the risk for file corruption.
<br><span class="timestamp">September 7, 12:45 PDT</span>

**Notice**: The Wynton system experiencing system-wide issues, including the file system, due to a campus power glitch.  To minimize the risk of corrupting the file system, it was decided to shut down the job scheduler and terminate all running jobs.  The power outage at Mission Bay campus happened at 15:13.  Despite diesel-generated backup power started up momentarily, it was enough to affect some of our servers.  The job scheduler will be offline until the impact on Wynton is fully investigated.
<br><span class="timestamp">September 6, 16:20 PDT</span>

<!--
start: 2022-09-06T15:20:00
stop: 2022-09-09T09:20:00
length: 66 hours
severity: major-outage
affected: jobs, beegfs, compute
reason: power outage
 -->


### August 5-9, 2022

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: All compute nodes have been rebooted.
<br><span class="timestamp">Aug 9, 12:00 PDT</span>

**Notice**: New operating-system kernels are deployed. Login, data-transfer, and development nodes will be rebooted on Monday August 8 at 14:00.  Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). During this update period, there will be fewer than usual slots available on the queues. To follow the progress, see the green 'Available CPU cores' curve (target ~14,500 cores) in the graph above.
<br><span class="timestamp">Aug 5, 10:30 PDT</span>


### August 4, 2022

#### <span style="color: orange;">Software repository maintenance</span>

**Resolved**: The Sali lab software module repository is back.
<br><span class="timestamp">Aug 4, 12:00 PDT</span>

**Notice**: The Sali lab software module repository is back will be unavailable from around 10:30-11:30 today August 4 for maintenance.
<br><span class="timestamp">Aug 4, 03:30 PDT</span>



### March 28-April 6, 2022

#### <span style="color: orange;">Major BeeGFS issues</span>

**Resolved**: The patch of the BeeGFS servers were successfully deployed by 14:30 and went without disruptions. As a side effect, rudimentary benchmarking shows that this patch also improves the overall performance. Since the troubleshooting, bug fixing, and testing started on 2022-03-28, we managed to keep the impact of the bugs to a minimum resulting in only one hour of BeeGFS stall.
<br><span class="timestamp">April 6, 17:00 PDT</span>

**Update**: The BeeGFS servers will be updated tomorrow April 6 at 14:00. The cluster should work as usual during the update.
<br><span class="timestamp">April 5, 17:00 PDT</span>

**Update**: Our load tests over the weekend went well. Next, we will do discrepancy validation tests between our current version and the patch versions. When those pass, we will do a final confirmation with the BeeGFS vendor. We hope to deploy the patch to Wynton in a few days.
<br><span class="timestamp">April 4, 10:30 PDT</span>

**Update**: After a few rounds, we now have a patch that we have confirmed work on our test BeeGFS system. The plan is to do additional high-load testing today and over the weekend.
<br><span class="timestamp">April 1, 10:30 PDT</span>

**Update**: The BeeGFS vendors will send us a patch by tomorrow Tuesday, which we will test on our separate BeeGFS test system. After being validated there, will will deploy it to the main system. We hope to have a patch deploy by the end of the week.
<br><span class="timestamp">March 28, 11:30 PDT</span>

**Update**: We have re-enabled the job scheduler after manually having resolved the BeeGFS meta server issues. We will keep monitoring the problem and send more debug data to the BeeGFS vendors.
<br><span class="timestamp">March 28, 11:00 PDT</span>

**Notice**: On Monday 2022-03-28 morning at 10:30 the BeeGFS hung again. We put a hold on the job scheduler for now.
<br><span class="timestamp">March 28, 10:30 PDT</span>

<!--
start: 2022-03-28T10:00:00
stop: 2022-03-28T11:00:00
length: 1.0 hours
severity: major-outage
affected: jobs, beegfs, compute
reason: beegfs
 -->


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
