# Submit Jobs

Here is what a typical job submission of shell script `script.sh` would look like from the command line:

```sh
qsub -cwd -pe smp 4 -l mem_free=2G -l scratch=50G -l h_rt=00:20:00 script.sh
```

This job submission will submit `script.sh` to the job scheduler which will eventually launch the job on one the compute nodes that can meet the resource needs of the job.  Exactly, what these options are is explained below sections, but in summary, the above will result in:

* `-S /bin/bash`: the job scheduler will run the script via Bash (important not to forget)
* `-cwd`: the working directory will be set to the same directory as from where the submission was done
* `-pe smp 4`: the job will be allotted four slots ("cores") on a single machine
* `-l mem_free=2G`: the job will be allotted 2 GiB of RAM per slot, i.e. 8 GiB in total
* `-l scratch=50G`: the job will be launched on a compute node with at least 50 GiB of local `/scratch` available
* `-l h_rt=00:20:00`: the scheduler knows that the job to run no longer than 20 minutes allowing it to be scheduled much sooner than if no run-time was specified
* `script.sh`: the shell script to be run

## Sample submit script

Before you can submit jobs to the compute nodes, you should prepare a script like the one below. Split your jobs into smaller tasks varying only in input parameters. You can then submit the jobs from a login node or a dev node.


```sh
#!/bin/bash           # the shell language when run outside of the job scheduler
#                     # lines starting with #$ is an instruction to the job scheduler
#$ -S /bin/bash       # the shell language when run via the job scheduler [IMPORTANT]
#$ -cwd               # job should run in the current working directory
#$ -j y               # STDERR and STDOUT should be joined
#$ -l mem_free=1G     # job requires up to 1 GiB of RAM per slot
#$ -l scratch=2G      # job requires up to 2 GiB of local /scratch space
#$ -l h_rt=24:00:00   # job requires up to 24 hours of runtime
##$ -t 1-10           # array job with 10 tasks (remove first '#' to enable)
#$ -r y               # if job crashes, it should be restarted

## If you array jobs (option -t), this script will run T times, once per task.
## For each run, $SGE_TASK_ID is set to the corresponding task index (here 1-10).
## To configure different parameters for each task index, one can use a Bash 
## array to map from the task index to a parameter string.

## All possible parameters
# params=(1bac 2xyz 3ijk 4abc 5def 6ghi 7jkl 8mno 9pqr 10stu)

## Select the parameter for the current task index
## Arrays are indexed from 0, so we subtract one from the task index
# param="${params[$((SGE_TASK_ID - 1))]}"

date
hostname

## End-of-job summary, if running as a job
[[ -n "$JOB_ID" ]] && qstat -j "$JOB_ID"  # This is useful for debugging and usage purposes,
                                          # e.g. "did my job exceed its memory request?"
```


## Submit a script to run in the current working directory

To submit a shell script to the scheduler such that it will run in the current working directory (`-cwd`), use:

```sh
qsub -cwd script.sh
```

The scheduler will assign your job a unique (numeric) job ID.


## Specifying (maximum) memory usage [`-l mem_free=<amount>`]

Unless specified, the maximum amount of memory used at any time is 1 GiB per slot (`-l mem_free=1G`).  A job that need to use more memory, need to request that when submitted.  For example, a job that needs (at most) 10 GiB of memory should be submitted as:

```sh
qsub -cwd -l mem_free=10G script.sh
```

The scheduler will launch this jobs on the first available compute node with that amount of memory available.

_TIPS_: Add `qstat -j $JOB_ID` to the end of your script to find out how much memory and CPU time your job needed.  See [Job Summary] page for more details.

<div class="alert alert-warning" role="alert" markdown="1">
A job that consumes more memory than requested may be terminated by the administrators and in the future possibly automatically by the scheduler.  Because of this, you may request a bit more memory in order to give your job some leeway.
</div>

<div class="alert alert-warning" role="alert" markdown="1">
Note that `-l mem_free=size` specifies _memory per slot_, not per job.
</div>



## Specifying (maximum) run time [`-l h_rt=<time>`]

<div class="alert alert-info" role="alert" markdown="1">
Specifying the run time will shorten the queuing time - significantly so for short running jobs.
</div>

By specifying the how long each job will take, the better the scheduler can manage resources and allocate jobs to different nodes.  This will also decrease the average waiting time the job will sit in the queue before being launched on a compute node.  You can specify the maximum run time (= wall time, not CPU time) for a job using option `-l h_rt=HH:MM:SS` where `HH:MM:SS` specifies the number of hours (`HH`), the number of minutes (`MM`), and the number of seconds (`SS`) - all parts must be specified.  For instance, the following job is expected to run for at most 3 minutes (180 seconds):

```sh
qsub -cwd -l mem_free=2G -l h_rt=00:03:00 script.sh
```

