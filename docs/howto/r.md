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
