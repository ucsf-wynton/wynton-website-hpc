{% assign github_server_offset = -32400 %}
{% assign now = "now" | date: "%s" | plus: github_server_offset %}
{% assign deadline = site.data.specs.protected_eol | date: "%s" %}
{% assign secs = deadline | minus: now | minus: 1800 %}
{% assign hours = secs | divided_by: 3600 %}

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="
1">

⚠️ <strong>Count down: {{ hours }} hours remaining - Protected (P3 and P4) data and accounts will be decommissioned at {{ site.data.specs.protected_eol }} (noon).</strong> After this date, it is Wynton Regular (P1-P2) accounts that can keep using the cluster. Protected users can no longer submit jobs as of 2026-01-29 01:00. P4 data is forbidden on the system since 2025-07-08.

</div>
