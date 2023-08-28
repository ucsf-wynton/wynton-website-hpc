# Migration from Centos 7 Linux to Rocky 8 Linux

Wynton currently runs on CentOS 7 Linux.

CentOS 7 will be reaching end of life June 30, 2024. 

Both to keep up with Linux security patches and to enable more modern software packages, the Wynton HPC Cluster will be moving all interactive and compute nodes to the "Rocky 8" Linux Distribution during a scheduled downtime: October 30, 2023.

However, because Rocky 8 is a different distribution and contains many updated packages, many things which currently work on Wynton are expected to need to be changed to work on Rocky 8.

To get ahead of the upgrade, we have installed Rocky 8 on a few interactive and compute nodes to enable you to test and to update your jobs and self-compiled software and scripts so they work with Rocky 8.

dev nodes:
- non-PHI: `devr8`
- PHI: `pdevr8`

GPU dev nodes:
- non-PHI: `gpudevr8`
- PHI: `pgpudevr8`

Jobs can be submitted to the Rocky 8 compute nodes by using `#$ -l rocky8=true` SGE job resource limitation in the job submission script.

Note, at this time there are only 6 available Rocky 8 compute nodes in the cluster, so *please do not send large arrays to the Rocky 8 nodes*.

Notes:

- It is expected that many of the Wynton and CBI modules may be broken when run in Rocky 8.

- If you run across one that doesn't function as you expect, please email us the details at: support@wynton.ucsf.edu

- Software Collections are organized differently in Rocky 8, only the gcc-toolset Software Collections are available. Python and Ruby versions are no longer included in the Software Collections.

- The default system Python on Rocky 8 is now Python-3.6 and must be called using: `python3` (which is the version located at `/usr/bin/python3`) and not just `python`.
- Python-2.7 is still available as `python2`, but is deprecated. We recommend any jobs/scripts/programs be updated to use `python3`. Python 2 EOL was January 1, 2020.

As noted above, please provide any feedback to: support@wynton.ucsf.edu

If you prefer to communicate via Slack, we have also created a #rocky8 channel in the UCSF Wynton Slack instance for Rocky 8 specific tips and troubleshooting.



See Also:
- [Rocky Linux](https://rockylinux.org/)
- [Red Hat: What to know about CentOS Linux EOL](https://www.redhat.com/en/topics/linux/centos-linux-eol)
