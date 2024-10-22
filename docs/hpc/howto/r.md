# Work with R

{% assign linux_distro = "rocky8" %}

{% assign r_basename = "R-4.4.0-gcc13" %}

{% assign r_libs_user = "4.4-CBI-gcc13" %}

{% assign r_path = site.path.cbi_software | append: "/_" | append: linux_distro | append: "/" | append: r_basename %}

{% assign r_libs_user_path = site.user.home | append: "R/" | append: linux_distro | append: "-x86_64-pc-linux-gnu-library" | append: "/" | append: r_libs_user %}

<!--
```
r_path='{{ r_path }}'
r_libs_user_path='{{ r_libs_user_path }}'
```
-->

R is available on {{ site.cluster.name }} via a [contributed environment module].


## Accessing R

To load the R module available in the [CBI software stack], do:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI
[alice@{{ site.devel.name }} ~]$ module load r
```

which provides access to a modern version of R:

<!-- code-block label="r-one-plus-two" -->
```r
[alice@{{ site.devel.name }} ~]$ R 

R version 4.4.0 (2024-04-24) -- "Puppy Cup"
Copyright (C) 2024 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> 1+2
[1] 3
> quit()
Save workspace image? [y/n/c]: n
[alice@{{ site.devel.name }} ~]$ 
```

To use an older version of R, specify the version when you load R,
e.g.

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI
[alice@{{ site.devel.name }} ~]$ module load r/3.5.3
```



## Using R in job scripts

In order to run R in jobs, the above R environment module needs to be
loaded just as when you run it interactively on a development node.
For example, to run the `my_script.R` script, the job script should at
a minimum contain:

```sh
#! /usr/bin/env bash
#$ -S /bin/bash
#$ -cwd

module load CBI
module load r
Rscript my_script.R
```


## Installing R packages

<div class="alert alert-info" role="alert" markdown="1">

R 4.4.0 was release on 2024-04-24 and Bioconductor 3.19 on 2024-05-01.
As of 2024-05-03, there were 20,684 packages on CRAN and 3,578
packages on Bioconductor 3.19.

On 2024-05-03, we confirmed that 20,614 CRAN packages and 3,560
Bioconductor 3.19 packages install out of the box when following the
below instructions. The packages that failed to install do so either
because they depend on a system library that is not available on the
cluster, or because they have bugs preventing them from being
installed out of the box. If you need to install any of those, please
reach out on one of the support channels.

<!--
Out of 3,568 Bioconductor 3.18 packages, 3,562 installed out of the
box in R 4.4.0 (sic!) when following the below instructions.
-->

</div>


The majority of R packages are available from [CRAN] (Comprehensive R
Archive Network).  Another dominant repository of R packages is
[Bioconductor], which provides R packages with a focus on
bioinformatics.  Packages available from Bioconductor are not
available on CRAN, and vice versa.  At times, you will find online
instructions for installing R packages hosted on, for instance, GitHub
and GitLab.  Before installing an R package from such sources, we
highly recommend to install the package from CRAN or Bioconductor, if
it is available there, because packages hosted on the latter are
stable releases and often better tested.

Before continuing, it is useful to understand where R packages looks
for locally installed R packages.  There are three locations that R
considers:

1. Your personal R package library. This is located under `~/R/`,
   e.g. `~/R/{{ linux_distro }}-x86_64-pc-linux-gnu-library/{{
   r_libs_user }}/`

2. (optional) A site-wide R package library (not used on {{
   site.cluster.name }})

3. The system-wide R package library part of the R installed, e.g. `{{
   r_path }}/lib64/R/library`

For instance, when we try to load an R package:

```r
> library(datasets)
```

R will search the above folders in order for R package 'datasets'.
When you start you fresh, the only R packages available to you are the
ones installed in folder (3) - the system-wide library.  The
'datasets' package comes with the R installation, so with a fresh
setup, it will be loaded from the third location.  As we will see
below, when you install your own packages, they will all be installed
into folder (1) - your personal library.  The first time your run R,
the personal library folder does not exists, so R will ask you whether
or not you want to create that folder.  If asked, you should always
accept (answer 'Yes').  If you had already created this folder, R will
install into this folder without asking.

