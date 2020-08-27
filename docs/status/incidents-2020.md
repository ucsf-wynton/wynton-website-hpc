### August 19, 2020

#### <span style="color: orange;">Cluster inaccessible (due to BeeGFS issues)</span>

**Resolved**: Our BeeGFS file system was non-responsive between 17:22 and 18:52 today because one of its meta servers hung while the other attempted to synchronize to it.
<br><span class="timestamp">August 19, 19:00 PDT</span>

**Notice**: The cluster is currently inaccessible for unknown reasons. The problem was first reported around 17:30 today.
<br><span class="timestamp">August 19, 18:15 PDT</span>


### August 10-13, 2020

#### <span style="color: orange;">Network and hardware upgrades (full downtime)</span>

**Resolved**: The cluster is fully back up and running.  Several compute nodes still need to be rebooted but we consider this upgrade cycle completed.  The network upgrade took longer than expected, which delayed the processes.  We hope to bring the new lab storage online during the next week.
<br><span class="timestamp">August 13, 21:00 PDT</span>

**Update**: All login, data-transfer, and development nodes are online.
Additional compute nodes are being upgraded and are soon part of the
pool serving jobs.
<br><span class="timestamp">August 13, 14:50 PDT</span>

**Update**: Login node log1, data-transfer node dt2, and the development nodes
are available again.  Compute nodes are going through an upgrade cycle and
will soon start serving jobs again.  The upgrade work is taking longer than
expected and will continue tomorrow Thursday August 13.
<br><span class="timestamp">August 12, 16:10 PDT</span>

**Notice**: All of the {{ site.cluster.name }} environment is down for maintenance
and upgrades.
<br><span class="timestamp">August 10, 00:00 PDT</span>

**Notice**: Starting early Monday August 10, the cluster will be powered down
entirely for maintenance and upgrades, which includes upgrading the network
and adding lab storage purchased by several groups.  We anticipate that
the cluster will be available again by the end of Wednesday August 12.
<br><span class="timestamp">July 24, 15:45 PDT</span>



### July 6, 2020

#### <span style="color: orange;">Development node failures</span>

**Resolved**: All three development nodes have been rebooted.
<br><span class="timestamp">July 6, 15:20 PDT</span>

**Notice**: The three regular development nodes have all gotten themselves hung up on one particular process.  This affects basic system operations and preventing such basic commands as `ps` and `w`.  To clear this state, we'll be doing an emergency reboot of the dev nodes at about 15:15.
<br><span class="timestamp">July 6, 15:05 PDT</span>


### July 5, 2020

#### <span style="color: orange;">Job scheduler non-working</span>

**Resolved**: The SGE scheduler produced errors when queried or when jobs were submitted or launched.  The problem started 00:30 and lasted until 02:45 early Sunday 2020-07-05.
<br><span class="timestamp">July 6, 22:00 PDT</span>


### June 11-26, 2020

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: All compute nodes have been rebooted.
<br><span class="timestamp">June 26, 10:45 PDT</span>

**Update**: Development node dev3 is back online.
<br><span class="timestamp">June 15, 11:15 PDT</span>

**Update**: Development node dev3 is not available.  It failed to reboot and requires on-site attention, which might not be possible for several days.  All other log-in, data-transfer, and development nodes were rebooted successfully.
<br><span class="timestamp">June 11, 15:45 PDT</span>

**Notice**: New operating-system kernels are deployed. Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). During this update period, there will be fewer than usual slots available on the queues. To follow the progress, see the green 'Available CPU cores' curve (target ~10,400 cores) in the graph above.  Log-in, data-transfer, and development nodes will be rebooted at 15:30 on Thursday June 11.
<br><span class="timestamp">June 11, 10:45 PDT</span>


### June 5-9, 2020

#### <span style="color: orange;">No internet access on development nodes</span>

**Resolved**: Internet access from the development nodes is available again.  A new web-proxy server had to be built and deploy.
<br><span class="timestamp">June 9, 09:15 PDT</span>

**Notice**: Internet access from the development nodes is not available.  This is because the proxy server providing them with internet access had a critical hardware failure around 08-09 this morning.  At the most, we cannot provide an estimate when we get to restore this server.
<br><span class="timestamp">June 5, 16:45 PDT</span>


### May 18-22, 2020

#### <span style="color: orange;">File-system maintenance</span>

**Update**: The upgrade of the BeeGFS filesystem introduced new issues.
We decided to rollback the upgrade and we are working with the vendor.
There is no upgrade planned for the near term.
<br><span class="timestamp">June 8, 09:00 PDT</span>

