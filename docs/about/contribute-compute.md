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

**A lab can invest any amount of USD**.  The amount invested will be translated to a certain number of processing units (PUs), which the lab will keep for life.  Owning processing unit shares on the Wynton HPC, will give access to the member.q queue.  The more PUs a lab has the more member.q slots they can use at anytime.

As of 2019-05-06, **[1 PU gives {{ member_q_slots_per_pu | round: 3 }} member.q slots]({{ '/about/shares.html' | relative_url }})**.


### Wynton HPC Recommended Purchase

The Wynton HPC team recommends, full or partial, contributions toward the following hardware configuration:

 * Four (4) compute nodes, each having:
   - Number of CPUs: 2
   - Each CPU: Intel Xeon Gold 6132 (14 cores, 2.60 GHz)
   - RAM: 384 GiB
   - Local storage: 1.0 TB HDD
   - Networking: 10 Gbps
 * Total cost: TBA

The total processing power of the above "brick" is **337 PUs** (based on Wynton HPC benchmarking), which currently corresponds to approximately {{ member_q_slots_per_pu | times: 337 | round: 0 }} member.q slots (as of 2019-05-06).


_Comment_: In order for Wynton to put in a purchase order, there needs to be lab requests for a complete brick.  Contributing multiples of 4 compute nodes (= complete one brick) is likely to make it available sooner as there is no need to wait for other labs to contribute the remaining shares.
