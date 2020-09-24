# Work with R

R is available on {{ site.cluster.name }} via a [contributed environment module]({{ '/software/software-repositories.html' | relative_url }}).
R is also available as part of the [core-software installation]({{ '/software/core-software.html' | relative_url }}) but, because that is an outdated version of R no longer supported by the R developers, we recommend that you do _not_ use that version.


## Accessing R

To load the R module available in the [CBI software stack], do:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI
[alice@{{ site.devel.name }} ~]$ module load r
```

which provides access to a modern version of R:

```r
[alice@{{ site.devel.name }} ~]$ R
R version 4.0.2 (2020-06-22) -- "Taking Off Again"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under the terms of the
GNU General Public License versions 2 or 3.
For more information about these matters see
https://www.gnu.org/licenses/.

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
#$ -cwd   ## SGE directive to run in the current working directory

module load CBI
module load r
Rscript my_script.R
```


## Installing R packages

The majority of R packages are available from [CRAN] (Comprehensive R Archive Network).  Another dominant repository of R packages is [Bioconductor], which provides R packages with a focus on bioinformatics.  Packages available from Bioconductor are not available on CRAN, and vice versa.  At times, you will find online instructions for installing R packages hosted on, for instance, GitHub and GitLab.  Before installing an R package from such sources, we highly recommend to install the package from CRAN or Bioconductor, if it is available there, because packages hosted on the latter are stable releases and often better tested.

Before continuing, it is useful to understand where R packages looks for locally installed R packages.  There are three locations that R considers:

1. Your personal R package library. This is located under `~/R/`, e.g. `~/R/x86_64-pc-linux-gnu-library/4.0-CBI/`

2. (optional) A site-wide R package library (not used on {{ site.cluster.name }})

3. The system-wide R package library part of the R installed, e.g. `/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/library`


For instance, when we try to load an R package:

```r
> library(nlme)
```

R will search the above folders in order for R package 'nlme'.
When you start you fresh, the only R packages available to you are the ones installed in folder (3) - the system-wide library.  The 'nlme' package comes with the R installation, so with a fresh setup, it will be loaded from the third location.
As we will see below, when you install your own packages, they will all be installed into folder (1) - your personal library.  The first time your run R, the personal library folder does not exists, so R will ask you whether or not you want to create that folder.  If asked, you should always accept (answer 'Yes').  If you had already created this folder, R will install into this folder without asking.

Finally, R undergoes a _main_ update once a year (in April).  For example, R 4.0.0 was release in April 2020.  The next main release will be R 4.1.0 in April 2021.  Whenever the `y` component in R `x.y.z` version is increased, you will start out with an empty personal package folder specific for R `x.y` (regardless of `z`).  This means that you will have to re-install all R packages you had installed during the year before the new main release came out.  Yes, this can be tedious and can take quite some time but it will improve stability and yet allow the R developers to keep improving R.  Of course, you can still keep using an older version of R and all the packages you have installed for that version - they will not be removed.


### Installing an R package from CRAN

Packages available on CRAN can be installed using the `install.packages()` function in R.  The default behavior of R is to always ask you which one of the many CRAN mirrors you want to install from (their content is all identical).  To avoid this question, tell R to always use the first one:

```r
> chooseCRANmirror(ind = 1)
>
```

Now, in order to install, for instance, the [zoo] package available on CRAN, call:

```r
> install.packages("zoo")
Warning in install.packages("zoo") :
  'lib = "/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/library"' is not writable
Would you like to use a personal library instead? (yes/No/cancel)
```

We notice two things.  First there is a warning mentioning that a "lib" folder was "not writable".  This is because your personal library folder did not yet exists and R tried to install to location (3) but failed (because you do not have write permission there).  This is where R decided to ask you whether or not you want to install to a personal library.  Answer 'yes':

```r
Would you like to use a personal library instead? (yes/No/cancel) yes
Would you like to create a personal library
'~/R/x86_64-pc-linux-gnu-library/4.0-CBI'
to install packages into? (yes/No/cancel)
```

R wants to make sure you are aware what is done, so it will, conservatively, also ask if you accept the default location.  Answer 'yes' for this folder to be created.  After this, the current and all future package installation in R will be installed into this folder without further questions asked.  In this example, we will get:

```r
Would you like to create a personal library
'~/R/x86_64-pc-linux-gnu-library/4.0-CBI'
to install packages into? (yes/No/cancel) yes
trying URL 'https://cloud.r-project.org/src/contrib/zoo_1.8-8.tar.gz'
Content type 'application/x-gzip' length 849487 bytes (829 KB)
==================================================
downloaded 829 KB

