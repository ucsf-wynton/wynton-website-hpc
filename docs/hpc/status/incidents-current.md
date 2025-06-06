### May 29-ongoing, 2025

#### <span style="color: orange;">Major file system failures</span>

**Update**: We plan to resume operations by the weekend, given that
the current backup and the necessary, manual one-at-the-time
replacement of multiple drives completes in time. Files that lived on
the failed storage pool are broken and cannot not be fully read, but
possible partially. Home directories are unaffected. The affected
files live under `/wynton/group`, `/wynton/protected/group`, and
`/wynton/protected/project`. We are scanning the file system to
identify exactly which files are affected - this is a slow
processes. We will share file lists with affected groups. Eventually,
any broken files have to be deleted.
<br><span class="timestamp">June 4, 14:00 PT</span>

**Update**: Wynton jobs and logins are still paused until further
notice. Our team is working on determining all of the files that may
be corrupt/unavailable and will work with the vendor on the best
course of action. We do not yet have an estimate on when we will be
back up.
<br><span class="timestamp">May 30, 10:40 PT</span>

**Notice**: Jobs and logins have been paused until further notice.
Our team is actively troubleshooting and coordinating with the vendor.
A drive was replaced today and was in the process of resilvering when
two more drives failed, totally three failed drives, which causes
significant problems. Data corruption is expected.
<br><span class="timestamp">May 29, 18:20 PT</span>

<!--
## When BeeGFS was down
start: 2025-05-29T18:00:00
stop: 
length: 
severity: major-outage
affected: beegfs, jobs, hosts
reason: beegfs
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
