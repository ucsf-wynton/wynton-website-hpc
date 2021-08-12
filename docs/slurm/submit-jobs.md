# Submit Jobs to Slurm

Here is what a typical job submission of shell script `script.sh` would look like from the command line:

```sh
sbatch --ntasks=4 --mem-per-cpu=2G --tmp=50G --time=00:20:00 script.sh
```

This job submission will submit `script.sh` to the job scheduler which will eventually launch the job on one the compute nodes that can meet the resource needs of the job.  Exactly, what these options are is explained below sections, but in summary, the above will result in:

* `--workdir=<directory>`: the working directory will be set to the same directory as from where the submission was done unless specified otherwise with `--workdir`
* `-n 4` / `--ntasks=4`: the job will be allotted four slots ("cores") on a single machine
* `--mem-per-cpu=2G`: the job will be allotted 2 GiB of RAM per slot, i.e. 8 GiB in total.
* `--tmp=50G`: the job will be launched on a compute node with at least 50 GiB of local `/scratch` available
* `--time=00:20:00`: the scheduler knows that the job to run no longer than 20 minutes allowing it to be scheduled much sooner than if no run-time was specified
* `script.sh`: the shell script to be run

## Sample submit script

Before you can submit jobs to the compute nodes, you should prepare a script like the one below. Split your jobs into smaller tasks varying only in input parameters. You can then submit the jobs from a login node or a dev node. (Note: _do not_ include the `#--` comments in your script - that won't work.)

```sh
#!/bin/bash                             
#                                       #-- what is the language of this shell & what language is your job in
#                                       #-- Any line that starts with #SBATCH is an instruction to Slurm
#SBATCH --output=[dir/file]             #-- output file relative to current directory (fill in)
#SBATCH --error=[dir/file]              #-- error file relative to current directory (fill in, omit if you want to combine output and error)
#SBATCH --requeue                       #-- tell the system that if a job crashes, it should be requeud
#SBATCH --mem-per-cpu=100MB             #-- submits on nodes with enough free memory (required)
#SBATCH --tmp=200GB                     #-- TMP/Scratch Space Available for job
#SBATCH --time=24:00:00                 #-- runtime limit (see above; this requests 24 hours)
##SBATCH --array=1-10                   #-- remove first '#' to specify the number of
                                        #-- tasks if desired (see Tips section on this page)

# Anything under here can be a bash script

# If you used the -t option above, this same script will be run for each task,
# but with $SGE_TASK_ID set to a different value each time (1-10 in this case).
# The commands below are one way to select a different input (PDB codes in
# this example) for each task.  Note that the bash arrays are indexed from 0,
# while task IDs start at 1, so the first entry in the tasks array variable
# is simply a placeholder

#tasks=(0 1bac 2xyz 3ijk 4abc 5def 6ghi 7jkl 8mno 9pqr 1stu )
#input="${tasks[$SLURM_TASK_ID]}"

date
hostname

## End-of-job summary, if running as a job
[[ -n "$SLURM_JOB_ID" ]] && sstat --format="JobID,AveCPU,MaxRSS,MaxPages,MaxDiskRead,MaxDiskWrite" -j "$SLURM_JOB_ID"         # This is useful for debugging and usage purposes,
                                                                                                                              # e.g. "did my job exceed its memory request?"
```

## Submit a script to run in the current working directory

To submit a shell script to the scheduler such that it will run in the current working directory (`-cwd`), use:
```sh
sbatch script.sh
```
The scheduler will assign your job a unique (numeric) job ID.


## Specifying (maximum) memory usage

Unless specified, the maximum amount of memory used at any time is 1 GiB per slot (`--mem-per-cpu=1G`).  A job that need to use more memory, need to request that when submitted.  For example, a job that needs (at most) 10 GiB of memory should be submitted as:
```sh
sbatch --mem-per-cpu=10G script.sh
```

The scheduler will launch this job on the first available compute node with that amount of memory available.

_TIPS_: Add `squeue $SLURM_JOB_ID` to the end of your script to find out how much memory and CPU time your job needed.  See [Job Summary] page for more details.

<div class="alert alert-warning" role="alert">
A job that consumes more memory than requested may be terminated by the administrators and in the future possibly automatically by the scheduler.  Because of this, you may request a bit more memory in order to give your job some leeway.
</div>

<div class="alert alert-warning" role="alert">
Note that <code>--mem-per-cpu=size</code> specifies <em>memory per slot</em>, not per job.
</div>



## Specifying (maximum) run time

<div class="alert alert-info" role="alert">
Specifying the run time will shorten the queuing time - significantly so for short running jobs.
</div>

By specifying the how long each job will take, the better the scheduler can manage resources and allocate jobs to different nodes.  This will also decrease the average waiting time the job will sit in the queue before being launched on a compute node.  You can specify the maximum run time (= wall time, not CPU time) for a job using option `--time=HH:MM:SS` where `HH:MM:SS` specifies the number of hours (`HH`), the number of minutes (`MM`), and the number of seconds (`SS`) - all parts must be specified.  For instance, the following job is expected to run for at most 3 minutes (180 seconds):
```sh
sbatch --mem-per-cpu=2G --time=00:03:00 script.sh
```

<div class="alert alert-warning" role="alert">
If not specified, the default run time is 30 minutes.  A job that runs longer than the requested run time will be terminated by the scheduler.  Because of this, you may add a little bit of extra time to give your job some leeway.
</div>



## Using local scratch storage

Each compute node has {{ site.data.specs.local_scratch_size_min }}-{{ site.data.specs.local_scratch_size_max }} TiB of [local scratch storage]({{ '/about/specs.html#scratch-storage' | relative_url }}) which is fast and ideal for temporary, intermediate data files that are only needed for the length of a job.  This scratch storage is unique to each machine and shared among all users and jobs running on the same machine.  To minimize the risk of launching a job on a node that have little scratch space left, specify the `--tmp=size` resource.  For instance, if your job requires 200 GiB of local `/scratch` space, submit the job using:
```sh
sbatch --tmp=200GB script.sh
```

Your job is only guaranteed the amount of available scratch space that you request _when it is launched_.  For more information and best practices, see [Using Local /scratch on Compute Nodes]({{ 'using-local-scratch.html' | relative_url}}).

<div class="alert alert-warning" role="alert">
Please specify <code>--tmp=size</code> when using local <code>/scratch</code>.  This maximizes the chance for compute nodes having enough available space, reduces the queuing times, and minimizes the risk for running out of local scratch. Note, the directories created for your job TMPDIR in local /scratch are deleted when your job finishes.
</div>

<div class="alert alert-warning" role="alert">
Note that <code>--tmp=size</code> specifies <em>space per job</em>, not per slot.
</div>


If your job would benefit from extra-fast [local scratch storage]({{ '/about/specs.html#scratch-storage' | relative_url }}), then you can request a node with either a SSD or NVMe scratch drive via the following flag:
```sh
sbatch --constraint=ssd
```
Or in a batch script:

```sh
#SBATCH -C ssd
```


## Using Software Modules in a Job Script

Slurm does not process login scripts (.bashrc, .bash_profile, .cshrc, etc.) when executing jobs on compute nodes, so it does not inherit the local environment variables necessary for modules to work properly.

To use environment variables in a Slurm job script, you must tell it to process your .bash_profile so it behaves as if it were logging in.

For example, the following script loads the CBI repository and cellranger version 3.1.0.

```sh
#!/bin/sh
#
#SBATCH -J ModuleTest
. $HOME/.bash_profile
module load CBI
module load cellranger/3.1.0
/bin/echo Which CellRanger am I using: `which cellranger`
/bin/echo Here I am: `hostname`
/bin/echo In directory: `pwd`
/bin/echo Today: `date`

```

## Parallel processing (on a single machine)

The scheduler will allocate a single core for your job.  To allow the job to use multiple slots, request the number of slots needed when you submit the job.  For instance, to request four slots (`NSLOTS=4`) _each with 2 GiB of RAM_, for a _total_ of 8 GiB RAM, use:
```sh
sbatch --nodes=1 --ntasks=4 --mem-per-cpu=2G script.sh
```
The scheduler will make sure your job is launched on a node with at least four slots available.

Note, when writing your script, use [Slurm environment variable] `SLURM_CPUS_PER_TASK`, which is set to the number of cores that your job was allocated.  This way you don't have to update your script if you request a different number of cores.  For instance, if your script runs the BWA alignment, have it specify the number of parallel threads as:

```sh
bwa aln -t $SLURM_CPUS_PER_TASK ...
```
_Comment_: PE stands for 'Parallel environment'.  SMP stands for ['Symmetric multiprocessing'](https://en.wikipedia.org/wiki/Symmetric_multiprocessing) and indicates that the job will run on a single machine using one or more cores.


<div class="alert alert-danger" role="alert">
<strong>Do not use more cores than requested!</strong> - a common reason for compute nodes being clogged up and jobs running slowly.  A typically mistake is to hard-code the number of cores in the script and then request a different number when submitting the job - using <code>NSLOTS</code> avoids this problem.  Another problem is software that by default use all of the machine's cores - make sure to control for this, e.g. use dedicated command-line option or environment variable for that software.
</div>


## Minimum network speed (1g=1 Gbps, 10g=10 Gbps, 40g=40 Gbps)

The majority of the compute nodes have 1 Gbps and 10 Gbps network cards while a few got 40 Gbps cards.  A job that requires 10-40 Gbps network speed can request this by specifying the constraint reflecting the speed (sic!) resource, e.g. to request the job be run only on a server with a 10g or 40g connection, the pipe (|) is used to specify the "or" operator for the two values.

```sh
sbatch --constraint="10g|40g"
```
A job requesting the constraint 40g will end up only on a 40 Gbps node, and a job that does not specify will end up on any node that is available.



## Passing arguments to script

You can pass arguments to a job script similarly to how one passes argument to a script executed on the command line, e.g.
```sh
sbatch --mem-per-cpu=1G script.sh --first=2 --second=true --third='"some value"' --debug
```
Arguments are then passed as if you called the script as `script.sh --first=2 --second=true --third="some value" --debug`.  Note how you have to have an extra layer of single quotes around `"some value"`, otherwise `script.sh` will see `--third=some value` as two independent arguments (`--third=some` and `value`).


## Interactive jobs

It is currently _not_ possible to request _interactive_ jobs (aka `srun`).  Instead, there are dedicated [development nodes] that can be used for short-term interactive development needs such building software and prototyping scripts before submitting them to the scheduler.



## MPI: Parallel processing 

{{ site.cluster.name }} provides an MPI parallel environment via OpenMPI.  For instance, to request an MPI job with in total 64 slots (`--ntasks=64`), submit it as:

```sh
srun --ntasks=64 hellompi.sh
```
Here is an example script:

```sh
#!/bin/bash

#SBATCH --job-name=hellompi
#SBATCH --output=hellompi.%j.out
#SBATCH --ntasks=64
# Load the default OpenMPI module.
. $HOME/.bash_profile
module load mpi/openmpi-x86_64

# Run the hellompi program with mpirun. The -n flag is not required;
# mpirun will automatically figure out the best configuration from the
# Slurm environment variables.
mpirun ./hellompi

```

## Hybrid MPI (multi-threaded multi-node MPI jobs)

Slurm example to run a hybrid MPI/OpenMPI job.

```sh
#!/bin/bash

# A job submission script for running a hybrid MPI/OpenMP job called hellohybrid on
# Wynton.

#SBATCH --job-name=hellohybrid
#SBATCH --output=hellohybrid.%j.out
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=8

# Load the default OpenMPI module.
. $HOME/.bash_profile
module load mpi/openmpi-x86_64

# Set OMP_NUM_THREADS to the number of CPUs per task we asked for.
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# Run the process with mpirun. Note that the -n option is not required
# in this case; mpirun will automatically determine how many processes
# to run from the Slurm settings.
mpirun ./hellohybrid

```

The options are similar to running an MPI job, with some differences:

`--ntasks=4` specifies the number of MPI processes (“tasks”).

`--cpus-per-task=8` allocates 8 CPUs for each task.

`export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK` sets the number of OpenMP threads to the number of requested cores (CPUs) for each task.


_Comment_: MPI stands for ['Message Passing Interface'](https://en.wikipedia.org/wiki/Message_Passing_Interface).



<!--
## Defaults

* Memory usage (per slot): If not specified, the default is `--mem-per-cpu=1G`.

* Working directory: If not specified (e.g. `-cwd`), the default working directory is `$HOME`.
-->

## Tips

- An array job is a collection of similar serial jobs which can be submitted and controlled together. For example, `--array=1-10` runs 10 tasks in an array. Each task runs the same script, but gets a different value for the `$SLURM_ARRAY_JOB_ID` environment variable (from '1' to '10' in this example). You can use this to choose different inputs or other parameters for each task.
- The Slurm manual pages are installed on all login and dev nodes. For more information type `man sbatch`, `man squeue`, `man sinfo`, etc.


## See also

[Slurm Quick Reference](https://slurm.schedmd.com/pdfs/summary.pdf)

For further options and advanced usage, see [Advanced Usage]({{ 'advanced-usage.html' | relative_url }}) of the scheduler.

[Slurm environment variable]: {{ '/slurm/slurm-envvars.html' | relative_url }}

[Job Summary]: {{ '/slurm/job-summary.html' | relative_url }}

[development nodes]: {{ '/get-started/development-prototyping.html' | relative_url }}