* installing *source* package 'zoo' ...
** package 'zoo' successfully unpacked and MD5 sums checked
** using staged installation
** libs
gcc -std=gnu99 -I"/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c coredata.c -o coredata.o
gcc -std=gnu99 -I"/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c init.c -o init.o
gcc -std=gnu99 -I"/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c lag.c -o lag.o
gcc -std=gnu99 -shared -L/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/lib -L/usr/local/lib64 -o zoo.so coredata.o init.o lag.o -L/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/lib -lR
installing to /wynton/home/bobson/alice/R/x86_64-pc-linux-gnu-library/4.0-CBI/00LOCK-zoo/00new/zoo/libs
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

If you already have BiocManager installed, you can skip this section.

When you start out fresh, the package [BiocManager] is not installed meaning that calling `BiocManager::install()` will fail.  We need to start by installing it from CRAN (sic!);

```r
> install.packages("BiocManager")
Installing package into '/wynton/home/bobson/alice/R/x86_64-pc-linux-gnu-library/4.0-CBI'
(as 'lib' is unspecified)
trying URL 'https://cloud.r-project.org/src/contrib/BiocManager_1.30.10.tar.gz'
Content type 'application/x-gzip' length 40205 bytes (39 KB)
==================================================
downloaded 39 KB

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

With BiocManager installed, we can now install any Bioconductor package.  For instance, to install [limma], and all of its dependencies, call:

```r
> BiocManager::install("limma")
Bioconductor version 3.11 (BiocManager 1.30.10), R 4.0.2 (2020-06-22)
Installing package(s) 'BiocVersion', 'limma'
trying URL 'https://bioconductor.org/packages/3.11/bioc/src/contrib/BiocVersion_3.11.1.tar.gz'
Content type 'application/x-gzip' length 980 bytes
==================================================
downloaded 980 bytes

trying URL 'https://bioconductor.org/packages/3.11/bioc/src/contrib/limma_3.44.3.tar.gz'
Content type 'application/x-gzip' length 1523576 bytes (1.5 MB)
==================================================
downloaded 1.5 MB

* installing *source* package 'BiocVersion' ...
** using staged installation
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (BiocVersion)
* installing *source* package 'limma' ...
** using staged installation
** libs
gcc -std=gnu99 -I"/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c init.c -o init.o
gcc -std=gnu99 -I"/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c normexp.c -o normexp.o
gcc -std=gnu99 -I"/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/include" -DNDEBUG   -I/usr/local/include   -fpic  -g -O2  -c weighted_lowess.c -o weighted_lowess.o
gcc -std=gnu99 -shared -L/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/lib -L/usr/local/lib64 -o limma.so init.o normexp.o weighted_lowess.o -L/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/lib -lR
installing to /wynton/home/bobson/alice/R/x86_64-pc-linux-gnu-library/4.0-CBI/00LOCK-limma/00new/limma/libs
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
        '/tmp/Rtmpsz02Og/downloaded_packages'
Installation path not writeable, unable to update packages: MASS, mgcv, nlme,
  survival
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

If you have an R scripts, and it involves setting up a number of parallel workers in R, do _not_ use `ncores <- detectCores()` of the **parallel** package because it will result in your job hijacking _all_ cores on the compute node regardless of how many cores the scheduler has given you.  Taking up all CPU resources without permission is really bad practice and a common cause for problems.  A much better solution is to use `availableCores()` that is available in the **[future]** package, e.g. as `ncores <- future::availableCores()`.  This function is backward compatible with `detectCores()` while respecting what the scheduler has allocated for your job.


