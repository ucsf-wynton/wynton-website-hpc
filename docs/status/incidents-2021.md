### June 24, 2021

#### <span style="color: orange;">Cluster not accessible (due to BeeGFS issues)</span>

**Resolved**: Wynton and BeeGFS is back online. The problem was due to failed disks. Unfortunately, about 10% of the space in `/wynton/scratch/` went bad, meaning some files are missing or corrupted.  It is neither possible to recover them nor identify which files or folders are affected.  In other words, expect some oddness if you had data under `/wynton/scratch/`.  There will also be some hiccups over the next several days as we get everything in ZFS and BeeGFS back into an as stable state as possible.
<br><span class="timestamp">June 24, 14:55 PDT</span>

**Update**: We're working hard on getting BeeGFS back up. We were not able to recover the bad storage target, so it looks like there will be some data loss on `/wynton/scratch/`. More updates soon.
<br><span class="timestamp">June 24, 13:45 PDT</span>

**Notification**: The Wynton environment cannot be accessed at the moment.  This is because the global file system, BeeGFS, is experiencing issues since early this morning. The problem is being investigated.
<br><span class="timestamp">June 24, 07:00 PDT</span>


### May 25-June 7, 2021

#### <span style="color: orange;">Full downtime (major maintenance)</span>

**Resolved**: All remaining issues from the downtime have been resolved.
<span class="timestamp">June 7, 17:00 PDT</span>

**Update**: Login node log2 can now be reached from the UCSF Housing WiFi network.
<br>
<span class="timestamp">June 7, 17:00 PDT</span>

**Update**: dt2 can now be reached from outside the Wynton cluster.
<br>
<span class="timestamp">June 7, 13:15 PDT</span>

**Update**: Login node log2 cannot be reached from the UCSF Housing WiFi network.  If you are on that network, use log1 until this has been resolved.
<br>
<span class="timestamp">June 2, 07:00 PDT</span>

**Update**: Both data transfer nodes are back online since a while, but dt2 can only be reached from within the Wynton cluster.
<br>
<span class="timestamp">June 1, 13:45 PDT</span>

**Update**: A large number of of the remaining compute nodes have been booted up.  There are now ~8,600 cores serving jobs.
<br>
<span class="timestamp">June 1, 10:15 PDT</span>

**Update**: The development nodes are now back too.  For the PHI pilot project, development node pgpudev1 is back up, but pdev1 is still down.
<br>
<span class="timestamp">May 28, 10:00 PDT</span>

**Update**: Wynton is partially back up and running.  Both login hosts are up (log1 and log2). The job scheduler, SGE, accepts new jobs and and launches queued jobs. Two thirds of the compute node slots are back up serving jobs. Work is done to bring up the the development nodes and the data transfer hosts (dt1 and dt2).
<br>
<span class="timestamp">May 27, 10:30 PDT</span>

**Update**: We hit more than a few snags today. Our filesystem, BeeGFS, is up and running, but it still needs some work.  The login hosts are up, but SGE is not and neither are the dev nodes.  We will continue the work early tomorrow Thursday.
<br>
<span class="timestamp">May 26, 21:40 PDT</span>

**Notice**: The Wynton HPC environment will be shut down late afternoon on Tuesday May 25, 2021, for maintenance.  We expect the cluster to be back online late Wednesday May 26.  To allow for an orderly shutdown of Wynton, the queues have been disabled starting at 3:30 pm on May 25.  Between now and then, only jobs whose runtimes end before that time will be able to start.  Jobs whose runtimes would run into the maintenance window will remain in the queue.
<br>
<span class="timestamp">May 10, 16:40 PDT</span>

**Preliminary notice**: The Wynton HPC cluster will be undergoing a major upgrade on Wednesday May 26, 2021.  As usual, starting 15 days prior to this day, on May 11, the maximum job run-time will be decreased on a daily basis so that all jobs finishes in time, e.g. if you submit a job on May 16 with a run-time longer than nine days, it will not be able to scheduled and it will be queued until after the downtime.
<br>
<span class="timestamp">May 3, 11:00 PDT</span>


### June 1-2, 2021

**Resolved**: Password updates works again.
<br>
<span class="timestamp">June 2, 10:30 PDT</span>

**Notice**: Due to technical issues, it is currently not possible to change your Wynton password.  If attempted from the web interface, you will get an error on "Password change not successful! (kadmin: Communication failure with server while initializing kadmin interface )".  If attempted using 'passwd', you will get "passwd: Authentication token manipulation error".
<br>
<span class="timestamp">June 1, 10:30 PDT</span>



### April 28 - May 7, 2021

#### <span style="color: orange;">Many GPU nodes down (due to cooling issues)</span>

**Resolved**: Cooling has been restored and all GPU nodes are back online again. 
<br>
<span class="timestamp">May 7, 11:10 PDT</span>

**Update**: Half of the GPU nodes that was taken down are back online.  Hopefully, the remaining ones can be brought back up tomorrow when the cooling in the server room should be fully functioning again.
<br>
<span class="timestamp">May 6, 14:30 PDT</span>

**Notification**: One of Wynton's ancillary server rooms is having cooling issues.  To reduce the heat load in the room, we had to turn off all the Wynton nodes in the room around 09:45 this morning.  This affects GPU nodes named msg\*gpu\* and a few other regular nodes.  We estimate that the UCSF Facilities to fix the cooling problem by early next week.
<br>
<span class="timestamp">April 28, 16:30 PDT</span>


### March 26, 2021

#### <span style="color: orange;">Cluster not accessible (due to network outage)</span>

**Resolved**: The malfunctioning network link between two of Wynton's data centers, which affected our BeeGFS file system and Wynton HPC as a whole, has been restored.
<br><span class="timestamp">March 26, 21:30 PDT</span>

**Notification**: Campus network issues causing major Wynton HPC issues including extremely slow access to our BeeGFS file system.  This was first reported around 11:30 today.  A ticket has been filed with the UCSF Network.  ETA is unknown.
<br><span class="timestamp">March 26, 12:30 PDT</span>


### January 29-February 12, 2021

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: All compute nodes have been rebooted.  A few compute nodes remain offline that has to be rebooted manually, which will be done as opportunity is given.
<br><span class="timestamp">February 13, 09:00 PST</span>

**Notice**: New operating-system kernels are deployed. Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). During this update period, there will be fewer than usual slots available on the queues. To follow the progress, see the green 'Available CPU cores' curve (target ~10,400 cores) in the graph above.  Login, data-transfer, and development nodes will be rebooted at 13:00 on Monday February 1.
<br><span class="timestamp">January 31, 17:00 PST</span>


### February 1-3, 2021

#### <span style="color: orange;">Development node not available</span>

**Resolved**: Development node `dev2` is available again.
<br><span class="timestamp">February 3, 15:00 PST</span>

**Notice**: Development node `dev2` is down.  It failed to come back up after the kernel upgrade on 2021-02-01.  An on-site reboot is planned for Wednesday February 3.
<br><span class="timestamp">February 2, 11:45 PST</span>


### January 28, 2021

#### <span style="color: orange;">Server room maintenance</span>

**Notice**: The air conditioning system in one of our server rooms will be upgraded on January 28.  The compute nodes in this room will be powered down during the upgrade resulting in fewer compute nodes being available on the cluster.  Starting 14 days prior to this date, compute nodes in this room will only accept jobs that will finish in time.
<br><span class="timestamp">January 13, 10:00 PDT</span>
