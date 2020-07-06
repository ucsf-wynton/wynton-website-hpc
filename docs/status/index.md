# UCSF {{ site.cluster.name }} HPC Status

<!-- To display the 'broadcast' icon in the navbar, edit assets/css/broadcast.css -->

{% assign status = "ok" %}

{% if status == "problematic" %} 
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} HPC is experiencing significant issues</strong>
</div>
{% elsif status == "recovering" %} 
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} HPC is operational with parts of the compute resources being recovered</strong>
</div>
{% elsif status == "kernel-upgrade" %} 
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>Wynton HPC has fewer slots available than usual due to kernel upgrades</strong><br>
</div>
{% elsif status == "full-outage" %} 
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} HPC environment non-operational</strong><br>
<em>Complete outage due to scheduled maintenance</em>
</div>
{% elsif status == "part-outage" %} 
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} HPC is operational but experiencing partial problems</strong><br>
<em>Several GPU compute nodes are down.</em>
</div>
</div>
{% elsif status == "notice" %} 
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} HPC environment operational</strong><br>
<em>There is no internet access on development nodes.</em><br>
</div>
{% else %}
<div class="alert alert-info" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>{{ site.cluster.name }} HPC environment operational</strong>
</div>
{% endif %}


## Queue Metrics
<ul class="nav nav-pills">
  <li class="active"><a data-toggle="pill" href="#queues-day">Day</a></li>
  <li><a data-toggle="pill" href="#queues-week">Week</a></li>
  <li><a data-toggle="pill" href="#queues-month">Month</a></li>
  <li><a data-toggle="pill" href="#queues-year">Year</a></li>
</ul>
<div class="tab-content" style="margin-top: 1ex;">
  <div id="queues-day" class="tab-pane fade in active">
    <img src="{{ site.assets.status_root_path }}/status/figures/queues-day.png" alt="queues usage during the last day"/><br>
    <img src="{{ site.assets.status_root_path }}/status/figures/gpuq-day.png" alt="GPU queues usage during the last day"/>
  </div>
  <div id="queues-week" class="tab-pane fade">
    <img src="{{ site.assets.status_root_path }}/status/figures/queues-week.png" alt="queues usage during the last week"/><br>
    <img src="{{ site.assets.status_root_path }}/status/figures/gpuq-week.png" alt="GPU queues usage during the last week"/>
  </div>
  <div id="queues-month" class="tab-pane fade">
    <img src="{{ site.assets.status_root_path }}/status/figures/queues-month.png" alt="queues usage during the last month"/><br>
    <img src="{{ site.assets.status_root_path }}/status/figures/gpuq-month.png" alt="GPU queues usage during the last month"/>
  </div>
  <div id="queues-year" class="tab-pane fade">
    <img src="{{ site.assets.status_root_path }}/status/figures/queues-year.png" alt="queues usage during the last year"/><br>
    <img src="{{ site.assets.status_root_path }}/status/figures/gpuq-year.png" alt="GPU queues usage during the last year"/>
  </div>
</div>


## Compute Nodes

<div id="hosttablediv">
<p id="hosttablemessage">All compute nodes are functional.</p>
</div>


## Upcoming and Current Incidents

## Current Incidents


## Past Incidents

### July 5, 2020

#### <span style="color: orange;">Job scheduler non-working</span>

**Resolved**: The SGE scheduler produced errors when queries and when submitting jobs.  The problem started 00:30 and lasted until 02:45 early Sunday 2020-07-05.
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

**Resolved**: The Wynton HPC system is considered fully functional again.  The legacy, deprecated NetApp storage was lost.
<br><span class="timestamp">February 10, 10:55 PDT</span>

**Update**: The majority of the compute nodes have been rebooted and are now online and running jobs.  We will actively monitor the system and assess the how everything works before we considered this incident resolved.
<br><span class="timestamp">February 7, 13:40 PDT</span>

**Update**: The login, development and data transfer nodes will be rebooted at 01:00 today Friday February 7.
<br><span class="timestamp">February 7, 12:00 PDT</span>

**Update**: The failed legacy NetApp server is the cause to the problems, e.g. compute nodes not being responsive causing problems for SGE etc. Because of this, **all of the cluster - login, development, transfer, and computes nodes - will be rebooted tomorrow Friday 2020-02-07**.
<br><span class="timestamp">February 6, 10:00 PDT</span>

