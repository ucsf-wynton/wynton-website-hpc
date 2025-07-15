<!-- markdownlint-disable-file MD034 -->

# Globus

[Globus] is a non-profit service for moving, syncing, and sharing large amounts of data asynchronously in the background.  Transfers are done from and to, so called, _Collections_.  In order to perform a file transfer from one location to another using the Globus service, both ends must have a Collection.  UCSF has a site license for Globus, and several UCSF departments and services, including the {{ site.cluster.name }} environment, provide Globus Collection.  This will allow you to transfer and share data efficiently with any other Globus user in the world.

## Setup of Globus Collections

### NOTE: You do not need a Wynton HPC Account to Transfer Data with Globus

If you only need to transfer data to or from remote Globus collections to or from your local machine or departmental share, you do NOT need a Wynton HPC Account.

Instead, follow the instructions below to install Globus Connect Personal on your computer.

### Set up a Globus Collection for your local machine

If you want to transfer files from or to your local machine, you need to set up a personal Collection on that machine.  Below is an outline on how to do this.  For full details, see the [Globus Docs How To](https://docs.globus.org/how-to/).

1. [local] Make sure [Globus Connect Personal] is installed on your local machine (available for macOS, Linux, and MS Windows)

2. [local] (optional) The default is that Globus will have access to all of the content under your home directory, e.g. when connected to Globus you will be able to browse it from the Global website online.  To limit this, create a folder to be used solely for Globus transfers, e.g. `~/globus/`.  Launch the 'Globus Connect Personal' software, go to 'Preferences' and change the 'Access Path Configuration' to `~/globus`. Then, click 'Save'.

3. [online] Setup a [Globus Connect Personal (GCP) Collection] for your local machine. Use one GCP collection per machine.  This step will produce a **GCP Security Key** for your local machine.  Make sure to write it down in a safe place.  If you lose it, you will have to create a new GCP collection.

4. [local] Launch the 'Globus Connect Personal' software, and enter your **GCP Security Key** code to connect.

5. [online] Go to [Collection -> 'Administered by You'](https://app.globus.org/collections?scope=administered-by-me), go to on your GCP Collection, and click on 'Open in File Manager'.  This will display the files and folders on your local computer.  If you restricted access to `~/globus` (Step 2), then it is only that folder that is accessible via Globus.

6. [local] In the Globus Connect Personal software, make sure to disconnect when no longer needed.

7. [online] (Optional) If you require to transfer data to or from Globus High Assurance Collections, your account must be associated with the "University of California San Francisco High Assurance Globus Plus" Group. To join the group, login to [globus.org](https://www.globus.org/) with your UCSF MyAccess credentials, select the groups side tab, deselect "My Groups", and search for "University of California San Francisco" - locate the "University of California San Francisco High Assurance Globus Plus" group and hit the join. The person who manages the UCSF Globus subscription will approve any account associated with a UCSF Email Address.

### Set up a Globus Collection for your {{ site.cluster.nickname }} account

If you want to transfer files from or to your {{ site.cluster.nickname }} account, you need to set up the '{{ site.globus.name }}' Collection.  Below is an outline on how to do this.

1. [online] Go to [Globus.org](https://www.globus.org) and log in with your UCSF MyAccess credentials. 
2. Then find the Collections menu on the left and click it. 
3. Then locate the ['{{ site.globus.name }}' collection]. 
4. This will bring up the "Overview" of the ['{{ site.globus.name }}' collection]. 
5. Click "Open in File Manager". There should be a new pane which says, "Authentication Required". 
6. Click "Continue". 
7. Select your Globus Wynton Identity. 
8. Enter your {{ site.cluster.nickname }} credential, i.e. your {{ site.cluster.nickname }} username and password. 
9. Your Wynton Home Directory should display in File Manager.

NOTE: You can only use Wynton Globus Collections to share data from Wynton Servers and the Wynton File systems. You cannot use the Wynton Globus Collections to share data mounted on Wynton servers via NFS mounts of remote servers.

#### Troubleshooting Globus Account Creation

* **If you receive a message similar to `Missing Identity Information. Unable to complete the authentication process. Your identity Provider did not release the attributes(s): {{email}}` please follow these steps, “This error is the result of email address privacy settings in the directory.  Please ask them to go to [UCSF Directory](https://directory.ucsf.edu) and click the “Edit My Record” button at the top right of the page. They’ll be asked to login via MyAccess (if they haven’t already done so).  To the right of the “Email” field on the Edit Your UCSF Directory Entry page that appears, click the pop-up menu (which probably shows “Private” currently) and select either “UCSF Only” or “Public” then click the “Save Changes” button at the bottom of the page.  This will tell the SSO system that it’s okay to release the email address to CILogon and other InCommon Federation registered applications.”**

### Globus for Wynton Protected Users

To use the Wynton Protected Compatible Globus ['UCSF Wynton PDT' Collection], you _must_ be signed up for [Wynton Two-Factor Authentication](/hpc/get-started/duo-signup.html).

The regular 'UCSF Wynton HPC' Collection is not compliant with Wynton Protected use. Instead, all Wynton Protected data must use the Wynton-Protected-approved Globus Collection 'UCSF Wynton PDT', which is associated with the pdt1 and pdt2 data-transfer nodes.  

1. Log in to Globus with your UCSF Campus ID. 
2. On the next screen, you will be notified 'Authentication Required'. 
3. Select your identity. 
4. This will take you to a screen where you are prompted to enter your Wynton Username and Password. Enter these. 
5. Your default Two-Factor Authentication will be notified.  
6. Approve, and Globus will continue to a screen representing the Wynton file system.


## Transfer between Wynton and UCSF Box using UCSF Wynton HPC Box Globus Connector

### Prerequisites

You must have:

* **a UCSF Associated Globus Account**

* **a UCSF Account that includes access to UCSF Box**

### Set up

1. Go to [Globus.org](https://www.globus.org) and log in with your UCSF MyAccess credentials.

2. In the "Collections" search field enter "UCSF Wynton HPC Box Connector".

3. Select the "UCSF Wynton HPC Box Connector" collection.

4. You will see a dialog "Authentication Required", click "continue". 

5. Next you will see a dialog "Identity Required". Select your UCSF associated identity, (it will be something like "123456@ucsf.edu").

6. Authenticate with MyAccess.

7. A representation of your UCSF Box files will appear in the Globus panel.

8. Log in to another Globus Collection to transfer files to or from your UCSF Box file repository to another collection.

Troubleshooting:

* **If step 4/5 above fails and you receive a message similar to "Identity set contains identity from an allowed domain but it does not map to a valid username for this connector." contact [{{ site.cluster.email_support }}](mailto::{{ site.cluster.email_support }}).**

* **If you receive a message similar to `Missing Identity Information. Unable to complete the authentication process. Your identity Provider did not release the attributes(s): {{email}}` or "Identity set contains identity from an allowed domain but it does not map to a valid username for this connector." please follow these steps, “This error is the result of email address privacy settings in the directory.  Please ask them to go to [UCSF Directory](https://directory.ucsf.edu) and click the “Edit My Record” button at the top right of the page. They’ll be asked to login via MyAccess (if they haven’t already done so).  To the right of the “Email” field on the Edit Your UCSF Directory Entry page that appears, click the pop-up menu (which probably shows “Private” currently) and select either “UCSF Only” or “Public” then click the “Save Changes” button at the bottom of the page.  This will tell the SSO system that it’s okay to release the email address to CILogon and other InCommon Federation registered applications.” If you choose to keep your email address “private”, you will be unable to use the Globus Box Plugin.**

## Transferring files

To transfer files via the Globus network:

1. Go to the [Globus Online File Manager](https://app.globus.org/file-manager)

2. Specify the two Collections you wish to transfer files from and to.

3. Select the files and folders to be transferred and click 'Start'.


## Collections of interest

* [Your personal GCP Collection](https://app.globus.org/collections?scope=administered-by-me)
* ['{{ site.globus.name }}' Collection] (UUID `{{ site.globus.uuid }}`)
* ['{{ site.globus-protected.name }}' Collection] (UUID `{{ site.globus-protected.uuid }}`)
* ['{{ site.globus-box.name }}' Collection] (UUID `{{ site.globus-box.uuid }}`)


[Globus]: https://www.globus.org/
[Globus Connect Personal]: https://www.globus.org/globus-connect-personal
[Globus Connect Personal (GCP) Collection]: https://app.globus.org/file-manager/gcp
['{{ site.globus.name }}' Collection]: https://app.globus.org/file-manager/collections/{{ site.globus.uuid }}/overview
['{{ site.globus-protected.name }}' Collection]: https://app.globus.org/file-manager/collections/{{ site.globus-protected.uuid }}/overview
['{{ site.globus-box.name }}' Collection]: https://app.globus.org/file-manager/collections/{{ site.globus-box.uuid }}/overview
