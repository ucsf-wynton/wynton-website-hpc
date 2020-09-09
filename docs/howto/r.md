# Work with R

R is available on {{ site.cluster.name }} via a [contributed environment module]({{ '/software/software-repositories.html' | relative_url }}).
R is also available as part of the [core-software installation]({{ '/software/core-software.html' | relative_url }}) but, because that is an outdated version of R no longer supported by the R developers, we recommend that you do _not_ use that version.


## Accessing R

To load the R module available in the CBI software stack, do:

```sh
[alice@dev3 ~]$ module load CBI
[alice@dev3 ~]$ module load r
```

which provides access to a modern version of R:

```r
[alice@dev3 ~]$ R
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
[alice@dev3 ~]$ 
```

## Using R in job scripts

In order to run R in jobs, the above R environment module needs to be loaded just as when you run it interactive on a development node.  For example, to run the `my_script.R` script, the job script should at a minimum contain:

```sh
#! /usr/bin/env bash
#$ -cwd   ## SGE directive to run in the current working directory

module load CBI
module load r
Rscript my_script.R
```


## Installing R packages

The majority of R packages are available from [CRAN] (Comprehensive R Archive Network).  Another dominant repository of R packages is [Bioconductor], which provides R packages within the Bioinformatics area.  Packages available from Bioconductor are not available on CRAN, and vice versa.  At times, you will find online instructions for installing R packages hosted on, for instance, GitHub and GitLab.  Before installing an R package from such sources, we highly recommend to install the package from CRAN or Bioconductor, if it is available there, because packages hosted on the latter are stable releases and often better tested.

Before continuing, it is useful to understand where R packages looks for locally installed R packages.  There are three locations that R considers:

1. Your personal R package library. This is located under `~/R/`, e.g. `~/R/x86_64-pc-linux-gnu-library/4.0-CBI/`

2. (optional) A site-wide R package library (not used on {{ site.cluster.name }}), e.g. `/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/library`

3. The system-wide R package library part of the R installed


For instance, when we try to load an R package:

```r
> library(nlme)
```

R will search the above folders in order for R package 'nlme'.
When you start you fresh, the only R packages available to you are the ones installed in folder (3) - the system-wide library.  The 'nlme' package comes with the R installation, so with a fresh setup, it will be loaded from the third location.
As we will see below, when you install your own packages, they will all be installed into folder (1) - your personal library.  The first time your run R, the personal library folder does not exists, so R will ask you whether or not you want to create that folder.  If asked, you should always accept (answer 'Yes').  If you had already created this folder, R will install into this folder without asking.


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

We notice two things.  First there is a warning mentioning that a "lib" folder was "not writable".  This is because your personal library folder did not yet exists and R tried to install to location (3) but failed (because you do not have write permission there).  This is when R decided to ask you with you want to install to a personal library.  Answer 'yes':

```r
Would you like to use a personal library instead? (yes/No/cancel) yes
Would you like to create a personal library
‘~/R/x86_64-pc-linux-gnu-library/4.0-CBI’
to install packages into? (yes/No/cancel)
```

R wants to make sure you are aware what is done, so it will, conservatively, also ask if you accept the default location.  Answer 'yes' for this folder to be created.  Afterward, the package will downloaded and the package installation be done:

```r
Would you like to create a personal library
‘~/R/x86_64-pc-linux-gnu-library/4.0-CBI’
to install packages into? (yes/No/cancel) yes
trying URL 'https://cloud.r-project.org/src/contrib/zoo_1.8-8.tar.gz'
Content type 'application/x-gzip' length 849487 bytes (829 KB)
==================================================
downloaded 829 KB

* installing *source* package ‘zoo’ ...
** package ‘zoo’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
gcc -std=gnu99 -I"/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c coredata.c -o coredata.o
gcc -std=gnu99 -I"/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c init.c -o init.o
gcc -std=gnu99 -I"/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/include" -DNDEBUG -I../inst/include  -I/usr/local/include   -fpic  -g -O2  -c lag.c -o lag.o
gcc -std=gnu99 -shared -L/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/lib -L/usr/local/lib64 -o zoo.so coredata.o init.o lag.o -L/wynton/home/cbi/shared/software/CBI/R-4.0.2/lib64/R/lib -lR
installing to /wynton/home/bengtsson/hb-test/R/x86_64-pc-linux-gnu-library/4.0-CBI/00LOCK-zoo/00new/zoo/libs
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
        ‘/tmp/RtmpVm3e6t/downloaded_packages’
>
```

If there is no mentioning of an "error" (a "warning" is ok in R but never an "error"), then the package was successfully installed.  If you see `* DONE (zoo)` at the end, it means that the package was successfully installed.  As with any other package in R, you can also verify that it is indeed installed by loading it, i.e.

```r
> library(zoo)

Attaching package: ‘zoo’

The following objects are masked from ‘package:base’:

    as.Date, as.Date.numeric

>
```




[CRAN]: https://cran.r-project.org/
[Bioconductor]: http://bioconductor.org/
[zoo]: https://cran.r-project.org/package=zoo
