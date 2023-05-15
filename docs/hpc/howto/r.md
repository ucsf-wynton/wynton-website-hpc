# Work with R

{% assign r_basename = "R-4.2.0-gcc10" %}

{% assign r_libs_user = "4.2-CBI-gcc10" %}

R is available on {{ site.cluster.name }} via a [contributed environment module](/hpc/software/software-repositories.html).


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

R version 4.2.0 (2022-04-22) -- "Vigorous Calisthenics"
Copyright (C) 2022 The R Foundation for Statistical Computing
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
#$ -S /bin/bash
#$ -cwd          # run job in the current working directory

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

Finally, R undergoes a _main_ update once a year (in April).  For example, R 4.2.0 was release in April 2022.  The next main release will be R 4.3.0 in April 2023.  Whenever the `y` component in R `x.y.z` version is increased, you will start out with an empty personal package folder specific for R `x.y` (regardless of `z`).  This means that you will have to re-install all R packages you had installed during the year before the new main release came out.  Yes, this can be tedious and can take quite some time but it will improve stability and yet allow the R developers to keep improving R.  Of course, you can still keep using an older version of R and all the packages you have installed for that version - they will not be removed.


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
trying URL 'https://cloud.r-project.org/src/contrib/zoo_1.8-10.tar.gz'
Content type 'application/x-gzip' length 808943 bytes (789 KB)
==================================================
downloaded 789 KB

* installing *source* package 'zoo' ...
** package 'zoo' successfully unpacked and MD5 sums checked
** using staged installation
** libs
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c coredata.c -o coredata.o
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c init.c -o init.o
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c lag.c -o lag.o
gcc -shared -L{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/lib -L/usr/local/lib -o zoo.so coredata.o init.o lag.o -L{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/lib -lR
installing to {{ site.user.home }}R/x86_64-pc-linux-gnu-library/4.2-gcc10/00LOCK-zoo/00new/zoo/libs
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
trying URL 'https://cloud.r-project.org/src/contrib/BiocManager_1.30.17.tar.gz'
Content type 'application/x-gzip' length 287948 bytes (281 KB)
==================================================
downloaded 281 KB

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
Bioconductor version 3.15 (BiocManager 1.30.17), R 4.2.0 (2022-04-22)
Installing package(s) 'limma'
trying URL 'https://bioconductor.org/packages/3.15/bioc/src/contrib/limma_3.52.0.tar.gz'
Content type 'application/x-gzip' length 1513449 bytes (1.4 MB)
==================================================
downloaded 1.4 MB

* installing *source* package 'limma' ...
** using staged installation
** libs
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c init.c -o init.o
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c normexp.c -o normexp.o
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c weighted_lowess.c -o weighted_lowess.o
gcc -shared -L{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/lib -L/usr/local/lib -o limma.so init.o normexp.o weighted_lowess.o -L{{ site.path.cbi_software }}/{{ r_basename }}/lib/R/lib -lR
installing to {{ site.user.home }}R/x86_64-pc-linux-gnu-library/4.2-gcc10/00LOCK-limma/00new/limma/libs
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


### Packages requiring newer dependencies

#### The hdf5r package

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
  1) r/4.2.0   2) CBI   3) scl-devtoolset/10   4) hdf5/1.12.1

 

```
 
Note that you also need to load the `hdf5` module every time you use the **hdf5r** package in R.

After this, the **hdf5r** package will install out of the box, i.e. by calling:

```r
> install.packages("hdf5r")
```


#### The sf package

The **[sf]** package requires GDAL 2.0.1 or newer but the version that comes with CentOS 7/EPEL is only 1.11.4;

```sh
$ gdalinfo --version
GDAL 1.11.4, released 2016/01/25
```

If we try to install **sf** with the this version, we'll get the following installation error in R:

```r
configure: GDAL: 1.11.4
checking GDAL version >= 2.0.1... no
configure: error: sf is not compatible with GDAL versions below 2.0.1
ERROR: configuration failed for package 'sf'
* removing '{{ site.user.home }}/R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}/sf'
* restoring previous '{{ site.user.home }}/R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}/sf'
```

 To fix this, load a modern version of GDAL from the [CBI software stack] before installing the package, i.e.

<!-- code-block label="r-gdal" -->
```sh
[alice@{{ site.devel.name }} ~]$ module load CBI gdal
[alice@{{ site.devel.name }} ~]$ module list

Currently Loaded Modules:
  1) r/4.2.0   2) CBI   3) scl-devtoolset/10   4) gdal/2.4.4

 

