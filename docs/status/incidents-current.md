### March 18-22, 2022

#### <span style="color: orange;">Job scheduler is disabled because of BeeGFS issues</span>

**Update**: The BeeGFS issue has been identified. We identified a job that appears to trigger a bug in BeeGFS, which we can reproduce. The BeeGFS vendor will work on a bug fix. The good news is that the job script that triggers the problem can be tweaked to avoid hitting the bug. This means we can enable the job scheduler as soon as all BeeGFS metadata servers have synchronized, which we expect to take a few hours.
<br><span class="timestamp">March 22, 12:00 PDT</span>

**Update**: The BeeGFS file system troubleshooting continues. The job queue is still disabled. You might experience login and non-responsive prompt issues while we troubleshoot this. We have met with the BeeGFS vendors this morning and we are collecting debug information to allow them to troubleshoot the problem on their end. At the same time, we hope to narrow in on the problem further on our end by trying to identify whether there is a particular job or software running on the queue that might cause this. Currently, we have no estimate when this problem will be fixed. We have another call scheduled with the vendor tomorrow morning.
<br><span class="timestamp">March 21, 11:45 PDT</span>

**Update**: The BeeGFS file system is back online and the cluster can be accessed again. However, we had to put SGE in maintenance mode, which means no jobs will be started until the underlying problem, which is still unknown, has been identified and resolved.  The plan is to talk to the BeeGFS vendor as soon as possible after the weekend.  Unfortunately, in order to stabilize BeeGFS, we had to kill, at 16:30 today, all running jobs and requeue them on the SGE job scheduler. They are now listed as status 'Rq'. For troubleshooting purposes, please do _not_ delete any of your 'Rq' jobs.
<br><span class="timestamp">March 18, 17:05 PDT</span>

**Notification**: The Wynton environment cannot be accessed at the moment. This is because the global file system, BeeGFS, is experiencing issues. The problem, which started around 11:45 today, is being investigated.
<br><span class="timestamp">March 18, 11:55 PDT</span>

<!--
start: 2022-03-18T11:45:00
stop: 2022-03-22T...?
length: ... hours
severity: major-outage
affected: jobs, beegfs, compute
reason: beegfs
 -->
