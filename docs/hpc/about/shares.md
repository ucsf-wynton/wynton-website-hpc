<div class="alert alert-info" role="alert" markdown="1">
**Contributions to the {{ site.cluster.name }} environment are non-expiring, e.g. contribute once and keep it for life!**
</div>

# Contributing Member Shares

## Compute Shares

{% comment %}
Let the static-site generator (Jekyll) perform calculations for us to make
it easier to keep the below example automatically up-to-date will based on
real cluster specs.

The site.data.specs.* variables are set in the _config.yml file.

HB 2019-04-29: This works but is a bit tedious to write and read; maybe this
               this is neater when done in Hugo(?).  Let's wait and see. If
               not, we might wanna consider Rmarkdown to generate this info.
{% endcomment %}
{% assign pu_add_label = "2.2 GHz Opteron 6174 CPU" %}
{% assign pu_add = 1.6 %}
{% assign slots_add = 12 %}
{% assign pu_times = 4 %}
{% assign pu_delta = pu_add | times: pu_times %}
{% assign slots_delta = slots_add | times: pu_times %}
{% assign pu_total_0 = site.data.specs.pu_total | minus: pu_delta %}
{% assign slots_total_0 = site.data.specs.member_q_total | minus: slots_delta %}
{% assign pu_delta_share = pu_delta | divided_by: pu_total_0 %}
{% assign slots_delta_share = pu_delta_share | times: slots_total_0 %}
{% assign pu_0 = 16.3 %}
{% assign pu_1 = pu_0 | plus: pu_delta %}
{% assign pu_1_share = pu_1 | divided_by: pu_total_0 %}
{% assign slots_1 = pu_1_share | times: slots_total_0 %}


Currently, the {{ site.cluster.name }} cluster has in total _member.q<sub>total</sub>_ = {{ site.data.specs.member_q_total }} slots available on the member.q queue.  Jobs on the _member.q_ queue will launch and finish sooner than jobs on the communal, lower-priority _long.q_ queue.  A member.q job will have higher-priority on the CPU than a long.q job in case they run on the same compute node.   It is only contributing members who have access to the member.q queue - non-contributing members will only have access to [queues](/hpc/scheduler/queues.html) such as the long.q queue.  **Contributors get _non-expiring, lifetime access_ to a  number of these member.q slots in proportion to their hardware contribution to the cluster.**  The number of member.q slots a particular hardware contribution, which can be monetary(\*) or physical(\*), adds, is based on how much compute power the contribution adds to the cluster.
The amount of compute power that contributed hardware adds is based on benchmarking(\*), which result in a _processing-unit score_ (PU) for the contribution.  Currently, there are in total _PU<sub>total</sub>_ = {{ site.data.specs.pu_total }} _contributed_ processing units on {{ site.cluster.name }}.

<div class="alert alert-info" role="alert" markdown="1">
**A lab's contributed processing units (_PU<sub>lab</sub>_) will never expire - it will remain the same until the lab makes additional contributions to the cluster.**
</div>

As other labs contribute to the cluster, the total computer power (_PU<sub>total</sub>_) and the total number of member.q slots (_member.q<sub>total</sub>_) will increase over time.   This will result in the lab's _relative_ compute share (_PU<sub>lab</sub>_ / _PU<sub>total</sub>_) to decrease over time while their number of member.q slots (_member.q<sub>lab</sub>_) will stay approximately(**) the same.


### Example: Additional contribution from the Charlie Lab

Assume that the last addition was from the Charlie Lab contributing {{ pu_times }} compute nodes.  Each of these machines has a {{ slots_add }}-core {{ pu_add_label }} and clocks in at {{ pu_add }} PUs based on the benchmarking, resulting in the processing power added for this lab, but also to the cluster as a whole, to be {{ pu_times }} \* {{ pu_add }} PUs = +{{ pu_delta }} PUs.  In addition to increasing the total amount of contributed PUs, the lab's contribution also increased the total number of member.q slots on the cluster by {{ pu_times }} \* {{ slots_add }} = +{{ slots_delta }} slots.