**Notice**: Wynton is experience major issues due to NetApp file-system failure, despite this is being deprecated and not used much these days. The first user report on this came in around 09:00 and the job-queue logs suggests the problem began around 02:00.  It will take a while for everything to come back up and there will be brief BeeGFS outage while we reboot the BeeGFS management node.
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


### December 22, 2019

#### <span style="color: orange;">BeeGFS failure</span>

**Resolved**: No further hiccups were needed during the BeeGFS resynchronization.  Everything is working as expected.
<br><span class="timestamp">December 23, 10:00 PST</span>

**Update**: The issues with log in was because the responsiveness of one of the BeeGFS file servers became unreliable around 04:20.  Rebooting that server resolved the problem.  The cluster is fully functional again although slower than usual until the file system have been resynced.  After this, there might be a need for one more, brief, reboot.
<br><span class="timestamp">December 22, 14:40 PST</span>

**Notice**: It is not possible to log in to the Wynton HPC environment.  The reason is currently not known.
<br><span class="timestamp">December 22, 09:15 PST</span>


### December 18, 2019

#### <span style="color: orange;">Network/login issues</span>

**Resolved**: The Wynton HPC environment is fully functional again. The BeeGFS filesystem was not working properly during 18:30-22:10 on December 18 resulting in no login access to the cluster and job file I/O being backed up.
<br><span class="timestamp">May 19, 08:50 PST</span>

**Update**: The BeeGFS filesystem is non-responsive, which we believe is due to the network switch upgrade.
<br><span class="timestamp">May 18, 21:00 PST</span>

**Notice**: One of two network switches will be upgraded on Wednesday December 18 starting at 18:00 and lasting a few hours.  We do not expect this to impact the Wynton HPC environment other than slowing down the network performance to 50%.
<br><span class="timestamp">May 17, 10:00 PST</span>


### October 29-November 11, 2019

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: All compute nodes have been updated and rebooted.
<br><span class="timestamp">Nov 11, 01:00 PST</span>

**Notice**: Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). GPU nodes will be rebooted as soon as all GPU jobs complete.  During this update period, there will be fewer available slots on the queues than usual. To follow the progress, see the green 'Available CPU cores' curve (target ~7,000 cores) in the graph above.
<br><span class="timestamp">Oct 29, 16:30 PDT</span>


### October 25, 2019

#### <span style="color: orange;">Byers Hall power outage glitch</span>

**Resolved**: Development node `qb3-dev2` was rebooted.  Data-transfer node `dt1.wynton.ucsf.edu` is kept offline because it is scheduled to be upgraded next week.
<br><span class="timestamp">October 28, 15:00 PDT</span>

**Update**: Most compute nodes that went down due to the power glitch has been rebooted.  Data-transfer node `dt1.wynton.ucsf.edu` and development node `qb3-dev2` are still down - they will be brought back online on Monday October 28.
<br><span class="timestamp">October 25, 14:00 PDT</span>

**Notice**: A very brief power outage in the Byers Hall building caused several compute nodes in its Data Center to go down.  Jobs that were running on those compute nodes at the time of the power failure did unfortunately fail.  Log-in, data-transfer, and development nodes were also affected.  All these hosts are currently being rebooted.
<br><span class="timestamp">October 25, 13:00 PDT</span>


### October 24, 2019

#### <span style="color: orange;">Login non-functional</span>

**Resolved**: Log in works again.
<br><span class="timestamp">October 24, 09:45 PDT</span>

**Notice**: It is not possible to log in to the Wynton HPC environment.  This is due to a recent misconfiguration of the LDAP server.
<br><span class="timestamp">October 24, 09:30 PDT</span>


### October 22-23, 2019

#### <span style="color: orange;">BeeGFS failure</span>

**Resolved**: The Wynton HPC BeeGFS file system is fully functional again.  During the outage, `/wynton/group` and `/wynton/scratch` was not working properly, whereas `/wynton/home` was unaffected.
<br><span class="timestamp">October 23, 10:35 PDT</span>

**Notice**: The Wynton HPC BeeGFS file system is non-functional.  It is expected to be resolved by noon on October 23. The underlying problem is that the power backup at the Diller data center did not work as expected during a planned power maintenance.
<br><span class="timestamp">October 22, 21:45 PDT</span>


### September 24, 2019

