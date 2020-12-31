# Globus

[Globus] is a non-profit service for moving, syncing, and sharing large amounts of data asynchronously in the background.  Transfers are done from and to, so called, _endpoints_.  In order to perform a file transfer from one location to another using the Globus service, both ends must have an endpoint.  Several UCSF departments and services, including the {{ site.cluster.name }} environment, provide Globus endpoints.  This will allow you to transfer and share data efficiently with any other Globus user in the world.

## Setup of Globus endpoints

### Set up a Globus endpoint for your {{ site.cluster.nickname }} account

If you want to transfer files from or to your {{ site.cluster.nickname }} account, you need to set up the '{{ site.globus.name }}' endpoint.  Below is an outline on how to do this.

1. [online] Go to [Globus.org](https://www.globus.org) and log in with your UCSF MyAccess credentials. Then find the Endpoints menu on the left and click it. Then locate the ['{{ site.globus.name }}' endpoint] and click 'Activate'.  This will ask you to enter your {{ site.cluster.nickname }} credential, i.e. your {{ site.cluster.nickname }} username and password.  Optionally, limit the lifetime of this endpoint by clicking 'Advanced' and select the number of hours you want it to be valid, e.g. `2` hours.

2. [online] Go to [Endpoints](https://app.globus.org/endpoints), go to the recently activated '{{ site.globus.name }}' endpoint, and click on 'Open in File Manager'.  This will display the files and folders on your {{ site.cluster.nickname }} account.  If you don't see anything, make sure to enter `~/` as the 'Path'.

3. [online] When no longer needed, make sure to 'Deactivate Credentials' for your '{{ site.globus.name }}' endpoint.


### Set up a Globus endpoint for your local machine

If you want to transfer files from or to your local machine, you need to set up a personal endpoint on that machine.  Below is an outline on how to do this.  For full details, see the [Globus Docs How To](https://docs.globus.org/how-to/).

1. [local] Make sure [Globus Connect Personal] is installed on your local machine (available for macOS, Linux, and MS Windows)

2. [local] (optional) The default is that Globus will have access to all of the content under your home directory, e.g. when connected to Globus you will be able to browse it from the Global website online.  To limit this, create a folder to be used solely for Globus transfers, e.g. `~/globus/`.  Launch the 'Globus Connect Personal' software, go to 'Preferences' and change the 'Access Path Configuration' to `~/globus`. Then, click 'Save'.

3. [online] Setup a [Globus Connect Personal (GCP) endpoint] for your local machine. Use one GCP endpoint per machine.  This step will produce a **GCP Security Key** for your local machine.  Make sure to write it down in a safe place.  If you lose it, you will have to create a new GCP endpoint.

4. [local] Launch the 'Globus Connect Personal' software, and enter your **GCP Security Key** code to connect.

5. [online] Go to [Endpoints -> 'Administered by You'](https://app.globus.org/endpoints?scope=administered-by-me), go to on your GCP endpoint, and click on 'Open in File Manager'.  This will display the files and folders on your local computer.  If you restricted access to `~/globus` (Step 2), then it is only that folder that is accessible via Globus.

6. [local] In the Globus Connect Personal software, make sure to disconnect when no longer needed.


## Transferring files

To transfer files via the Globus network:

1. Go to the [Globus Online File Manager](https://app.globus.org/file-manager)

2. Specify the two endpoints you wish to transfer files from and to.

3. Select the files and folders to be transferred and click 'Start'.





## Endpoints of interest

* [Your personal GCP endpoint](https://app.globus.org/endpoints?scope=administered-by-me)
* ['{{ site.globus.name }}' endpoint] (UUID `{{ site.globus.uuid }}`)


[Globus]: https://www.globus.org/
[Globus Connect Personal]: https://www.globus.org/globus-connect-personal
[Globus Connect Personal (GCP) endpoint]: https://app.globus.org/file-manager/gcp
<!-- markdownlint-disable-file MD034 -->
['{{ site.globus.name }}' endpoint]: https://app.globus.org/file-manager/collections/{{ site.globus.uuid }}/overview
