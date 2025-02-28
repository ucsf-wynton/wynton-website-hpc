### February 21-ongoing, 2025

#### <span style="color: orange;">File system timeouts</span>

**Notice**: In order to speed up resynchronization of metadata
servers, we have decided to minimize the load on the file system by
suspending all running jobs, disable login to Wynton, and disable all
file transfers to and from Wynton.
<br><span class="timestamp">February 27, 16:30 PT</span>

**Notice**: The file system latency is extremely high, resulting in
the cluster being unusable and attempts to log in via SSH
failing. This is due to the BeeGFS secondary metadata server `meta51`
resynchronizing with the primary `meta73`.
<br><span class="timestamp">February 27, 16:15 PT</span>

**Notice**: Resynchronization of BeeGFS metadata server pair
`meta22` and `meta32` completed after 30 hours.
<br><span class="timestamp">February 27, 06:00 PT</span>

**Notice**: The file system latency is extremely high, resulting in
the cluster being unusable and attempts to log in via SSH
failing. This is due to the BeeGFS secondary metadata server `meta32`
resynchronizing with the primary `meta22`.
<br><span class="timestamp">February 26, 19:30 PT</span>

**Notice**: We are working with the vendor to try to resolve this
problem.
<br><span class="timestamp">February 26, 09:00 PT</span>

**Notice**: The file system is again very slow.
delays when working interactively and jobs to slow down.
<br><span class="timestamp">February 25, 15:15 PT</span>

**Notice**: The file system is again very slow.
<br><span class="timestamp">February 25, 10:00 PT</span>

**Notice**: The file system is very slow, which result in long delays
when working interactively and jobs to take longer than usual.
<br><span class="timestamp">February 21, 16:00 PT</span>

<!--
## When BeeGFS was down
start: 2025-01-27T07:30:00
stop: 2025-01-26T19:30:00
length: 12h00m
severity: major-outage
affected: beegfs
reason: beegfs

## When BeeGFS was down
start: 2025-01-26T19:30:00
stop: 2025-01-21T16:00:00
length: ???
severity: high
affected: beegfs
reason: beegfs

## total length on scheduler being down due to BeeGFS: 81h45m
 -->


### February 21-ongoing, 2025

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: Login node `plog1` respects SSH keys again.
<br><span class="timestamp">February 24, 2025, 11:15 PT</span>

**Update**: Login node `plog1` is available again, but does not respect
SSH keys.
<br><span class="timestamp">February 24, 2025, 10:30 PT</span>

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
