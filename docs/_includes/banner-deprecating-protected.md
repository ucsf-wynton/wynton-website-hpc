{% assign current_date = "now" | date: "%s" | plus: 0 %}
{% assign target_date = site.data.specs.protected_eol | date: "%s" | plus: 0 %}
{% assign secs = target_date | minus: current_date %}
{% assign days = secs | divided_by: 86400 %}

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="
1">

⚠️ <strong>Count down: {{ days }} days remaining - Protected (P3 and P4) data and accounts will be decommissioned by {{ site.data.specs.protected_eol }}.</strong> After this date, it is Wynton Regular (P1-P2) accounts that can keep using the cluster. <strong>Jobs submitted by Protected accounts will fail if the run-time ('h_rt') goes beyond 2026-01-29 01:00.</strong> P4 data is forbidden on the system since 2025-07-08.

</div>
