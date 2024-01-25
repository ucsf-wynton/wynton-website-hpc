### January 25, 2024

#### <span style="color: orange;">Emergency shutdown due to cooling issue</span>

**Notice**: We are shutting down all Wynton compute nodes as an
emergency action. This is due to a serious issue with the
chilled-water system that feeds the cooling in the Wynton data
center. By shutting down all of the compute nodes, we hope to slow the
current temperature rise, while keeping the storage system and login
nodes up. The will come back up again as soon as the UCSF Facilities
has resolved the chilled-water system. ETA is currently unknown.
<br><span class="timestamp">January 25, 11:25 PT</span>

<!--
start: 2024-01-25T11:25:00
stop: ...
length: 
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



### November 15-ongoing, 2023

#### <span style="color: orange;">Upgrading compute nodes</span>

**Update**: A total of ~15,000 CPU cores are now up and running.
<br><span class="timestamp">November 27, 15:00 PT</span>

**Update**: A total of ~14,000 CPU cores are now up and running.
<br><span class="timestamp">November 26, 02:00 PT</span>

**Update**: A total of ~13,000 CPU cores are now up and running.
<br><span class="timestamp">November 22, 15:30 PT</span>

**Update**: A total of ~12,000 CPU cores are now up and running.
<br><span class="timestamp">November 22, 01:00 PT</span>

**Update**: A total of ~10,000 CPU cores are now up and running.
<br><span class="timestamp">November 21, 01:00 PT</span>

**Update**: 98 compute nodes with a total of 2,780 CPU cores are now
up and running.
<br><span class="timestamp">November 16, 15:00 PT</span>

**Notice**: As we come back from the downtime, we start out with 36
out of 490 compute nodes available to process jobs.  Work continues to
migrating the remaining nodes to Rocky 8.
<br><span class="timestamp">November 15, 14:15 PT</span>

<!--
start: 2023-11-15T09:00:00
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
