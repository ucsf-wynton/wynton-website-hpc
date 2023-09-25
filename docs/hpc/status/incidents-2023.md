### Operational Summary for 2023 (this far)

* Full downtime:
  - Scheduled: 37.0 hours (= 1.5 days)
  - Unscheduled: 359.0 hours (= 15.0 days)
  - Total: 396.0 hours (= 16.5 days)
  - External factors: 0% of the above downtime, corresponding to 0.0 hours (= 0.0 days), were due to external factors


#### Scheduled maintenance downtimes

* Impact: No file access, no compute resources available
* Damage: None
* Occurrences:
  - 2023-02-22 (17.0 hours)
  - 2023-05-17 (20.0 hours)
* Total downtime: 37.0 hours

#### Scheduled kernel maintenance

* Impact: Fewer compute nodes than usual until rebooted
* Damage: None
* Occurrences:
  - N/A

#### Unscheduled downtimes due to power outage

* Impact: No file access, no compute resources available
* Damage: Running jobs (<= 14 days) failed, file-transfers failed,
  possible file corruptions
* Occurrences:
  - N/A
* Total downtime: 0.0 hours of which 0.0 hours were due to external
  factors
  
#### Unscheduled downtimes due to file-system failures

* Impact: No file access
* Damage: Running jobs (<= 14 days) may have failed, file-transfers
  may have failed, cluster not accessible
* Occurrences:
  - N/A
* Total downtime: 0.0 hours of which 0.0 hours were due to external
  factors

#### Unscheduled downtimes due to other reasons

* Impact: Less compute resources
* Damage: Running jobs (<= 14 days) may have failed, file-transfers
  may have failed, cluster not accessible
* Occurrences:
  - 2023-05-17 -- 2023-06-01 (359.0 hours)
* Total downtime: 0.0 hours of which 0.0 hours were due to external
  factors



### May 16-June 1, 2023

#### <span style="color: orange;">Full downtime followed by network and file-system recovery</span>

**Resolved**: All group directories (`/wynton/group`, `/wynton/protected/group`, and `/wynton/protected/project`) are open and SGE is running jobs. **If you encounter a "Communication error on send" error, please do not delete or move the affected file.** Details: The final two ZFS storage targets, which content could not be recovered, are still offline.  Affected users and labs will get a "Communication error on send" error whenever attempting to access a file, or parts of a file, that are residing on the two corrupted ZFS storage targets. If you need a list of affected files specific to your lab on those two targets, please contact the Wynton support team.
<br><span class="timestamp">June 30, 15:50 PDT</span>

**Update**: We will be reintroducing the final two ZFS storage targets back into the BeeGFS file system (`/wynton`) on Friday June 30.  The work will start at 10 am and should take an hour or so.  During that time, there will be a couple of brief "blips" as we reconfigure the storage.
<br><span class="timestamp">June 29, 23:55 PDT</span>

**Update**: Organizing the data recovered from ZFS storage target 22004 into a form suitable for BeeGFS is taking long than expected. Thus far, we've properly replaced 10,354,873 of the 11,351,926 recovered files. Approximately one million files remain. We now hope to complete the work this week. The automatic clean up of old files on `/wynton/scratch` and `/wynton/protected/scratch` have been resumed.
<br><span class="timestamp">June 27, 17:00 PDT</span>

**Update**: There are two broken ZFS storage targets (22004 and 21002). We expect to recover most files on target 22004 (approximately 14 TB). The reason it takes this long to recover that storage target is that the file chunks are there, but we have to puzzle them together to reconstruct the original files, which is a slow process. We estimate this process to complete by the end of the week. The files on the other target, target 21002, are unfortunately not recoverable. **If you encounter a "Communication error on send" error, please do not delete or move the affected file.**
<br><span class="timestamp">June 21, 23:30 PDT</span>

**Update**: There are two ZFS storage targets that are still failing and offline. We have hopes to be able to recover files from one of them. As of June 9, about 12 TB of low-level, raw file data (out of ~15 TB) was recovered. When that is completed, we will start the tedious work on reconstructing the actual files lost.  The consultants are less optimistic about recovering data from second storage target, because it was much more damaged. They will give us the final verdict by the end of the week.  **If you encounter a "Communication error on send" error, please do not delete or move the affected file.**
<br><span class="timestamp">June 12, 16:00 PDT</span>

**Update**: The job scheduler is now available. Access to `/wynton/group`, `/wynton/protected/group`, and `/wynton/protected/project` has been restored.
**If you encounter a "Communication error on send" error, please do not delete or move the affected file.**
<br><span class="timestamp">June 1, 16:00 PDT</span>

**Update**: Wynton will be fully available later today, meaning the job scheduler and access to `/wynton/group`, `/wynton/protected/group`, and `/wynton/protected/project` will be re-enabled. Note, two ZFS storage targets are still faulty and offline, but the work of trying to recover them will continue while we go live. This means that any files on the above re-opened `/wynton` subfolders that are stored, in part or in full, on those two offline storage targets will be inaccessible. Any attempt to read such files will result in a "Communication error on send" error and stall. To exit, press <kbd>Ctrl-C</kbd>. **Importantly, do _not_ attempt to remove, move, or update such files! That will make it impossible to recover them!**
<br><span class="timestamp">June 1, 12:15 PDT</span>

