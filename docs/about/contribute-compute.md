# Purchasing Additional Compute Resources


{% comment %}
Let the static-site generator (Jekyll) perform calculations for us to make
it easier to keep the below example automatically up-to-date will based on
real cluster specs.

The site.specs.* variables are set in the _config.yml file.
{% endcomment %}
{% assign member_q_slots_per_pu = site.specs.member_q_total | plus: 0.0 | divided_by: site.specs.pu_total %}


* {{ member_q_slots_per_pu }}
* {{ site.specs.member_q_total }}
* {{ site.specs.pu_total }}


## Summary

* Wynton HPC contributors get access to a number of _member.q_ compute slots, which have higher priority on the queue and on the compute nodes.  For details, see [Contributing Member Shares]({{ '/about/shares.html' | relative_url }}).

* Labs can increase the number of _member.q_ jobs they can run on Wynton HPC at any time by contributing compute resources to Wynton HPC

* Contributions can be done by:
  - purchasing new hardware (the most common), or
  - migrating existing HPC-compatible compute hardware (relevant to a few labs) (\*)


_If you are interested in contributing new hardware to Wynton HPC, please contact us at [wynton_admin@ucsf.edu](mailto:wynton_admin@ucsf.edu)._


<small>
(\*) How to contribute existing hardware will be document on this page as soon as we have a formal mechanism in place for benchmarking the compute nodes to be contributed. (2019-05-06)
</small>


## Purchasing new hardware

### Wynton HPC Recommended Purchase

 * Compute node ("1U"):
   - Number of CPUs: 2
   - Each CPU: Xeon Gold 6132 (14 cores, 2.6 GHz)
   - RAM: 384 GiB
   - Local storage: 1.0 TB HDD
   - Networking: 10 Gbps
   - Wynton HPC Processing Units: 109.25 PUs (~{{ 109.25 | plus: 0.0 | divided_by: 14 | divided_by: 2 | round: 1 }} PUs/core).  109.25 PUs [corresponds to]({{ '/about/shares.html' | relative_url }}) _member.q_ = {{ member_q_slots_per_pu | times: 109.25 | round: 1 }} slots (as of 2019-05-06)
   - Cost: TBA
   
This compute node is part of a "4U brick" that contains in total of four (4) such compute nodes.  In order for Wynton to put in a purchase order, there needs to be a request for a complete 4U brick.  Purchasing multiples of 4 compute nodes (= one 4U brick) is likely to make it available sooner because it avoids having to have for other labs to complete a brick.
