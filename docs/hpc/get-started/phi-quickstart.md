# Protected Health Information (PHI) Quickstart

## UCSF Data Classification Standard & Restricted Data Types

* Please see [UCSF Policy 650-16 Addendum F, UCSF Data Classification Standard] for more information regarding UCSF's data classification standard:

  - [Personally Identifiable Information (PII)]

  - [Protected Health Information (PHI)]


## First step: Wynton accounts

* If you don't either don't have a {{ site.cluster.name }} account or if you already have a Wynton account, but it is not authorized to use PHI:

  - link to [learn more about the Wynton cluster](/hpc/about/join.html)
  
  - link to actually [request a Wynton PHI account]

* A link will be emailed to a Statement of Responsibility form that all users applying for PHI access must sign agreeing to the responsibilities of handling PII and/or PHI data, take the training in the handling of PII/PHI data, and keep the training up to date.

  - **Important**: The email address associated with a new Statement of Responsibility must exactly match the user's original email address.


## Principal Investigator responsibilities for PHI

* The Principal Investigator (PI) is responsible for all PHI data

* Additionally, the following rules apply to PIs using PHI on Wynton or approving users that use PHI on Wynton:

  - The PI must notify Wynton of any approved users whose access needs to be removed or is no longer required
  
  - The PI must notify Wynton of any users who have transferred departments and no longer require access to study data
  
  - The PI must notify Wynton when departing UCSF and transfer to another UCSF owner or archive their projects and data
  
  - The PI is responsible for ensuring that any user added to a Wynton PHI project that requires IRB approval, is listed on the IRB
  
  - The PI is responsible for classifying and taking inventory of data within their Wynton PHI project
  
  - The PI must notify Wynton of any change in security requirements in research agreements to Wynton admins


## User responsibilities for PHI

* Read and comply with the {{ site.cluster.name }} [User Agreement and Disclaimer](/hpc/about/user-agreement.html)

* Abide by the statement of {{ site.cluster.name }} [Purpose, Principles and Governance](/hpc/about/governance.html)

* User end points (e.g. laptops and desktops) connecting to Wynton must meet [UCSF Minimum Security Standards for Electronic Information Resources]

* PHI users must use PHI-specific nodes on Wynton;

  - login nodes: `plog1.wynton.ucsf.edu`
  
  - development nodes: `pdev1` and `pgpudev1`

  - data-transfer nodes: `pdt1.wynton.ucsf.edu` and `pdt2.wynton.ucsf.edu`

* PHI users must _not_ use any of the non-PHI-compliant nodes on Wynton, including log1, log2, dev1, dev2, dev3, gpudev1, dt1, and dt2.

* Data containing PHI must not be transferred to, mounted on, or processed with any Wynton HPC cluster resources outside of the PHI-designated `/wynton/protected/` location

* PHI users must use data-transfer nodes pdt1 and pdt2 for all file transfers to and from the cluster, including when using [Globus](/hpc/transfers/globus.html#globus-for-phi-users)

* If you have questions regarding the security status of your data, please contact the [UCSF Privacy Office](https://hipaa.ucsf.edu/)


## Frequently Asked Questions (FAQ)

**Q.** What if I want to share data between `/wynton/protected/group/` (PHI) and `/wynton/group/` (non-PHI) directories?

**A.** Users with PHI access still have access to `/wynton/group/`, as do Wynton non-PHI users. However, PHI data should never be stored under `/wynton/group/` and PHI data should never be shared with a user who does not have PHI access.


[UCSF Policy 650-16 Addendum F, UCSF Data Classification Standard]: https://it.ucsf.edu/standard-guideline/ucsf-policy-650-16-addendum-f-ucsf-data-classification-standard
[Personally Identifiable Information (PII)]: https://it.ucsf.edu/standard-guideline/ucsf-policy-650-16-addendum-f-ucsf-data-classification-standard#PII
[Protected Health Information (PHI)]: https://it.ucsf.edu/standard-guideline/ucsf-policy-650-16-addendum-f-ucsf-data-classification-standard#phi
[request a Wynton PHI account]: https://ucsf.service-now.com/ucsfit?id=ucsf_sc_cat_item&sys_id=68f9651f1bf47c50683e0ed8624bcbac&sysparm_category=40c0305b7b92d000e2dc8180984d4d9f
[UCSF Minimum Security Standards for Electronic Information Resources]: https://it.ucsf.edu/standard-guideline/ucsf-650-16-addendum-b-ucsf-minimum-security-standards-electronic-information
