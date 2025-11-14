### November 12-13, 2025

#### <span style="color: orange;">Full downtime</span>

**Update**: The downtime has concluded and the maintenance has been
successfully completed. The cluster is now back up and running. Please
note, you may experience some lag over the next 24 hours as the
file-system metadata servers continue to re-synchronize.
<br><span class="timestamp">November 13, 18:00 PT</span>

**Update**: The cluster is down for maintenance.
<br><span class="timestamp">November 12, 15:00 PT</span>

**Notice**: The cluster will down for maintenance from 3:00 pm on
Wednesday November 12 until 6:00 pm on Thursday November 13, 2025.
This is a full downtime, including no access to login, development,
data-transfer, and app nodes. Compute nodes will be shutdown as
well. Jobs with runtimes that go into the maintenance window will be
started after the downtime. Starting October 29 at 4:00pm, jobs
relying on the default 14-day runtime will not be launched until after
the downtime.  UCSF Facilities will perform annual fire inspection
activities to remain compliant with regulations. The network team will
update a core switch. The Wynton team will take the opportunity to
implement kernel updates during this period.
<br><span class="timestamp">October 29, 12:00 PT</span>

<!--
comment: Scheduled downtime
start: 2025-11-12T15:00:00
stop: 2025-11-13T18:00:00
length: 27 hours
severity: under-maintenance
affected: jobs, beegfs, compute, *
reason: scheduled
 -->


### November 16-ongoing, 2023

#### <span style="color: orange;">Sporadic job failure</span>

**Update**: There was another burst of "can't get password entry for
user" errors starting on 2025-01-26 around 15:30, causing jobs to fail
immediately. We are restarting the SSSD service on the ~140 compute
nodes we have identified suffer from this problem.  <br><span
class="timestamp">January 27, 11:45 PT</span>

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