#### <span style="color: orange;">BeeGFS failure</span>

**Resolved**: The Wynton HPC environment is up and running again.
<br><span class="timestamp">September 24, 20:25 PDT</span>

**Notice**: The Wynton HPC environment is nonresponsive.  Problem is being investigated.
<br><span class="timestamp">September 24, 17:30 PDT</span>


### August 23, 2019

#### <span style="color: orange;">BeeGFS failure</span>

**Resolved**: The Wynton HPC environment is up and running again. The reason for this downtime was the BeeGFS file server became nonresponsive.
<br><span class="timestamp">August 23, 20:45 PDT</span>

**Notice**: The Wynton HPC environment is nonresponsive.
<br><span class="timestamp">August 23, 16:45 PDT</span>


### August 15, 2019

#### <span style="color: orange;">Power outage</span>

**Resolved**: The Wynton HPC environment is up and running again.
<br><span class="timestamp">August 15, 21:00 PDT</span>

**Notice**: The Wynton HPC environment is down due to a non-planned power outage at the Diller data center.  Jobs running on compute nodes located in that data center, were terminated.  Jobs running elsewhere may also have been affected because `/wynton/home` went down as well (despite it being mirrored).
<br><span class="timestamp">August 15, 15:45 PDT</span>


### July 30, 2019

#### <span style="color: orange;">Power outage</span>

**Resolved**: The Wynton HPC environment is up and running again.
<br><span class="timestamp">July 30, 14:40 PDT</span>

**Notice**: The Wynton HPC environment is down due to a non-planned power outage at the main data center.
<br><span class="timestamp">July 30, 08:20 PDT</span>


### July 8-12, 2019

#### <span style="color: orange;">Full system downtime</span>

**Resolved**: The Wynton HPC environment and the BeeGFS file system are fully functional after updates and upgrades.
<br><span class="timestamp">July 12, 11:15 PDT</span>

**Notice**: The Wynton HPC environment is down for maintenance.
<br><span class="timestamp">July 8, 12:00 PDT</span>

**Notice**: Updates to the BeeGFS file system and the operating system that require to bring down all of Wynton HPC will start on the morning of Monday July 8.  Please make sure to log out before then.  The downtime might last the full week.
<br><span class="timestamp">July 1, 14:15 PDT</span>


### June 17-18, 2019

#### <span style="color: orange;">Significant file-system outage</span>

**Resolved**: The BeeGFS file system is fully functional again.
<br><span class="timestamp">June 18, 01:30 PDT</span>

**Investigating**: Parts of `/wynton/scratch` and `/wynton/group` are currently unavailable. The `/wynton/home` space should be unaffected.
<br><span class="timestamp">June 17, 15:05 PDT</span>


### May 17, 2019

#### <span style="color: orange;">Major outage due to file-system issues</span>

**Resolved**: The BeeGFS file system and the cluster is functional again.
<br><span class="timestamp">May 17, 16:00 PDT</span>

**Investigating**: There is a major slowdown of the BeeGFS file system (`/wynton`), which in turn causes significant problems throughout the Wynton HPC environment.
<br><span class="timestamp">May 17, 10:45 PDT</span>


### May 15-16, 2019

#### <span style="color: orange;">Major outage due to file-system issues</span>

**Resolved**: The BeeGFS file system, and thereby also the cluster itself, is functional again.
<br><span class="timestamp">May 16, 10:30 PDT</span>

**Investigating**: The BeeGFS file system (`/wynton`) is experiencing major issues.  This caused all on Wynton HPC to become non-functional.
<br><span class="timestamp">May 15, 10:00 PDT</span>



### May 15, 2019

#### <span style="color: orange;">Network/login issues</span>

**Resolved**: The UCSF-wide network issue that affected access to Wynton HPC has been resolved.
<br><span class="timestamp">May 15, 15:30 PDT</span>

**Update**: The login issue is related to UCSF-wide network issues.
<br><span class="timestamp">May 15, 13:30 PDT</span>

**Investigating**: There are issues logging in to Wynton HPC.
<br><span class="timestamp">May 15, 10:15 PDT</span>


### March 21-April 5, 2019

#### <span style="color: orange;">Kernel maintenance</span>
**Resolved**: All compute nodes have been rebooted.
<br><span class="timestamp">April 5, 12:00 PDT</span>