<div class="alert alert-warning" role="alert" markdown="1">
If not specified, the default run time is 14 days, i.e. the maximum allowed.  If your job will run more quickly than that, a more accurate estimate will help the scheduler plan better.  Note, though, that jobs are killed if they hit the run time request, so be sure to leave some leeway in your request.
</div>


## Using local scratch storage [`-l scratch=<amount>`]

Each compute node has {{ site.data.specs.local_scratch_size_min }}-{{ site.data.specs.local_scratch_size_max }} TiB of [local scratch storage](/hpc/about/specs.html#scratch-storage) which is fast and ideal for temporary, intermediate data files that are only needed for the length of a job.  This scratch storage is unique to each machine and shared among all users and jobs running on the same machine.  To minimize the risk of launching a job on a node that have little scratch space left, specify the `-l scratch=size` resource.  For instance, if your job requires 200 GiB of local `/scratch` space, submit the job using:

```sh
qsub -cwd -l scratch=200G script.sh
```

Your job is only guaranteed the amount of available scratch space that you request _when it is launched_.  For more information and best practices, see [Using Local /scratch on Compute Nodes](/hpc/scheduler/using-local-scratch.html).

<div class="alert alert-warning" role="alert" markdown="1">
Please specify `-l scratch=size` when using local `/scratch` and please [clean up afterward](using-local-scratch.html). This maximizes the chance for compute nodes having enough available space, reduces the queuing times, and minimizes the risk for running out of local scratch.
</div>

<div class="alert alert-warning" role="alert" markdown="1">
Note that `-l scratch=size` specifies _space per job_, not per slot.
</div>


If your job would benefit from extra-fast [local scratch storage](/hpc/about/specs.html#scratch-storage), then you can request a node with either a SSD or NVMe scratch drive via the following flag:

```sh
qsub -l ssd_scratch=1
```

## Parallel processing [`-pe <type> <slots>`]

By default, the scheduler will allocate a single core for your job.  To allow the job to use multiple CPU cores, you must run your job in a SGE parallel environment (PE) and tell SGE how many cores the job will use.  Please note that jobs using multiple cores running outside of a parallel environment are subject to termination without warning by the Wynton admins.  There are four parallel environments on Wynton:

* `smp`: for single-host parallel jobs using ['Symmetric multiprocessing (SMP)'](https://en.wikipedia.org/wiki/Symmetric_multiprocessing)
* `mpi`:  for multiple-host parallel jobs based on MPI parallelization
* `mpi_onehost`: for single-host parallel jobs based on MPI parallelization
* `mpi-8`: for multi-threaded multi-host jobs based on MPI parallelization

For any of the above environments, you must request the number of slots needed when you submit the job, e.g. `-pe smp 4`, `-pe mpi_onehost 14`, `-pe mpi 38`, and `-pe mpi-8 40`.


### Single-host parallel processing [`-pe smp <slots>`]

To request four slots (`NSLOTS=4`) on a single host, where _each slot gets 2 GiB of RAM_, for a _total_ of 8 GiB RAM, use:

```sh
qsub -pe smp 4 -l mem_free=2G script.sh
```

The scheduler will make sure your job is launched on a node with at least four slots available.

Note, when writing your script, use SGE environment variable `NSLOTS`, which is set to the number of cores that your job was allocated.  This way you don't have to update your script if you request a different number of cores.  For instance, if your script runs the BWA alignment, have it specify the number of parallel threads as:

```sh
bwa aln -t "${NSLOTS:-1}" ...
```

By using `${NSLOTS:-1}`, instead of just `${NSLOTS}`, this script will fall back to use a single thread if `NSLOTS` is not set, e.g. when running the script on your local computer.

<div class="alert alert-danger" role="alert" markdown="1">
**Do not use more cores than requested!** - a common reason for compute nodes being clogged up and jobs running slowly.  A typically mistake is to hard-code the number of cores in the script and then request a different number when submitting the job - using `NSLOTS` avoids this problem.  Another problem is software that by default use all of the machine's cores - make sure to control for this, e.g. use dedicated command-line option or environment variable for that software.  One such environment variable is `OMP_NUM_THREADS`.  For bash scripts, use `export OMP_NUM_THREADS=${NSLOTS:-1}`.
</div>


### MPI single-host parallel processing [`-pe mpi_onehost <slots>`]

Similarly to the SMP parallel environment, we can request slots on a single host for the main purpose of using MPI to orchestrate the parallel processing.  For example, to request ten such slots, use:

```sh
qsub -pe mpi_onehost 10 -l mem_free=2G script.sh
```

where the job script looks like something like:

```sh
#! /usr/bin/env bash
#$ -S /bin/bash       # the shell language when run via the job scheduler [IMPORTANT]
#$ -cwd               # job should run in the current working directory

module load mpi/openmpi-x86_64

## Important: Make sure to $NHOSTS here
mpirun -np $NSLOTS /path/to/the_app
```


### MPI multi-host parallel processing [`-pe mpi <slots>`]

MPI supports parallelization across multiple hosts where the different parallel processes communicating over the network.  To request a, possible, multi-host job, use `-pi mpi <slots>`.  For example,

```sh
qsub -pe mpi 24 -l mem_free=2G script.sh
```

requests 24 slots, each allotted 2 GiB RAM, with a total of 48 GiB RAM.


### MPI multi-threaded multi-host parallel processing [`-pe mpi_8 <slots>`]

In addition to `-pe mpi_onehost <nslots>` and `-pe mpi <nslots>`, {{ site.cluster.name }} provides a special MPI parallel environment (PE) called `mpi-8` that allocates exactly eight (8) slots per node _across one or more compute nodes_.  For instance, to request a Hybrid MPI job with in total forty slots (40), submit it as:

```sh
qsub -pe mpi-8 40 hybrid_mpi.sh
```

and make sure that the script (here `hybrid_mpi.sh`) exports `OMP_NUM_THREADS=8` (the eight slots per node) and then launches the MPI application using `mpirun -np $(wc -l < "$PE_HOSTFILE") /path/to/the_app`:

```sh
#! /usr/bin/env bash
#$ -S /bin/bash       # the shell language when run via the job scheduler [IMPORTANT]
#$ -cwd               # job should run in the current working directory

module load mpi/openmpi-x86_64
export OMP_NUM_THREADS=8

## Important: Don't use -np $NHOSTS here
mpirun -np $(wc -l < "$PE_HOSTFILE") /path/to/the_app
```

<!--
To request a job where all MPI tasks run on the same machine, use: 

```sh
qsub -pe mpi_onehost 40 hybrid_mpi.sh
```
-->

_Note_: When working with MPI, it is important to use the exact same version as was used to built the software using MPI.  Because of this, we always specify the full `mpi/<version>` path.

<div class="alert alert-warning" role="alert" markdown="1">
Note that mpi-8 jobs must request a multiple of exactly eight (8) slots.  If `NSLOTS` is not a multiple of eight, then the job will be stuck in the queue forever and never run.
</div>

<div class="alert alert-warning" role="alert" markdown="1">
2023-01-23: Due to an SGE issue, you _must not_ use `NHOSTS` as in `mpirun -np $NHOSTS ...`. If done, you might overuse one node and underuse another, when requesting 16 or more slots. Until resolved, please use the `mpirun -np $(wc -l < "$PE_HOSTFILE") ...` solution instead.
</div>



## CPU architecture generation [`-l x86-64-v=<level>`]

All {{ site.cluster.name }} compute nodes have x86-64-compliant CPUs,
but they differ in generation.  There are four major generations of
CPUs - x86-64-v1, x86-64-v2, x86-64-v3, and x86-64-v4 - formally
referred to as [CPU microarchitecture levels]. Most software tools are
compiled such they can run on any of these generations, that is, they
only require a CPU supporting x86-64-v1.  However, some are compiled
to take advantage of more modern CPU instructions, and thereby become
more performant.  Such software tools cannot run on an older
generation of CPUs.  For example, if a tool uses x86-64-v4 CPU
instructions, but is launched on a x86-64-v3 machine, it will
terminate, often with an obscure error, e.g.

```plain
 *** caught illegal operation ***
address 0x2b3a8b234ccd, cause 'illegal operand'
```

or

```plain
Illegal instruction (core dumped)
```

If you have a software tool that requires a specific x86-64 level,
specify it via the `x86-64-v=<level>` resource.  For example,

```sh
qsub -cwd -l x86-64-v=3 script.sh
```

will launch the job on a compute node with x86-64-v3 CPUs or newer.


## Minimum network speed (1 Gbps, 10 Gbps, 40 Gbps) [`-l eth_speed <bandwidth>`]

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


## Submitting a string of commands as job

The `qsub` command typically takes a job-script file as input, but,
alternatively, it can take a sequence of commands on the standard
input (stdin) as input.  For example, consider you want to run two
commands via the job scheduler;

```sh
hostname
date --iso-8601=seconds
```

Instead of creating a script file with those two commands, you can
pass them to `sub` using `echo`:

```sh
$ echo "hostname; date --iso-8601=seconds" | qsub -S /bin/bash -cwd -l mem_free=1G
Your job 2225213 ("STDIN") has been submitted
```


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

For further options and advanced usage, see [Advanced Usage](/hpc/scheduler/advanced-usage.html) of the scheduler.

[SGE environment variable]: /hpc/scheduler/sge-envvars.html
[Job Summary]: /hpc/scheduler/job-summary.html
[development nodes]: /hpc/get-started/development-prototyping.html
[CPU microarchitecture levels]: https://en.wikipedia.org/wiki/X86-64#Microarchitecture_levels
