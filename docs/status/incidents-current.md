### March 28-ongoing, 2022

#### <span style="color: orange;">Major BeeGFS issues</span>

**Update**: The BeeGFS servers will be updated tomorrow April 6 at 14:00. The cluster should work as usual during the update.
<br><span class="timestamp">April 5, 17:00 PDT</span>

**Update**: Our load tests over the weekend went well. Next, we will do discrepancy validation tests between our current version and the patch versions. When those pass, we will do a final confirmation with the BeeGFS vendor. We hope to deploy the patch to Wynton in a few days.
<br><span class="timestamp">April 4, 10:30 PDT</span>

**Update**: After a few rounds, we now have a patch that we have confirmed work on our test BeeGFS system. The plan is to do additional high-load testing today and over the weekend.
<br><span class="timestamp">April 1, 10:30 PDT</span>

**Update**: The BeeGFS vendors will send us a patch by tomorrow Tuesday, which we will test on our separate BeeGFS test system. After being validated there, will will deploy it to the main system. We hope to have a patch deploy by the end of the week.
<br><span class="timestamp">March 28, 11:30 PDT</span>

**Update**: We have re-enabled the job scheduler after manually having resolved the BeeGFS meta server issues. We will keep monitoring the problem and send more debug data to the BeeGFS vendors.
<br><span class="timestamp">March 28, 11:00 PDT</span>

**Notice**: On Monday 2022-03-28 morning at 10:30 the BeeGFS hung again. We put a hold on the job scheduler for now.
<br><span class="timestamp">March 28, 10:30 PDT</span>

<!--
start: 2022-03-28T10:00:00
stop: 2022-03-28T11:00:00
length: 1.0 hours
severity: major-outage
affected: jobs, beegfs, compute
reason: beegfs
 -->