**Update**: Nearly all compute nodes have been rebooted (~5,200 cores are now available).
<br><span class="timestamp">Mar 29, 12:00 PDT</span>

**Notice**: Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). During this update period, there will be fewer available slots on the queues than usual. To follow the progress, see the green 'Available CPU cores' curve (target 5,424 cores) in the graph above.
<br><span class="timestamp">Mar 21, 15:30 PDT</span>


### March 22, 2019

#### <span style="color: orange;">Kernel maintenance</span>
**Resolved**: The login, development and transfer hosts have been rebooted.
<br><span class="timestamp">March 22, 10:35 PDT</span>

**Notice**: On Friday March 22 at 10:30am, all of the login, development, and data transfer hosts will be rebooted.  Please be logged out before then.  These hosts should be offline for less than 5 minutes.
<br><span class="timestamp">Mar 21, 15:30 PDT</span>


### January 22-February 5, 2019

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: All compute nodes have been rebooted.
<br><span class="timestamp">Feb 5, 11:30 PST</span>

**Notice**: Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). During this update period, there will be fewer available slots on the queues than usual. To follow the progress, see the green 'Available CPU cores' curve (target 1,944 cores) in the graph above.
<br><span class="timestamp">Jan 22, 16:45 PST</span>


### January 23, 2019

#### <span style="color: orange;">Kernel maintenance</span>
**Resolved**: The login, development and transfer hosts have been rebooted.
<br><span class="timestamp">Jan 23, 13:00 PST</span>

**Notice**: On Wednesday January 23 at 12:00 (noon), all of the login, development, and data transfer hosts will be rebooted.  Please be logged out before then.  The hosts should be offline for less than 5 minutes.
<br><span class="timestamp">Jan 22, 16:45 PST</span>


### January 14, 2019
 
#### <span style="color: orange;">Blocking file-system issues</span>

**Resolved**: The file system under `/wynton/` is back up again.  We are looking into the cause and taking steps to prevent this from happening again.
<br><span class="timestamp">Jan 9, 12:45 PST</span>

**Investigating**: The file system under `/wynton/` went down around 11:30 resulting is several critical failures including the scheduler failing.
<br><span class="timestamp">Jan 14, 11:55 PST</span>


### January 9, 2019

#### <span style="color: orange;">Job scheduler maintenance downtime</span>

**Resolved**: The SGE job scheduler is now back online and accepts new job submission again.
<br><span class="timestamp">Jan 9, 12:45 PST</span>

**Update**: The downtime of the job scheduler will begin on Wednesday January 9 @ noon and is expected to be completed by 1:00pm.
<br><span class="timestamp">Jan 8, 16:00 PST</span>

**Notice**: There will be a short job-scheduler downtime on Wednesday January 9 due to SGE maintenance.  During this downtime, already running jobs will keep running and queued jobs will remain in the queue, but no new jobs can be submitted.
<br><span class="timestamp">Dec 20, 12:00 PST</span>


### January 8, 2019
 
#### <span style="color: orange;">File-system server crash</span>
**Investigating**: One of the parallel file-system servers (BeeGFS) appears to have crashed on Monday January 7 at 07:30 and was recovered on 9:20pm.  Right now we are monitoring its stability, and investigating the cause and what impact it might have had.  Currently, we believe users might have experienced I/O errors on `/wynton/scratch/` whereas `/wynton/home/` was not affected.
<br><span class="timestamp">Jan 8, 10:15 PST</span>


### December 21, 2018
#### <span style="color: orange;">Partial file system failure</span>

**Resolved**: Parts of the new BeeGFS file system was non-functional for approx. 1.5 hours during Friday December 21 when a brief maintenance task failed.
<br><span class="timestamp">Dec 21, 20:50 PST</span>


### December 12-20, 2018
#### <span style="color: orange;">Nodes down</span>