Finally, R undergoes a _main_ update once a year (in April).  For
example, R 4.4.0 was release in April 2024.  The next main release
will be R 4.5.0 a year later.  Whenever the `y` component in R `x.y.z`
version is increased, you will start out with an empty personal
package folder specific for R `x.y` (regardless of `z`).  This means
that you will have to re-install all R packages you had installed
during the year before the new main release came out.  Yes, this can
be tedious and can take quite some time but it will improve stability
and yet allow the R developers to keep improving R.  Of course, you
can still keep using an older version of R and all the packages you
have installed for that version - they will not be removed.


### Installing an R package from CRAN

Packages available on CRAN can be installed using the
`install.packages()` function in R.  The default behavior of R is to
always ask you which one of the many CRAN mirrors you want to install
from (their content is all identical).  To avoid this question, tell R
to always use the first one:

```r
> chooseCRANmirror(ind = 1)
>
```

Now, in order to install, for instance, the **[zoo]** package
available on CRAN, call:

```r
> install.packages("zoo")
Warning in install.packages("zoo") :
  'lib = "{{ r_path }}/lib64/R/library"' is not writable
Would you like to use a personal library instead? (yes/No/cancel)
```

We notice two things.  First there is a warning mentioning that a
"lib" folder was "not writable".  This is because your personal
library folder did not yet exists and R tried to install to location
(3) but failed (because you do not have write permission there).  This
is where R decided to ask you whether or not you want to install to a
personal library.  Answer 'yes':

```r
Would you like to use a personal library instead? (yes/No/cancel) yes
Would you like to create a personal library
'~/R/{{ linux_distro }}-x86_64-pc-linux-gnu-library/{{ r_libs_user }}'
to install packages into? (yes/No/cancel)
```

R wants to make sure you are aware what is done, so it will,
conservatively, also ask if you accept the default location.  Answer
'yes' for this folder to be created.  After this, the current and all
future package installation in R will be installed into this folder
without further questions asked.  In this example, we will get:

<!-- code-block label="install-zoo" -->
```r
Would you like to create a personal library
'~/R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}'
to install packages into? (yes/No/cancel) yes
trying URL 'https://cloud.r-project.org/src/contrib/zoo_1.8-12.tar.gz'
Content type 'application/x-gzip' length 782344 bytes (764 KB)
==================================================
downloaded 764 KB

* installing *source* package ‘zoo’ ...
** package ‘zoo’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
using C compiler: ‘gcc (GCC) 13.1.1 20230614 (Red Hat 13.1.1-4)’
gcc -I"{{ r_path }}/lib/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c coredata.c -o coredata.o
gcc -I"{{ r_path }}/lib/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c init.c -o init.o
gcc -I"{{ r_path }}/lib/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c lag.c -o lag.o
gcc -shared -L{{ r_path }}/lib/R/lib -L/usr/local/lib -o zoo.so coredata.o init.o lag.o -L{{ r_path }}/lib/R/lib -lR
installing to {{ r_libs_user_path }}/00LOCK-zoo/00new/zoo/libs
** R
** demo
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** checking absolute paths in shared objects and dynamic libraries
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (zoo)

The downloaded source packages are in
        '/scratch/alice/RtmpVm3e6t/downloaded_packages'
>
```

If there is no mentioning of an "error" (a "warning" is ok in R but
never an "error"), then the package was successfully installed.  If
you see `* DONE (zoo)` at the end, it means that the package was
successfully installed.  As with any other package in R, you can also
verify that it is indeed installed by loading it, i.e.

```r
> library(zoo)

Attaching package: 'zoo'

The following objects are masked from 'package:base':

    as.Date, as.Date.numeric

>
```


#### Updating CRAN packages

If a new version of one or more CRAN packages is released, they can be
installed by calling:

```r
> chooseCRANmirror(ind = 1)
> update.packages()
...
```



### Installing an R package from Bioconductor

Per Bioconductor's best practices, R packages from Bioconductor should
be installed using `BiocManager::install()`.  This is to guarantee
maximum compatibility between all Bioconductor packages.


#### Installing BiocManager (once)

If you already have **[BiocManager]** installed, you can skip this
section.  When you start out fresh, the package **BiocManager** is not
installed meaning that calling `BiocManager::install()` will fail.  We
need to start by installing it from CRAN (sic!);

