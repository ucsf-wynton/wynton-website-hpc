# Submit Jobs

Here is what a typical job submission of shell script `script.sh` would look like from the command line:

```sh
qsub -cwd -pe smp 4 -l mem_free=2G -l scratch=50G -l h_rt=00:20:00 script.sh
```

This job submission will submit `script.sh` to the job scheduler which will eventually launch the job on one the compute nodes that can meet the resource needs of the job.  Exactly, what these options are is explained below sections, but in summary, the above will result in:

* `-cwd`: the working directory will be set to the same directory as from where the submission was done
* `-pe smp 4`: the job will be allotted four slots ("cores") on a single machine
* `-l mem_free=2G`: the job will be allotted 2 GiB of RAM per slot, i.e. 8 GiB in total
* `-l scratch=50G`: the job will be launched on a compute node with at least 50 GiB of local `/scratch` available
* `-l h_rt=00:20:00`: the scheduler knows that the job to run no longer than 20 minutes allowing it to be scheduled much sooner than if no run-time was specified
* `script.sh`: the shell script to be run

## Sample submit script

Before you can submit jobs to the compute nodes, you should prepare a script like the one below. Split your jobs into smaller tasks varying only in input parameters. You can then submit the jobs from a login node or a dev node. (Note: _do not_ include the `#--` comments in your script - that won't work.)

```sh
#!/bin/bash                        #-- what is the language of this shell
#                                  #-- Any line that starts with #$ is an instruction to SGE
#$ -S /bin/bash                    #-- the shell for the job
#$ -o [dir]                        #-- output directory (fill in)
#$ -e [dir]                        #-- error directory (fill in)
#$ -cwd                            #-- tell the job that it should start in your working directory
#$ -r y                            #-- tell the system that if a job crashes, it should be restarted
#$ -j y                            #-- tell the system that the STDERR and STDOUT should be joined
#$ -l mem_free=1G                  #-- submits on nodes with enough free memory (required)
#$ -l scratch=1G                   #-- SGE resources (home and scratch disks)
#$ -l h_rt=24:00:00                #-- runtime limit (see above; this requests 24 hours)
##$ -t 1-10                        #-- remove first '#' to specify the number of
                                   #-- tasks if desired (see Tips section on this page)

# Anything under here can be a bash script

# If you used the -t option above, this same script will be run for each task,
# but with $SGE_TASK_ID set to a different value each time (1-10 in this case).
# The commands below are one way to select a different input (PDB codes in
# this example) for each task.  Note that the bash arrays are indexed from 0,
# while task IDs start at 1, so the first entry in the tasks array variable
# is simply a placeholder

#tasks=(0 1bac 2xyz 3ijk 4abc 5def 6ghi 7jkl 8mno 9pqr 1stu )
#input="${tasks[$SGE_TASK_ID]}"

date
hostname

## End-of-job summary, if running as a job
[[ -n "$JOB_ID" ]] && qstat -j "$JOB_ID"          # This is useful for debugging and usage purposes,
                                                  # e.g. "did my job exceed its memory request?"
```


## Submit a script to run in the current working directory

To submit a shell script to the scheduler such that it will run in the current working directory (`-cwd`), use:
```sh
qsub -cwd script.sh
```
The scheduler will assign your job a unique (numeric) job ID.


## Specifying (maximum) memory usage

Unless specified, the maximum amount of memory used at any time is 1 GiB per slot (`-l mem_free=1G`).  A job that need to use more memory, need to request that when submitted.  For example, a job that needs (at most) 10 GiB of memory should be submitted as:
```sh
qsub -cwd -l mem_free=10G script.sh
```
The scheduler will launch this jobs on the first available compute node with that amount of memory available.

_TIPS_: Add `qstat -j $JOB_ID` to the end of your script to find out how much memory and CPU time your job needed.  See [Job Summary] page for more details.

<div class="alert alert-warning" role="alert">
A job that consumes more memory than requested may be terminated by the administrators and in the future possibly automatically by the scheduler.  Because of this, you may request a bit more memory in order to give your job some leeway.
</div>

<div class="alert alert-warning" role="alert">
Note that <code>-l mem_free=size</code> specifies <em>memory per slot</em>, not per job.
</div>



## Specifying (maximum) run time

<div class="alert alert-info" role="alert">
Specifying the run time will shorten the queuing time - significantly so for short running jobs.
</div>

By specifying the how long each job will take, the better the scheduler can manage resources and allocate jobs to different nodes.  This will also decrease the average waiting time the job will sit in the queue before being launched on a compute node.  You can specify the maximum run time (= wall time, not CPU time) for a job using option `-l h_rt=HH:MM:SS` where `HH:MM:SS` specifies the number of hours (`HH`), the number of minutes (`MM`), and the number of seconds (`SS`) - all parts must be specified.  For instance, the following job is expected to run for at most 3 minutes (180 seconds):
```sh
qsub -cwd -l mem_free=2G -l h_rt=00:03:00 script.sh
```

<div class="alert alert-warning" role="alert">
If not specified, the default run time is 10 minutes.  A job that runs longer than the requested run time will be terminated by the scheduler.  Because of this, you may add a little bit of extra time to give your job some leeway.
</div>



## Using local scratch storage

Each compute node has {{ site.data.specs.local_scratch_size_min }}-{{ site.data.specs.local_scratch_size_max }} TiB of [local scratch storage]({{ '/about/specs.html#scratch-storage' | relative_url }}) which is fast and ideal for temporary, intermediate data files that are only needed for the length of a job.  This scratch storage is unique to each machine and shared among all users and jobs running on the same machine.  To minimize the risk of launching a job on a node that have little scratch space left, specify the `-l scratch=size` resource.  For instance, if your job requires 200 GiB of local `/scratch` space, submit the job using:
```sh
qsub -cwd -l scratch=200G script.sh
```

Your job is only guaranteed the amount of available scratch space that you request _when it is launched_.  For more information and best practices, see [Using Local /scratch on Compute Nodes]({{ '/using-local-scratch.html' | relative_url }}).

<div class="alert alert-warning" role="alert">
Please specify <code>-l scratch=size</code> when using local <code>/scratch</code> and please <a href="using-local-scratch.html">cleanup afterward</a>.  This maximizes the chance for compute nodes having enough available space, reduces the queuing times, and minimizes the risk for running out of local scratch.
</div>

<div class="alert alert-warning" role="alert">
Note that <code>-l scratch=size</code> specifies <em>space per job</em>, not per slot.
</div>


If your job would benefit from extra-fast [local scratch storage]({{ '/about/specs.html#scratch-storage' | relative_url }}), then you can request a node with either a SSD or NVMe scratch drive via the following flag:
```sh
qsub -l ssd_scratch=1
```

## Parallel processing 

By default, the scheduler will allocate a single core for your job.  To allow the job to use multiple CPU cores, you must run your job in a SGE parallel environment (PE) and tell SGE how many cores the job will use.  Please note that jobs using multiple cores running outside of a parallel environment are subject to termination without warning by the Wynton admins.  There are four parallel environments on Wynton:

* `smp`: for multithreaded jobs using ['Symmetric multiprocessing'](https://en.wikipedia.org/wiki/Symmetric_multiprocessing (SMP)
* `mpi`: for parallel jobs using MPI
* `mpi_onehost`: for tightly coupled parallel jobs using MPI which run best on a single host
* `mpi-8`: for Hybrid MPI (multi-threaded multi-node MPI jobs)

For any of the above environments, you must request the number of slots needed when you submit the job.  For instance, to request four slots (`NSLOTS=4`) in the SMP PE _each with 2 GiB of RAM_, for a _total_ of 8 GiB RAM, use:
```sh
qsub -pe smp 4 -l mem_free=2G script.sh
```
The scheduler will make sure your job is launched on a node with at least four slots available.

Note, when writing your script, use SGE environment variable `NSLOTS`, which is set to the number of cores that your job was allocated.  This way you don't have to update your script if you request a different number of cores.  For instance, if your script runs the BWA alignment, have it specify the number of parallel threads as:
```sh
bwa aln -t "${NSLOTS:-1}" ...
```
By using `${NSLOTS:-1}`, instead of just `${NSLOTS}`, this script will fall back to use a single thread if `NSLOTS` is not set, e.g. when running the script on your local computer.

<div class="alert alert-danger" role="alert">
<strong>Do not use more cores than requested!</strong> - a common reason for compute nodes being clogged up and jobs running slowly.  A typically mistake is to hard-code the number of cores in the script and then request a different number when submitting the job - using <code>NSLOTS</code> avoids this problem.  Another problem is software that by default use all of the machine's cores - make sure to control for this, e.g. use dedicated command-line option or environment variable for that software.  One such environment variable is OMP_NUM_THREADS.  For bash scripts, use <code>export OMP_NUM_THREADS=${NSLOTS:-1}</code>.
</div>


### MPI

There are two versions of MPI on Wynton:

 * OpenMPI 3.1.3, available via `module load mpi` or `module load mpi/openmpi3-x86_64`
 * OpenMPI 1.10.7, available via `module laod mpi/openmpi-x86_64`

To launch a parallel job using MPI, put `mpirun -np $NSLOTS` before your application and its arguments in your job script.  MPI jobs running on multiple hosts communicate over the network.  For certain types of applications (known as tightly coupled), this can slow a job down more than the multiple cores can speed it up.  Run these types of jobs in the `mpi_onehost` PE to keep the job on a single compute node.

### MPI: Parallel processing via Hybrid MPI (multi-threaded multi-node MPI jobs)

{{ site.cluster.name }} provides a special MPI parallel environment (PE) called `mpi-8` that allocates exactly eight (8) slots per node across one or more compute nodes.  For instance, to request a Hybrid MPI job with in total forty slots (`NSLOTS=40`), submit it as:

```sh
qsub -pe mpi-8 40 hybrid_mpi.sh
```

and make sure that the script (here `hybrid_mpi.sh`) exports `OMP_NUM_THREADS=8` (the eight slots per node) and then launches the MPI application using `mpirun -np $NHOSTS /path/to/the_app` where `NHOSTS` is automatically set by SGE (here `NHOSTS=5`):

```sh
#! /usr/bin/env bash
#$ -cwd   ## SGE directive to run in the current working directory

module load mpi/openmpi-x86_64
export OMP_NUM_THREADS=8
mpirun -np $NHOSTS /path/to/the_app
```

_Note_: When working with MPI, it is important to use the exact same version as was used to built the software using MPI.  Because of this, we always specify the full `mpi/<version>` path.

<div class="alert alert-warning" role="alert">
Note that mpi-8 jobs must request a multiple of exactly eight (8) slots.  If <code>NSLOTS</code> is not a multiple of eight, then the job will be stuck in the queue forever and never run.
</div>


## Minimum network speed (1 Gbps, 10 Gbps, 40 Gbps)

The majority of the compute nodes have 1 Gbps and 10 Gbps network cards while a few got 40 Gbps cards.  A job that requires 10-40 Gbps network speed can request this by specifying the `eth_speed=10` (sic!) resource, e.g.
```sh
qsub -cwd -l eth_speed=10 script.sh
```
A job requesting `eth_speed=40` will end up on a 40 Gbps node, and a job requesting `eth_speed=1` (default) will end up on any node.



## Passing arguments to script

You can pass arguments to a job script similarly to how one passes argument to a script executed on the command line, e.g.
```sh
qsub -cwd -l mem_free=1G script.sh --first=2 --second=true --third='"some value"' --debug
```
Arguments are then passed as if you called the script as `script.sh --first=2 --second=true --third="some value" --debug`.  Note how you have to have an extra layer of single quotes around `"some value"`, otherwise `script.sh` will see `--third=some value` as two independent arguments (`--third=some` and `value`).


## Interactive jobs

It is currently _not_ possible to request _interactive_ jobs (aka `qlogin`).  Instead, there are dedicated [development nodes] that can be used for short-term interactive development needs such building software and prototyping scripts before submitting them to the scheduler.




_Comment_: MPI stands for ['Message Passing Interface'](https://en.wikipedia.org/wiki/Message_Passing_Interface).

## Tips

- An array job is a collection of similar serial jobs which can be submitted and controlled together. For example, `-t 1-10` runs 10 tasks in an array. Each task runs the same script, but gets a different value for the `$SGE_TASK_ID` environment variable (from '1' to '10' in this example). You can use this to choose different inputs or other parameters for each task.
- The SGE manual pages are installed on the login and dev nodes. For more info on any SGE command, just type the name of command (e.g., `man qsub`).



<!--
## Defaults

* Memory usage (per slot): If not specified, the default is `-l mem_free=1G`.

* Working directory: If not specified (e.g. `-cwd`), the default working directory is `$HOME`.
-->


## See also

For further options and advanced usage, see [Advanced Usage]({{ '/scheduler/advanced-usage.html' | relative_url }}) of the scheduler.

[SGE environment variable]: {{ '/scheduler/sge-envvars.html' | relative_url }}
[Job Summary]: {{ '/scheduler/job-summary.html' | relative_url }}
[development nodes]: {{ '/get-started/development-prototyping.html' | relative_url }}