**Resolved**: All of the `msg-* compute nodes but one are operational.
<br><span class="timestamp">Dec 20, 16:40 PST</span>

**Notice**: Starting Wednesday December 12 around 11:00, several `msg-*` compute nodes went down (~200 cores in total).  The cause of this is unknown.  Because it might be related to the BeeGFS migration project, the troubleshooting of this incident will most likely not start until the BeeGFS project is completed, which is projected to be done on Wednesday December 19.
<br><span class="timestamp">Dec 17, 17:00 PST</span>


### December 18, 2018
#### <span style="color: orange;">Development node does not respond</span>
**Resolved**: Development node `qb3-dev1` is functional.
<br><span class="timestamp">Dec 18, 20:50 PST</span>

**Investigating**: Development node `qb3-dev1` does not respond to SSH. This will be investigated the first thing tomorrow morning (Wednesday December 19).  In the meanwhile, development node `qb3-gpudev1`, which is "under construction", may be used.
<br><span class="timestamp">Dec 18, 16:30 PST</span>

### November 28-December 19, 2018

#### <span style="color: orange;">Installation of new, larger, and faster storage space</span>

**Resolved**: `/wynton/scratch` is now back online and ready to be used.
<br><span class="timestamp">Dec 19, 14:20 PST</span>

**Update**: The plan is to bring `/wynton/scratch` back online before the end of the day tomorrow (Wednesday December 19).  The planned SGE downtime has been rescheduled to Wednesday January 9.  Moreover, we will start providing the new 500-GiB `/wynton/home/` storage to users who explicitly request it (before Friday December 21) and who also promise to **move** the content under their current `/netapp/home/` to the new location.  Sorry, users on both QB3 and Wynton will _not_ be able to migrate until the QB3 cluster has been incorporated into Wynton HPC (see [Roadmap]({{ '/about/roadmap.html' | relative_url }})) or they giving up their QB3 account.
<br><span class="timestamp">Dec 18, 16:45 PST</span>

**Update**: The installation and migration to the new BeeGFS parallel file servers is on track and we expect to go live as planned on Wednesday December 19. We are working on fine tuning the configuration, running performance tests, and resilience tests.
<br><span class="timestamp">Dec 17, 10:15 PST</span>

**Update**: `/wynton/scratch` has been taken offline.
<br><span class="timestamp">Dec 12, 10:20 PST</span>

**Reminder**: All of `/wynton/scratch` will be taken offline and completely wiped starting Wednesday December 12 at 8:00am.
<br><span class="timestamp">Dec 11, 14:45 PST</span>

**Notice**: On Wednesday December 12, 2018, the global scratch space `/wynton/scratch` will be taken offline and completely erased.  Over the week following this, we will be adding to and reconfiguring the storage system in order to provide all users with new, larger, and faster (home) storage space.  The new storage will served using BeeGFS, which is a new much faster file system - a system we have been prototyping and tested via `/wynton/scratch`.  Once migrated to the new storage, a user's home directory quota will be increased from 200 GiB to 500 GiB.  In order to do this, the following upgrade schedule is planned:

* Wednesday November 28-December 19 (21 days): **To all users, please refrain from using `/wynton/scratch` - use local, node-specific `/scratch` if possible (see below).  The sooner we can take it down, the higher the chance is that we can get everything in place before December 19.**

* Wednesday December 12-19 (8 days): **`/wynton/scratch` will be unavailable and completely wiped**.  For computational scratch space, please [use local `/scratch` unique to each compute node](https://ucsf-hpc.github.io/wynton/scheduler/using-local-scratch.html).  For _global_ scratch needs, the old and much slower `/scrapp` and `/scrapp2` may also be used.

* ~~Wednesday December 19, 2018 (1/2 day): The Wynton HPC scheduler (SGE) will be taken offline.  No jobs will be able to be submitted until it is restarted.~~

* Wednesday December 19, 2018: The upgraded Wynton HPC with the new storage will be available including `/wynton/scratch`.

* Wednesday January 9, 2019 (1/2 day): The Wynton HPC scheduler (SGE) will be taken offline temporarily.  No jobs will be able to be submitted until it is restarted.

It is our hope to be able to keep the user's home accounts, login nodes, the transfer nodes, and the development nodes available throughout this upgrade period.

_NOTE: If our new setup proves more challenging than anticipated, then we will postpone the SGE downtime to after the holidays, on Wednesday January 9, 2019.  Wynton will remain operational over the holidays, though without `/wynton/scratch`._
<br><span class="timestamp">Dec 6, 14:30 PST [edited Dec 18, 17:15 PST]</span>


### December 12-14, 2018
#### <span style="color: orange;">Power failure</span>

**Resolved**: All `mac-*` compute nodes are up and functional.
<br><span class="timestamp">Dec 14, 12:00 PST</span>

**Investigating**: The compute nodes named `mac-*` (in the Sandler building) went down due to power failure on Wednesday December 12 starting around 05:50.  Nodes are being rebooted.
<br><span class="timestamp">Dec 12, 09:05 PST</span>


### November 8, 2018

#### <span style="color: orange;">Partial shutdown due to planned power outage</span>

**Resolved**: The cluster is full functional.  It turns out that none of the compute nodes, and therefore none of the running jobs, were affected by the power outage.
<br><span class="timestamp">Nov 8, 11:00 PST</span>

**Update**: The queue-metric graphs are being updated again.
<br><span class="timestamp">Nov 8, 11:00 PST</span>

**Update**: The login nodes, the development nodes and the data transfer node are now functional.
<br><span class="timestamp">Nov 8, 10:10 PST</span>

**Update**: Login node `wynlog1` is also affected by the power outage.  Use `wynlog2` instead.
<br><span class="timestamp">Nov 8, 09:10 PST</span>

**Notice**: Parts of the Wynton cluster will be shut down on November 8 at 4:00am.  This shutdown takes place due to the UCSF Facilities shutting down power in the Byers Hall.  Jobs running on affected compute nodes will be terminated abruptly.  Compute nodes with battery backup or in other buildings will not be affected.  Nodes will be rebooted as soon as the power comes back. ~~To follow the reboot progress, see the 'Available CPU cores' curve (target 1,832 cores) in the graph above.~~  Unfortunately, the above queue-metric graphs cannot be updated during the power outage.
<br><span class="timestamp">Nov 7, 15:45 PST</span>


### September 28 - October 11, 2018

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: The compute nodes has been rebooted and are accepting new jobs.  For the record, on day 5 approx. 300 cores were back online, on day 7 approx. 600 cores were back online, on day 8 approx. 1,500 cores were back online, and on day 9 the majority of the 1,832 cores were back online.
<br><span class="timestamp">Oct 11, 09:00 PDT</span>

**Notice**: On September 28, a kernel update was applied to all compute nodes. To begin running the new kernel, each node must be rebooted.  To achieve this as quickly as possible and without any loss of running jobs, the queues on the nodes were all disabled (i.e., they stopped accepting new jobs).  Each node will reboot itself and re-enable its own queues as soon as all of its running jobs have completed.  Since the maximum allowed run time for a job is two weeks, it may take until October 11 before all nodes have been rebooted and accepting new jobs.  In the meanwhile, there will be fewer available slots on the queue than usual.  To follow the progress, see the 'Available CPU cores' curve (target 1,832 cores) in the graph above.
<br><span class="timestamp">Sept 28, 16:30 PDT</span>


### October 1, 2018

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: The login, development, and data transfer hosts have been rebooted.
<br><span class="timestamp">Oct 1, 13:30 PDT</span>

**Notice**: On Monday October 1 at 01:00, all of the login, development, and data transfer hosts will be rebooted.
<br><span class="timestamp">Sept 28, 16:30 PDT</span>


### September 13, 2018

#### <span style="color: orange;">Scheduler unreachable</span>

**Resolved**: Around 11:00 on Wednesday September 12, the SGE scheduler (“qmaster”) became unreachable such that the scheduler could not be queried and no new jobs could be submitted. Jobs that relied on run-time access to the scheduler may have failed. The problem, which was due to a misconfiguration being introduced, was resolved early morning on Thursday September 13.
<br><span class="timestamp">Sept 13, 09:50 PDT</span>


### August 1, 2018

#### <span style="color: orange;">Partial shutdown</span>

**Resolved**: Nodes were rebooted on August 1 shortly after the power came back.
<br><span class="timestamp">Aug 2, 08:15 PDT</span>

**Notice**: On Wednesday August 1 at 6:45am, parts of the compute nodes (msg-io{1-10} + msg-*gpu) will be powered down. They will be brought back online within 1-2 hours.  The reason is a planned power shutdown affecting one of Wynton's server rooms.
<br><span class="timestamp">Jul 30, 20:45 PDT</span>


### July 30, 2018

#### <span style="color: orange;">Partial shutdown</span>

**Resolved**: The nodes brought down during the July 30 partial shutdown has been rebooted.  Unfortunately, the same partial shutdown has to be repeated within a few days because the work in server room was not completed. Exact date for the next shutdown is not known at this point.
<br><span class="timestamp">Jul 30, 09:55 PDT</span>

**Notice**: On Monday July 30 at 7:00am, parts of the compute nodes (msg-io{1-10} + msg-*gpu) will be powered down. They will be brought back online within 1-2 hours.  The reason is a planned power shutdown affecting one of Wynton's server rooms.
<br><span class="timestamp">Jul 29, 21:20 PDT</span>


### June 16-26, 2018

#### <span style="color: orange;">Power outage</span>

**Resolved**: The NVidia-driver issue occurring on some of the GPU compute nodes has been fixed.
<br><span class="timestamp">Jun 26, 11:55 PDT</span>

**Update**: Some of the compute nodes with GPUs are still down due to issues with the NVidia drivers.
<br><span class="timestamp">Jun 19, 13:50 PDT</span>

**Update**: The login nodes and and the development nodes are functional. Some compute nodes that went down are back up, but not all.
<br><span class="timestamp">Jun 18, 10:45 PDT</span>

**Investigating**: The UCSF Mission Bay Campus experienced a power outage on Saturday June 16 causing parts of Wynton to go down.  One of the login nodes (wynlog1), the development node (qb3-dev1), and parts of the compute nodes are currently non-functional.
<br><span class="timestamp">Jun 17, 15:00 PDT</span>



<!-- DO NOT EDIT ANYTHING BELOW -->

<script src="https://d3js.org/d3.v3.min.js"><!-- ~150 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"><!-- ~80 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"><!-- 2 kB --></script>

<script type="text/javascript" charset="utf-8">
d3.text("{{ '/assets/data/host_table.tsv' | relative_url }}", "text/csv", function(host_table) {
  // drop header comments
  host_table = host_table.replace(/^[#][^\r\n]*[\r\n]+/mg, '');
  host_table = d3.tsv.parse(host_table);

  d3.text("https://raw.githubusercontent.com/UCSF-HPC/wynton-slash2/master/status/qstat_nodes_in_state_au.tsv", "text/csv", function(host_status) {
    
    // drop header comments
    host_status = host_status.replace(/^[#][^\r\n]*[\r\n]+/mg, '');
    host_status = d3.tsv.parse(host_status);

    var tbody, tr, td, td_status;
    var value;
    var cores = 0, cores_node;
    var nodes_with_issues = 0, cores_with_issues = 0;
  
    /* For each row */
    var nodes = 0;
    host_table.forEach(function(row) {
      nodes += 1;
      cores_node = parseInt(row["Physical Cores"]);
      cores += cores_node;

      // No issues?
      if (host_status.filter(function(d) { return d.queuename == row["Node"] }).length == 0) return;

      /* Ignore column on /tmp size, iff it exists */
      delete row["Local `/tmp`"];

      if (nodes_with_issues == 0) {
        var table = d3.select("#hosttablediv").append("details").append("table");
        table.id = "hosttable";
        tr = table.append("thead").append("tr");
        tr.append("th").text("Status");
        for (key in row) tr.append("th").text(key.replace(/\`/g, ""));
        tbody = table.append("tbody");
      }

      nodes_with_issues += 1;      
      cores_with_issues += cores_node;
  
      tr = tbody.append("tr");
      td_status = tr.append("td").text("⚠");  // "⚠" or "✖"
      for (key in row) td = tr.append("td").text(row[key]);
    });

    var p = d3.select("#hosttablemessage");
    if (nodes_with_issues > 0) {
      p.text("Currently, " + (100*nodes_with_issues/nodes).toFixed(1) + "% (" + nodes_with_issues + " of " + nodes + ") of the nodes, corresponding to " + (100*cores_with_issues/cores).toFixed(1) + "% (" + cores_with_issues + " of " + cores + ") of the cores, are reported to have a queuing state 'unheard/unreachable' or 'error' (according to \'qstat -f -qs uE\' queried every five minutes), which means they will not take on any new jobs.");
    } else {
      p.text("All " + nodes + " nodes, with a total of " + cores + " cores, are functional.");
    }
    
    $(document).ready(function() {
      $('#hosttable').DataTable({
        paging: false,
        searching: false,
        order: [[ 1, "asc" ]]
      });
    });
  });
});
</script>


<style>
table {
  margin-top: 2ex;
  margin-bottom: 2ex;
}
tfoot {
  border-top: 2px solid #000;
  font-weight: bold;
}
ttr:last-child { border-top: 2px solid #000; }
</style>