<!-- code-block label="install-BiocManager" -->
```r
> install.packages("BiocManager")
Installing package into '{{ r_libs_user_path }}'
(as 'lib' is unspecified)
trying URL 'https://cloud.r-project.org/src/contrib/BiocManager_1.30.22.tar.gz'
Content type 'application/x-gzip' length 582690 bytes (569 KB)
==================================================
downloaded 569 KB

* installing *source* package ‘BiocManager’ ...
** package ‘BiocManager’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (BiocManager)

The downloaded source packages are in
        '/scratch/alice/RtmpSRgaB4/downloaded_packages'
> 
```

_Comment_: If this is the very first R package you installed, see
above CRAN instructions for setting a default CRAN mirror and creating
a personal library folder.


#### Installing a Bioconductor package

With **BiocManager** installed, we can now install any Bioconductor package.  For instance, to install **[limma]**, and all of its dependencies, call:

<!-- code-block label="install-limma" -->
```r
> BiocManager::install("limma")
Bioconductor version 3.19 (BiocManager 1.30.22), R 4.4.0 (2024-04-24)
Installing package(s) 'BiocVersion'
trying URL 'https://bioconductor.org/packages/3.19/bioc/src/contrib/BiocVersion_3.19.1.tar.gz'                                                               
Content type 'application/x-gzip' length 987 bytes
==================================================
downloaded 987 bytes

* installing *source* package ‘limma’ ...
** using staged installation
** libs
using C compiler: ‘gcc (GCC) 10.3.1 20210422 (Red Hat 10.3.1-1)’
gcc -I"{{ r_path }}/lib64/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c init.c -o init.o
gcc -I"{{ r_path }}/lib64/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c normexp.c -o normexp.o
gcc -I"{{ r_path }}/lib64/R/include" -DNDEBUG   -I/usr/local/include    -fpic  -g -O2  -c weighted_lowess.c -o weighted_lowess.o
gcc -shared -L{{ r_path }}/lib64/R/lib -L/usr/local/lib64 -o limma.so init.o normexp.o weighted_lowess.o -L{{ r_path }}/lib64/R/lib -lR          
installing to {{ r_libs_user_path }}/00LOCK-limma/00new/limma/libs
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** checking absolute paths in shared objects and dynamic libraries
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (limma)

The downloaded source packages are in
        ‘/scratch/alice/Rtmp4dISqw/downloaded_packages’
>
```

There were no "error" messages, so the installation was successful.
To verify that it worked, we can load the package in R as:

```r
> library(limma)
>
```


#### Updating Bioconductor packages

To install Bioconductor updates, call `BiocManager::install()` without arguments:

```r
> BiocManager::install()
```

_Comment_: This will actually also update any CRAN packages.



## Appendix

### Parallel processing in R

If you have an R scripts, and it involves setting up a number of
parallel workers in R, do _not_ use `ncores <- detectCores()` of the
**parallel** package because it will result in your job hijacking
_all_ cores on the compute node regardless of how many cores the
scheduler has given you.  Taking up all CPU resources without
permission is really bad practice and a common cause for problems.  A
much better solution is to use `availableCores()` that is available in
the **[parallelly]** package, e.g. as `ncores <-
parallelly::availableCores()`.  This function is backward compatible
with `detectCores()` while respecting what the scheduler has allocated
for your job.


### Packages MASS and Matrix

As of 2024-04-26, the "recommended" **[MASS]** and **[Matrix]**
packages require R (>= 4.4.0). If you run an older version of R, you
can install older versions of them that are compatible with R (<
4.4.0) using:

```r
> install.packages("https://cran.r-project.org/src/contrib/Archive/MASS/MASS_7.3-60.0.1.tar.gz", type = "source")

> install.packages("https://cran.r-project.org/src/contrib/Archive/Matrix/Matrix_1.6-5.tar.gz", type = "source")
```


### Packages relying on MPI

Some R packages rely on the Message Passing Interface (MPI),
e.g. **Rmpi**, **pbdMPI** and **bigGP**.  To use these, but also to
install them we need to load the built-in `mpi` module;

<!-- code-block label="r-openmpi" -->
```sh
[alice@{{ site.devel.name }} ~]$ module load mpi/openmpi-x86_64
[alice@{{ site.devel.name }} ~]$ module list

Currently Loaded Modules:
  1) CBI   2) scl-gcc-toolset/13   3) r/4.4.0   4) mpi/openmpi-x86_64

 

```

