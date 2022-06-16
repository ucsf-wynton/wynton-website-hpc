---
context:
  - login
---

# Group Quota

## Adjust group disk quota on /wynton/group and /wynton/protected/group

Lab admins are able to adjust disk quota for their users.

If a group purchases storage (first time or additional):

1. go to https://preview.cgl.ucsf.edu/secure/admin/unixGroupMaint.py
2. Get the group, 
3. Update the purchasedStorage field.
4. Submit

This *should* update the purchasedStorage *and* the allocatedStorage fields for the group in LDAP.  Every night, a script will run which reads that data and uses the allocatedStorage field to actually set the quota for the group.

To create a subgroup that shares quota with a "parent" group:

1. Go to https://preview.cgl.ucsf.edu/secure/admin/unixGroupMaint.py
2. Get or create the subgroup
3. Update the parent group field with the name of the parent group
4. Submit

To actually add quota to the subgroup:

1. go to https://preview.cgl.ucsf.edu/secure/admin/unixGroupMaint.py
2. Get the group,
3. Update the allocatedStorage field.
4. Submit

This *should* decrease the allocatedStorage in the parent group by the amount added to the subgroup.  When the nightly script runs the quotas of both the parent group and subgroup will get updated.

To reduce the amount of storage for a group, if, for example, you need to re-allocate it to another group:

1. go to https://preview.cgl.ucsf.edu/secure/admin/unixGroupMaint.py
2. Get the group,
3. Update the purchasedStorage field.
4. Submit

This *should* update the purchasedStorage *and* the allocatedStorage fields for the group in LDAP.  Every night, a script will run which reads that data and uses the allocatedStorage field to actually set the quota for the group.

### Note, only integers (no decimals) are allowed for purchasedStorage values. Thus 1TB is the minimum purchasedStorage configurable via the form
