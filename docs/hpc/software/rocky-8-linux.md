# Migration from Centos 7 Linux to Rocky 8 Linux

Wynton currently runs on CentOS 7 Linux.

CentOS 7 will be reaching end of life June 30, 2024. 

Both to keep up with Linux security patches and to enable more modern software packages, the Wynton HPC Cluster will be moving all interactive and compute nodes to the "Rocky 8" Linux Distribution in the fall of 2023 (exact date To Be Determined).

However, because Rocky 8 is a different distribution and contains many updated packages, many things which currently work on Wynton will are expected to need to be changed to work on Rocky 8.

To get ahead of the upgrade, we have installed Rocky 8 on a few interactive and compute nodes to enable you to test and to update your jobs and self-compiled software and scripts so they work with Rocky 8.

```
Dev Node: devr8
PHI Dev Node: pdevr8
```

Jobs can be submitted to the Rocky 8 compute nodes by using `#$ -l rocky8=true` SGE job resource limitation in the job submission script.

Note, at this time there are only 6 available Rocky 8 compute nodes in the cluster, so *please do not send large arrays to the Rocky 8 nodes*.

In addition, there is still some work to be done on getting the interactive GPU nodes and GPU compute nodes set up in the cluster.

Notes:

- It is expected that many of the Wynton and CBI modules may be broken when run in Rocky 8.

- If you run across one that doesn't function as you expect, please email us the details at: support@wynton.ucsf.edu

- Software Collections are organized differently in Rocky 8, only the gcc-toolset Software Collections are available. Python and Ruby versions are no longer included in the Software Collections.

- The default system Python on Rocky 8 is now Python-3.6.8 and must be called using: `/usr/bin/python3`.  Python-2.7.18 is still available as `python2`, but is deprecated. We recommend any jobs/scripts/programs be updated to use python3.

As noted above, please provide any feedback to: support@wynton.ucsf.edu

If you prefer to communicate via Slack, we have also created a #rocky8 channel in the UCSF Wynton Slack instance for Rocky 8 specific tips and troubleshooting.



See Also:
- [Rocky Linux](https://rockylinux.org/)
- [Red Hat: What to know about CentOS Linux EOL](https://www.redhat.com/en/topics/linux/centos-linux-eol)
