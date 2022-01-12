# Wynton PHI

Wynton PHI environment is available to all UCSF researchers and affiliates as of December 17, 2021. This means Wynton users can now use the entire Wynton HPC environment (449 compute nodes with 12,572 physical cores + 148 GPUs on 42 GPU nodes, and counting) to process research computing jobs involving Protected Health Information (PHI) and/or sensitive data. Please submit [Apply for Wynton PHI] on ServiceNow to request an account and use <a href="https://wynton.ucsf.edu/hpc/support/index.html">these support channels</a> for any help you need. Allowing for the time for onboarding new accounts and set up new PHI projects, we expect to start enabling new PHI users January 5, 2022 onward.

## Background

Since its inception in 2017, Wynton has been providing (and steadily growing) a large, shared high-performance compute (HPC) cluster for research computing. However, its use was restricted to non-PHI data. The Wynton team received many requests from PIs to expand this scope to support working with PHI data, and with the support from central IT, we initiated a project (dubbed Wynton PHI) in 2019 to upgrade the Wynton environment to support PHI. 

Fast forward to December 2020, we launched a Wynton PHI pilot to test the system. To date, this pilot has successfully supported 40 users across 12 different projects that needed to work with PHI or deidentified patient data. Based on the pilot feedback, we are happy to make this environment available to all UCSF researchers and affiliates.

## Features and Benefits

### Approved for PHI usage

Wynton PHI environment is approved for storing and working with PHI data as long as the specific PHI data usage is covered under a Principal Investigator (PI)'s IRB approval. This way, PIs can be confident that they are conducting their research computing with PHI in a compliant environment.

Wynton team worked closely with UCSF IT Security and the Privacy, Legal, and Risk (PLR) group to follow the best practices in addressing security and privacy related risks. We obtained the services of an outside security consulting firm to put together a System Security Plan (SSP) based on the <a href="https://csrc.nist.gov/publications/detail/sp/800-53/rev-4/archive/2015-01-22">NIST 800-53 revision 4 framework</a> from US federal government. The SSP lists 12 security domains with a total of 156 risk control categories. The SSP then describes how Wynton PHI addresses each risk control, and clearly identifies the owner of each risk control. The Wynton team reviewed this SSP with IT Security and PLR for their support of the plan and also went through a security risk assessment with IT Security which assigned an overall risk level of "Low".  

Please note that Wynton PHI employs a shared risk model that relies on individual PIs and their research team members to own certain risks and follow the guidelines set in <a href="https://wynton.ucsf.edu/hpc/about/user-agreement.html">Wynton User Agreement</a> as well as <a href="https://it.ucsf.edu/standard-guideline/ucsf-650-16-addendum-b-ucsf-minimum-security-standards-electronic-information">UCSF Minimum Security Standards for Electronic Information Resources</a>.

### Lots of computing power (including GPUs) and Storage

With Wynton PHI, researchers have access to Wynton HPC's entire computing power and storage to work on their PHI data, which provides a significant throughput compared to single workstations or typical lab networks. As of December 2021, Wynton HPC consists of:

* Compute nodes - 449
* Physical cores - 12572
* GPUs - 148 GPUs on 42 GPU nodes (48/11 GPUs/nodes are communal and 100/31 GPUs/nodes are prioritized for GPU contributors)
* RAM - 48-1512 GiB/node
* Local scratch - 0.1-1.8 TiB/node
* Global scratch - 615 TiB
* User home storage - 500 GiB/user (383 TiB in total)
* Group storage - 5.6 PB
* Number of accounts - 1,311
* Number of projects - 380

### Free (paid-models available for dedicated storage and to run higher-priority jobs)

The Wynton HPC environment is available for free to all UCSF researchers and their collaborators. This means every user has access to 500 GiB of space in their home directory plus the entire scratch space, and they can run their jobs at basic priority levels. There is also a paid model for users to schedule jobs at a higher priority and also to purchase additional dedicated storage. Here is more information:

* [Compute Node Pricing](https://wynton.ucsf.edu/hpc/about/pricing-compute.html)
* [Dedicated Storage Pricing](https://wynton.ucsf.edu/hpc/about/pricing-storage.html)

### Professional Support

Unlike running research computing jobs on individual workstations or lab networks where researchers are on their own for system administration and compliance, Wynton PHI has a dedicated staff of system administrators supporting the environment. In addition to day-to-day maintenance of the system, the admin team is constantly adding enhancements and also providing user support through various channels, including a weekly office hour where researchers can talk to the admins directly. Ultimately, our goal is to create a thriving research computing community around Wynton that helps provide world class research computing tools to facilitate the great work done by world class researchers at UCSF.

## How to get a Wynton PHI account

Please submit [Apply for Wynton PHI] on ServiceNow to request an account on Wynton PHI. This will initiate an automated onboarding process to check that you meet the following prerequisites:

* Valid email address
* PI approval to work on Wynton PHI
* Attested to UCSF Statement of Responsibility

Once these are completed, you will be notified of your account credentials to access Wynton PHI. If you already have a regular Wynton HPC account, your account will be reconfigured to access Wynton PHI.

Allowing for the time for onboarding new accounts and setting up new PHI projects, we expect to start enabling new PHI users January 5, 2022 onward.

## How to Access and Use Wynton PHI

Please note that once you have a Wynton PHI account, you can only access Wynton using Wynton PHI login nodes, which requires you to have 2-factor authentication (using Duo) or to log in from within the UCSF network. 

Here is a list of the currently known issues that our team is working on resolving:

* Wynton currently does NOT provide data backups. While we are looking at potential solutions, for now, please make sure you have your data backup and recovery processes in place before and while you are working with your research data (and code) in Wynton PHI. 
* Wynton PHI does not support data transfers using Globus yet since the configuration of 2-factor authentication in Globus is still in progress. 
* Currently we can only onboard UCSF staff and UCSF affiliates who have a UCSF ID. We are updating our ServiceNow onboarding process to allow creating Wynton PHI accounts for non-UCSF research collaborators with approval from the PHI project's PI. 

Also - as with any new system in place, we are sure there will be other things to be fine-tuned. So, please reach out to us using <a href="https://wynton.ucsf.edu/hpc/support/index.html">these support channels</a> for any help you need, or any feedback you have to improve our service. 

## Other options at UCSF to work with PHI data

Depending on your project, Wynton PHI may or may not be the best fit for your project. So we encourage you to also evaluate the following options at UCSF to work with PHI data:

* [RAE](https://it.ucsf.edu/service/rae)
* [Data Center Services](https://it.ucsf.edu/service/data-center-services)
* [UCSF Secure Cloud](https://cloudservices.ucsf.edu/)

## Acknowledgments

Many brave souls across different corners of UCSF have contributed to making Wynton PHI possible. We would like to specifically thank the following individuals for their invaluable help and leadership:

* Joshua Baker-LePain
* Scooter Morris
* Erik Ellestad
* Saketh Koduru
* Michael Urashka
* Dirk Kleinhesselink
* Greg Couch
* Rick Larsen
* Sandeep Giri
* Nicole Martin
* Sharat Israni
* Rhett Hillary
* Joe Hesse
* Pavan Gupta
* Toby Barber
* Robert Tannenbaum

Finally - we hope adding this new major feature will tremendously help UCSF researchers working with PHI data. Please reach out to us if you have any questions or feedback.

Thanks!

Your Wynton Admin Team


[Apply for Wynton PHI]: https://ucsf.service-now.com/ucsfit?id=ucsf_sc_cat_item&sys_id=68f9651f1bf47c50683e0ed8624bcbac&sysparm_category=40c0305b7b92d000e2dc8180984d4d9f
