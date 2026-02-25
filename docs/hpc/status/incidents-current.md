### February 20-ongoing, 2026

#### <span class="incident-title">BeeGFS storage outage</span>

**Notice**: All jobs and the job queue are suspended. The Wynton Team
is working with support vendors and the UCSF networking team to
troubleshoot.
<br><span class="timestamp">February 24, 18:00 PT</span>

**Notice**: Jobs and the job queue have been resumed. The root cause
is still being investigated. There is a risk for subsequential file
system issues resulting in job hanging.
<br><span class="timestamp">February 23, 17:45 PT</span>

**Notice**: All jobs and the job queue remain suspended. The Wynton Team
is working on this as a top priority.
<br><span class="timestamp">February 23, 10:30 PT</span>

**Notice**: The Wynton Team has been working throughout the weekend to
monitor and mitigate issues with the BeeGFS storage servers.
<br><span class="timestamp">February 23, 09:30 PT</span>

**Notice**: All jobs have been paused. They will be automatically
resumed when the file system is stable again.
<br><span class="timestamp">February 20, 21:30 PT</span>

**Notice**: BeeGFS is experiencing issues since Friday at 17:55.
<br><span class="timestamp">February 20, 19:00 PT</span>

<!--
period: 2026-02-20T17:45:00/2026-02-23T17:45:00 (72.0 hours)
total_length: 72.0 hours
severity: minor-outage
affected: beegfs, jobs, hosts
reason: beegfs
 -->


### November 16, 2023-ongoing

#### <span class="incident-title">Sporadic job failure</span>

**Update**: There was another burst of "can't get password entry for
user" errors starting on 2025-01-26 around 15:30, causing jobs to fail
immediately. We are restarting the SSSD service on the ~140 compute
nodes we have identified as suffering from this problem.  <br><span
class="timestamp">January 27, 2025, 11:45 PT</span>

**Update**: To lower the risk for this problem to occur, the SSSD
timeout limit was increased from 10 seconds to 30 seconds.
<br><span class="timestamp">November 20, 2023, 10:00 PT</span>

**Update**: The "can't get password entry for user" error happens on
some compute nodes where the System Security Services Daemon (SSSD)
has failed.  Until the cause for failed SSSD has been identified and
resolved, the only solution is to resubmit the job.
<br><span class="timestamp">November 17, 2023, 09:30 PT</span>

**Notice**: Some jobs end up in an error state (Eqw) with an error
"can't get password entry for user "alice". Either user does not exist
or error with NIS/LDAP etc."
<br><span class="timestamp">November 16, 2023, 17:00 PT</span>

<!--
start: 2023-11-17T16:00:00
stop: 
length: 
severity: 
affected: jobs
reason: scheduled
 -->



### November 5, 2023-ongoing

#### <span class="incident-title">Passwords cannot be reset</span>

**Notice**: Passwords can be changed via the web interface. It is
still not possible to change it via the command-line while logged in
to Wynton.
<br><span class="timestamp">November 13, 2023, 11:00 PT</span>

**Notice**: It is not possible to change or reset passwords since
2023-11-05. This problem was introduced while doing cluster-wide
upgrades to Rocky 8.
<br><span class="timestamp">November 11, 2023, 09:00 PT</span>
