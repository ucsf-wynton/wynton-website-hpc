# Globus File Sharing


## Creating a Shared Globus Endpoint

1. Make sure you have a working setup of [Globus for {{ site.cluster.nickname }}]

2. Email [support@wynton.ucsf.edu] with the directory you want to share.
   The admins will send back the path the Globus share will appear as, e.g. `/wynton/globus/share/alice`

3. Go to ['UCSF {{ site.cluster.nickname }}' endpoint], click the 'Activate' button to get to 'Please authenticate to access UCSF Wynton HPC':
   * Enter your {{ site.cluster.nickname }} credential, i.e. your {{ site.cluster.nickname }} username and password

3. On the ['UCSF {{ site.cluster.nickname }}' endpoint] page, click the ['Collections'] tab to get to 'Guest Collections':
   * Click the 'Add a Guest Collection' button

6. Fill out the 'Create New Guest Collection' form:
   * Path: Enter the path you received from the admins, e.g. `/wynton/globus/share/alice`
   * Share Display Name: Enter a descriptive name, e.g. 'Alice Wynton Share with Bob'
   * Click 'Create Share'
   
7. On the 'Permission' tab, click 'Add Permissions - Share With' and Enter:
   * Path: Above path again
   * Share with: 'user' (the default)
   * Username of Email: the Globus ID email address of the user you'll be sharing with.  If they don't have a Globus ID email address, use their regular email -- they'll be prompted to create a Globus ID.
   * Permissions: 'read' (user can download) or 'write' (user can also upload)
   * Click 'Add Permission'

At that point you should be all set.  Globus will send an email to the person you are sharing the folder with, and you can let them know the share is active.


## Removing a Shared Globus Endpoint

When you’re done, log into Globus, go to 'Endpoints' and then 'Administered by You'. Click on the shared endpoint and then 'Delete endpoint'.  Email [support@wynton.ucsf.edu] to let us know you've deleted the endpoint.


[support@wynton.ucsf.edu]: mailto:support@wynton.ucsf.edu

[Globus]: https://www.globus.org/
[Globus Connect Personal]: https://www.globus.org/globus-connect-personal
[Globus Connect Personal (GCP) endpoint]: https://app.globus.org/file-manager/gcp
['UCSF {{ site.cluster.nickname }}' endpoint]: https://app.globus.org/file-manager/collections/1dd9beaa-14b7-11eb-abe2-0213fe609573/overview
['Collections']: https://app.globus.org/file-manager/collections/1dd9beaa-14b7-11eb-abe2-0213fe609573/shares

[Globus for {{ site.cluster.nickname }}]: {{ '/transfers/globus.html' | relative_url }}