```
 
After this, the **sf** package will install out of the box, i.e. by calling:

```r
> install.packages("sf")
```

Note that you also need to load the `gdal` module every time you use the **gdal** package in R.


### Packages relying on MPI

<div class="alert alert-warning" role="alert" markdown="1">
The **Rmpi** requires OpenMPI v3 (module `mpi/openmpi3-x86_64`) or
newer, when running on {{ site.cluster.nickname }}. It does _not_ work
with ancient OpenMPI v1 (module `mpi/openmpi-x86_64`).
</div>


Several R packages that rely on the Message Passing Interface (MPI) do not install out-of-the-box like other R packages.  At a minimum, they require that the built-in `mpi` module is loaded;

<!-- code-block label="r-openmpi" -->
```sh
[alice@{{ site.devel.name }} ~]$ module load mpi/openmpi3-x86_64
[alice@{{ site.devel.name }} ~]$ module list

Currently Loaded Modules:
  1) CBI   2) scl-devtoolset/10   3) r/4.2.0   4) mpi/openmpi3-x86_64

 

```

_Importantly_, make sure to specify the exact version of the `mpi` module as well so that your code will keep working also when a newer version becomes the new default.  Note that you will have to load the same `mpi` module, and version(!), also whenever you run R code that requires these MPI-dependent R packages.

In addition to making OpenMPI available by loading the `mpi` module, several MPI-based R packages requires additional special care in order to install.  Below sections, show how to install them.


#### The Rmpi package

The **[Rmpi]** package does not install out-of-the-box like other R packages.  To install **Rmpi** on the cluster, we have to load the `mpi` module (see above) before starting R.  Then, to install **Rmpi**, we launch R and call the following:

<!-- code-block label="install-Rmpi" -->
```r
> install.packages("Rmpi", configure.args="--with-Rmpi-include=$MPI_INCLUDE --with-Rmpi-libpath=$MPI_LIB --with-Rmpi-type=OPENMPI")
Installing package into '{{ site.user.home }}/R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}'
(as 'lib' is unspecified)
* installing *source* package 'Rmpi' ...
** package 'Rmpi' successfully unpacked and MD5 sums checked
** using staged installation
configure: creating ./config.status
config.status: creating src/Makevars
** libs
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/include" -DNDEBUG -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -I/usr/include/openmpi3-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c Rmpi.c -o Rmpi.o
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/include" -DNDEBUG -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -I/usr/include/openmpi3-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c conversion.c -o conversion.o
gcc -I"{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/include" -DNDEBUG -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -I/usr/include/openmpi3-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c internal.c -o internal.o
gcc -shared -L{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/lib -L/usr/local/lib64 -o Rmpi.so Rmpi.o conversion.o internal.o -L/usr/lib64/openmpi3/lib -lmpi -L{{ site.path.cbi_software }}/{{ r_basename }}/lib64/R/lib -lR
installing to {{ site.user.home }}/R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}/00LOCK-Rmpi/00new/Rmpi/libs
** R
** demo
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
--------------------------------------------------------------------------
No OpenFabrics connection schemes reported that they were able to be
used on a specific port.  As such, the openib BTL (OpenFabrics
support) will be disabled for this port.

  Local host:           dev1
  Local device:         mlx5_0
  Local port:           1
  CPCs attempted:       rdmacm, udcm
--------------------------------------------------------------------------
[1684164541.785007] [dev1:144774:0]       ib_iface.c:700  UCX  ERROR ibv_create_cq(cqe=4096) failed: Cannot allocate memory
[{{ site.devel.hostname }}:144774] pml_ucx.c:208 Error: Failed to create UCP worker
** checking absolute paths in shared objects and dynamic libraries
** testing if installed package can be loaded from final location
--------------------------------------------------------------------------
No OpenFabrics connection schemes reported that they were able to be
used on a specific port.  As such, the openib BTL (OpenFabrics
support) will be disabled for this port.

  Local host:           dev1
  Local device:         mlx5_0
  Local port:           1
  CPCs attempted:       rdmacm, udcm
--------------------------------------------------------------------------
[1684164544.056113] [{{ site.devel.name }}:144810:0]       ib_iface.c:700  UCX  ERROR ibv_create_cq(cqe=4096) failed: Cannot allocate memory
[{{ site.devel.hostname }}:144810] pml_ucx.c:208 Error: Failed to create UCP worker
** testing if installed package keeps a record of temporary installation path
* DONE (Rmpi)

The downloaded source packages are in
        '/scratch/{{ site.user.name }}/RtmpgUxkQk/downloaded_packages'
>
```


Note, you need to load the identical module and version each time you want to use the **Rmpi** package.  After installing **Rmpi**, verify that it works:

<!-- code-block label="test-Rmpi" -->
```r
[alice@{{ site.devel.name }} ~]$ module load CBI r
[alice@{{ site.devel.name }} ~]$ module load mpi/openmpi3-x86_64
[alice@{{ site.devel.name }} ~]$ R
...
> library(Rmpi)
--------------------------------------------------------------------------
No OpenFabrics connection schemes reported that they were able to be
used on a specific port.  As such, the openib BTL (OpenFabrics
support) will be disabled for this port.

  Local host:           {{ site.devel.name}}
  Local device:         mlx5_0
  Local port:           1
  CPCs attempted:       rdmacm, udcm
