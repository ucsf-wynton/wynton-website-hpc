### January 17-ongoing, 2025

#### <span style="color: orange;">Cluster unavailable</span>

**Update**: The login and data-transfer nodes are available again.
<br><span class="timestamp">January 22, 11:00 PT</span>

**Update**: The third resynchronization completed successfully.
<br><span class="timestamp">January 21, 18:30 PT</span>

**Update**: Further investigation of the failed resynchronization this
morning indicated that the resynchronization did indeed keep running
while it stopped producing any output and the underlying BeeGFS
service was unresponsive. Because of this, we decided to not restart
the resynchronization, but instead let it continue in the hope it will
finish. But, by not restarting, Wynton will remain inaccessible. Our
first objective is to not jeopardize the cluster, the second objective
is to bring the system back online.
<br><span class="timestamp">January 21, 15:15 PT</span>

**Update**: The cluster is unavailable again. The past
resynchronization of the problematic BeeGFS metadata server failed
again, which triggers the problem. We are communicating with the
vendor for their support.
<br><span class="timestamp">January 21, 09:45 PT</span>

**Update**: The cluster is available again, but the scheduler has been
paused. No queued jobs are launched and running jobs have been
suspended, but will resume when the pause of scheduler is
removed. This is done to minimize the load on BeeGFS, which will
simplify troubleshooting and increase the chances to stabilize
BeeGFS. It is the same BeeGFS metadata server as before that is
experiencing problems.
<br><span class="timestamp">January 19, 13:45 PT</span>

**Update**: The cluster is unavailable again.
<br><span class="timestamp">January 19, 12:45 PT</span>

**Update**: The cluster is working again. We have started a
resynchronization of the problematic BeeGFS metadata server.
<br><span class="timestamp">January 18, 13:45 PT</span>

**Update**: First signs of the cluster coming back online again,
e.g. queued jobs are launched, and it is possible to access the
cluster via SSH.
<br><span class="timestamp">January 18, 06:00 PT</span>

**Notice**: Identifies a specific BeeGFS metadata server that is
unresponsive. The BeeGFS vendor has been contacted.
<br><span class="timestamp">January 18, 01:00 PT</span>

**Notice**: The underlying problem appears to be BeeGFS. The storage
servers are okay, but one or more metadata servers are unresponsive.
<br><span class="timestamp">January 17, 21:30 PT</span>

**Notice**: The cluster is unavailable, e.g. i is not possible to
access the login or the data-transfer nodes.
<br><span class="timestamp">January 17, 19:45 PT</span>

<!--
start: 2025-01-17T19:45:00
stop: 2025-01-18T06:00:00
length: 10h15m
severity: major-outage
affected: jobs, beegfs, compute, *
reason: beegfs
 -->


### November 16-ongoing, 2023

#### <span style="color: orange;">Sporadic job failure</span>

**Update**: To lower the risk for this problem to occur, the SSSD
timeout limit was increased from 10 seconds to 30 seconds.
<br><span class="timestamp">November 20, 10:00 PT</span>

**Update**: The "can't get password entry for user" error happens on
some compute nodes where the System Security Services Daemon (SSSD)
has failed.  Until the cause for failed SSSD has been identified and
resolved, the only solution is to resubmit the job.
<br><span class="timestamp">November 17, 09:30 PT</span>

**Notice**: Some jobs end up in an error state (Eqw) with an error
"can't get password entry for user "alice". Either user does not exist
or error with NIS/LDAP etc."
<br><span class="timestamp">November 16, 17:00 PT</span>

<!--
start: 2023-11-17T16:00:00
stop: 
length: 
severity: 
affected: jobs
reason: scheduled
 -->



### November 5-ongoing, 2023

#### <span style="color: orange;">Passwords cannot be reset</span>

**Notice**: Passwords can be changed via the web interface. It is
still not possible to change it via the command-line while logged in
to Wynton.
<br><span class="timestamp">November 13, 11:00 PT</span>

**Notice**: It is not possible to change or reset passwords since
2023-11-05. This problem was introduced while doing cluster-wide
upgrades to Rocky 8.
<br><span class="timestamp">November 11, 09:00 PT</span>
