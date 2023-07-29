<!--
 WARNING: If you update this page, beyond fixing typos, you must create a
 GitHub issue on <https://github.com/ucsf-wynton/wynton-website-hpc/issues>
 to make sure the same information is updated in UCSF ServiceNow.
 -->

# User Agreement and Disclaimer

## Customer Responsibilities

Wynton user responsibilities and/or requirements in support of this
Agreement include:

 * By using the Wynton HPC environment, you agree to abide by the
   statement of its [Purpose, Principles and Governance].

 * Users who wish to access protected data such as Protected Health
   Information (PHI) are required to log into node(s) that implement
   enhanced security such as additional access restrictions and/or
   relevant HIPAA compliance measures.

 * It is the responsibility of the Principal Investigator (PI) to
   ensure users that they have approved are on the Institutional
   Review Board (IRB) approval letter with the PI.

 * The PI is responsible for ensuring that any user they approve that
   is added to Wynton that accesses data that requires IRB approval,
   is listed on the IRB approval letter.

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

 * It is the responsibility of the PIs to ensure the integrity of
   their data. The Wynton filesystem is not the primary source of data
   (not a system of record). Once the PI has write access to the data,
   they are entitled to manipulate the data as they see fit.

 * Upon separation from UCSF, a Wynton user's home directory and it's
   contents may be transferred to the user's PI in accordance with the
   Authorized and Acceptable Use of Electronic Information Resources
   policy (650-18) "i. An account that is not deleted upon loss of
   affiliation shall be transferred to another UCSF faculty or staff
   person designated as being responsible for the account."

 * The Wynton Operations team is tasked with implementing the policies
   established by the Faculty Steering Committee and with ensuring
   that the cluster runs effectively and efficiently. Users agree not
   to attempt to circumvent policies nor avoid restrictions imposed by
   the Wynton Operations team.

 * Under no circumstances are users to share their account and
   password with others.

 * Users are prohibited from changing system-wide configurations on
   Wynton nodes.

 * Wynton operations maintains (including patches) of system-wide
   software on Wynton nodes. Software managed using the yum package
   management tool is the responsibility of Wynton operations.
   
 * Software not managed by Wynton admins, and is the user's
   responsibility, include software installed in Wynton user and group
   directories. This includes but is not limited to: software in user
   Singularity containers and software installed using the conda
   package manager. Additionally, Lmod modules that are not maintained
   by the Wynton admins themselves is the responsibility of the
   individual labs and users that maintain the module repositories
   (e.g. the CBI and Sali repositories).


[Purpose, Principles and Governance]: /hpc/about/governance.html
[Governance document]: /hpc/about/governance.html
[Authorized and Acceptable Use of Electronic Information Resources]: https://policies.ucsf.edu/policy/650-18