**Update**: The BeeGFS filesystem has been upgraded using a patch from the
vendor. The patch was designed to lower the amount of resynchronization needed
between the two metadata servers. Unfortunately, after the upgrade we observe
an increase of resynchronization.  We will keep monitoring the status.  If
the problem remains, we will consider a rollback to the BeeGFS version used
prior to May 18.
<br><span class="timestamp">May 22, 01:25 PDT</span>

**Update**: For a short moment around 01:00 early Friday, both of our BeeGFS
metadata servers were down.  This may have lead to some applications
experiencing I/O errors around this time.
<br><span class="timestamp">May 22, 01:25 PDT</span>

**Notice**: Work to improve the stability of the BeeGFS filesystem (`/wynton`)
will be conducted during the week of May 18-22. This involves restarting the
eight pairs of metadata server processes, which may result in several brief
stalls of the file system. Each should last less than 5 minutes and operations
will continue normally after each one.
<br><span class="timestamp">May 6, 15:10 PDT</span>


### May 28-29, 2020

#### <span style="color: orange;">GPU compute nodes outage</span>

**Resolved**: The GPU compute nodes are now fully available to serve jobs.
<br><span class="timestamp">May 29, 12:00 PDT</span>

**Update**: The GPU compute nodes that went down yesterday have been rebooted.
<br><span class="timestamp">May 29, 11:10 PDT</span>

**Investigating**: A large number of GPU compute nodes in the MSG data center are currently down for unknown reasons.  We are investigating the cause.
<br><span class="timestamp">May 28, 09:35 PDT</span>


### February 5-7, 2020

#### <span style="color: orange;">Major outage due to NetApp file-system failure</span>

**Resolved**: The {{ site.cluster.name }} system is considered fully functional again.  The legacy, deprecated NetApp storage was lost.
<br><span class="timestamp">February 10, 10:55 PDT</span>

**Update**: The majority of the compute nodes have been rebooted and are now online and running jobs.  We will actively monitor the system and assess the how everything works before we considered this incident resolved.
<br><span class="timestamp">February 7, 13:40 PDT</span>

**Update**: The login, development and data transfer nodes will be rebooted at 01:00 today Friday February 7.
<br><span class="timestamp">February 7, 12:00 PDT</span>

**Update**: The failed legacy NetApp server is the cause to the problems, e.g. compute nodes not being responsive causing problems for SGE etc. Because of this, **all of the cluster - login, development, transfer, and computes nodes - will be rebooted tomorrow Friday 2020-02-07**.
<br><span class="timestamp">February 6, 10:00 PDT</span>

**Notice**: {{ site.cluster.name }} is experience major issues due to NetApp file-system failure, despite this is being deprecated and not used much these days. The first user report on this came in around 09:00 and the job-queue logs suggests the problem began around 02:00.  It will take a while for everything to come back up and there will be brief BeeGFS outage while we reboot the BeeGFS management node.
<br><span class="timestamp">February 5, 10:15 PDT</span>


### January 29, 2020

#### <span style="color: orange;">BeeGFS failure</span>

**Resolved**: The BeeGFS file-system issue has been resolved by rebooting two meta servers.
<br><span class="timestamp">January 29, 17:00 PDT</span>

**Notice**: There's currently an issue with the BeeGFS file system.  Users reporting that they cannot log in.
<br><span class="timestamp">January 29, 16:00 PDT</span>


### January 22, 2020

#### <span style="color: orange;">File-system maintenance</span>

**Resolved**: The BeeGFS upgrade issue has been resolved.
<br><span class="timestamp">Jan 22, 14:30 PST</span>

**Update**: The planned upgrade caused unexpected problems to the BeeGFS file system resulting in `/wynton/group` becoming unstable.
<br><span class="timestamp">Jan 22, 13:35 PST</span>

**Notice**: One of the BeeGFS servers, which serve our cluster-wide file system, will be swapped out starting at noon (11:59am) on Wednesday January 22, 2020 and the work is expected to last one hour.  We don't anticipate any downtime because the BeeGFS servers are mirrored for availability.
<br><span class="timestamp">Jan 16, 14:40 PST</span>


### December 20, 2019 - January 4, 2020

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: All compute nodes have been updated and rebooted.
<br><span class="timestamp">Jan 4, 11:00 PST</span>

**Notice**: Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). During this update period, there will be fewer available slots on the queues than usual. To follow the progress, see the green 'Available CPU cores' curve (target ~7,500 cores) in the graph above.  Log-in, data-transfer, and development nodes will be rebooted at 15:30 on Friday December 20.  GPU nodes already run the new kernel and are not affected.
<br><span class="timestamp">December 20, 10:20 PST</span>
