### October 27-ongoing, 2023

#### <span style="color: orange;">File-system failures</span>

**Update**: The BeeGFS issue is related to a CentOS 7-kernel bug in
one of our BeeGFS metadata servers. To minimize the risk of data loss
on the `/wynton` file system, we took the decision to shut down Wynton
immediately. At the moment, we do not have an estimate on how long it
will take to resolve this problem.  It has to be resolved before we
can begin the major upgrade scheduled for 2023W44.
<br><span class="timestamp">October 27, 16:30 PST</span>

**Notice**: The BeeGFS file system, which hosts `/wynton`, is
experiencing unexpected, major issues.  Some or all files on `/wynton`
cannot be accessed, and when attempted, an `Communication error on
send` error is seen.  The problem started around 13:45 on Friday
2023-10-27.
<br><span class="timestamp">October 27, 15:10 PST</span>

<!--
start: 2023-10-27T13:45:00
stop: 
length: 
severity: filesystem-failure
affected: jobs, beegfs, compute, storage, *
reason: unscheduled
 -->

