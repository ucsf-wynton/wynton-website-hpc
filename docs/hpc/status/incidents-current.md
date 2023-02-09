### February 22-23, 2023

#### <span style="color: orange;">Full downtime</span>

<!--
**Resolved**: The cluster maintenance has completed and the cluster is now fully operational again.
<br><span class="timestamp">February 23, 17:00 PST</span>

**Update**: The cluster has been shutdown for maintenance.
<br><span class="timestamp">February 22, 21:00 PST</span>
-->

**Notice**: The cluster will be shut down for maintenance from 9 pm on Wednesday February 22 until 5:00 pm on Thursday February 23, 2023. Starting February 8, the maximum job runtime will be decreased on a daily basis from the current 14 days so that jobs finish in time. This is done to avoid possible file-system and hardware failures when the UCSF Facilities performs power-system maintenance.  During this downtime, we will perform cluster maintenance.
<br><span class="timestamp">February 9, 09:00 PST</span>

<!--
start: 2023-02-22T21:00:00
stop: 2023-02-23T17:00:00
length: 20 hours
severity: under-maintenance
affected: jobs, beegfs, compute, *
reason: scheduled
 -->


### April 26, 2022

#### <span style="color: orange;">X2Go not working on GPU development nodes</span>

**Notice**: X2Go is currently broken on gpudev1 and pgpudev1. Symptom
is the session disconnects after successful authentication. We are
working on diagnosing the problem with the vendor. In the meantime,
please instead use port forwarding for GUI/Jupyter use of gpudev1 and
pgpudev1.
<br><span class="timestamp">April 26, 13:40 PDT</span>