If this was Charlie Lab's first contribution to {{ site.cluster.name }}, their share on the member.q queue will be _PU<sub>lab</sub>_ / _PU<sub>total</sub>_ = {{ pu_delta }} / {{ site.data.specs.pu_total }} = {{ pu_delta_share | times: 100 | round: 3 }}%.  This PU share translates to _member.q<sub>lab</sub>_ = (_PU<sub>lab</sub>_ / _PU<sub>total</sub>_) \*_member.q<sub>total</sub>_ = {{ slots_delta_share | round: 0 }} member.q slots ({{ slots_delta_share | round: 2 }} rounded off to the closest integer).
Instead, if they already had contributed, say, in total {{ pu_0 }} PUs in the past, their computational share would had become _PU<sub>lab</sub>_ = ({{ pu_0 }} + {{ pu_delta }}) / {{ site.data.specs.pu_total }} = {{ pu_1_share | times: 100 | round: 3 }}%, which, would corresponds to {{ slots_1 | round: 0 }} member.q slots ({{ slots_1 | round: 2 }} rounded off).

<!--
All members of a lab will have access to the lab's member.q slots.  For example, if five out of seven member.q slots are currently in use when another lab member submits four ten-hour jobs, then two of those jobs will end up on the member.q queue whereas the other two will "spill over" to the lower-priority long.q queue.  In contrast, if those jobs were submitted by a non-contributing member, all four would end up on the long.q queue.
-->


### Current Compute Shares

Below table shows the current amount of contributions in terms of Processing Units (PU) and the corresponding number of member.q slots per contributing lab.



<script src="https://d3js.org/d3.v3.min.js"><!-- ~150 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"><!-- ~80 kB --></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"><!-- 2 kB --></script>

<table id="hosttable">
</table>

<!-- markdownlint-disable-file MD011 MD052 -->
<script type="text/javascript" charset="utf-8">
d3.text("/hpc/assets/data/compute_shares.tsv", "text/csv", function(host_table) {
  // extract date from header comments
  var timestamp = host_table.match(/^[#] Created on: [^\r\n]*[\r\n]+/mg, '')[0];
  timestamp = timestamp.replace(/^[#] Created on: /g, '');
  timestamp = timestamp.replace(/ [^ ]+/g, ''); // keep only the date
  timestamp = timestamp.trim();
  d3.select("#compute-shares-timestamp").text(timestamp);
  
  // drop header comments
  host_table = host_table.replace(/^[#][^\r\n]*[\r\n]+/mg, '');
  host_table = d3.tsv.parse(host_table);

  var table = d3.select("#hosttable");
  var thead, tbody, tfoot, tr, td, td_status;
  var value, value2;
  var pu_total = 0, slots_total = 0;
  
  /* For each row */
  var nodes = 0;
  host_table.forEach(function(row0) {
    var row = [row0["fshares"], row0["queue_slots"], row0["project"]];

    if (nodes == 0) {
      tr = table.append("thead").append("tr");
      tr.append("th").text("Processing Units (PU)");
      tr.append("th").text("Member.q Slots");
      tr.append("th").text("Lab Group");
      tbody = table.append("tbody");
    }

    tr = tbody.append("tr");
    for (key in row) td = tr.append("td").text(row[key]);

    pu_total += parseInt(row[0]);
    slots_total += parseInt(row[1]);

    nodes += 1;
  });

  tr = table.append("tfoot").append("tr");
  tr.append("td").text(pu_total + " PUs");
  tr.append("td").text(slots_total + " slots");

  $(document).ready(function() {
    $('#hosttable').DataTable({
      "pageLength": 50,
      "order": [[ 0, "desc" ]]
    });
  });
});
</script>

Source: [compute_shares.tsv](/hpc/assets/data/compute_shares.tsv) produced on <span id="compute-shares-timestamp"></span>.  These data were compiled from the current SGE configuration (`qconf -srqs member_queue_limits` and `qconf -sprj <project>`).  In SGE terms, a processing unit (PU) corresponds to a _functional share_ ("fshare").



<small>
(*) To be documented.<br>
(**) The reason for _member.q<sub>lab</sub>_ not remaining exactly the same when _PU<sub>lab</sub>_ does not change, is that the compute power per core is greater for newer hardware compared with older hardware. Because of this, a lab’s number of member.q slots is likely to, ever so slightly, decrease in the long run as the cluster keeps growing. But don’t worry, as the _average compute power per member.q slot increases over time_, your lab's total compute power on the member.q queue remains constant per definition (unless your lab adds further contributions).
</small>
