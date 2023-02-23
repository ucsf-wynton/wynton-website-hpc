### Operational Summary for 2023 (this far)

* Full downtime:
  - Scheduled: 17.0 hours (= 0.6 days)
  - Unscheduled: 0.0 hours (= 0.0 days)
  - Total: 17.0 hours (= 0.6 days)
  - External factors: 0% of the above downtime, corresponding to 0.0
    hours (= 0.0 days), were due to external factors


#### Scheduled maintenance downtimes

* Impact: No file access, no compute resources available
* Damage: None
* Occurrences:
  - 2023-02-22 (17.0 hours)
* Total downtime: 17.0 hours

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
  - N/A
* Total downtime: 0.0 hours of which 0.0 hours were due to external
  factors


### February 22-23, 2023

#### <span style="color: orange;">Full downtime</span>

**Resolved**: The cluster maintenance has completed and the cluster is now fully operational again.
<br><span class="timestamp">February 23, 14:00 PST</span>

**Update**: The cluster has been shut down for maintenance.
<br><span class="timestamp">February 22, 21:00 PST</span>

**Notice**: The cluster will be shut down for maintenance from 9 pm on Wednesday February 22 until 5:00 pm on Thursday February 23, 2023.  This is done to avoid possible file-system and hardware failures when the UCSF Facilities performs power-system maintenance.  During this downtime, we will perform cluster maintenance.  Starting February 8, the maximum job runtime will be decreased on a daily basis from the current 14 days so that jobs finish in time. Jobs with runtimes going into the maintainance window, will be started after the downtime.
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

