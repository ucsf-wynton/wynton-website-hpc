### August 26-??, 2021

#### <span style="color: orange;">Byers Hall power outage</span>

**Update**: The BeeGFS filesystem recovering attempt keeps running. The current plan is to bring Wynton back online while keeping the problematic BeeGFS filesystem offline.
<br><span class="timestamp">August 26, 23:05 PDT</span>

**Update**: All of the BeeGFS servers are up and running, but one of the 108 filesystems that make up BeeGFS was corrupted by the sudden power outage. The bad filesystem is part of `/wynton/group`. We estimate that 70 TB of data is affected.  We are making every possible effort to restore this filesystem, which will take time. While we do so, Wynton will remain down.
<br><span class="timestamp">August 26, 14:05 PDT</span>

**Notice**: The cluster is down after an unplanned power outage in the main data center. The power is back online but several of our systems, including BeeGFS servers, did not come back up automatically and will require on-site, manual actions.
<br><span class="timestamp">August 26, 09:15 PDT</span>



