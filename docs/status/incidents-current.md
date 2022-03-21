### March 18 - ongoing, 2022

#### <span style="color: orange;">Cluster is not accessible because of BeeGFS issues</span>

**Update**: The BeeGFS file system troubleshooting continues. The job queue is still disabled. We have been with the BeeGFS vendors and we are collecting debug information to allow them to troubleshoot the problem. At the same time, we are trying to identify if there is a particular job and software running on the queue that might cause this. If so, we hope to narrow in on the problem further. We have no estimate when this can be fixed. We have another call scheduled with the vendor tomorrow morning.
<br><span class="timestamp">March 22, 11:45 PDT</span>

**Update**: The BeeGFS file system is back online and the cluster can be accessed again. However, we had to put SGE in maintenance mode, which means no jobs will be started until the underlying problem, which is still unknown, has been identified and resolved.  The plan is to talk to the BeeGFS vendor as soon as possible after the weekend.  Unfortunately, in order to stabilize BeeGFS, we had to kill, at 16:30 today, all running jobs and requeue them on the SGE job scheduler. They are now listed as status 'Rq'. For troubleshooting purposes, please do _not_ delete any of your 'Rq' jobs.
<br><span class="timestamp">March 18, 17:05 PDT</span>

**Notification**: The Wynton environment cannot be accessed at the moment. This is because the global file system, BeeGFS, is experiencing issues. The problem, which started around 11:45 today, is being investigated.
<br><span class="timestamp">March 18, 11:55 PDT</span>

<!--
start: 2022-03-18T11:45:00
stop: 2022-03-..T...?
length: ... hours
severity: major-outage
affected: jobs, beegfs, compute
reason: internal
 -->
