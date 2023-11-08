### Operational Summary for 2021

* Full downtime:

  - Scheduled: 64 hours = 2.7 days = 0.73%
  - Unscheduled: 58 hours = 2.4 days = 0.66%
  - Total: 122 hours = 5.1 days = 1.4%
  - External factors: 39% of the above downtime, corresponding to 47 hours (=2.0 days), were due to external factors


#### Scheduled maintenance downtimes

* Impact: No file access, no compute resources available
* Damage: None
* Occurrences:
  1. 2021-05-25 (64 hours)
* Total downtime: 64 hours

#### Scheduled kernel maintenance

* Impact: Fewer compute nodes than usual until rebooted
* Damage: None
* Occurrences:
  1. 2021-01-29 (up to 14 days)
  2. 2021-07-23 (up to 14 days)
  3. 2021-12-08 (up to 14 days)

#### Unscheduled downtimes due to power outage

* Impact: No file access, no compute resources available
* Damage: Running jobs (<= 14 days) failed, file-transfers failed, possible file corruptions
* Occurrences:
  - 2021-08-26 (28 hours) - Planned Byers Hall power shutdown failed
  - 2021-11-09 (10 hours) - Unplanned PG&E power outage
* Total downtime: 38 hours of which 38 hours were due to external factors
  

#### Unscheduled downtimes due to file-system failures

* Impact: No file access
* Damage: Running jobs (<= 14 days) may have failed, file-transfers may have failed, cluster not accessible
* Occurrences:
  1. 2021-03-26 (9 hours) - Campus networks issues causing significant BeeGFS slowness
  1. 2021-07-23 (8 hours) - BeeGFS silently failed disks
  1. 2021-11-05 (3 hours) - BeeGFS non-responsive
* Total downtime: 20 hours of which 9 hours were due to external factors

#### Unscheduled downtimes due to other reasons

* Impact: Less compute resources
* Damage: Running jobs (<= 14 days) may have failed, file-transfers may have failed, cluster not accessible
* Occurrences:
  1. 2021-04-28 (210 hours) - GPU taken down due to server room cooling issues
* Total downtime: 0 hours

#### Accounts

* Number of user account: 1,274 (change: +410 during the year)


### December 8-December 23, 2021

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: All compute nodes have been rebooted.
<br><span class="timestamp">Dec 23, 12:00 PT</span>

**Notice**: New operating-system kernels are deployed. Login, data-transfer, and development nodes will be rebooted tomorrow Thursday December 9 at 11:00.  Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). During this update period, there will be fewer than usual slots available on the queues. To follow the progress, see the green 'Available CPU cores' curve (target ~12,500 cores) in the graph above.  
<br><span class="timestamp">Dec 8, 16:30 PT</span>


### December 19-21, 2021

#### <span style="color: orange;">Globus and data-transfer node issue</span>

**Resolved**: Data-transfer node `dt1` and Globus file transfers are working again.
<br><span class="timestamp">Dec 21, 13:20 PT</span>

**Update**: Globus file transfers to and from Wynton are not working.  This is because Globus relies on the data-transfer node `dt1`, which is currently down.
<br><span class="timestamp">Dec 20, 15:30 PT</span>

**Notice**: Data-transfer node `dt1` has issues. Please use `dt2` until resolved. The first report on this problem came yesterday at 21:30.
<br><span class="timestamp">Dec 20, 09:30 PT</span>



### November 9, 2021

#### <span style="color: orange;">Partial outage due to campus power glitch</span>

**Resolved**: All hosts have been rebooted and are now up and running.
<br><span class="timestamp">November 9, 11:00 PT</span>

**Notice**: There was a brief PG&E power outage early Tuesday November 9 around 01:20.  This affected the power on the Mission Bay campus, including the data center housing Wynton.  The parts of our system with redundant power were fine, but many of the compute nodes are on PG&E-power only and, therefore, went down.  As a result, lots of jobs crashed.  We will restart the nodes that crashed manually during the day today.
<br><span class="timestamp">November 9, 09:10 PT</span>

<!--
start: 2021-11-09T01:20:00
stop: 2021-11-09T11:00:00
length: 10 hours
severity: partial-outage
affected: jobs, compute
reason: external
 -->


### October 25-26, 2021

#### <span style="color: orange;">File-system maintenance</span>

**Resolved**: Resynchronization of all file-system meta servers is complete, which concludes the maintenance.
<br><span class="timestamp">October 26, 09:45 PT</span>

**Update**: The maintenance work has started.
<br><span class="timestamp">October 25, 14:00 PT</span>

**Notice**: We will perform BeeGFS maintenance work starting Monday October 25 at 2:00 pm.  During this work, the filesystem might be less performant.  We don't anticipate any downtime.
<br><span class="timestamp">October 21, 12:10 PT</span>


### August 26-September 10, 2021

#### <span style="color: orange;">Byers Hall power outage & file-system corruption</span>

**Resolved**: The corrupted filesystem has been recovered.
<br><span class="timestamp">September 10, 17:20 PT</span>

