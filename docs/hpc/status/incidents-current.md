### June 15-ongoing, 2024

#### <span style="color: orange;">File-system unreliable</span>

**Update**: Development nodes are available. We have also opened up
100 compute nodes. We will keep monitoring BeeGFS over the weekend
with the plan to re-enable the remaining compute nodes if all go well.
<br><span class="timestamp">June 21, 19:15 PT</span>

**Update**: The login and data-transfer nodes are available. We will
continue to validate BeeGFS during the day with the intent to open up
the development nodes and a portion of the compute nodes before the
weekend.
<br><span class="timestamp">June 21, 12:45 PT</span>

**Update**: We decided to replace the problematic chassis with a
spare. The RAID file system has two failing drives, which are
currently being restored. We expect this to finish up in the
morning. Then, we will replace those two failing drives and proceed
with another restore. If that succeeds, we plan to open up the login
nodes to make files available again. After that, the goal is to slowly
open up the queue and compute nodes over the weekend.
<br><span class="timestamp">June 20, 23:30 PT</span>

**Update**: We had folks onsite today to complete some preventative
maintenance on all of the disk chassis (and, in a fit of optimism,
bring up all of the nodes to prepare for a return to production).  As
this maintenance involved new firmware, we had some hope that it might
sort out our issues with the problematic chassis.  Unfortunately, our
testing was still able to cause an issue (read: crash). We've sent
details from this latest crash to the vendor and we'll be pushing hard
to work with them tomorrow Thursday to sort things out.
<br><span class="timestamp">June 20, 00:15 PT</span>

**Update**: The vendor is still working on diagnosing our disk chassis
issue.  That work will resume after Wednesday's holiday.  So,
unfortunately, we will not be able to bring Wynton up on Wednesday.
We hope to come up on Thursday, but it all depends on our testing and
the vendor's investigation.
<br><span class="timestamp">June 19, 01:00 PT</span>

**Update**: We are working with both the system and chassis vendors to
diagnose this and determine what the problem is and how to fix
it. This process is taking much longer than we'd like, and it is
looking increasingly unlikely that we'll be in a position to bring
Wynton back online today.
<br><span class="timestamp">June 18, 14:00 PT</span>

**Update**: A disk chassis that hosts part of `/wynton/home` appears
to be failing. It works for a while and then fails, which brings down
`/wynton`.  We are trying to keep it running as much as possible, but
can't make any promises.
<br><span class="timestamp">June 16, 00:15 PT</span>

**Notice**: Wynton is currently down due to an unknown issue. The
problem started around 15:00 on Saturday 2024-06-15.
<br><span class="timestamp">June 15, 23:15 PT</span>

<!--
start: 2024-06-15T15:00:00
stop: 2024-06-21T19:00:00
length: 144 hours - 32.0 hours scheduled maintenance = 112 hours
severity: major-outage
affected: jobs, beegfs, compute, *
reason: beegfs
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
