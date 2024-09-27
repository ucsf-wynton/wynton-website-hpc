<!--
 WARNING: If you update this page, beyond fixing typos, you must create a
 GitHub issue on <https://github.com/ucsf-wynton/wynton-website-hpc/issues>
 to make sure the same information is updated in UCSF ServiceNow.
 -->

# User Agreement and Disclaimer

Last Updated September 26, 2024, 6:00pm PDT

Wynton user responsibilities and requirements in support of this
Agreement include:

 * By using the Wynton HPC environment, you agree to abide by the
   statement of its [Purpose, Principles and Governance] as well as the [UCSF Minimum Security Standards](https://it.ucsf.edu/standard-guideline/ucsf-650-16-addendum-b-ucsf-minimum-security-standards-electronic-information).

 * Users who wish to access protected data such as Protected Health
   Information (PHI) are required to log into node(s) that implement
   enhanced security such as additional access restrictions and
   relevant HIPAA compliance measures.

 * The PI is responsible for ensuring that users are listed on the
   Institutional Review Board (IRB) approval letter before they
   approve those users' Wynton access to data that require IRB
   approval. The PI is also responsible for ensuring they are in compliance with their grant requirements (e.g. platform security, data retention policies).

 * It is the responsibility of the PIs to ensure the integrity of
   their data. The Wynton filesystem is not the primary source of data
   (not a system of record). Once the PI has write access to the data,
   they are entitled to manipulate the data as they see fit.

 * All Wynton users are responsible for ensuring they have their own back-ups so they are able to revert to
   an earlier version if a mistake is made or they want access to their data during an outage. Wynton does not offer a back-up service, other than disaster recovery back-ups 
   of Home directories that could be restored only in the event of a major disaster, such as data center loss or ransomware.
   Very large Home directories do not have disaster recovery back-ups. 
   
 * Upon separation from UCSF, a Wynton user's home directory and its
   contents may be transferred to the user's PI in accordance with the
   Authorized and Acceptable Use of Electronic Information Resources
   policy (650-18) "i. An account that is not deleted upon loss of
   affiliation shall be transferred to another UCSF faculty or staff
   person designated as being responsible for the account." Accounts that are not claimed after
   90 days will be permanently deleted.
   
 * Because IT security requirements, operating systems, and hardware
   are continually evolving, difficult situations may arise in the
   future. For example, it is possible that future requirements
   imposed by the University of California Office of the President
   (UCOP) or the UCSF concerning PHI data would in turn negatively
   impact on the ability of the cluster to serve its founding purpose,
   as defined in the [Governance document].  In such a case, the
   Steering Committee may roll back configurational changes or
   otherwise re-configure the cluster, so that the founding needs are
   still satisfied, even if that occurs at the expense of some
   applications. Therefore, while every effort will continue to be
   made to maximize the number of applications, it is impossible to
   guarantee that once supported applications will always remain
   supported. If a rollback is required the Wynton OPS team and Shared
   Compute governance will make it a priority to stand up a separate
   cluster supporting the required functionality.

 * Use of the Wynton HPC cluster is subject to UCSF's policy on
   [Authorized and Acceptable Use of Electronic Information
   Resources].

 * The Wynton Operations team is tasked with implementing the policies
   established by the Faculty Steering Committee and with ensuring
   that the cluster runs effectively and efficiently. Users agree not
   to attempt to circumvent policies nor avoid restrictions imposed by
   the Wynton Operations team.

 * Under no circumstances are users to share their account and
   password with others.

 * Users are prohibited from changing system-wide configurations on
   Wynton nodes.

 * Wynton operations installs and maintains packages provided by the OS vendor
   and select system-wide application software.
   
 * Software not managed by Wynton admins is the user's
   responsibility. This includes but is not limited to: software installed in Wynton user and group
   directories, software in containers, and software installed using the Conda package manager.
   Additionally, Lmod modules that are not maintained
   by the Wynton admins themselves are the responsibility of the
   individual labs and users that maintain the module repositories
   (e.g. the CBI and Sali repositories).


[Purpose, Principles and Governance]: /hpc/about/governance.html
[Governance document]: /hpc/about/governance.html
[Authorized and Acceptable Use of Electronic Information Resources]: https://policies.ucsf.edu/policy/650-18
