---
context:
  - login
---

# Delegated Subgroup Quota Management and Delegated Group User Management


<div class="alert alert-warning" role="alert" markdown="1">
2022-09-02: The Quota Management Tool is still being developed. If you run into any problems, please email: [{{ site.cluster.email_support }}](mailto::{{ site.cluster.email_support }}).
</div>

Any group with purchased storage can have a group folder in both `/wynton/group/` and `/wynton/protected/group/`.

In that case, the group quota usage would include group owned files in BOTH `/wynton/group/group_name/` AND `/wynton/protected/group/group_name/`.

Of course, only members with Wynton PHI/Protected access would have access to the data in `/wynton/protected/group/group_name/`.

You can also request to create a subgroup to self-manage the quota for phi only data storage, group_name-phi for example, and it could be allocated as part of the parent quota.

In addition, responsible parties may request to be delegated responsibility for managing the membership of their groups.

## To adjust the quota of a delegated subgroup

Request the creation and delegation of a subgroup from [{{ site.cluster.email_support }}](mailto::{{ site.cluster.email_support }}).

Once you are the delegated "owner" of the subgroup, you will be able to allocate quota from your group's parent quota to the subgroup.

 1. Go to [CGL Unix Group Maintenance](https://www.cgl.ucsf.edu/admin/unixGroupMaint.py)
 2. Get the subgroup
 3. Update the allocatedStorage field
 4. Select "Submit Changes"
 5. Notification: "Success! Group unix_group has been successfully updated!"

This will decrease the allocatedStorage in the parent group by the amount added to the subgroup.  When the nightly script runs the quotas of both the parent group and subgroup will get updated.

Every night, a script will run which reads that data and uses the allocatedStorage field to actually set the quota for the group.



## To adjust the membership of a delegated group

Delegated responsible parties are able to adjust the memberships of their delegated groups.

<div class="alert alert-warning" role="alert" markdown="1">
Important note: There are two ways a user can be a member of a Unix group. By their default Unix Group and by explicit group membership. In most cases, on Wynton, group membership is a function of a user's default Unix Group. This property can only be configured by the Wynton Sysadmins, it cannot be changed from the CGL Unix Group Maintenance page. Usually Wynton users are only explicitly added to groups when they have secondary group memberships in addition to their primary group membership.
</div>

Request the delegation of group ownership from [{{ site.cluster.email_support }}](mailto::{{ site.cluster.email_support }}).

Once you are the delegated "owner" of the group, you will be able to adjust the group membership of your delegated group.

 1. Go to [CGL Unix Group Maintenance](https://www.cgl.ucsf.edu/admin/unixGroupMaint.py)
 2. Get the group
 3. In the "Members: Available" field, select a unix account
 4. Select "Append"
 5. The Unix Account should appear in "Members: Selected"
 6. Select "Submit Changes"
 7. Notification: "Success! Group unix_group has been successfully updated!"
