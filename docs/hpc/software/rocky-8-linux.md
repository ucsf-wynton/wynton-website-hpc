# Migration to Rocky 8 Linux from CentOS 7

## Wynton will switch to Rocky 8 on October 30

{{ site.cluster.nickname }} currently runs on CentOS 7 Linux. CentOS 7
will reach the [end of life (EOL) on June 30, 2024], which means it will
receive neither regular not security updates after that date.  To keep
up with Linux security patches and to enable more modern software
packages, we will move the {{ site.cluster.name }} to the [Rocky 8
Linux](https://rockylinux.org/) distribution;

* _We will migrate all of the cluster from CentOS 7 to Rocky 8 during
    a complete downtime on **Monday October 30, 2023**_

* You can already now test your existing pipelines on our Rocky 8 test
  cluster.



## What to expect?

Rocky 8 is a modern Linux distribution that is similar and supersedes
CentOS 7. It comes with newer versions of software tools and system
libraries, which means that more software will install out of the box
without having to go an extra mile to get them installed.  We expect a
lot of things to keep working as before, but some software tools may
require you to tweak your scripts and to re-install for instance R and
Python packages.

Here are some of the hurdles you may run into:

* [Software Repositories] : It is expected that some of the software
  tools available via environment modules (built-in, CBI, and Sali)
  may no longer work or Rocky 8.  The few that were specific to CentOS
  7, will no longer be available.  If you run across a module that
  does not work, please email us the details at [{{
  site.cluster.email_support }}](mailto:{{ site.cluster.email_support
  }})

* [Software Collections (SCL)] : Compared to CentOS 7, Rocky 8 will
  only provide SCLs for using modern GCC development tools, e.g. C and
  C++ compilers.  These SCLs, called `gcc-toolset`, corresponds
  somewhat to the `devtoolset` SCLs that are available on CentOS 7.
  Python and Ruby SCLs will no longer be available.

* [Python] : There will no longer be a `python` command; Python 3 has
  to be called as `python3` and legacy Python 2 is available as
  `python2`. On CentOS 7, `python` corresponded to `python2`.  Note
  that Python 2 reached its EOL on 2020-01-01.


## Try Rocky 8 already now

To get ahead of the upgrade, we have installed Rocky 8 on a few
interactive and compute nodes to enable you to test and to update your
jobs and self-compiled software and scripts so they work with Rocky 8.

If you are a non-PHI users, please use:

 * Development node: `devr8`
 * GPU development node: `gpudevr8`
 * Compute nodes: Add `-l rocky8=true` to `qsub` or to your script

If you are a PHI users, please use:

 * Development node: `pdevr8`
 * GPU development node: `pgpudevr8`
 * Compute nodes: Add `-l rocky8=true` to `qsub` or to your script

Note, at this time (2023-08-31) there are only six available Rocky 8
compute nodes in the cluster, so _please do not send large arrays to
the Rocky 8 nodes_.


## Rocky 8 support and feedback

Please provide any feedback either via email to [{{
site.cluster.email_support }}](mailto:{{ site.cluster.email_support
}}) or via Slack (feel free to use the `#rocky8` channel before the
migration).


[end of life (EOL) on June 30, 2024]: https://www.redhat.com/en/topics/linux/centos-linux-eol
[Software Repositories]: software-repositories.html
[Software Collections (SCL)]: scl.html
[Python]: ../howto/python.html
