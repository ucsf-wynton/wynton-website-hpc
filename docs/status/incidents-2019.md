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

**Notice**: It is not possible to log in to the {{ site.cluster.name }} environment.  The reason is currently not known.
<br><span class="timestamp">December 22, 09:15 PST</span>


### December 18, 2019

#### <span style="color: orange;">Network/login issues</span>

**Resolved**: The {{ site.cluster.name }} environment is fully functional again. The BeeGFS filesystem was not working properly during 18:30-22:10 on December 18 resulting in no login access to the cluster and job file I/O being backed up.
<br><span class="timestamp">May 19, 08:50 PST</span>

**Update**: The BeeGFS filesystem is non-responsive, which we believe is due to the network switch upgrade.
<br><span class="timestamp">May 18, 21:00 PST</span>

**Notice**: One of two network switches will be upgraded on Wednesday December 18 starting at 18:00 and lasting a few hours.  We do not expect this to impact the {{ site.cluster.name }} environment other than slowing down the network performance to 50%.
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

**Notice**: It is not possible to log in to the {{ site.cluster.name }} environment.  This is due to a recent misconfiguration of the LDAP server.
<br><span class="timestamp">October 24, 09:30 PDT</span>


### October 22-23, 2019

#### <span style="color: orange;">BeeGFS failure</span>

**Resolved**: The {{ site.cluster.name }} BeeGFS file system is fully functional again.  During the outage, `/wynton/group` and `/wynton/scratch` was not working properly, whereas `/wynton/home` was unaffected.
<br><span class="timestamp">October 23, 10:35 PDT</span>

**Notice**: The {{ site.cluster.name }} BeeGFS file system is non-functional.  It is expected to be resolved by noon on October 23. The underlying problem is that the power backup at the Diller data center did not work as expected during a planned power maintenance.
<br><span class="timestamp">October 22, 21:45 PDT</span>


### September 24, 2019

#### <span style="color: orange;">BeeGFS failure</span>

**Resolved**: The {{ site.cluster.name }} environment is up and running again.
<br><span class="timestamp">September 24, 20:25 PDT</span>

**Notice**: The {{ site.cluster.name }} environment is nonresponsive.  Problem is being investigated.
<br><span class="timestamp">September 24, 17:30 PDT</span>


### August 23, 2019

#### <span style="color: orange;">BeeGFS failure</span>

**Resolved**: The {{ site.cluster.name }} environment is up and running again. The reason for this downtime was the BeeGFS file server became nonresponsive.
<br><span class="timestamp">August 23, 20:45 PDT</span>

**Notice**: The {{ site.cluster.name }} environment is nonresponsive.
<br><span class="timestamp">August 23, 16:45 PDT</span>


### August 15, 2019

#### <span style="color: orange;">Power outage</span>

**Resolved**: The {{ site.cluster.name }} environment is up and running again.
<br><span class="timestamp">August 15, 21:00 PDT</span>

**Notice**: The {{ site.cluster.name }} environment is down due to a non-planned power outage at the Diller data center.  Jobs running on compute nodes located in that data center, were terminated.  Jobs running elsewhere may also have been affected because `/wynton/home` went down as well (despite it being mirrored).
<br><span class="timestamp">August 15, 15:45 PDT</span>


### July 30, 2019

#### <span style="color: orange;">Power outage</span>

**Resolved**: The {{ site.cluster.name }} environment is up and running again.
<br><span class="timestamp">July 30, 14:40 PDT</span>

**Notice**: The {{ site.cluster.name }} environment is down due to a non-planned power outage at the main data center.
<br><span class="timestamp">July 30, 08:20 PDT</span>


### July 8-12, 2019

#### <span style="color: orange;">Full system downtime</span>

**Resolved**: The {{ site.cluster.name }} environment and the BeeGFS file system are fully functional after updates and upgrades.
<br><span class="timestamp">July 12, 11:15 PDT</span>

**Notice**: The {{ site.cluster.name }} environment is down for maintenance.
<br><span class="timestamp">July 8, 12:00 PDT</span>

**Notice**: Updates to the BeeGFS file system and the operating system that require to bring down all of {{ site.cluster.name }} will start on the morning of Monday July 8.  Please make sure to log out before then.  The downtime might last the full week.
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

**Investigating**: There is a major slowdown of the BeeGFS file system (`/wynton`), which in turn causes significant problems throughout the {{ site.cluster.name }} environment.
<br><span class="timestamp">May 17, 10:45 PDT</span>


### May 15-16, 2019

#### <span style="color: orange;">Major outage due to file-system issues</span>

**Resolved**: The BeeGFS file system, and thereby also the cluster itself, is functional again.
<br><span class="timestamp">May 16, 10:30 PDT</span>

**Investigating**: The BeeGFS file system (`/wynton`) is experiencing major issues.  This caused all on {{ site.cluster.name }} to become non-functional.
<br><span class="timestamp">May 15, 10:00 PDT</span>



### May 15, 2019

#### <span style="color: orange;">Network/login issues</span>

**Resolved**: The UCSF-wide network issue that affected access to {{ site.cluster.name }} has been resolved.
<br><span class="timestamp">May 15, 15:30 PDT</span>

**Update**: The login issue is related to UCSF-wide network issues.
<br><span class="timestamp">May 15, 13:30 PDT</span>

**Investigating**: There are issues logging in to {{ site.cluster.name }}.
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
