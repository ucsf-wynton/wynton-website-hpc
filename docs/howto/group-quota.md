---
context:
  - login
---

# Group Quota

## Adjust group disk quota on /wynton/group and /wynton/protected/group

Lab admins are able to adjust disk quota for their users.

To add quota to the subgroup:

1. go to https://preview.cgl.ucsf.edu/secure/admin/unixGroupMaint.py
2. Get the group,
3. Update the allocatedStorage field.
4. Submit

This *should* decrease the allocatedStorage in the parent group by the amount added to the subgroup.  When the nightly script runs the quotas of both the parent group and subgroup will get updated.


Every night, a script will run which reads that data and uses the allocatedStorage field to actually set the quota for the group.

