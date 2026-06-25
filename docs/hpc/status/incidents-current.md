### June 23-24, 2026

#### <span class="incident-title">Full downtime</span>

**Update**: Wynton HPC is available as of June 24 at 6:00 PM. Compute
nodes are rebooted with require in-person manual reboot.

**Notice**: Wynton HPC was shut down on June 23 at 8:00 PM.

**Notice**: Wynton HPC will undergo a planned maintenance window
beginning Tuesday, June 23 at 8:00 PM through Wednesday, June 24 at
1:00 PM due to a facilities electrical shutdown in Byers Hall. To
prepare for the maintenance, the scheduler has been configured to
prevent jobs from starting if they can’t be completed before the
maintenance window begins.  Jobs that cannot complete before the
downtime begins will not be started by the scheduler until after the
downtime is completed. Some running jobs may be interrupted during the
maintenance window.
<br><span class="timestamp">June 9, 13:00 PT</span>

<!--
comment: Scheduled downtime
start: 2026-06-23T20:00:00
stop: 2026-06-24T18:00:00
length: 19 hours
severity: under-maintenance
affected: jobs, beegfs, compute, *
reason: scheduled
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
