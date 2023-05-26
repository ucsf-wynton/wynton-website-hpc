### May 16-30 (end date uncertain), 2023

#### <span style="color: orange;">Full downtime</span>

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
start: 2023-05-16T21:00:00
stop: 2023-05-17T17:00:00
length: 20 hours
severity: under-maintenance
affected: jobs, beegfs, compute, *
reason: scheduled
 -->

