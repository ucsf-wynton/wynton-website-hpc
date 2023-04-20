<!-- markdownlint-disable-file MD034 -->

# Globus

[Globus] is a non-profit service for moving, syncing, and sharing large amounts of data asynchronously in the background.  Transfers are done from and to, so called, _Collections_.  In order to perform a file transfer from one location to another using the Globus service, both ends must have a Collection.  UCSF has a site license for Globus, and several UCSF departments and services, including the {{ site.cluster.name }} environment, provide Globus Collection.  This will allow you to transfer and share data efficiently with any other Globus user in the world.

## Setup of Globus Collections

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

NOTE: You can only use Wynton Globus Collections to share data from Wynton Servers and the Wynton File systems using the Wynton Globus Collections. You cannot use the Wynton Globus Collections to share data mounted on Wynton servers via automounts of remote servers.

### Globus for PHI Users

To use the PHI Compatible Globus ['UCSF Wynton PDT' Collection], you _must_ be signed up for [Wynton Two-Factor Authentication](/hpc/get-started/duo-signup.html).

Instead of using the non-PHI-compliant Collection 'UCSF Wynton HPC', all PHI data must use the PHI-approved Globus Collection 'UCSF Wynton PDT', which is associated with the pdt1 and pdt2 data-transfer nodes.  

1. Log in to Globus with your UCSF Campus ID. 
2. On the next screen, you will be notified 'Authentication Required'. 
3. Select your identity. 
4. This will take you to a screen where you are prompted to enter your Wynton Username and Password. Enter these. 
5. Your default Two-Factor Authentication will be notified.  
6. Approve, and Globus will continue to a screen representing the Wynton file system.


### Set up a Globus Collection for your local machine

If you want to transfer files from or to your local machine, you need to set up a personal Collection on that machine.  Below is an outline on how to do this.  For full details, see the [Globus Docs How To](https://docs.globus.org/how-to/).

1. [local] Make sure [Globus Connect Personal] is installed on your local machine (available for macOS, Linux, and MS Windows)

2. [local] (optional) The default is that Globus will have access to all of the content under your home directory, e.g. when connected to Globus you will be able to browse it from the Global website online.  To limit this, create a folder to be used solely for Globus transfers, e.g. `~/globus/`.  Launch the 'Globus Connect Personal' software, go to 'Preferences' and change the 'Access Path Configuration' to `~/globus`. Then, click 'Save'.

3. [online] Setup a [Globus Connect Personal (GCP) Collection] for your local machine. Use one GCP collection per machine.  This step will produce a **GCP Security Key** for your local machine.  Make sure to write it down in a safe place.  If you lose it, you will have to create a new GCP collection.

4. [local] Launch the 'Globus Connect Personal' software, and enter your **GCP Security Key** code to connect.

5. [online] Go to [Collection -> 'Administered by You'](https://app.globus.org/collections?scope=administered-by-me), go to on your GCP Collection, and click on 'Open in File Manager'.  This will display the files and folders on your local computer.  If you restricted access to `~/globus` (Step 2), then it is only that folder that is accessible via Globus.

6. [local] In the Globus Connect Personal software, make sure to disconnect when no longer needed.

## Transfer between Wynton and UCSF Box using UCSF Wynton HPC Box Globus Connector

<div class="alert alert-warning" role="alert" markdown="1">
2022-05-26: We are still testing this feature. Although basic use-case testing has been done, **UCSF HPC Box Globus Connector** still hasn't been thoroughly validated by end users. If you run into issues or have suggestions to make the documentation clearer, please reach out to [{{ site.cluster.email_support }}](mailto::{{ site.cluster.email_support }}).
</div>

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

## Transferring files

To transfer files via the Globus network:

1. Go to the [Globus Online File Manager](https://app.globus.org/file-manager)

2. Specify the two Collections you wish to transfer files from and to.

3. Select the files and folders to be transferred and click 'Start'.


## Collections of interest

* [Your personal GCP Collection](https://app.globus.org/collections?scope=administered-by-me)
* ['{{ site.globus.name }}' Collection] (UUID `{{ site.globus.uuid }}`)
* ['{{ site.globus-phi.name }}' Collection] (UUID `{{ site.globus-phi.uuid }}`)
* ['{{ site.globus-box.name }}' Collection] (UUID `{{ site.globus-box.uuid }}`)


[Globus]: https://www.globus.org/
[Globus Connect Personal]: https://www.globus.org/globus-connect-personal
[Globus Connect Personal (GCP) Collection]: https://app.globus.org/file-manager/gcp
['{{ site.globus.name }}' Collection]: https://app.globus.org/file-manager/collections/{{ site.globus.uuid }}/overview
['{{ site.globus-phi.name }}' Collection]: https://app.globus.org/file-manager/collections/{{ site.globus-phi.uuid }}/overview
['{{ site.globus-box.name }}' Collection]: https://app.globus.org/file-manager/collections/{{ site.globus-box.uuid }}/overview
