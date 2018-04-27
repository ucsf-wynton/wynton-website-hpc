# Submit Jobs

## Submit a script

To submit a shell script to the scheduler that needs 1 GiB of RAM (`-l mem_free=1G`) and such that it will run in the current working directory (`-cwd`), use:
```sh
qsub -cwd -l mem_free=1G script.sh
```
The scheduler will assign your job a unique (numeric) job ID.



### Passing arguments to script

You can pass arguments to a job script similarly to how one passes argument to a script executed on the command line, e.g.
```sh
qsub -cwd -l mem_free=1G script.sh --first=2 --second=true --third='"some value"' --debug
```
Arguments are then passed as if you called the script as `script.sh --first=2 --second=true --third="some value" --debug`.  Note how you have to have an extra layer of single quotes around `"some value"`, otherwise `script.sh` will see `--third=some value` as two independent arguments (`--third=some` and `value`).


## Specifying (maximum) run time

By specifying the how long each job will take, the better the scheduler can manage resources and allocate jobs to different nodes.  This will also decrease the average waiting time the job will sit in the queue before being launched on a compute node.  You can specify the maximum run time for a job using option `-l h_rt=HH:MM:SS` where `HH:MM:SS` specifies the number of hours (`HH`), the number of minutes (`MM`), and the number of seconds (`SS`) - all parts must be specified.  For instance, the following job is expected to run for at most 3 minutes (180 seconds):
```sh
qsub -cwd -l mem_free=1G -l h_rt=00:03:00 script.sh
```

<div class="alert alert-warning" role="alert">
A job that runs longer than the requested run time, will be terminated by the scheduler.  Because of this, you may add a little bit of extra time to give your job some leeway.
</div>




## Parallel processing (on a single machine)

The scheduler will allocate a single core for your job.  To allow the job to use multiple cores, request the number of cores needed when you submit the job.  For instance, to request four cores and in _total_ 2 GiB of RAM, use:
```sh
qsub -pe smp 4 -l mem_free=2G script.sh
```
The scheduler will make sure your job is launched on a node with at least four cores available.

Note, when writing your script, use [SGE environment variable] `NSLOTS`, which is set to the number of cores that your job was allocated.  This way you don't have to update your script if you request a different number of cores.  For instance, if your script runs the BWA alignment, have it specify the number of parallel threads as:
```sh
bwa aln -t $NSLOTS ...
```

_Comment_: SMP stands for [Symmetric multiprocessing](https://en.wikipedia.org/wiki/Symmetric_multiprocessing) and indicates that the job will run on a single machine using one or more cores.


<div class="alert alert-danger" role="alert">
<strong>Do not use more cores than requested!</strong> - a common reason for compute nodes being clogged up and jobs running slowly.  A typically mistake is to hard-code the number of cores in the script and then request a different number when submitting the job - using <code>NSLOTS</code> avoids this problem.  Another problem is software that by default use all of the machine's cores - make sure to control for this, e.g. use dedicated command-line option or environment variable for that software.
</div>



## Developing, prototyping jobs

It is currently not possible to request _interactive jobs_.  Instead, there are dedicated [development nodes] that can be used for short-term interactive development needs such building software and prototyping scripts before submitting them to the scheduler.


## See also

For further options and advanced usage, see [Advanced Usage](advanced-usage.html) of the scheduler.

[SGE environment variable]: {{ '/scheduler/sge-envvars.html' | relative_url }}
[interactive nodes]: {{ '/get-started/interactive-usage.html' | relative_url }}
