### October 30-November 15(?), 2023

#### <span style="color: orange;">Full downtime</span>

**Update**: We plan to re-enable the job scheduler and start
processing jobs by the end of today. It is possible to submit jobs
already now, but they will remain queued until we re-enable the
scheduler.
<br><span class="timestamp">November 15, 10:30 PT</span>

**Update**: The BeeGFS issue has been resolved, which allows us to
move forward on the remaining Rocky-8 updates. We hope to start
bringing compute nodes online as soon as tomorrow (2023-11-15).
<br><span class="timestamp">November 14, 13:15 PT</span>

**Update**: Still status quo; the BeeGFS issue holds us back from
bringing the scheduler back up.  We're rather certain that we will not
be able to resolve it today or tomorrow.
<br><span class="timestamp">November 13, 13:45 PT</span>

**Update**: Login and development nodes are available. Write access to
the BeeGFS file system has been re-enabled. Due to continued issues in
getting BeeGFS back in stable state, we are still not ready for
opening up the scheduler and compute nodes. 
<br><span class="timestamp">November 11, 00:30 PT</span>

**Update**: Unfortunately, we will not bring up Wynton to run jobs
today. We are evaluating what, if anything, may be possible to bring
up before the long weekend. The reason being that the required
metadata resynchronization failed late yesterday. The vendor has
provided us with a script to fix the failure. That script is running,
and once it's done, we'll reattempt to resynchronize.
<br><span class="timestamp">November 9, 10:30 PT</span>

**Update**: We estimate to bring Wynton back up by the end of day
Thursday November 9, 2023. At that time, we expect all login, all
data-transfer, and most development nodes will be available. A large
number of the compute nodes will also be available via the scheduler.
<br><span class="timestamp">November 8, 10:30 PT</span>

**Update**: The team makes progress on the scheduled downtime
activities, which was delayed due to the BeeGFS incident. We estimate
to bring Wynton back up by the end of day Thursday November 9, 2023.
<br><span class="timestamp">November 7, 11:20 PT</span>

**Notice**: The cluster will be shut down for maintenance from 9 pm on
Monday October 30 through end of business on Friday November 3, 2023
(2023W44).  The operating system will be upgraded system wide (_all_
machines) from CentOS 7.9 to Rocky 8 Linux, the BeeGFS will be
upgrade, and old hardware will be replaced. UCSF Facilities will
perform scheduled work.  After the downtime, there will no longer be
any machine running CentOS 7.9.  All machines will have their _local_
disks (including `/scratch` and `/tmp`) wiped. Anything under
`/wynton` (including `/wynton/scratch`, `/wynton/home`, ...) should be
unaffected, but please note that Wynton does not back anything up, so
we recommend you to back up critical data. For more information about
the Rocky 8 Linux migration project and how you can prepare for it is
available at on the [Migration to Rocky 8 Linux from CentOS
7](/hpc/software/rocky-8-linux.html) page.
<br><span class="timestamp">October 13, 11:15 PT</span>

<!--
start: 2023-10-30T09:00:00
stop: 2023-11-08T17:00:00
length: 
severity: under-maintenance
affected: jobs, beegfs, compute, *
reason: scheduled
 -->



### November 5-17(?), 2023

#### <span style="color: orange;">Passwords cannot be reset</span>

**Notice**: Passwords can be changed via the web interface. It is
still not possible to change it via the command-line while logged in
to Wynton.
<br><span class="timestamp">November 13, 11:00 PT</span>

**Notice**: It is not possible to change or reset passwords since
2023-11-05. This problem was introduced while doing cluster-wide
upgrades to Rocky 8.
<br><span class="timestamp">November 11, 09:00 PT</span>
