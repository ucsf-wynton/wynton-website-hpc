{% assign current_date = "now" | date: "%s" | plus: 0 %}
{% assign target_date = "2026-01-30" | date: "%s" | plus: 0 %}
{% assign secs = target_date | minus: current_date %}
{% assign days = secs | divided_by: 86400 %}

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="
1">

<strong>Count down: {{ days }} days remaining -
Protected (P3 and P4) data and accounts will be decommissioned by
2026-01-30.</strong>
P4 data is forbidden on the system since 2025-07-08. Protected
accounts are no longer commissioned as of 2025-12-01.

</div>