**Update**: Wynton is back online but the problematic BeeGFS filesystem is kept offline, which affects access to some of the folders and files hosted on `/wynton/group/`.  The file recovery tools are still running.
<br><span class="timestamp">August 27, 13:05 PT</span>

**Partially resolved**: Wynton is back online but the problematic BeeGFS filesystem is kept offline, which affects access to some of the folders and files hosted on `/wynton/group/`.  The file recovery tools are still running.
<br><span class="timestamp">August 27, 13:05 PT</span>

**Update**: The BeeGFS filesystem recovering attempt keeps running. The current plan is to bring Wynton back online while keeping the problematic BeeGFS filesystem offline.
<br><span class="timestamp">August 26, 23:05 PT</span>

**Update**: All of the BeeGFS servers are up and running, but one of the 108 filesystems that make up BeeGFS was corrupted by the sudden power outage. The bad filesystem is part of `/wynton/group/`. We estimate that 70 TB of data is affected.  We are making every possible effort to restore this filesystem, which will take time. While we do so, Wynton will remain down.
<br><span class="timestamp">August 26, 14:05 PT</span>

**Notice**: The cluster is down after an unplanned power outage in the main data center. The power is back online but several of our systems, including BeeGFS servers, did not come back up automatically and will require on-site, manual actions.
<br><span class="timestamp">August 26, 09:15 PT</span>

<!--
start: 2021-08-26T09:15:00
stop: 2021-08-27T13:15:00
length: 28.0 hours
severity: major-outage
affected: jobs, beegfs, compute
reason: external
 -->


### July 23-July 28, 2021

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: The majority of the compute nodes have been rebooted after only four days, which was quicker than the maximum of 14 days.
<br><span class="timestamp">July 28, 08:00 PT</span>

**Notice**: New operating-system kernels are deployed. Login, data-transfer, and development nodes will be rebooted at 13:00 on Friday July 23 at 1:00 pm.  Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). During this update period, there will be fewer than usual slots available on the queues. To follow the progress, see the green 'Available CPU cores' curve (target ~10,400 cores) in the graph above.  
<br><span class="timestamp">July 23, 07:40 PT</span>


### June 24, 2021

#### <span style="color: orange;">Cluster not accessible (due to BeeGFS issues)</span>

**Resolved**: Wynton and BeeGFS is back online. The problem was due to failed disks. Unfortunately, about 10% of the space in `/wynton/scratch/` went bad, meaning some files are missing or corrupted.  It is neither possible to recover them nor identify which files or folders are affected.  In other words, expect some oddness if you had data under `/wynton/scratch/`.  There will also be some hiccups over the next several days as we get everything in ZFS and BeeGFS back into an as stable state as possible.
<br><span class="timestamp">June 24, 14:55 PT</span>

**Update**: We're working hard on getting BeeGFS back up. We were not able to recover the bad storage target, so it looks like there will be some data loss on `/wynton/scratch/`. More updates soon.
<br><span class="timestamp">June 24, 13:45 PT</span>

**Notification**: The Wynton environment cannot be accessed at the moment.  This is because the global file system, BeeGFS, is experiencing issues since early this morning. The problem is being investigated.
<br><span class="timestamp">June 24, 07:00 PT</span>

<!--
start: 2021-06-24T07:00:00
stop: 2021-06-24T14:55:00
length: 8.0 hours
severity: major-outage
affected: jobs, beegfs, compute
reason: external
 -->


### May 25-June 7, 2021

#### <span style="color: orange;">Full downtime (major maintenance)</span>

**Resolved**: All remaining issues from the downtime have been resolved.
<br>
<span class="timestamp">June 7, 17:00 PT</span>

**Update**: Login node log2 can now be reached from the UCSF Housing WiFi network.
<br>
<span class="timestamp">June 7, 17:00 PT</span>

**Update**: dt2 can now be reached from outside the Wynton cluster.
<br>
<span class="timestamp">June 7, 13:15 PT</span>

**Update**: Login node log2 cannot be reached from the UCSF Housing WiFi network.  If you are on that network, use log1 until this has been resolved.
<br>
<span class="timestamp">June 2, 07:00 PT</span>

**Update**: Both data transfer nodes are back online since a while, but dt2 can only be reached from within the Wynton cluster.
<br>
<span class="timestamp">June 1, 13:45 PT</span>

**Update**: A large number of of the remaining compute nodes have been booted up.  There are now ~8,600 cores serving jobs.
<br>
<span class="timestamp">June 1, 10:15 PT</span>

**Update**: The development nodes are now back too.  For the PHI pilot project, development node pgpudev1 is back up, but pdev1 is still down.
<br>
<span class="timestamp">May 28, 10:00 PT</span>

**Update**: Wynton is partially back up and running.  Both login hosts are up (log1 and log2). The job scheduler, SGE, accepts new jobs and and launches queued jobs. Two thirds of the compute node slots are back up serving jobs. Work is done to bring up the the development nodes and the data transfer hosts (dt1 and dt2).
<br>
<span class="timestamp">May 27, 10:30 PT</span>

**Update**: We hit more than a few snags today. Our filesystem, BeeGFS, is up and running, but it still needs some work.  The login hosts are up, but SGE is not and neither are the dev nodes.  We will continue the work early tomorrow Thursday.
<br>
<span class="timestamp">May 26, 21:40 PT</span>

