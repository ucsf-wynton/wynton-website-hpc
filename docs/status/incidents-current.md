### May 25-June 7, 2021

#### <span style="color: orange;">Full downtime (major maintenance)</span>

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

