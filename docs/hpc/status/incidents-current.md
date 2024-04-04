### April 3-ongoing, 2024

#### <span style="color: orange;">Kernel maintenance</span>

**Update**: Login, data-transfer, and development nodes have been rebooted. It will take some more time before `dt1` and `plog1` are available again, because they did not come back as expected after the reboot.
<br><span class="timestamp">April 4, 11:15 PT</span>

**Notice**: New operating-system kernels are deployed. Login, data-transfer, and development nodes will be rebooted on Thursday April 4 at 11:00. Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). During this update period, there will be fewer than usual slots available on the queues.
<br><span class="timestamp">April 3, 17:30 PT</span>


### January 25-ongoing, 2024

#### <span style="color: orange;">Emergency shutdown due to cooling issue</span>

**Update**: The compute and development nodes are available again.
Jobs that were running when we did the emergency shutdown should be
considered lost and need to be resubmitted.  UCSF Facilities has
re-established cooling, but there is currently no redundancy cooling
system available, meaning there is a higher-than-usual risk for
another failure.
<br><span class="timestamp">January 25, 15:45 PT</span>

**Notice**: We are shutting down all Wynton compute and development
nodes as an emergency action. This is due to a serious issue with the
chilled-water system that feeds the cooling in the Wynton data
center. By shutting down all of the compute nodes, we hope to slow the
current temperature rise, while keeping the storage system, login and
data-transfer nodes up. The will come back up again as soon as the
UCSF Facilities has resolved the chilled-water system. ETA is
currently unknown.
<br><span class="timestamp">January 25, 11:25 PT</span>

<!--
start: 2024-01-25T11:25:00
stop: 2024-01-25T15:25:00
length: 4.0 hours
severity: major-outage
affected: jobs
reason: external
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
