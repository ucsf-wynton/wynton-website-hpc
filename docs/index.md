<div class="alert alert-info" role="alert">
<strong>NEWS</strong>:<br/>
2019-03-01--...: Migrating nodes from QB3 to Wynton HPC - <a href="{{ '/about/specs.html' | relative_url }}">120 nodes (3440 cores)</a> has been moved this far.<br/>
2019-02-14: Added <a href="{{ '/scheduler/submit-jobs.html' | relative_url }}">SGE resource `eth_speed`</a> for requesting minimum network speeds.<br/>
2019-01-31: Added two more <a href="{{ '/about/specs.html' | relative_url }}">development nodes</a>.<br/>
2019-01-18: It is now possible to <a href="{{ '/about/pricing-storage.html' | relative_url }}">purchase additional storage</a>.<br/>
2018-11-05: Nightly cleanup of <a href="{{ '/about/specs.html#scratch-storage' | relative_url }}">scratch spaces</a> now respects also when files were "added" - not just when they were last modified.  This fixes the problem where files with old timestamps were extracted from an archive just to be wiped by the next nightly cleanup.<br/>
<a href="{{ '/about/news.html' | relative_url }}">More ...</a>
</div>


# Wynton - UCSF Research Computing at Scale

Wynton is a large, shared high-performance compute (HPC) cluster underlying UCSF's Research Computing Capability. Funded and administered cooperatively by UCSF campus IT and key research groups, it is available to all UCSF researchers, and consists of different profiles suited to various biomedical and health science computing needs.  Researchers can participate using the "co-op" model of resource contribution and sharing.

In the initial phase (starting Fall 2017), our focus is to accommodate existing users from the earliest contributing UCSF centers (Memory and Aging Center (joined), Inst. for Computational Health Sciences, Dept. of Radiology & Biomedical Imaging, and QB3).  In addition, **we encourage research groups who want to join the cooperative environment through new purchases or equipment migration to [contact us] for planning and evaluation**.  We plan to bring on more UCSF centers every few months.  Finally, once we achieve sufficient size and robustness, **we will also offer additional guest accounts for UCSF researchers who are not contributing to the co-op model**, to help meet the computational needs of the broad range of UCSF faculty and staff.  For more details, please see the Wynton [Roadmap].

If you don't fit one of the above early-access categories, but are keen to participate in one way or the other, please don't hesitate to [contact us] - we'd love to hear from you.

**Please note**: The current Wynton HPC environment is *not* certified for use with Protected Health Information (PHI).  Data containing PHI must not be transferred to, mounted on, or processed with any Wynton cluster resources.  If you have questions regarding the security status of your data, please contact the [UCSF Privacy Office].


[Roadmap]: {{ '/about/roadmap.html' | relative_url }}
[contact us]: {{ '/about/contact.html' | relative_url }}
[UCSF Privacy Office]: https://hipaa.ucsf.edu/
