# Wynton runs Rocky 8 Linux as of November 2023

_Last updated: 2023-11-11_

{{ site.cluster.nickname }} now runs [Rocky 8] Linux.  Previously, we
were running CentOS 7 Linux, which will reach the [end of life (EOL)
on June 30, 2024].


## What to expect?

Rocky 8 is a modern Linux distribution that is similar and supersedes
CentOS 7. It comes with newer versions of software tools and system
libraries, which means that more software will install out of the box
without having to go an extra mile to get them installed.  We expect a
lot of things to keep working as before, but some software tools may
require you to tweak your scripts and to re-install for instance R and
Python packages.

Here are some of the hurdles you may run into:

* [Software Repositories] : Not all, but the majority of the existing
  built-in, CBI, and Sali environment modules work also on Rocky 8.  A
  small number of modules specific to CentOS 7 have been removed from
  Rocky 8.  Many of the modules are no longer necessary to use on
  Rocky 8, because they provided software and libraries that were
  otherwise outdated on CentOS 7.  In contrast, Rocky 8 comes with
  newer versions making the need for loading newer versions via
  modules less necessary - when in doubt, try first without loading
  the module.

* [Software Collections (SCL)] : Compared to CentOS 7, Rocky 8
  provides only SCLs for using modern GCC development tools, e.g. C
  and C++ compilers.  These SCLs, called `gcc-toolset`, corresponds
  somewhat to the `devtoolset` SCLs that are available on CentOS 7.
  The built-in GCC version is now 8.5.0 (2021-05-14), whereas on
  CentOS 7 it was 4.8.5 (2015-06-23).  Python and Ruby SCLs are no
  longer available.

* [Python] : There is no longer a `python` command; Python 3 has to be
  called as `python3` and legacy Python 2 is available as
  `python2`. On CentOS 7, `python` corresponded to `python2`.  Python
  3.6 is available via `python3.6`, Python 3.8 via `python3.8`, and
  Python 3.11 via `python3.11`.
  - If you get errors like `/opt/rh/rh-python38/root/usr/bin/python3:
    bad interpreter: No such file or directory` when you run a Python
    based software, then you need to reinstall that software tool.

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
  may need to be recompiled to function in Rocky 8.


[Rocky 8]: https://rockylinux.org/
[end of life (EOL) on June 30, 2024]: https://www.redhat.com/en/topics/linux/centos-linux-eol
[Software Repositories]: software-repositories.html
[Software Collections (SCL)]: scl.html
[Python]: ../howto/python.html
[MPI]: .../scheduler/submit-jobs.html#mpi-single-host-parallel-processing--pe-mpi_onehost-slots
