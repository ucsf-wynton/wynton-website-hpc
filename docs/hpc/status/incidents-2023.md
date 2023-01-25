### Operational Summary for 2023 (this far)

* Full downtime:
  - Scheduled: 0.0 hours (= 0.0 days)
  - Unscheduled: 0.0 hours (= 0.0 days)
  - Total: 0.0 hours (= 0.0 days)
  - External factors: 0% of the above downtime, corresponding to 0.0
    hours (= 0.0 days), were due to external factors


#### Scheduled maintenance downtimes

* Impact: No file access, no compute resources available
* Damage: None
* Occurrences:
  - N/A
* Total downtime: 0.0 hours

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

