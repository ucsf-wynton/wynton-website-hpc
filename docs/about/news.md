# News

2020-08-21: Deployed four BeeGFS storage bricks for the group storage `/wynton/group` to 5.6 PB (was 3.8 PB).  Groups who purchased storage have had their new group quotas updated.

2020-08-21: Increased global `/wynton/scratch` to 615 TiB (was 492 TiB).

2020-08-21: Prefix qb3- has been dropped from the development node names, which are now named dev1, dev2, dev3, and gpudev1.

2020-05-22: Added 2,016 cores (+27%) via 48 standard nodes (36 cores and 384 GiB of RAM), 4 high-memory nodes (36 cores and 756 GiB of RAM), and 4 huge-memory nodes (36 cores and 1.5 TiB of RAM).

2020-04-14: Progress until the next round of storage purchase can be found on <a href="{{ '/about/pricing-storage.html' | relative_url }}">About -> Storage Pricing</a>.

2020-04-03: Added support for <a href="{{ '/transfers/globus.html' | relative_url }}">file transfers via the Globus service</a>.

2020-02-26: Website moved to <https://wynton.ucsf.edu/hpc/>.

2020-02-05: The QB3-legacy NetApp storage (`/netapp/`), deprecated with a deadline on December 2019, crashed on 2020-02-05 and was declared non-recoverable without further resource/funding.

2019-12-13: Status page now include <a href="{{ '/status/index.html' | relative_url }}">GPU queue metrics</a>.

2019-11-12: Added support for <a href="{{ '/scheduler/email-notifications.html' | relative_url }}">email notifications</a> when a job starts running or ends.

2019-09-20: New <a href="{{ '/scheduler/queues.html' | relative_url }}">GPU policy</a> in place. All GPU nodes, communal and contributed, are now available to all users. Run time is two weeks, unless for jobs running on a contributed nodes that was not contributed by you in which case the run time is limited to 2 hours.

2019-09-13: Added another three <a href="{{ '/about/specs.html' | relative_url }}">communal GPU nodes with a total of 12 GPUs</a>.

2019-09-12 Added a second <a href="{{ '/about/specs.html' | relative_url }}">data transfer node</a>.

2019-08-15 Legacy NetApp storage locations `/scrapp` and `/scrapp2` used for global scratch have been removed - use `/wynton/scratch` instead.

2019-07-27 Legacy NetApp storage locations `/scrapp` and `/scrapp2` used for global scratch are now deprecated - use `/wynton/scratch` instead.  The deprecated mounts will become read-only on 2019-08-01 and removed on 2019-08-09.

2019-06-13: <a href="{{ '/software/software-repositories.html' | relative_url }}">Contributed Software Repositories</a> are now available and documented.

2019-04-30: <a href="{{ '/about/shares.html' | relative_url }}">Contributing Member Shares</a> are now explained and listed online.

2019-04-15: Added a dedicated GPU development node (after having been in beta testing for several months).

2019-04-12: Added another two communal GPU nodes available to all users.  There are now four communal GPU nodes with a total of 12 GPUs.

2019-04-12: Migrated another <a href="{{ '/about/specs.html' | relative_url }}">24 nodes (396 cores)</a> from QB3 to {{ site.cluster.name }}.

2019-04-09: Added the first two communal GPU nodes available to all users.

2019-03-21: To decrease the number of stray shells, any shell session that has been idle for more than eight hours will timeout and exit automatically.

2019-03-17: The majority (136 nodes; 3680 cores) of the QB3 nodes has now been migrated to {{ site.cluster.name }}.

2019-03-15: Migrated another <a href="{{ '/about/specs.html' | relative_url }}">8 nodes (224 cores)</a> from QB3 to {{ site.cluster.name }}.

2019-03-12: Migrated another <a href="{{ '/about/specs.html' | relative_url }}">19 nodes (532 cores)</a> from QB3 to {{ site.cluster.name }}.

2019-03-08: Migrated another <a href="{{ '/about/specs.html' | relative_url }}">10 nodes (264 cores)</a> from QB3 to {{ site.cluster.name }}.

2019-03-07: Migrated another <a href="{{ '/about/specs.html' | relative_url }}">11 nodes (292 cores)</a> from QB3 to {{ site.cluster.name }}.

2019-03-06: Migrated another <a href="{{ '/about/specs.html' | relative_url }}">15 nodes (392 cores)</a> from QB3 to {{ site.cluster.name }}.

2019-03-05: Migrated another <a href="{{ '/about/specs.html' | relative_url }}">15 nodes (392 cores)</a> from QB3 to {{ site.cluster.name }}.

2019-03-01: Migrated <a href="{{ '/about/specs.html' | relative_url }}">48 nodes (1344 cores)</a> from QB3 to {{ site.cluster.name }}.

2019-02-14: Added <a href="{{ '/scheduler/submit-jobs.html' | relative_url }}">SGE resource `eth_speed`</a> for requesting minimum network speeds.

2019-01-31: Added two more <a href="{{ '/about/specs.html' | relative_url }}">development nodes</a>.

2019-01-18: It is now possible to <a href="{{ '/about/pricing-storage.html' | relative_url }}">purchase additional storage</a>.

2018-11-05: Nightly cleanup of <a href="{{ '/about/specs.html#scratch-storage' | relative_url }}">scratch spaces</a> now respects also when files were "added" - not just when they were last modified.  This fixes the problem where files with old timestamps were extracted from an archive just to be wiped by the next nightly cleanup.

2018-10-02: Added a <a href="{{ '/about/roadmap.html' | relative_url }}">Roadmap</a>.

2018-08-20: <a href="{{ '/about/specs.html#scratch-storage' | relative_url }}">Global scratch storage</a> on BeeGFS Parallel File System is live - validation and testing completed.

2018-08-02: Added a dedicate <a href="{{ '/about/specs.html#data-transfer-nodes' | relative_url }}">10 Gbps transfer node</a> for faster file transfers in to and out from {{ site.cluster.nickname }}.

2018-07-25: <a href="{{ '/about/specs.html#scratch-storage' | relative_url }}">BeeGFS Parallel File System/Storage</a>: Validation completed - user beta testing started.

2017-09-07: {{ site.cluster.name }} is live.


For upcoming features and improvements, please see the [Roadmap].


[Roadmap]: {{ '/about/roadmap.html' | relative_url }}
