# Work with MATLAB

MATLAB is available on {{ site.cluster.name }} via a [built-in environment module]({{ '/software/software-repositories.html' | relative_url }}) and is supported by a UCSF-wide MATLAB license.

## Accessing MATLAB

To load the MATLAB module, do:

```sh
[alice@{{ site.devel.name }} ~]$ module load matlab
[alice@{{ site.devel.name }} ~]$ matlab -nosplash -nodesktop
MATLAB is selecting SOFTWARE OPENGL rendering.


                                              < M A T L A B (R) >
                                    Copyright 1984-2020 The MathWorks, Inc.
                                    R2020a (9.8.0.1323502) 64-bit (glnxa64)
                                               February 25, 2020

 
To get started, type doc.
For product information, visit www.mathworks.com.
 

>> 1+2

ans =

     3

>> quit

[alice@{{ site.devel.name }} ~]$ 
```


If you forget to load the MATLAB module, then you will get an error when attempting to start MATLAB:

```sh
[alice@{{ site.devel.name }} ~]$ matlab
-bash: matlab: command not found
```


## Using MATLAB in job scripts

In order to run MATLAB in jobs, the MATLAB environment module needs to be loaded just as when you run it interactive on a development node.  For example, to run the `my_script.m` script, the job script should at a minimum contain:

```sh
#! /usr/bin/env bash
#$ -cwd   ## SGE directive to run in the current working directory

module load matlab
matlab -batch my_script
```