_Importantly_, make sure to specify the exact version of the `mpi`
module as well so that your code will keep working also when a newer
version becomes the new default.  Note that you will have to load the
same `mpi` module, and version(!), also whenever you run R code that
requires these MPI-dependent R packages.

In addition to making OpenMPI available by loading the `mpi` module,
several MPI-based R packages requires additional special care in order
to install.  Below sections, show how to install them.


#### Package **Rmpi**

After loading the `mpi` module, the **[Rmpi]** package installs
out-of-the-box like other R packages.  After installing it, you can
verify that it works by running the following example commands:

```r
[alice@{{ site.devel.name }} ~]$ module load CBI r
[alice@{{ site.devel.name }} ~]$ module load mpi/openmpi-x86_64
[alice@{{ site.devel.name }} ~]$ R
...
> library(Rmpi)
[1684426121.677063] [c4-dev3:23125:0]            sys.c:618  UCX  ERROR shmget(size=2097152 flags=0xfb0) for mm_recv_desc failed: Operation not permitted, please check shared memory limits by 'ipcs -l'

> mpi.spawn.Rslaves()              ## launch one or more MPI parallel workers
        1 slaves are spawned successfully. 0 failed.
[1684426140.976380] [c4-dev3:23125:0]            sys.c:618  UCX  ERROR shmget(size=2097152 flags=0xb80) for ucp_am_bufs failed: Operation not permitted, please check shared memory limits by 'ipcs -l'
master (rank 0, comm 1) of size 2 is running on: {{ site.devel.name}} 
slave1 (rank 1, comm 1) of size 2 is running on: {{ site.devel.name}}

> mpi.remote.exec(Sys.getpid())    ## get the process ID for one of them
     out
1 189114
```


#### Packages **pbdMPI** and **bigGP**

<!--
Rocky 8: pbdMPI, bigGP still need to be installed this way /HB 2023-09-16
-->

Contrary to **Rmpi** above, packages such **[pbdMPI]** and **[bigGP]**
require more hand-holding to install.  For example, after having
loaded the `mpi` module, we can install **pbdMPI** in R as:

