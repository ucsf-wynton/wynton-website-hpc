### March 26, 2021

#### <span style="color: orange;">Cluster not accessible (due to network outage)</span>

**Resolved**: The malfunctioning network link between two of Wynton's data centers, which affected our BeeGFS file system and Wynton HPC as a whole, has been restored.
<br><span class="timestamp">March 26, 21:30 PDT</span>

**Notification**: Campus network issues causing major Wynton HPC issues including extremely slow access to our BeeGFS file system.  This was first reported around 11:30 today.  A ticket has been filed with the UCSF Network.  ETA is unknown.
<br><span class="timestamp">March 26, 12:30 PDT</span>


### January 29-February 12, 2021

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: All compute nodes have been rebooted.  A few compute nodes remain offline that has to be rebooted manually, which will be done as opportunity is given.

**Notice**: New operating-system kernels are deployed. Compute nodes will no longer accept new jobs until they have been rebooted. A node will be rebooted as soon as any existing jobs have completed, which may take up to two weeks (maximum runtime). During this update period, there will be fewer than usual slots available on the queues. To follow the progress, see the green 'Available CPU cores' curve (target ~10,400 cores) in the graph above.  Login, data-transfer, and development nodes will be rebooted at 13:00 on Monday February 1.
<br><span class="timestamp">January 31, 17:00 PST</span>


### February 1-3, 2021

#### <span style="color: orange;">Development node not available</span>

**Resolved**: Development node `dev2` is available again.
<br><span class="timestamp">February 3, 15:00 PST</span>

**Notice**: Development node `dev2` is down.  It failed to come back up after the kernel upgrade on 2021-02-01.  An on-site reboot is planned for Wednesday February 3.
<br><span class="timestamp">February 2, 11:45 PST</span>


### January 28, 2021

#### <span style="color: orange;">Server room maintenance</span>

**Notice**: The air conditioning system in one of our server rooms will be upgraded on January 28.  The compute nodes in this room will be powered down during the upgrade resulting in fewer compute nodes being available on the cluster.  Starting 14 days prior to this date, compute nodes in this room will only accept jobs that will finish in time.
<br><span class="timestamp">January 13, 10:00 PDT</span>
