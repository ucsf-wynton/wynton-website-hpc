### February 21-ongoing, 2025

#### <span style="color: orange;">Kernel maintenance</span>

<!--
**Resolved**: All compute nodes have been rebooted.
<br><span class="timestamp">MONTH, DAY, YEAR, HOUR:MINUTE PT</span>
-->

**Update**: Data-transfer node `dt1` is available again.
<br><span class="timestamp">February 24, 2025, 10:30 PT</span>

**Update**: With the exception for `plog1` and `dt1`, all login,
data-transfer, and development nodes have been rebooted. Until `plog1`
is available, PHI-users may use `pdt1` and `pdt2` to login into the
cluster.
<br><span class="timestamp">February 22, 2025, 13:30 PT</span>

**Notice**: New operating-system kernels are deployed. Login,
data-transfer, and development nodes will be rebooted on Saturday,
February 22, 2025 at 13:00. Compute nodes will no longer accept new
jobs until they have been rebooted. A node will be rebooted as soon as
any existing jobs have completed, which may take up to two weeks
(maximum runtime). During this update period, there will be fewer than
usual slots available on the queues.
<br><span class="timestamp">February 21, 2025, 12:15 PT</span>


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