```r
> install.packages("pbdMPI", configure.args="--with-mpi-include=$MPI_INCLUDE --with-mpi-libpath=$MPI_LIB --with-mpi-type=OPENMPI")
Installing package into '{{ r_libs_user_path }}'
(as 'lib' is unspecified)
* installing *source* package 'pbdMPI' ...
** package 'pbdMPI' successfully unpacked and MD5 sums checked
** using staged installation
setting mpi include path from MPI_INCLUDE
checking for sed... /usr/bin/sed
checking for mpicc... mpicc
checking for ompi_info... ompi_info
checking for pkg-config... /usr/bin/pkg-config
>> TMP_FOUND = Nothing found from mpicc --show & sed nor pkg-config ...
checking for openpty in -lutil... yes
checking for main in -lpthread... yes
 
******************* Results of pbdMPI package configure *****************
 
>> MPIRUN = /usr/lib64/openmpi/bin/mpirun
>> MPIEXEC = /usr/lib64/openmpi/bin/mpiexec
>> ORTERUN = /usr/lib64/openmpi/bin/orterun
>> TMP_INC = 
>> TMP_LIB = 
>> TMP_LIBNAME = 
>> TMP_FOUND = Nothing found from mpicc --show & sed nor pkg-config ...
>> MPI_ROOT = 
>> MPITYPE = OPENMPI
>> MPI_INCLUDE_PATH = /usr/include/openmpi-x86_64
>> MPI_LIBPATH = /usr/lib64/openmpi/lib
>> MPI_LIBNAME = 
>> MPI_LIBS =  -lutil -lpthread
>> MPI_DEFS = -DMPI2
>> MPI_INCL2 = 
>> MPI_LDFLAGS = 
>> PKG_CPPFLAGS = -I/usr/include/openmpi-x86_64  -DMPI2 -DOPENMPI
>> PKG_LIBS = -L/usr/lib64/openmpi/lib -lmpi  -lutil -lpthread
>> PROF_LDFLAGS = 
>> ENABLE_LD_LIBRARY_PATH = no
 
*************************************************************************
 
configure: creating ./config.status
config.status: creating src/Makevars
configure: creating ./config.status
config.status: creating src/Makevars
config.status: creating R/zzz.r
** libs
echo "MPIRUN = /usr/lib64/openmpi/bin/mpirun" > Makeconf
echo "MPIEXEC = /usr/lib64/openmpi/bin/mpiexec" >> Makeconf
echo "ORTERUN = /usr/lib64/openmpi/bin/orterun" >> Makeconf
echo "TMP_INC = " >> Makeconf
echo "TMP_LIB = " >> Makeconf
echo "TMP_LIBNAME = " >> Makeconf
echo "TMP_FOUND = Nothing found from mpicc --show & sed nor pkg-config ..." >> Makeconf
echo "MPI_ROOT = " >> Makeconf
echo "MPITYPE = OPENMPI" >> Makeconf
echo "MPI_INCLUDE_PATH = /usr/include/openmpi-x86_64" >> Makeconf
echo "MPI_LIBPATH = /usr/lib64/openmpi/lib" >> Makeconf
echo "MPI_LIBNAME = " >> Makeconf
echo "MPI_LIBS =  -lutil -lpthread" >> Makeconf
echo "MPI_DEFS = -DMPI2" >> Makeconf
echo "MPI_INCL2 = " >> Makeconf
echo "MPI_LDFLAGS = " >> Makeconf
echo "PKG_CPPFLAGS = -I/usr/include/openmpi-x86_64  -DMPI2 -DOPENMPI" >> Makeconf
echo "PKG_LIBS = -L/usr/lib64/openmpi/lib -lmpi  -lutil -lpthread" >> Makeconf
echo "PROF_LDFLAGS = " >> Makeconf
echo "ENABLE_LD_LIBRARY_PATH = no" >> Makeconf
gcc -I"{{ r_path }}/lib64/R/include" -DNDEBUG -I/usr/include/openmpi-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c comm_errors.c -o comm_errors.o
gcc -I"{{ r_path }}/lib64/R/include" -DNDEBUG -I/usr/include/openmpi-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c comm_sort_double.c -o comm_sort_double.o
...
gcc -I"{{ r_path }}/lib64/R/include" -DNDEBUG -I/usr/include/openmpi-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c zzz.c -o zzz.o
gcc -shared -L{{ r_path }}/lib64/R/lib -L/usr/local/lib64 -o pbdMPI.so comm_errors.o comm_sort_double.o comm_sort_integer.o pkg_dl.o pkg_tools.o spmd.o spmd_allgather.o spmd_allgatherv.o spmd_allreduce.o spmd_alltoall.o spmd_alltoallv.o spmd_bcast.o spmd_communicator.o spmd_communicator_spawn.o spmd_gather.o spmd_gatherv.o spmd_info.o spmd_recv.o spmd_reduce.o spmd_scatter.o spmd_scatterv.o spmd_send.o spmd_sendrecv.o spmd_sendrecv_replace.o spmd_tool.o spmd_utility.o spmd_wait.o zzz.o -L/usr/lib64/openmpi/lib -lmpi -lutil -lpthread -L{{ r_path }}/lib64/R/lib -lR
installing via 'install.libs.R' to {{ r_libs_user_path }}/00LOCK-pbdMPI/00new/pbdMPI
** R
** demo
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
[1684426347.259086] [c4-dev3:26986:0]            sys.c:618  UCX  ERROR shmget(size=2097152 flags=0xfb0) for mm_recv_desc failed: Operation not permitted, please check shared memory limits by 'ipcs -l'
[{{ site.devel.hostname }}:227206] pml_ucx.c:208 Error: Failed to create UCP worker
** checking absolute paths in shared objects and dynamic libraries
** testing if installed package can be loaded from final location
[1684426349.593601] [c4-dev3:27017:0]            sys.c:618  UCX  ERROR shmget(size=2097152 flags=0xfb0) for mm_recv_desc failed: Operation not permitted, please check shared memory limits by 'ipcs -l'
[{{ site.devel.hostname }}:227248] pml_ucx.c:208 Error: Failed to create UCP worker
** testing if installed package keeps a record of temporary installation path
* DONE (pbdMPI)

The downloaded source packages are in
        '/scratch/{{ site.user.name }}/RtmpKNz5KF/downloaded_packages'
```

The **bigGP** installs the same way.



### Packages relying on JAGS

#### Package **rjags**

<!--
Rocky 8: rjags still requires JAGS; keep. ALSO: Troubleshoot why rjags
fails to load on Rocky 8 although the compile goes well /HB 2023-09-16
-->

