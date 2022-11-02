### November 2, 2022

#### <span style="color: orange;">Major BeeGFS issues</span>

**Notice**: The BeeGFS file system started to experience issues early morning on Tuesday 2022-11-02.  The symptoms are missing files and folders.
<br><span class="timestamp">November 2, 08:15 PDT</span>

<!--
start: 2022-11-02T10:00:00
stop: 2022-11-02T11:00:00
length: 1.0 hours
severity: major-outage
affected: jobs, beegfs, compute
reason: beegfs
 -->


### November 1, 2022

#### <span style="color: orange;">Scheduler not available</span>

**Update**: The job scheduler is responsive again, but we are not
certain what caused the problem. We will keep monitoring the issue.
<br><span class="timestamp">November 1, 16:30 PDT</span>

**Notice**: The job scheduler, SGE, does not respond to user requests,
e.g. `qstat` and `qsub`.  No new jobs can be submitted at this time.
The first reports on problems came in around 09:00 this morning.  We
are troubleshooting the problem.
<br><span class="timestamp">November 1, 10:25 PDT</span>


### April 26, 2022

#### <span style="color: orange;">X2Go not working on GPU development nodes</span>

**Notice**: X2Go is currently broken on gpudev1 and pgpudev1. Symptom
is the session disconnects after successful authentication. We are
working on diagnosing the problem with the vendor. In the meantime,
please instead use port forwarding for GUI/Jupyter use of gpudev1 and
pgpudev1.
<br><span class="timestamp">April 26, 13:40 PDT</span>