**Update**: In total 22 (92%) out of 24 failed storage targets has been recovered. The consultant hopes to recover the bulk of the data from one of the two remaining damaged targets. The final damage target is heavily damaged, work on it will continue a few more days, but it is likely it cannot be recovered. The plan is to open up `/wynton/group` tomorrow Thursday with instructions what to expect for files on the damaged targets. The compute nodes and the job scheduler will also be enabled during the day tomorrow.
<br><span class="timestamp">May 31, 22:45 PDT</span>

**Update**: In total 22 (92%) out of 24 failed storage targets has been recovered. The remaining two targets are unlikely to be fully recovered. We're hoping to restore the bulk of the files from them, but there is a risk that we will get none back. Then plan is to bring back `/wynton/group`, `/wynton/protected/group`, and `/wynton/protected/project`, and re-enable the job queue, on Thursday.
<br><span class="timestamp">May 31, 01:00 PDT</span>

**Update**: The login, data-transfer, and development nodes (except `gpudev1`) are now online an available for use. The job scheduler and compute nodes are kept offline, to allow for continued recovery of the failed ZFS storage pools. For the same reason, folders under `/wynton/group`, `/wynton/protected/group`, and `/wynton/protected/project` are locked down, except for groups who have mirrored storage. `/wynton/home` and `/wynton/scratch` are fully available.  We have suspended the automatic cleanup of old files under `/wynton/scratch` and `/wynton/protected/scratch`. The ZFS consultant recovered 3 of the 6 remaining storage targets. We have now recovered in total 21 (88%) out of 24 failed targets. The recovery work will continue on Monday (sic!).
<br><span class="timestamp">May 26, 17:00 PDT</span>

**Update**: All 12 ZFS storage targets on one server pair have been recovered and are undergoing final verification, after which that server pair is back in production. On the remaining server pair with also 12 failed ZFS storage targets, 4 targets have been recovered, 4 possibly have been, and 4 are holding out. We're continuing our work with the consultant on those targets. These storage servers were installed on 2023-03-28, so it is only files written after that date that may be affected.  We are tentatively planning on bringing up the login, data transfer and development nodes tomorrow Friday, prior to the long weekend, but access to directories in `/wynton/group`, `/wynton/protected/group`, or `/wynton/protected/project` will be blocked with the exception for a few groups with mirrored storage. `/wynton/home` and `/wynton/scratch` would be fully accessible.
<br><span class="timestamp">May 25, 17:00 PDT</span>

**Update**: 8 more ZFS storage targets were recovered today. We have now recovered in total 17 (71%) out of 24 failed targets. The content of the recovered targets is now being verified. We will continue working with the consultant tomorrow on the remaining 7 storage targets.
<br><span class="timestamp">May 24, 17:00 PDT</span>

**Update**: The maintenance and upgrade of the Wynton network switch was successful and is now completed. We also made progress of recovering the failed ZFS storage targets - 9 (38%) out of 24 failed targets have been recovered. To maximize our chances at a full recovery, Wynton will be kept down until the consultant completes their initial assessment. Details: The contracted ZFS consultant started to work on recovering the failed ZFS storage targets that we have on four servers. During the two hours of work, they quickly recovered another three targets on on the first server, leaving us with only one failed target on that server. Attempts of the same recovery method on the second and third servers were not successful. There was no time today to work on the fourth server. The work to recover the remaining targets will resume tomorrow. After the initial recovery attempt has been attempted on all targets, the consultant, who is one of the lead ZFS developers, plans to load a development version of ZFS on the servers in order to perform more thorough and deep-reaching recovery attempts.
<br><span class="timestamp">May 23, 17:00 PDT</span>

**Update**: Wynton will be kept down until the ZFS-recovery consultant has completed their initial assessment. If they get everything back quickly, Wynton will come back up swiftly. If recovery takes longer, or is less certain, we will look at coming back up without the problematic storage targets.  As the purchase is being finalized, we hope that the consultant can start their work either on Tuesday or Wednesday.  The UCSF Networking Team is performing more maintenance on the switch tonight.
<br><span class="timestamp">May 22, 23:30 PDT</span>

**Update**: The cluster will be kept offline until at least Tuesday May 23. The BeeGFS file-system failure is because 24 out of 144 ZFS storage targets got corrupted.  These 24 storage targets served our "group" storage, which means only files written to `/wynton/group`, `/wynton/protected/group`, and `/wynton/protected/project` within the past couple of months are affected. Files under `/wynton/home` and `/wynton/scratch` are not affected. We are scanning the BeeGFS file system to identify exactly which files are affected. Thus far, we have managed to recover 6 (25%) out of the 24 failed targets. The remaining 18 targets are more complicated and we are working with a vendor to start helping us recover them next week.
<br><span class="timestamp">May 19, 10:15 PDT</span>

