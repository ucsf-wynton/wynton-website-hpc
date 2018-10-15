# UCSF Wynton Status

<div class="alert alert-info" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>Wynton HPC Environment Operational</strong>
</div>

<!--
<div class="alert alert-warning" role="alert" style="margin-top: 3ex; margin-bottom: 3ex; font-size: large;">
<strong>Some Wynton HPC compute nodes are down</strong>
</div>
-->


## Queue Metrics

<ul class="nav nav-pills">
  <li class="active"><a data-toggle="pill" href="#queues-day">Day</a></li>
  <li><a data-toggle="pill" href="#queues-week">Week</a></li>
  <li><a data-toggle="pill" href="#queues-month">Month</a></li>
  <li><a data-toggle="pill" href="#queues-year">Year</a></li>
</ul>
<div class="tab-content" style="margin-top: 1ex;">
  <div id="queues-day" class="tab-pane fade in active">
    <img src="{{ site.assets.status_root_path }}/status/figures/queues-day.png" alt="queues usage during the last day"/>
  </div>
  <div id="queues-week" class="tab-pane fade">
    <img src="{{ site.assets.status_root_path }}/status/figures/queues-week.png" alt="queues usage during the last week"/>
  </div>
  <div id="queues-month" class="tab-pane fade">
    <img src="{{ site.assets.status_root_path }}/status/figures/queues-month.png" alt="queues usage during the last month"/>
  </div>
  <div id="queues-year" class="tab-pane fade">
    <img src="{{ site.assets.status_root_path }}/status/figures/queues-year.png" alt="queues usage during the last year"/>
  </div>
</div>
  


## Past Incidents


### September 28 - October 11, 2018

#### <span style="color: orange;">Kernel maintenance</span>

*Resolved**: The compute nodes has been rebooted and are accepting new jobs.  For the record, on Oct 3 (day 5) approx. 300 cores were back online, on Oct 5 (day 7) approx. 600 cores were back online, on Oct 6 (day 8) approx. 1500 cores were back online, and on Oct 7 (day 9) the majority of the 1832 cores were back online.
<br><span class="timestamp">Oct 11, 09:00 PDT</span>

**Notice**: On September 28, a kernel update was applied to all compute nodes. To begin running the new kernel, each node must be rebooted.  To achieve this as quickly as possible and without any loss of running jobs, the queues on the nodes were all disabled (i.e., they stopped accepting new jobs).  Each node will reboot itself and re-enable its own queues as soon as all of its running jobs have completed.  Since the maximum allowed run time for a job is two weeks, it may take until October 11 before all nodes have been rebooted and accepting new jobs.  In the meanwhile, there will be fewer available slots on the queue than usual.  To follow the progress, see the 'Available CPU cores' curve (target 1832 cores) in the graph above.
<br><span class="timestamp">Sept 28, 16:30 PDT</span>


### October 1, 2018

#### <span style="color: orange;">Kernel maintenance</span>

**Resolved**: The login, development, and data transfer hosts have been rebooted.
<br><span class="timestamp">Oct 1, 13:30 PDT</span>

**Notice**: On Monday October 1 at 1:00 pm, all of the login, development, and data transfer hosts will be rebooted.
<br><span class="timestamp">Sept 28, 16:30 PDT</span>


### September 13, 2018

#### <span style="color: orange;">Scheduler unreachable</span>

**Resolved**: Around 11pm on Wednesday September 12, the SGE scheduler (“qmaster”) became unreachable such that the scheduler could not be queried and no new jobs could be submitted. Jobs that relied on run-time access to the scheduler may have failed. The problem, which was due to a misconfiguration being introduced, was resolved early morning on Thursday September 13.
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



<script type="text/javascript">
  // FIXME: Ideally we set <meta http-equiv="refresh" content="300">
  //        but how do we do that with Jekyll? /HB 2018-08-17
  // Refresh page every 5 minutes
  setTimeout(function() { location.reload(); }, 5*60000);
</script>
