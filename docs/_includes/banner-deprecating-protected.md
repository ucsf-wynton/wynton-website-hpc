{% assign deadline = site.data.specs.protected_eol %}

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
  <p>
    ⚠️ <strong>Countdown: <span id="live-countdown">--</span> hours remaining</strong> 
    - Protected (P3 and P4) data and accounts will be decommissioned at {{ deadline }} (noon). 
    After this date, only Wynton Regular (P1-P2) accounts can keep using the cluster. 
    Protected users can no longer submit jobs as of 2026-01-29 01:00. 
    P4 data is forbidden on the system since 2025-07-08.
  </p>
</div>

<script>
(function() {
    const deadlineStr = "{{ deadline }}".replace(/-/g, "/"); // Formatting for cross-browser compatibility
    const deadlineTime = new Date(deadlineStr).getTime();
    const bufferMs = 1800 * 1000; // 30-min offset

    function updateCountdown() {
        const now = new Date().getTime();
        const distance = deadlineTime - now - bufferMs;
        const displayElement = document.getElementById('live-countdown');

        if (distance <= 0) {
            displayElement.innerHTML = "0";
            return;
        }

        // Total hours remaining
        const totalHours = Math.floor(distance / (1000 * 60 * 60));
        
        displayElement.innerHTML = totalHours;
    }

    // Update every 60 second
    setInterval(updateCountdown, 60*1000);
    updateCountdown();
})();
</script>
