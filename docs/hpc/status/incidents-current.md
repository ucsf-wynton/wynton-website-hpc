### October 14-18, 2024

#### <span style="color: orange;">Full downtime</span>

**Update**: The cluster including all its storage is offline
undergoing a scheduled maintenance.
<br><span class="timestamp">October 14, 11:00 PT</span>

**Notice**: The cluster will be shut down for maintenance from 8:00 am
on Monday October 14 until 5:00 pm on Friday October 18, 2024. This is
a full downtime, including no access to login, development,
data-transfer, and app nodes. Compute nodes will be shutdown as
well. Starting 14 days before, the maximum job runtime will be
decreased on a daily basis from the current 14 days down to one day so
that jobs finish in time before the shutdown. Jobs with runtimes that
go into the maintenance window will be started after the downtime.
The reason for the downtime is that UCSF Facilities will perform
maintenance affecting cooling in our data center. We will take this
opportunity to perform system updates and BeeGFS maintenance.
<br><span class="timestamp">September 20, 16:45 PT</span>

<!--
comment: Scheduled downtime
start: 2024-10-14T08:00:00
stop: 2024-10-18T17:00:00
length: ?? hours
severity: under-maintenance
affected: jobs, beegfs, compute, *
reason: scheduled
 -->


### January 25-ongoing, 2024

#### <span style="color: orange;">Emergency shutdown due to cooling issue</span>

**Update**: UCSF Facilities performed testing for rerouting of updated
chilled-water piping the building where the Wynton data center is
hosted between 07-12 on 2024-05-08.
<br><span class="timestamp">May 9, 12:30 PT</span>

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