### Packages that require extra care

#### The hdf5r package

The [hdf5r] package requires [hdf5 1.8.13 or newer](https://github.com/hhoeflin/hdf5r/issues/115) but the version that comes with CentOS 7/EPEL is only 1.8.12. This will result in the following installation error in R:

```r
Found hdf5 with version: 1.8.12
configure: error: The version of hdf5 installed on your system is not sufficient. Please ensure that at least version 1.8.13 is installed
ERROR: configuration failed for package 'hdf5r'
```

 To fix this, load a modern version of 'hdf5' from the [CBI software stack] before installing the package, i.e.

 ```sh
 [alice@{{ site.devel.name }} ~]$ module load CBI hdf5 r
 [alice@{{ site.devel.name }} ~]$ module list
 Currently Loaded Modules:
  1) CBI   2) hdf5/1.12.0   3) r/4.0.2
 ```
 Note that you also need to load the `hdf5` module every time you use the hdf5r package in R.

After this, the hdf5r package will install out of the box, i.e. by calling:

```r
> install.packages("hdf5r")
```


#### The Rmpi package

The [Rmpi] package does not install out-of-the-box like other R packages.  It requires special care to install.  To install Rmpi on the cluster, we start by loading the `mpi` module;

```sh
[alice@{{ site.devel.name }} ~]$ module load mpi
[alice@{{ site.devel.name }} ~]$ module load CBI r
[alice@{{ site.devel.name }} ~]$ module list
Currently Loaded Modules:
  1) mpi/openmpi-x86_64   2) CBI   3) r/4.0.2
```

Note that you will have to load the `mpi` module also whenever you run R code that requires the Rmpi package.

Continuing, to install Rmpi, we launch R and call the following:

```r
> install.packages("Rmpi", configure.args="--with-Rmpi-include=$MPI_INCLUDE --with-Rmpi-libpath=$MPI_LIB --with-Rmpi-type=OPENMPI")
Installing package into '/wynton/home/cbi/alice/R/x86_64-pc-linux-gnu-library/4.0-CBI'
(as 'lib' is unspecified)
trying URL 'https://cloud.r-project.org/src/contrib/Rmpi_0.6-9.tar.gz'
Content type 'application/x-gzip' length 106745 bytes (104 KB)
==================================================
downloaded 104 KB

* installing *source* package 'Rmpi' ...
** package 'Rmpi' successfully unpacked and MD5 sums checked
** using staged installation
configure: creating ./config.status
config.status: creating src/Makevars
** libs
gcc -std=gnu99 -I"/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/include" -DNDEBUG -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -I/usr/include/openmpi-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c Rmpi.c -o Rmpi.o
gcc -std=gnu99 -I"/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/include" -DNDEBUG -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -I/usr/include/openmpi-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c conversion.c -o conversion.o
gcc -std=gnu99 -I"/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/include" -DNDEBUG -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -I/usr/include/openmpi-x86_64  -DMPI2 -DOPENMPI  -I/usr/local/include   -fpic  -g -O2  -c internal.c -o internal.o
gcc -std=gnu99 -shared -L/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/lib -L/usr/local/lib64 -o Rmpi.so Rmpi.o conversion.o internal.o -L/usr/lib64/openmpi/lib -lmpi -L/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/lib -lR
installing to /wynton/home/bobson/alice/R/x86_64-pc-linux-gnu-library/4.0-CBI/00LOCK-Rmpi/00new/Rmpi/libs
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

That's it!



[CRAN]: https://cran.r-project.org/
[Bioconductor]: http://bioconductor.org/
[BiocManager]: https://cran.r-project.org/package=BiocManager
[future]: https://cran.r-project.org/package=future
[hdf5r]: https://cran.r-project.org/package=hdf5r
[Rmpi]: https://cran.r-project.org/package=Rmpi
[zoo]: https://cran.r-project.org/package=zoo
[limma]: http://bioconductor.org/packages/limma/
[CBI software stack]: {{ '/software/software-repositories.html' | relative_url }}
