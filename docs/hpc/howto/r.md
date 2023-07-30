# Work with R

{% assign r_basename = "R-4.3.1-gcc10" %}

{% assign r_libs_user = "4.3-CBI-gcc10" %}

R is available on {{ site.cluster.name }} via a [contributed environment module]({{ '/software/software-repositories.html' | relative_url }}).


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

R version 4.3.1 (2023-06-16) -- "Beagle Scouts"
Copyright (C) 2023 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

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

To use an older version of R, specify the version when you load R, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI
[alice@{{ site.devel.name }} ~]$ module load r/3.5.3
```



## Using R in job scripts

In order to run R in jobs, the above R environment module needs to be loaded just as when you run it interactively on a development node.  For example, to run the `my_script.R` script, the job script should at a minimum contain:

```sh
#! /usr/bin/env bash

module load CBI
module load r
Rscript my_script.R
```


## Installing R packages

The majority of R packages are available from [CRAN] (Comprehensive R Archive Network).  Another dominant repository of R packages is [Bioconductor], which provides R packages with a focus on bioinformatics.  Packages available from Bioconductor are not available on CRAN, and vice versa.  At times, you will find online instructions for installing R packages hosted on, for instance, GitHub and GitLab.  Before installing an R package from such sources, we highly recommend to install the package from CRAN or Bioconductor, if it is available there, because packages hosted on the latter are stable releases and often better tested.

Before continuing, it is useful to understand where R packages looks for locally installed R packages.  There are three locations that R considers:

1. Your personal R package library. This is located under `~/R/`, e.g. `~/R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}/`

2. (optional) A site-wide R package library (not used on {{ site.cluster.name }})

3. The system-wide R package library part of the R installed, e.g. `{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/library`



For instance, when we try to load an R package:

```r
> library(datasets)
```

R will search the above folders in order for R package 'datasets'.
When you start you fresh, the only R packages available to you are the ones installed in folder (3) - the system-wide library.  The 'datasets' package comes with the R installation, so with a fresh setup, it will be loaded from the third location.
As we will see below, when you install your own packages, they will all be installed into folder (1) - your personal library.  The first time your run R, the personal library folder does not exists, so R will ask you whether or not you want to create that folder.  If asked, you should always accept (answer 'Yes').  If you had already created this folder, R will install into this folder without asking.

Finally, R undergoes a _main_ update once a year (in April).  For example, R 4.3.0 was release in April 2023.  The next main release will be R 4.4.0 in April 2024.  Whenever the `y` component in R `x.y.z` version is increased, you will start out with an empty personal package folder specific for R `x.y` (regardless of `z`).  This means that you will have to re-install all R packages you had installed during the year before the new main release came out.  Yes, this can be tedious and can take quite some time but it will improve stability and yet allow the R developers to keep improving R.  Of course, you can still keep using an older version of R and all the packages you have installed for that version - they will not be removed.


### Installing an R package from CRAN

Packages available on CRAN can be installed using the `install.packages()` function in R.  The default behavior of R is to always ask you which one of the many CRAN mirrors you want to install from (their content is all identical).  To avoid this question, tell R to always use the first one:

```r
> chooseCRANmirror(ind = 1)
>
```

Now, in order to install, for instance, the **[zoo]** package available on CRAN, call:

```r
> install.packages("zoo")
Warning in install.packages("zoo") :
  'lib = "{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/library"' is not writable
Would you like to use a personal library instead? (yes/No/cancel)
```

We notice two things.  First there is a warning mentioning that a "lib" folder was "not writable".  This is because your personal library folder did not yet exists and R tried to install to location (3) but failed (because you do not have write permission there).  This is where R decided to ask you whether or not you want to install to a personal library.  Answer 'yes':

```r
Would you like to use a personal library instead? (yes/No/cancel) yes
Would you like to create a personal library
'~/R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}'
to install packages into? (yes/No/cancel)
```

R wants to make sure you are aware what is done, so it will, conservatively, also ask if you accept the default location.  Answer 'yes' for this folder to be created.  After this, the current and all future package installation in R will be installed into this folder without further questions asked.  In this example, we will get:

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
using C compiler: ‘gcc (GCC) 10.2.1 20210130 (Red Hat 10.2.1-11)’
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c coredata.c -o coredata.o
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c init.c -o init.o
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c lag.c -o lag.o
gcc -shared -L{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/lib -L/usr/local/lib -o zoo.so coredata.o init.o lag.o -L{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/lib -lR
installing to {{ site.user.home }}R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}/00LOCK-zoo/00new/zoo/libs
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
        '/tmp/RtmpVm3e6t/downloaded_packages'
>
```

If there is no mentioning of an "error" (a "warning" is ok in R but never an "error"), then the package was successfully installed.  If you see `* DONE (zoo)` at the end, it means that the package was successfully installed.  As with any other package in R, you can also verify that it is indeed installed by loading it, i.e.

```r
> library(zoo)

Attaching package: 'zoo'

The following objects are masked from 'package:base':

    as.Date, as.Date.numeric

>
```


#### Updating CRAN packages

If a new version of one or more CRAN packages is released, they can be installed by calling:

```r
> chooseCRANmirror(ind = 1)
> update.packages()
...
```



### Installing an R package from Bioconductor

Per Bioconductor's best practices, R packages from Bioconductor should be installed using `BiocManager::install()`.  This is to guarantee maximum compatibility between all Bioconductor packages.


#### Installing BiocManager (once)

If you already have **[BiocManager]** installed, you can skip this section.  When you start out fresh, the package **BiocManager** is not installed meaning that calling `BiocManager::install()` will fail.  We need to start by installing it from CRAN (sic!);

<!-- code-block label="install-BiocManager" -->
```r
> install.packages("BiocManager")
Installing package into '{{ site.user.home }}R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}'
(as 'lib' is unspecified)
trying URL 'https://cloud.r-project.org/src/contrib/BiocManager_1.30.21.tar.gz'
Content type 'application/x-gzip' length 582625 bytes (568 KB)
==================================================
downloaded 568 KB

* installing *source* package 'BiocManager' ...
** package 'BiocManager' successfully unpacked and MD5 sums checked
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
        '/tmp/RtmpohfP1g/downloaded_packages'
> 
```

_Comment_: If this is the very first R package you installed, see above CRAN instructions for setting a default CRAN mirror and creating a personal library folder.


#### Installing a Bioconductor package

With **BiocManager** installed, we can now install any Bioconductor package.  For instance, to install **[limma]**, and all of its dependencies, call:

<!-- code-block label="install-limma" -->
```r
> BiocManager::install("limma")
Bioconductor version 3.17 (BiocManager 1.30.21), R 4.3.1 (2023-06-16)
Installing package(s) 'limma'
trying URL 'https://bioconductor.org/packages/3.17/bioc/src/contrib/limma_3.56.2.tar.gz'
Content type 'application/x-gzip' length 1515291 bytes (1.4 MB)
==================================================
downloaded 1.4 MB

* installing *source* package ‘limma’ ...
** using staged installation
** libs
using C compiler: ‘gcc (GCC) 10.2.1 20210130 (Red Hat 10.2.1-11)’
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c init.c -o init.o
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c normexp.c -o normexp.o
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c weighted_lowess.c -o weighted_lowess.o
gcc -shared -L{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/lib -L/usr/local/lib -o limma.so init.o normexp.o weighted_lowess.o -L{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/lib -lR
installing to {{ site.user.home }}R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}/00LOCK-limma/00new/limma/libs
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
        '/scratch/alice/Rtmpz9uHdz/downloaded_packages'
>
```

There were no "error" messages, so the installation was successful.  To verify that it worked, we can load the package in R as:

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

If you have an R scripts, and it involves setting up a number of parallel workers in R, do _not_ use `ncores <- detectCores()` of the **parallel** package because it will result in your job hijacking _all_ cores on the compute node regardless of how many cores the scheduler has given you.  Taking up all CPU resources without permission is really bad practice and a common cause for problems.  A much better solution is to use `availableCores()` that is available in the **[parallelly]** package, e.g. as `ncores <- parallelly::availableCores()`.  This function is backward compatible with `detectCores()` while respecting what the scheduler has allocated for your job.


### Packages relying on MPI

Several R packages that rely on the Message Passing Interface (MPI) do not install out-of-the-box like other R packages.  At a minimum, they require that the built-in `mpi` module is loaded;

<!-- code-block label="r-openmpi" -->
```sh
[alice@{{ site.devel.name }} ~]$ module load mpi/openmpi3-x86_64
[alice@{{ site.devel.name }} ~]$ module list

Currently Loaded Modules:
  1) CBI   2) scl-devtoolset/10   3) r/4.3.1   4) mpi/openmpi3-x86_64

 

```

_Importantly_, make sure to specify the exact version of the `mpi` module as well so that your code will keep working also when a newer version becomes the new default.  Note that you will have to load the same `mpi` module, and version(!), also whenever you run R code that requires these MPI-dependent R packages.

In addition to making OpenMPI available by loading the `mpi` module, several MPI-based R packages requires additional special care in order to install.  Below sections, show how to install them.


#### Package **Rmpi**

The **[Rmpi]** package does not install out-of-the-box like other R packages.  To install **Rmpi** on the cluster, we have to load the `mpi` module (see above) before starting R.  Then, to install **Rmpi**, we launch R and call the following:

<!-- code-block label="install-Rmpi" -->
```r
> install.packages("Rmpi", configure.args="--with-Rmpi-include=$MPI_INCLUDE --with-Rmpi-libpath=$MPI_LIB --with-Rmpi-type=OPENMPI")
Installing package into '{{ site.user.home }}R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}'
(as 'lib' is unspecified)
trying URL 'https://cloud.r-project.org/src/contrib/Rmpi_0.7-1.tar.gz'
Content type 'application/x-gzip' length 106286 bytes (103 KB)
==================================================
downloaded 103 KB

* installing *source* package 'Rmpi' ...
** package 'Rmpi' successfully unpacked and MD5 sums checked
** using staged installation
configure: creating ./config.status
config.status: creating src/Makevars
** libs
using C compiler: ‘gcc (GCC) 10.2.1 20210130 (Red Hat 10.2.1-11)’
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/include" -DNDEBUG -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPA
CKAGE_URL=\"\" -I/usr/include/openmpi-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c Rmpi.c -o Rmpi.o
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/include" -DNDEBUG -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPA
CKAGE_URL=\"\" -I/usr/include/openmpi-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c conversion.c -o conversion.o
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/include" -DNDEBUG -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPA
CKAGE_URL=\"\" -I/usr/include/openmpi-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c internal.c -o internal.o
gcc -shared -L{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/lib -L/usr/local/lib64 -o Rmpi.so Rmpi.o conversion.o internal.o -L/usr/lib64/openmpi/lib -lmpi -L{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/lib -lR
installing to {{ site.user.home }}R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}/00LOCK-Rmpi/00new/Rmpi/libs
** R
** demo
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
** checking absolute paths in shared objects and dynamic libraries
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (Rmpi)

The downloaded source packages are in
        '/scratch/alice/RtmpAwBn4a/downloaded_packages'
>
```


Note, you need to load the identical module and version each time you want to use the **Rmpi** package.  After installing **Rmpi**, verify that it works:

```r
[alice@{{ site.devel.name }} ~]$ module load CBI r
[alice@{{ site.devel.name }} ~]$ module load mpi/openmpi3-x86_64
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

Similarly to the **Rmpi** package above, MPI-dependent R packages such as **[pbdMPI]** and **[bigGP]** require special install instructions.  For example, after having loaded the `mpi` module, we can install **pbdMPI** in R as:

```r
> install.packages("pbdMPI", configure.args="--with-mpi-include=$MPI_INCLUDE --with-mpi-libpath=$MPI_LIB --with-mpi-type=OPENMPI")
Installing package into '{{ site.user.home }}/R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}'
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
 
>> MPIRUN = /usr/lib64/openmpi3/bin/mpirun
>> MPIEXEC = /usr/lib64/openmpi3/bin/mpiexec
>> ORTERUN = /usr/lib64/openmpi3/bin/orterun
>> TMP_INC = 
>> TMP_LIB = 
>> TMP_LIBNAME = 
>> TMP_FOUND = Nothing found from mpicc --show & sed nor pkg-config ...
>> MPI_ROOT = 
>> MPITYPE = OPENMPI
>> MPI_INCLUDE_PATH = /usr/include/openmpi3-x86_64
>> MPI_LIBPATH = /usr/lib64/openmpi3/lib
>> MPI_LIBNAME = 
>> MPI_LIBS =  -lutil -lpthread
>> MPI_DEFS = -DMPI2
>> MPI_INCL2 = 
>> MPI_LDFLAGS = 
>> PKG_CPPFLAGS = -I/usr/include/openmpi3-x86_64  -DMPI2 -DOPENMPI
>> PKG_LIBS = -L/usr/lib64/openmpi3/lib -lmpi  -lutil -lpthread
>> PROF_LDFLAGS = 
>> ENABLE_LD_LIBRARY_PATH = no
 
*************************************************************************
 
configure: creating ./config.status
config.status: creating src/Makevars
configure: creating ./config.status
config.status: creating src/Makevars
config.status: creating R/zzz.r
** libs
echo "MPIRUN = /usr/lib64/openmpi3/bin/mpirun" > Makeconf
echo "MPIEXEC = /usr/lib64/openmpi3/bin/mpiexec" >> Makeconf
echo "ORTERUN = /usr/lib64/openmpi3/bin/orterun" >> Makeconf
echo "TMP_INC = " >> Makeconf
echo "TMP_LIB = " >> Makeconf
echo "TMP_LIBNAME = " >> Makeconf
echo "TMP_FOUND = Nothing found from mpicc --show & sed nor pkg-config ..." >> Makeconf
echo "MPI_ROOT = " >> Makeconf
echo "MPITYPE = OPENMPI" >> Makeconf
echo "MPI_INCLUDE_PATH = /usr/include/openmpi3-x86_64" >> Makeconf
echo "MPI_LIBPATH = /usr/lib64/openmpi3/lib" >> Makeconf
echo "MPI_LIBNAME = " >> Makeconf
echo "MPI_LIBS =  -lutil -lpthread" >> Makeconf
echo "MPI_DEFS = -DMPI2" >> Makeconf
echo "MPI_INCL2 = " >> Makeconf
echo "MPI_LDFLAGS = " >> Makeconf
echo "PKG_CPPFLAGS = -I/usr/include/openmpi3-x86_64  -DMPI2 -DOPENMPI" >> Makeconf
echo "PKG_LIBS = -L/usr/lib64/openmpi3/lib -lmpi  -lutil -lpthread" >> Makeconf
echo "PROF_LDFLAGS = " >> Makeconf
echo "ENABLE_LD_LIBRARY_PATH = no" >> Makeconf
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/include" -DNDEBUG -I/usr/include/openmpi3-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c comm_errors.c -o comm_errors.o
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/include" -DNDEBUG -I/usr/include/openmpi3-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c comm_sort_double.c -o comm_sort_double.o
...
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/include" -DNDEBUG -I/usr/include/openmpi3-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c zzz.c -o zzz.o
gcc -shared -L{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/lib -L/usr/local/lib64 -o pbdMPI.so comm_errors.o comm_sort_double.o comm_sort_integer.o pkg_dl.o pkg_tools.o spmd.o spmd_allgather.o spmd_allgatherv.o spmd_allreduce.o spmd_alltoall.o spmd_alltoallv.o spmd_bcast.o spmd_communicator.o spmd_communicator_spawn.o spmd_gather.o spmd_gatherv.o spmd_info.o spmd_recv.o spmd_reduce.o spmd_scatter.o spmd_scatterv.o spmd_send.o spmd_sendrecv.o spmd_sendrecv_replace.o spmd_tool.o spmd_utility.o spmd_wait.o zzz.o -L/usr/lib64/openmpi3/lib -lmpi -lutil -lpthread -L{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/lib -lR
installing via 'install.libs.R' to {{ site.user.home }}/R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}/00LOCK-pbdMPI/00new/pbdMPI
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


### Packages relying on HDF5

#### Package **hdf5r**

The **[hdf5r]** package requires [hdf5 1.8.13 or newer](https://github.com/hhoeflin/hdf5r/issues/115) but the version that comes with CentOS 7/EPEL is only 1.8.12. This will result in the following installation error in R:

```r
Found hdf5 with version: 1.8.12
configure: error: The version of hdf5 installed on your system is not sufficient. Please ensure that at least version 1.8.13 is installed
ERROR: configuration failed for package 'hdf5r'
```

 To fix this, load a modern version of 'hdf5' from the [CBI software stack] before installing the package, i.e.

<!-- code-block label="r-hdf5" -->
```sh
[alice@{{ site.devel.name }} ~]$ module load CBI hdf5
[alice@{{ site.devel.name }} ~]$ module list

Currently Loaded Modules:
  1) CBI   2) scl-devtoolset/10   3) r/4.3.1   4) hdf5/1.12.2

 

```
 
Note that you also need to load the `hdf5` module every time you use the **hdf5r** package in R.

After this, the **hdf5r** package will install out of the box, i.e. by calling:

```r
> install.packages("hdf5r")
```



### Packages relying on GDAL, GEOS, PROJ, and sqlite3

There are R packages for spatial analyses that depend on external
libraries GDAL, GEOS, PROJ, and sqlite3. For example:

* **[rgdal]**  requires either (i) GDAL (< 3) & PROJ (< 6), or (ii) GDAL (>= 3) & PROJ (>= 6)
* **[rgeos]**  requires                  GEOS (>= 3.2.0)
* **[sf]**     requires GDAL (>= 2.0.1), GEOS (>= 3.4.0), PROJ (>= 4.8.0), sqlite3
* **[lwgeom]** requires                  GEOS (>= 3.5.0), PROJ (>= 4.8.0), sqlite3
* **[terra]**  requires GDAL (>= 2.2.3), GEOS (>= 3.4.0), PROJ (>= 4.9.3), sqlite3

CentOS 7/EPEL provides GDAL 1.11.4 (2016-01-25), GEOS 3.4.2
(2013-08-25), PROJ 4.8.0 (2012-03-06), and sqlite3 3.7.17
(2013-05-20). These are all too old for installing above R packages.
The solution is to load more modern versions from the CBI software
stack before installing and using such packages in R;

```sh
$ module load CBI r
$ module load CBI gdal geos proj sqlite
$ module list
Currently Loaded Modules:
  1) CBI                3) r/4.2.0     5) goes/3.9.4    7) sqlite/3.42.0
  2) scl-devtoolset/10  4) gdal/2.4.3  6) proj/4.9.3
```

After loading _all_ these dependencies, above R packages will install
out-of-the-box in R and will be compatible with each other if used at
the same time, which some of them require.

Because these R packages interact with each other, it is important to
use the _same_ versions of GDAL, GEOS, PROJ, and sqlite, when
installing and loading these R packages.  Because of this, we also
recommend to install all of the above at the same time.  You might
even choose to always have those extra CBI modules loaded at all time
when using R to make your life easier, e.g. when updating R packages
using `update.packages()`.

Here is how to install the above R packages all at once:

```r
$ module load CBI r
$ module load CBI gdal geos proj sqlite
$ R --quiet
> install.packages(c("rgdal", "rgeos", "sf", "lwgeom", "terra"))
```

After this, we can load each of them to verify everything works;

```r
> library(rgdal)
Loading required package: sp
The legacy packages maptools, rgdal, and rgeos, underpinning the sp package,
which was just loaded, will retire in October 2023.
Please refer to R-spatial evolution reports for details, especially
https://r-spatial.org/r/2023/05/15/evolution4.html.
It may be desirable to make the sf package available;
package maintainers should consider adding sf to Suggests:.
The sp package is now running under evolution status 2
     (status 2 uses the sf package in place of rgdal)
Please note that rgdal will be retired during October 2023,
plan transition to sf/stars/terra functions using GDAL and PROJ
at your earliest convenience.
See https://r-spatial.org/r/2023/05/15/evolution4.html and https://github.com/r-spatial/evolution
rgdal: version: 1.6-7, (SVN revision 1203)
Geospatial Data Abstraction Library extensions to R successfully loaded
Loaded GDAL runtime: GDAL 2.4.3, released 2019/10/28
Path to GDAL shared files: /wynton/home/cbi/shared/software/CBI/gdal-2.4.3/share/gdal
GDAL binary built with GEOS: TRUE 
Loaded PROJ runtime: Rel. 4.9.3, 15 August 2016, [PJ_VERSION: 493]
Path to PROJ shared files: (autodetected)
Linking to sp version:2.0-0
```

```r
> library(rgeos)
rgeos version: 0.6-4, (SVN revision 699)
 GEOS runtime version: 3.9.4-CAPI-1.14.4 
 Please note that rgeos will be retired during October 2023,
plan transition to sf or terra functions using GEOS at your earliest convenience.
See https://r-spatial.org/r/2023/05/15/evolution4.html for details.
 GEOS using OverlayNG
 Linking to sp version: 2.0-0 
 Polygon checking: TRUE 
```

```r
> library(sf)
Linking to GEOS 3.9.4, GDAL 2.4.3, PROJ 4.9.3; sf_use_s2() is TRUE
```

```r
> library(lwgeom)
Linking to liblwgeom 3.0.0beta1 r16016, GEOS 3.9.4, PROJ 4.9.3
```

```r
> library(terra)
terra 1.7.39
```

Note that you need to load all of those extra CBI modules whenever you
use these R packages.



### Packages relying on JAGS

#### Package **rjags**

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
* removing '{{ site.user.home }}/R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}/rjags'
ERROR: dependency 'rjags' is not available for package 'infercnv'
* removing '{{ site.user.home }}/R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}/infercnv'
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


### Packages relying on GSL

The GNU Scientific Library (GSL) is a numerical library for C and C++ that provides a wide range of mathematical routines such as random number generators, special functions and least-squares fitting. Several R packages rely on it.

#### Package **gsl**

If we try to install the **[gsl]** package, we'll get the following
compilation:

```r
> install.packages("gsl")
...
In file included from ellint.c:1:
/usr/include/gsl/gsl_sf_ellint.h:84:5: note: declared here
   84 | int gsl_sf_ellint_D_e(double phi, double k, double n, gsl_mode_t mode, gsl_sf_result * result);
      |     ^~~~~~~~~~~~~~~~~
make: *** [{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/etc/Makeconf:191: ellint.o] Error 1
ERROR: compilation failed for package ‘gsl’
...
```

This is because the GSL version that comes with the operating system
is too old.  A more modern version is available via the CBI software
stack.  Load it before starting R:

```sh
$ module load CBI gsl
```

and you'll find that `install.packages("gsl")` will complete
successfully.

Importantly, you need to load the `gsl` CBI module any time you run R
where the **gsl** R package needs to be loaded.



### Packages requiring extra care

#### Package **udunits2**

The **[udunits2]** package does not install out of the box.  It seems to be due to a problem with the package itself, and the suggested instructions that the package gives on setting environment variable `UDUNITS2_INCLUDE` do not work.  A workaround to install the package is to do:

```sh
install.packages("udunits2", configure.args="--with-udunits2-include=/usr/include/udunits2")   
```


[CRAN]: https://cran.r-project.org/
[Bioconductor]: http://bioconductor.org/
[bigGP]: https://cran.r-project.org/package=bigGP
[BiocManager]: https://cran.r-project.org/package=BiocManager
[parallelly]: https://cran.r-project.org/package=parallelly
[gsl]: https://cran.r-project.org/package=gsl
[hdf5r]: https://cran.r-project.org/package=hdf5r
[igraph]: https://cran.r-project.org/package=igraph
[lwgeom]: https://cran.r-project.org/package=lwgeom
[pbdMPI]: https://cran.r-project.org/package=pbdMPI
[pbdPROF]: https://cran.r-project.org/package=pbdPROF
[rgdal]: https://cran.r-project.org/package=rgdal
[rgeos]: https://cran.r-project.org/package=rgeos
[rjags]: https://cran.r-project.org/package=rjags
[Rmpi]: https://cran.r-project.org/package=Rmpi
[sf]: https://cran.r-project.org/package=sf
[terra]: https://cran.r-project.org/package=terra
[udunits2]: https://cran.r-project.org/package=udunits2
[zoo]: https://cran.r-project.org/package=zoo
[limma]: http://bioconductor.org/packages/limma/
[CBI software stack]: {{ '/software/software-repositories.html' | relative_url }}
