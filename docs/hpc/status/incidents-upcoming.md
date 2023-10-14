### October 16-October 20, 2023

**Notice**: Access to login node `log1`, data-transfer nodes `dt1`,
and `pdt2` will be disabled from Monday-Friday October 16-20, 2023 to
upgrade the operating system to Rocky 8 Linux.  They might return
sooner.  The alternative login node `log2`, data-transfer nodes `dt2`,
and `pdt1` are unaffected, so are the Wynton HPC Globus endpoints.
<br><span class="timestamp">October 13, 11:20 PST</span>


### October 30-November 3, 2023

#### <span style="color: orange;">Full downtime</span>

<!--
**Notice**: Starting today, October 15, the maximum job runtime will
be decreased on a daily basis from the current 14 days so that jobs
finish in time for the shutdown on October 30. Jobs with runtimes
going into the maintenance window, will only be started after the
downtime.
<br><span class="timestamp">October 15, 09:00 PST</span>
-->

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
<br><span class="timestamp">October 13, 11:15 PST</span>

<!--
start: 2023-10-30T09:00:00
stop: 2023-11-03T17:00:00
length: 
severity: under-maintenance
affected: jobs, beegfs, compute, *
reason: scheduled
 -->
