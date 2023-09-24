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

* [Software Repositories] : Historically, many Wynton software modules
  were created to provide _newer_ versions of software than those that
  were available in CentOS 7 Linux. As Rocky 8 is a newer software
  distribution, many of those modules created with CentOS 7 Linux in
  mind now provide _older_ versions of software than packages that are
  installed in Rocky 8. Before using _any_ software modules, first
  check to see if the software is installed on the system. If the
  software is available without loading a module, use the installed
  version rather than the module.  It is expected that some of the
  software tools available via environment modules (built-in, CBI, and
  Sali) may not work or Rocky 8 due to library dependencies and other
  issues.  The few that were specific to CentOS 7, will be removed as
  they are discovered.  If you run across a module that does not work,
  please email us the details at [{{ site.cluster.email_support
  }}](mailto:{{ site.cluster.email_support }})

* [Software Collections (SCL)] : Compared to CentOS 7, Rocky 8 will
  only provide SCLs for using modern GCC development tools, e.g. C and
  C++ compilers.  These SCLs, called `gcc-toolset`, corresponds
  somewhat to the `devtoolset` SCLs that are available on CentOS 7.
  Python and Ruby SCLs will no longer be available.

* [Python] : There will no longer be a `python` command; Python 3 has
  to be called as `python3` and legacy Python 2 is available as
  `python2`. On CentOS 7, `python` corresponded to `python2`.  Note
  that Python 2 reached its EOL on 2020-01-01.

* [MPI] : OpenMPI is available via the built-in module `mpi`. On Rocky
  8, the default, and only available version is OpenMPI 4.1, which you
  get via module `mpi/openmpi-x86_64` (sic!). Note that, on CentOS 7,
  `mpi/openmpi-x86_64` provided legacy OpenMPI 1.10. On CentOS 7,
  there was also `mpi/openmpi3-x86_64` for OpenMPI 3.1.  Because Rocky
  8 and CentOS 7 have no versions of OpenMPI in common, it is likely
  that software tools that were _compiled_ with OpenMPI as a dependency
  have to be rebuilt for Rocky 8.

* Self-compiled software: If you have compiled software to run from
  your home directory, depending on how the libraries are linked, it
  may need to be recompiled to function in Rocky 8. In addition,
  **software compiled on Rocky 8 nodes may _not_ function on CentOS 7
  nodes**. If you do compile or recompile software on the Rocky 8 dev
  nodes, be sure to send jobs which include that software _only_ to
  Rocky 8 nodes using the `-l rocky8=true` flag.


## Try Rocky 8

To get ahead of the upgrade, we have installed Rocky 8 on a few
development and compute nodes to enable you to test and to update your
jobs and self-compiled software and scripts so they work with Rocky 8.

If you are a non-PHI users, please use:

 * Development nodes: `dev3` and `devr8`
 * GPU development node: `gpudevr8`
 * Compute nodes: Add `-l rocky8=true` to `qsub` or to your script

If you are a PHI users, please use:

 * Development node: `pdevr8`
 * GPU development node: `pgpudevr8`
 * Compute nodes: Add `-l rocky8=true` to `qsub` or to your script

Note, at this time (2023-08-31) there is a limited number of Rocky 8
compute nodes in the cluster, so _please do not send large arrays or
time consuming jobs to the Rocky 8 nodes_.


## Rocky 8 support and feedback

Please provide any feedback either via email to [{{
site.cluster.email_support }}](mailto:{{ site.cluster.email_support
}}) or via Slack (feel free to use the `#rocky8` channel before the
migration).


[end of life (EOL) on June 30, 2024]: https://www.redhat.com/en/topics/linux/centos-linux-eol
[Software Repositories]: software-repositories.html
[Software Collections (SCL)]: scl.html
[Python]: ../howto/python.html
[MPI]: .../scheduler/submit-jobs.html#mpi-single-host-parallel-processing--pe-mpi_onehost-slots
