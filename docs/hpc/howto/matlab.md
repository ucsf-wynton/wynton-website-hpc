# Work with MATLAB

MATLAB is available on {{ site.cluster.name }} via a [built-in environment module](/hpc/software/software-repositories.html) and is supported by a UCSF-wide MATLAB license.

## Accessing MATLAB

To load the MATLAB module, do:

```sh
[alice@{{ site.devel.name }} ~]$ module load matlab
[alice@{{ site.devel.name }} ~]$ matlab -nosplash -nodesktop
MATLAB is selecting SOFTWARE OPENGL rendering.


                          < M A T L A B (R) >
                Copyright 1984-2021 The MathWorks, Inc.
                R2021a (9.10.0.1602886) 64-bit (glnxa64)
                           February 17, 2021


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
#$ -S /bin/bash
#$ -cwd          # run job in the current working directory

module load matlab
matlab -singleCompThread -batch "my_script"
```

The `-batch` option tells MATLAB to call the command `my_script`, and since that is not a built in command, it will look for a MATLAB script file called `my_script.m`, and execute that.  The `-singleCompThread` option tells MATLAB to run in sequential mode; this prevents your job for overusing the compute nodes by mistake.


### Parallel processing in MATLAB

If your MATLAB code supports parallel processing, make sure to [specify the number of CPU cores]((/hpc/scheduler/submit-jobs.html)) when submitting your job submit, e.g. `-pe smp 4` will request four cores on one machine, which in turn will set environment variable `NSLOTS` to `4`.  To make your MATLAB script respect this, add the following at the top of your script:

```matlab
%% Make MATLAB respect the number of cores that the SGE scheduler
%% has alloted the job.  If not specified, run with a single core,
%% e.g. when running on a development node
nslots = getenv('NSLOTS');              % env var is always a 'char'
if (isempty(nslots)) nslots = '1'; end  % default value
nslots = str2num(nslots);               % coerce to 'double'
maxNumCompThreads(nslots);              % number of cores MATLAB may use
```

and then launch your MATLAB script _without_ option `-singleCompThread`, e.g. `matlab -batch my_script.m`.