--------------------------------------------------------------------------
[1684166567.056542] [{{ site.devel.name}}:179552:0]       ib_iface.c:700  UCX  ERROR ibv_create_cq(cqe=4096) failed: Cannot allocate memory
[{{ site.devel.hostname}}:179552] pml_ucx.c:208 Error: Failed to create UCP worker

> mpi.spawn.Rslaves()              ## launch one or more MPI parallel workers
[{{ site.devel.hostname}}:180960] 1 more process has sent help message help-mpi-btl-openib-cpc-base.txt / no cpcs for port
[{{ site.devel.hostname}}:180960] Set MCA parameter "orte_base_help_aggregate" to 0 to see all help / error messages
        1 slaves are spawned successfully. 0 failed.
master (rank 0, comm 1) of size 2 is running on: {{ site.devel.name}} 
slave1 (rank 1, comm 1) of size 2 is running on: {{ site.devel.name}}

> mpi.remote.exec(Sys.getpid())    ## get the process ID for one of them
     out
1 189114
```


#### The pbdMPI, pbdPROF, and bigGP packages

Similarly to the **Rmpi** package above, MPI-dependent R packages such as **[pbdMPI]**, **[pbdPROF]**, and **[bigGP]** require special install instructions.  For example, after having loaded the `mpi` module, we can install **pdbMPI** in R as:

```r
> install.packages("pbdMPI", configure.args="--with-mpi-libpath=$MPI_LIB --with-mpi-type=OPENMPI")
Installing package into '{{ site.user.home }}/R/x86_64-pc-linux-gnu-library/{{ r_libs_user }}'
(as 'lib' is unspecified)
trying URL 'https://cloud.r-project.org/src/contrib/pbdMPI_0.4-4.tar.gz'
Content type 'application/x-gzip' length 519492 bytes (507 KB)
==================================================
downloaded 507 KB

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
>> MPI_LDFLAGS = 
>> PKG_CPPFLAGS = -I/usr/include/openmpi-x86_64  -DMPI2 -DOPENMPI
>> PKG_LIBS = -L/usr/lib64/openmpi/lib -lmpi  -lutil -lpthread
>> PROF_LDFLAGS = 
>> ENABLE_LD_LIBRARY_PATH = no
 
*************************************************************************
...
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (pbdMPI)

The downloaded source packages are in
        '/scratch/alice/RtmpaslkmM/downloaded_packages'
```


### Packages relying on JAGS

#### The rjags package

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
* removing '{{ site.user.home }}/R/x86_64-pc-linux-gnu-library/4.2-CBI-gcc10/rjags'
ERROR: dependency 'rjags' is not available for package 'infercnv'
* removing '{{ site.user.home }}/R/x86_64-pc-linux-gnu-library/4.2-CBI-gcc10/infercnv'
```

The error says that the "JAGS library" is missing.  It's available via
the CBI software stack.  Load it before starting R:

```sh
$ module load CBI jags
```

and you'll find that `install.packages("rjags")` will complete successfully.

Importantly, you need to load `jags` CBI module any time you run R
where the **rjags** R package needs to be loaded.



### Packages requiring extra care

#### The **udunits2** package

The **[udunits2]** package does not install out of the box.  It seems to be due to a problem with the package itself, and the suggested instructions that the package gives on setting environment variable `UDUNITS2_INCLUDE` do not work.  A workaround to install the package is to do:

```sh
install.packages("udunits2", configure.args="--with-udunits2-include=/usr/include/udunits2")   
```


[CRAN]: https://cran.r-project.org/
[Bioconductor]: http://bioconductor.org/
[bigGP]: https://cran.r-project.org/package=bigGP
[BiocManager]: https://cran.r-project.org/package=BiocManager
[parallelly]: https://cran.r-project.org/package=parallelly
[hdf5r]: https://cran.r-project.org/package=hdf5r
[igraph]: https://cran.r-project.org/package=igraph
[pbdMPI]: https://cran.r-project.org/package=pbdMPI
[pbdPROF]: https://cran.r-project.org/package=pbdPROF
[rjags]: https://cran.r-project.org/package=rjags
[Rmpi]: https://cran.r-project.org/package=Rmpi
[sf]: https://cran.r-project.org/package=sf
[udunits2]: https://cran.r-project.org/package=udunits2
[zoo]: https://cran.r-project.org/package=zoo
[limma]: http://bioconductor.org/packages/limma/
[CBI software stack]: /hpc/software/software-repositories.html
