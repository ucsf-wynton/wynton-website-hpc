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
Arguments are then passed as if you called the script as `script.sh --first=2 --second=true --third="some value" --debug`.  Note how you have to have an extra layer of single quotes around `"some value"`, otherwise `script.sh` will see `--third=some value` as the two arguments `--third=some` and `value`.



## Parallel processing (on a single machine)

The scheduler will allocate a single core for your job.  To allow the job to use multiple cores, request the number of cores needed when you submit the job.  For instance, to request four cores and in _total_ 2 GiB of RAM, use:
```sh
qsub -pe smp 4 -l mem_free=2G script.sh
```
The scheduler will make sure your job is launched on a node with at least four cores available.

Note, when writing your script, use SGE environment variable `NSLOTS`, which is set to the number of cores that your job was allocated.  This way you don't have to update your script if you request a different number of cores.  For instance, if your script runs the BWA alignment, have it specify the number of parallel threads as:
```sh
bwa aln -t $NSLOTS ...
```

_Comment_: SMP stands for [Symmetric multiprocessing](https://en.wikipedia.org/wiki/Symmetric_multiprocessing) and indicates that the job will run on a single machine using one or more cores.



## Interactive jobs

It is not possible to request _interactive_ jobs.  Instead, there [are dedicated interactive nodes](https://github.com/UCSF-HPC/wynton/wiki/Todo) that can be used for building software and prototyping scripts before submitting them to the scheduler.


## See also

For further options and advanced usage, see [Advanced Usage](advanced-usage.html) of the scheduler.
