# PHI Quickstart

## UCSF Data Classification Standard & Restricted Data Types

- Please see [UCSF Policy 650-16 Addendum F, UCSF Data Classification Standard](https://it.ucsf.edu/standard-guideline/ucsf-policy-650-16-addendum-f-ucsf-data-classification-standard) for more information regarding UCSF's data classification standard:

  - [Personally Identifiable Information (PII)](https://it.ucsf.edu/standard-guideline/ucsf-policy-650-16-addendum-f-ucsf-data-classification-standard#PII)
  - [Protected Health Information (PHI)](https://it.ucsf.edu/standard-guideline/ucsf-policy-650-16-addendum-f-ucsf-data-classification-standard#phi)


## First step: Wynton accounts

- If you either don't have a {{ site.cluster.name }} account or if you already have a Wynton account, but it is not authorized to use PHI:
  - learn more about the Wynton cluster - [click here]({{ '/about/join.html' | relative_url }})
  - to actually request a Wynton PHI account - [click here](https://ucsf.service-now.com/ucsfit?id=ucsf_sc_cat_item&sys_id=68f9651f1bf47c50683e0ed8624bcbac&sysparm_category=40c0305b7b92d000e2dc8180984d4d9f)
- All PHI users must sign a Statement of Responsibility form agreeing to the responsibilities of handling PII and/or PHI data and take the training in the handling of PII/PHI data and keep the training up to date.

## Wynton PHI PI responsibilities

- The PI is responsible for all PHI data
- Additionally, the following rules apply to PIs using PHI on Wynton or approving users that use PHI on Wynton:
  - The PI must notify Wynton of any approved users whose access needs to be removed or is no longer required
  - The PI must notify Wynton of any users who have transferred departments and no longer require access to study data
  - The PI must notify Wynton when departing UCSF and transfer to another UCSF owner or archive their projects and data
  - The PI is responsible for ensuring that any user added to a Wynton PHI project that requires IRB approval, is listed on the IRB
  - The PI is responsible for classifying and taking inventory of data within their Wynton PHI project 
  - The PI must notify Wynton of any change in security requirements in research agreements to Wynton admins

## Wynton PHI user responsibilities

- Read and comply with the {{ site.cluster.name }} [User Agreement and Disclaimer]({{ '/about/governance.html' | relative_url }})
- Abide by the statement of {{ site.cluster.name }} [Purpose, Principles and Governance]({{ '/about/governance.html' | relative_url }})
- User end points (laptops/desktops) connecting to Wynton must meet [UCSF minimum security standards](https://it.ucsf.edu/standard-guideline/ucsf-650-16-addendum-b-ucsf-minimum-security-standards-electronic-information)
- PHI users must use PHI-specific nodes to connect to Wynton
  - login/data transfer: `plog1`
  - dev: `pdev1`, `pgpudev1`
- Data containing PHI must not be transferred to, mounted on, or processed with any Wynton HPC cluster resources outside of the PHI-designated `/wynton/protected` location
- If you have questions regarding the security status of your data, please contact the [UCSF Privacy Office](https://hipaa.ucsf.edu/)

## Frequently Asked Questions (FAQ)

**Q.**. Is data on Wynton backed up?

**A.**. Data on Wynton is not backed up, users and labs are responsible to back up their own data outside of Wynton HPC.

**Q. **. What is I want to share data between `/wynton/protected/group` (PHI) and `/wynton/group` (non-PHI) directories?

**A.**. Users with PHI access still have access to `/wynton/group`, as do Wynton non-PHI users. However, PHI data should never be stored under `/wynton/group` and PHI data should never be shared witha a user who does not have PHI access.