**Notice**: The Wynton HPC environment will be shut down late afternoon on Tuesday May 25, 2021, for maintenance.  We expect the cluster to be back online late Wednesday May 26.  To allow for an orderly shutdown of Wynton, the queues have been disabled starting at 3:30 pm on May 25.  Between now and then, only jobs whose runtimes end before that time will be able to start.  Jobs whose runtimes would run into the maintenance window will remain in the queue.
<br>
<span class="timestamp">May 10, 16:40 PT</span>

**Preliminary notice**: The Wynton HPC cluster will be undergoing a major upgrade on Wednesday May 26, 2021.  As usual, starting 15 days prior to this day, on May 11, the maximum job run-time will be decreased on a daily basis so that all jobs finishes in time, e.g. if you submit a job on May 16 with a run-time longer than nine days, it will not be able to scheduled and it will be queued until after the downtime.
<br>
<span class="timestamp">May 3, 11:00 PT</span>

<!--
start: 2021-05-25T16:00:00
stop: 2021-06-28T10:00:00
length: 64 hours
severity: under-maintenance
affected: jobs, beegfs, compute
reason: scheduled
 -->



### June 1-2, 2021

#### <span style="color: orange;">Password management outage</span>

**Resolved**: Password updates works again.
<br>
<span class="timestamp">June 2, 10:30 PT</span>

**Notice**: Due to technical issues, it is currently not possible to change your Wynton password.  If attempted from the web interface, you will get an error on "Password change not successful! (kadmin: Communication failure with server while initializing kadmin interface )".  If attempted using 'passwd', you will get "passwd: Authentication token manipulation error".
<br>
<span class="timestamp">June 1, 10:30 PT</span>



### April 28 - May 7, 2021

#### <span style="color: orange;">Many GPU nodes down (due to cooling issues)</span>

**Resolved**: Cooling has been restored and all GPU nodes are back online again. 
<br>
<span class="timestamp">May 7, 11:10 PT</span>

**Update**: Half of the GPU nodes that was taken down are back online.  Hopefully, the remaining ones can be brought back up tomorrow when the cooling in the server room should be fully functioning again.
<br>
<span class="timestamp">May 6, 14:30 PT</span>

**Notification**: One of Wynton's ancillary server rooms is having cooling issues.  To reduce the heat load in the room, we had to turn off all the Wynton nodes in the room around 09:45 this morning.  This affects GPU nodes named msg\*gpu\* and a few other regular nodes.  We estimate that the UCSF Facilities to fix the cooling problem by early next week.
<br>
<span class="timestamp">April 28, 16:30 PT</span>

<!--
start: 2021-04-28T16:30:00
stop: 2021-05-07T11:10:00
length: 210 hours
severity: partial-outage
affected: jobs-gpu, compute-gpu
reason: external
 -->


### March 26, 2021

#### <span style="color: orange;">Cluster not accessible (due to network outage)</span>

**Resolved**: The malfunctioning network link between two of Wynton's data centers, which affected our BeeGFS file system and Wynton HPC as a whole, has been restored.
<br><span class="timestamp">March 26, 21:30 PT</span>

**Notification**: Campus network issues causing major Wynton HPC issues including extremely slow access to our BeeGFS file system.  This was first reported around 11:30 today.  A ticket has been filed with the UCSF Network.  ETA is unknown.
<br><span class="timestamp">March 26, 12:30 PT</span>

<!--
start: 2021-03-26T12:30:00
stop: 2021-03-26T21:30:00
length: 9 hours
severity: major-outage
affected: beegfs, compute
reason: external
 -->


### January 29-February 12, 2021

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: All compute nodes have been rebooted.  A few compute nodes remain offline that has to be rebooted manually, which will be done as opportunity is given.
<br><span class="timestamp">February 13, 09:00 PT</span>

**Notice**: New operating-system kernels are deployed. Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). During this update period, there will be fewer than usual slots available on the queues. To follow the progress, see the green 'Available CPU cores' curve (target ~10,400 cores) in the graph above.  Login, data-transfer, and development nodes will be rebooted at 13:00 on Monday February 1.
<br><span class="timestamp">January 31, 17:00 PT</span>



### February 1-3, 2021

#### <span style="color: orange;">Development node not available</span>

**Resolved**: Development node `dev2` is available again.
<br><span class="timestamp">February 3, 15:00 PT</span>

**Notice**: Development node `dev2` is down.  It failed to come back up after the kernel upgrade on 2021-02-01.  An on-site reboot is planned for Wednesday February 3.
<br><span class="timestamp">February 2, 11:45 PT</span>


### January 28, 2021

#### <span style="color: orange;">Server room maintenance</span>

**Notice**: The air conditioning system in one of our server rooms will be upgraded on January 28.  The compute nodes in this room will be powered down during the upgrade resulting in fewer compute nodes being available on the cluster.  Starting 14 days prior to this date, compute nodes in this room will only accept jobs that will finish in time.
<br><span class="timestamp">January 13, 10:00 PT</span>
