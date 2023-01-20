# Globus File Sharing

Below are instructions on how to share a specific folder on {{ site.cluster.nickname }} with specific Globus users.  These users do _neither_ have to have a {{ site.cluster.nickname }} account or have to be UCSF employees - you can share with anyone who has a Globus account.  When sharing, you can specify whether the person you share with should have read-only access or write access.  Typically, if you want to make large data files available for download, you will share with read-only permission.  If you want to receive data from a collaborator, you can give them write permission. 


## Creating a Shared Globus Collection

<div class="alert alert-warning" role="alert" markdown="1">
<span class="phi">Note,</span> Guest Collections/Shared Globus Collections are _not_ allowed for PHI/Protected Wynton users.
</div>

1. Make sure you have a working setup of [Globus for {{ site.cluster.nickname }}]

2. Email [support@wynton.ucsf.edu] with the directory you want to share.
   The admins will send back the path the Globus share will appear as, e.g. `/wynton/globus/share/alice`

3. On the ['UCSF {{ site.cluster.nickname }}' Collection] page, click the ['Collections'] tab to get to 'Guest Collections':
   * Click the 'Add a Guest Collection' button

4. Fill out the 'Create New Guest Collection' form:
   * Directory: Enter the path you received from the admins, e.g. `/wynton/globus/share/alice`
   * Display Name: Enter a descriptive name, e.g. 'Alice Wynton Share with Bob'
   * Optionally add a "Description" or "Keywords".
   * Click 'Create Collection'
   
5. On the 'Permission' tab, click 'Add Permissions - Share With' and Enter:
   * Directory: `/`
   * Share with: 'user' (the default)
   * Username of Email: the Globus ID email address of the user you'll be sharing with.  If they don't have a Globus ID email address, use their regular email -- they'll be prompted to create a Globus ID.
   * Permissions: 'read' (user can download) or 'write' (user can also upload)
   * Click 'Add Permission'

At that point you should be all set.  Globus will send an email to the person you are sharing the folder with, and you can let them know the share is active.

<div class="alert alert-warning" role="alert" markdown="1">
It is only possible to have one Globus Guest Collection per Wynton user. However, you can add multiple permissions to your Guest Collection, giving different people access to different subdirectories. If you have questions, send mail to [support@wynton.ucsf.edu].
</div>


## Removing a Shared Globus Collection

When you’re done, log into Globus, go to 'Collections' and then 'Administered by You'. Click on the shared Collection and then 'Delete Collection'.  Email [support@wynton.ucsf.edu] to let us know you've deleted the Collection.



[support@wynton.ucsf.edu]: mailto:support@wynton.ucsf.edu

[Globus]: https://www.globus.org/
[Globus Connect Personal]: https://www.globus.org/globus-connect-personal
[Globus Connect Personal (GCP) Collection]: https://app.globus.org/file-manager/gcp
['UCSF {{ site.cluster.nickname }}' Collection]: https://app.globus.org/file-manager/collections/68f06816-cd00-4bf3-ae1f-0597a07ed118/overview
['Collections']: https://app.globus.org/file-manager/collections/68f06816-cd00-4bf3-ae1f-0597a07ed118/shares

[Globus for {{ site.cluster.nickname }}]: /hpc/transfers/globus.html
