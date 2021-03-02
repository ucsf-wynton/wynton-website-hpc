# Job Summary

## Output job details at end of job

The more accurately you can specify the required resources (memory, running time, local scratch needs, ...) of your jobs, the better the job scheduler can serve your needs and often your jobs will be processed sooner.  For instance, if you have a good sense of the amount of memory and run time your job needs, then you can specify these via [Slurm options]({{ '/slurm/submit-jobs.html' | relative_url }}) `--mem` and `--time`.  If you don't specify them, your job will use the default settings.

If you don't know how much resources your job consumes, you can add `sstat` to the end of your job script.  This will output a summary of your job to the job output log.  Here is an example of a job that runs R, draws 100 million random numbers and calculates their summary statistics. We also call the garbage collector 1,000 times to emulate some CPU processing to give the scheduler enough time to snapshot the job.  At the end, we output the job summary.

```sh
#!/bin/env bash
#$ -cwd    ## use current working directory
#$ -j yes  ## merge stdout and stderr

## Summarize 100 million random numbers in R, which occupies
## 100e6 * 8 bytes = 0.80 GB of RAM.
## We also run the garbage collector 1,000 times to
## emulate some CPU processing time
Rscript -e "x <- rnorm(100e6); for (i in 1:1e3) gc(); summary(x)"

## End-of-job summary, if running as a job
[[ -n "$SLURM_JOB_ID" ]] && sstat --format="JobID,AveCPU,MaxRSS,MaxPages,MaxDiskRead,MaxDiskWrite" -j "$SLURM_JOB_ID"
```

The `sstat` call will append something like the following to our slurm log file:

```sh
       JobID     AveCPU     MaxRSS MaxPages  MaxDiskRead MaxDiskWrite 
------------ ---------- ---------- -------- ------------ ------------ 
5122.batch    00:00.000   3186108K        0      9295430        16167
```

When the job completes, we can find the resources as part of the output file:

```sh
$ grep "usage" job_summary.sge.o2854740
usage         1:            cpu=00:00:14, mem=6.82412 GB s, io=0.00903 GB, vmem=810.203M, maxvmem=810.203M
```
The full details are available at the end.

From this we learn that:

  -  JobID: 5121.batch - the job id and job step
  -  AveCPU: 00:00.000 - average (system + user) CPU time (mm:ss.uuu)
  -  MaxRSS: 3186112K - maximum memory use (resident set size); --mem must be greater than this
  -  MaxPages: 0 - maximum number of memory cache misses (page faults); the smaller this number, the more efficient is the software implemented
  -  MaxDiskRead: 9295463 - maximum number of bytes read
  -  MaxDiskWrite: 16167 - maximum number of bytes written

See `man sstat` for details on these and what other fields are available.

_Comment_: The reason for the ‘AveCPU’ time being zero is currently unknown to us /2020-01-05


## Job summary of an already finished job

Complementary to outputting `sstat` information at the end of a job, we can also use sacct to query the Slurm accounting database for a summary of the job after it has finished. Here are some of the accounting details available for above job:

```sh
[alice@c4-log1 ~]$ sacct --format="JobID,State,ExitCode,Submit,Start,Elapsed,AveCPU,CpuTime,MaxRSS,MaxPages,MaxDiskRead,MaxDiskWrite" -j 5121
       JobID      State ExitCode              Submit               Start    Elapsed     AveCPU    CPUTime     MaxRSS MaxPages  MaxDiskRead MaxDiskWrite 
------------ ---------- -------- ------------------- ------------------- ---------- ---------- ---------- ---------- -------- ------------ ------------ 
5121          COMPLETED      0:0 2021-01-05T13:49:29 2021-01-05T13:49:30   00:00:46              00:00:46                                               
5121.batch    COMPLETED      0:0 2021-01-05T13:49:30 2021-01-05T13:49:30   00:00:46   00:00:00   00:00:46   3186112K        0        8.86M        0.02M
```
For more details and additional statistics collected, see man `sacct`.

With this information, we can narrow down that the total processing time was 46 seconds (`Elapsed=00:00:46`) and that the maximum amount of resident set size memory used was ~3,111 MiB (`MaxRSS=3186112K`). With the help of Elapsed and MaxRSS from previous runs, we can re-submit this job script with more relevant resource specifications in our Slurm options within the script (eg `--mem=3500M`). Remember it pays to keep the mem request as small as possible. Jobs with large memory requests will sit in the queue longer.

## Post-mortem job details

Sometimes your job "just dies". There is often a simply explanation to this but finding out why can be complicated at first, especially if there are no clues in the job log files.

One common reason for jobs terminating early is that it ran out of the requested runtime (`--time=<runtime>`).  When that happens, the log files appear to have ended abruptly (which is not too far from the truth).  If you requested email notifications, then those messages will show something like:
 
```sh
Slurm Job_id=1034 Name=bam_test Failed, Run time 00:01:13, TIMEOUT, ExitCode 0
```
You can also look in the job log file:
```sh
$ cat slurm-1034.log
...
slurmstepd: error: *** JOB 1034 ON c4-n1 CANCELLED AT 2020-12-18T15:51:53 DUE TO TIME LIMIT 
```
You would see a similar error for other resources. For memory:
```sh
$ cat slurm-1007.log
...
slurmstepd: error: Detected 1 oom-kill event(s) in step 1007.batch cgroup. Some of your processes may have been killed by the cgroup out-of-memory handler.
```
