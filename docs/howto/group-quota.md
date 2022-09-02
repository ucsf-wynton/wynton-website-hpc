---
context:
  - login
---

# Group Quota


<div class="alert alert-warning" role="alert" markdown="1">
2022-09-02: The Quota Management Tool is still being developed. If you run into any problems, please email: [{{ site.cluster.email_support }}](mailto::{{ site.cluster.email_support }}).
</div>

Any group with purchased storage can have a group folder in both /wynton/group and /wynton/protected/group.

In that case, the group quota would include rsl group owned files in /wynton/group/group_name and /wynton/protected/group/group_name.

Of course, only members with Wynton PHI/Protected access would have access to the data in /wynton/protected/group/group_name.

You can also request to create a sub-group to manage the quota for phi only data storage, group_name-phi for example, and it could be allocated as part of the parent quota.

## Adjust group disk quota of subgroups and membership of groups and subgroups

Lab admins are able to adjust the quotas of subgroups and membership of groups and subgroups 

To add quota to the subgroup:

1. go to https://www.cgl.ucsf.edu/admin/unixGroupMaint.py
2. Get the group
3. Update the allocatedStorage field
4. Submit

This *should* decrease the allocatedStorage in the parent group by the amount added to the subgroup.  When the nightly script runs the quotas of both the parent group and subgroup will get updated.

Every night, a script will run which reads that data and uses the allocatedStorage field to actually set the quota for the group.

