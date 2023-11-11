### October 30-November 13(?), 2023

#### <span style="color: orange;">Full downtime</span>

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


### October 27-November 13(?), 2023

#### <span style="color: orange;">File-system failures</span>

**Update**: After resynchronization of the BeeGFS metadata kept
failing, we identified a possible culprit. We suspect BeeGFS cannot
handle the folders with many millions of files, causing the
resynchronization to fail. We keep working on stabilizing BeeGFS.
<br><span class="timestamp">November 11, 00:45 PT</span>

**Update**: The BeeGFS metadata resynchronization that had been
running for several hours, failed late yesterday. The vendor has
provided us with a script tailored to fix the issue we ran into. That
script is running, and once it's done, we'll start the
resynchronization again.
<br><span class="timestamp">November 9, 10:30 PT</span>

**Update**: The recovery from the BeeGFS incident goes as planned. We
estimate to have resolved this issue by the end of November 9, 2023,
when full read-write access to `/wynton` will be available again.
<br><span class="timestamp">November 8, 10:30 PT</span>

**Update**: The Wynton team works on fixing and stabilizing the BeeGFS
incident. We estimate to have resolved this issue by the end of
November 9, 2023.
<br><span class="timestamp">November 7, 11:20 PT</span>

**Update**: Read-only access to Wynton has been enabled for users to
retrieve their files. Login nodes `log1` and `plog1` are available for
this.  If going through the Wynton 2FA, make sure to answer "no"
(default) when prompted for "Remember connection authentication from
98.153.103.186 for 12 hours? [y/N]"; answering "yes" causes the SSH
connection to fail.
<br><span class="timestamp">November 5, 00:30 PT</span>

**Update**: Wynton admins can retrieve user files under `/wynton/`
upon requests until 18:00 today, when the UCSF network will go
down. We are not able to share the PHI data under
`/wynton/protected/`. Please contact support with all details
including full path of the data to be retrieved.
<br><span class="timestamp">October 30, 15:30 PT</span>

**Update**: The BeeGFS issue is related to a CentOS 7-kernel bug in
one of our BeeGFS metadata servers. To minimize the risk of data loss
on the `/wynton` file system, we took the decision to shut down Wynton
immediately. At the moment, we do not have an estimate on how long it
will take to resolve this problem.  It has to be resolved before we
can begin the major upgrade scheduled for 2023W44.
<br><span class="timestamp">October 27, 16:30 PT</span>

**Notice**: The BeeGFS file system, which hosts `/wynton`, is
experiencing unexpected, major issues.  Some or all files on `/wynton`
cannot be accessed, and when attempted, an `Communication error on
send` error is seen.  The problem started around 13:45 on Friday
2023-10-27.
<br><span class="timestamp">October 27, 15:10 PT</span>

<!--
start: 2023-10-27T13:45:00
stop: 
length: 
severity: filesystem-failure
affected: jobs, beegfs, compute, storage, *
reason: unscheduled
 -->


### November 5-13(?), 2023

#### <span style="color: orange;">Passwords cannot be reset</span>

**Notice**: It is not possible to change or reset passwords since
2023-11-05. This problem was introduced while doing cluster-wide
upgrades to Rocky 8.
<br><span class="timestamp">November 11, 09:00 PT</span>