If we try to install the **[rjags]** package, we'll get the following
installation error in R:

```r
> install.packages("rjags")
...
* installing *source* package 'rjags' ...
** package 'rjags' successfully unpacked and MD5 sums checked
** using staged installation
checking for pkg-config... /usr/bin/pkg-config
configure: WARNING: pkg-config file for jags 4 unavailable
configure: WARNING: Consider adding the directory containing `jags.pc`
configure: WARNING: to the PKG_CONFIG_PATH environment variable
configure: Attempting legacy configuration of rjags
checking for jags... no
configure: error: "automatic detection of JAGS failed. Please use pkg-config to locate the JAGS library. See the INSTALL file for details."
ERROR: configuration failed for package 'rjags'
* removing '{{ r_libs_user_path }}/rjags'
ERROR: dependency 'rjags' is not available for package 'infercnv'
* removing '{{ r_libs_user_path }}/infercnv'
```

The error says that the "JAGS library" is missing.  It's available via
the CBI software stack.  Load it before starting R:

```sh
$ module load CBI jags
```

and you'll find that `install.packages("rjags")` will complete
successfully.

Importantly, you need to load the `jags` CBI module any time you run R
where the **rjags** R package needs to be loaded.


### Packages relying on JQ

#### Package **jqr**

If we try to install the **[jqr]** package, it fails to compile;

```r
> install.packages("jqr")
...
* installing *source* package ‘jqr’ ...
** package ‘jqr’ successfully unpacked and MD5 sums checked
** using staged installation
Using PKG_CFLAGS=
Using PKG_LIBS=-ljq
--------------------------- [ANTICONF] --------------------------------
Configuration failed because libjq was not found. Try installing:
 * deb: libjq-dev (Debian, Ubuntu).
 * rpm: jq-devel (Fedora, EPEL)
 * csw: libjq_dev (Solaris)
 * brew: jq (OSX)
If  is already installed set INCLUDE_DIR and LIB_DIR manually via:
R CMD INSTALL --configure-vars='INCLUDE_DIR=... LIB_DIR=...'
-------------------------- [ERROR MESSAGE] ---------------------------
<stdin>:1:10: fatal error: jq.h: No such file or directory
compilation terminated.
--------------------------------------------------------------------
ERROR: configuration failed for package ‘jqr’
```

To fix this, load the `jq` module from the CBI stack before launching R, i.e.

```r
$ module load CBI r
$ module load CBI jq
$ R
```

after this, the **jqr** package will install out of the box.

Importantly, you need to load the `jq` CBI module any time you run R
where the **jqr** R package needs to be loaded.



### Packages requiring extra care

#### Package **udunits2**

<!--
Rocky 8: udunits2 still requires special care; keep as-is /HB 2023-09-16
-->

The **[udunits2]** package does not install out of the box.  It seems
to be due to a problem with the package itself, and the suggested
instructions that the package gives on setting environment variable
`UDUNITS2_INCLUDE` do not work.  A workaround to install the package
is to do:

```r
install.packages("udunits2", configure.args="--with-udunits2-include=/usr/include/udunits2")
```


[CRAN]: https://cran.r-project.org/
[Bioconductor]: https://bioconductor.org/
[bigGP]: https://cran.r-project.org/package=bigGP
[BiocManager]: https://cran.r-project.org/package=BiocManager
[parallelly]: https://cran.r-project.org/package=parallelly
[jqr]: https://cran.r-project.org/package=jqr
[MASS]: https://cran.r-project.org/package=MASS
[Matrix]: https://cran.r-project.org/package=Matrix
[pbdMPI]: https://cran.r-project.org/package=pbdMPI
[pbdPROF]: https://cran.r-project.org/package=pbdPROF
[rjags]: https://cran.r-project.org/package=rjags
[Rmpi]: https://cran.r-project.org/package=Rmpi
[sf]: https://cran.r-project.org/package=sf
[tfevents]: https://cran.r-project.org/package=tfevents
[udunits2]: https://cran.r-project.org/package=udunits2
[zoo]: https://cran.r-project.org/package=zoo
[limma]: https://bioconductor.org/packages/limma/
[contributed environment module]: {{ '/hpc/software/software-repositories.html' | relative_url }}
[CBI software stack]: {{ '/hpc/software/software-repositories.html' | relative_url }}