**Update**: Automatic cleanup of `/wynton/scratch` has been disabled.
<br><span class="timestamp">May 18, 23:00 PDT</span>

**Update**: Several ZFS storage targets that are used by BeeGFS experienced failures during the scheduled maintenance window. There is a very high risk of partial data loss, but we will do everything possible to minimize the loss.  In addition, the Wynton core network switch failed and needs to be replaced. The UCSF IT Infrastructure Network Services Team works with the vendor to get a rapid replacement.
<br><span class="timestamp">May 17, 16:30 PDT</span>

**Update**: The cluster is down and unavailable because of maintenance.
<br><span class="timestamp">May 16, 21:00 PDT</span>

**Update**: There will be a one-day downtime starting at 21:00 on Tuesday May 16 and ending at 17:00 on Wednesday May 17. This is aligned with a planned PG&E power-outage maintenance on May 17.  Starting May 2, the maximum job runtime will be decreased on a daily basis from the maximum 14 days so that jobs finish in time. Jobs with runtimes going into the maintenance window, will only be started after the downtime. The default run time is 14 days, so make sure to specify `qsub -l h_rt=<run-time> ...` if you want something shorter.
<br><span class="timestamp">May 3, 10:00 PDT</span>

**Update**: The updated plan is to only have a 24-hour downtime starting the evening of Tuesday May 16 and end by the end of Wednesday May 17. This is aligned with a planned PG&E power-outage maintenance on May 17.
<br><span class="timestamp">April 24, 11:00 PDT</span>

**Update**: The updated plan is to have the downtime during the week of May 15, 2023 (2023W20). This is aligned with a planned PG&E power-outage maintenance during the same week.
<br><span class="timestamp">March 27, 11:00 PDT</span>

**Notice**: We will performing a full-week major update to the cluster during late Spring 2023. Current plan is to do this during either the week of May 8, 2023 (2023W19) or the week of May 15, 2023 (2023W20).
<br><span class="timestamp">February 27, 11:00 PST</span>

<!--
start: 2023-05-17T17:00:00
stop: 2023-06-01T16:00:00
length: 359 hours
severity: filesystem-failure
affected: jobs, beegfs, compute, storage, *
reason: unscheduled
 -->

<!--
start: 2023-05-16T21:00:00
stop: 2023-05-17T17:00:00
length: 20 hours
severity: under-maintenance
affected: jobs, beegfs, compute, *
reason: scheduled
 -->



### February 22-23, 2023

#### <span style="color: orange;">Full downtime</span>

**Resolved**: The cluster maintenance has completed and the cluster is now fully operational again.
<br><span class="timestamp">February 23, 14:00 PST</span>

**Update**: The cluster has been shut down for maintenance.
<br><span class="timestamp">February 22, 21:00 PST</span>

**Notice**: The cluster will be shut down for maintenance from 9 pm on Wednesday February 22 until 5:00 pm on Thursday February 23, 2023.  This is done to avoid possible file-system and hardware failures when the UCSF Facilities performs power-system maintenance.  During this downtime, we will perform cluster maintenance.  Starting February 8, the maximum job runtime will be decreased on a daily basis from the current 14 days so that jobs finish in time. Jobs with runtimes going into the maintenance window, will be started after the downtime.
<br><span class="timestamp">February 9, 09:00 PST</span>

<!--
start: 2023-02-22T21:00:00
stop: 2023-02-23T14:00:00
length: 17 hours
severity: under-maintenance
affected: jobs, beegfs, compute, *
reason: scheduled
 -->


### January 24, 2023

#### <span style="color: orange;">No access to login and data-transfer hosts</span>

**Resolve**: Network issues has been resolved and access to all login
and data-transfer has been re-established.  The problem was physical
(a cable was disconnected).
<br><span class="timestamp">January 24, 16:00 PST</span>

**Notice**: There is no access to non-PHI login and data-transfer
hosts (log[1-2], dt[1-2]).  We suspect a physical issue (e.g. somebody
kicked a cable), which means we need to send someone onsite to fix the
problem.
<br><span class="timestamp">January 24, 14:45 PST</span>



### January 11, 2023

#### <span style="color: orange;">No internet access on development nodes</span>

**Resolved**: The network issue for the proxy servers has been fixed.
All development nodes now have working internet access.
<br><span class="timestamp">January 11, 16:00 PST</span>

**Workarounds**: Until this issue has been resolved, and depending on
needs, you might try to use a data-transfer node.Some of the software
tools on the development nodes are also available on the data-transfer
nodes, e.g. `curl`, `wget`, and `git`.
<br><span class="timestamp">January 11, 09:50 PST</span>

**Notice**: The development nodes have no internet access, because the
network used by out proxy servers is down for unknown reasons.
The problem most likely started on January 10 around 15:45.
<br><span class="timestamp">January 11, 09:00 PST</span>

<!--
start: 2023-01-10T15:45:00
stop: 2023-01-11T15:45:00
length: 24 hours
severity: partial-outage
affected: develop
reason: network
 -->

