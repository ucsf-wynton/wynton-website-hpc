### January 15-16, 2026

#### <span class="incident-title">Partial BeeGFS storage failure</span>

**Notice**: All of the BeeGFS file system is available again.
<br><span class="timestamp">January 15, 09:45 PT</span>

**Notice**: One section (bss16) of the BeeGFS file system is offline
since 00:00 on 2026-01-26.
<br><span class="timestamp">January 16, 09:15 PT</span>

**Notice**: All of the BeeGFS file system is available again.
<br><span class="timestamp">January 15, 09:30 PT</span>

**Notice**: Two sections (bss6 and bss16) of the BeeGFS file system
are offline since 06:45-07:00 this morning.
<br><span class="timestamp">January 15, 08:30 PT</span>

<!--
period: 2026-01-15T06:45:00/2026-01-15T09:30:00 (2.75 hours)
period: 2026-01-16T00:00:00/2026-01-16T09:45:00 (9.75 hours)
total_length: 12.5 hours
severity: minor-outage
affected: beegfs, jobs, hosts
reason: beegfs
 -->


### November 16, 2023-ongoing

#### <span class="incident-title">Sporadic job failure</span>

**Update**: There was another burst of "can't get password entry for
user" errors starting on 2025-01-26 around 15:30, causing jobs to fail
immediately. We are restarting the SSSD service on the ~140 compute
nodes we have identified suffer from this problem.  <br><span
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
