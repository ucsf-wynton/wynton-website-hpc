# Job Summary

The more accurately you can specify the required resources (memory, running time, local scratch needs, ...) of your jobs, the better the job scheduler can serve your needs and often your jobs will be processed sooner.  For instance, if you have a good sense of the amount of memory and run time your job needs, then you can specify these via [SGE resource options]({{ '/scheduler/submit-jobs.html' | relative_url }}) `mem_free` and `h_rt`.  If you don't specify them, your job will use the default settings.

If you don't know how much resources your job consumes, you can add `qstat -j $JOB_ID` to the end of your job script.  This will output a summary of your job to the job output log.  Here is an example of a job that runs R, draws 100 million random numbers and calculates their summary statistics. We also call the garbage collector 1,000 times to emulate some CPU processing to give the scheduler enough time to snapshot the job.  At the end, we output the job summary.

```sh
#!/bin/env bash
#$ -cwd    ## use current working directory
#$ -j yes  ## merge stdout and stderr

## Summarize 100 million random numbers in R, which occupies
## 100e6 * 8 bytes = 0.80 GB of RAM.
## We also run the garbage collector 1,000 times to
## emulate some CPU processing time
Rscript -e "x <- rnorm(100e6); for (i in 1:1e3) gc(); summary(x)"

## End-of-job summary
qstat -j $JOB_ID
```

As a first guess, we can assume that this script takes at most 5 minutes to run, but let's assume we don't have a good sense on how much memory it will consume, so we submit it as:

```sh
$ qsub -l h_rt=00:05:00 job_summary.sge
Your job 2854740 ("job_summary.sge") has been submitted
```

When the job completes, we can find the resources as part of the output file:

```sh
$ grep "usage" job_summary.sge.o2854740
usage         1:            cpu=00:00:14, mem=6.82412 GB s, io=0.00903 GB, vmem=810.203M, maxvmem=810.203M
```
The full details are available at the end.

With this information, we can narrow down that the total processing time was 14 seconds (`cpu=00:00:14`) and that the maximum amount of virtual memory used was ~810 MB (`maxvmem=810.203M`).  With the help of `cpu` and `maxvmem` from previous runs, we can re-submit this job script with more relevant resource specifications;

```sh
$ qsub -l h_rt=00:01:00 -l mem=1G job_summary.sge
```


_Comment_: Note that the `mem` value has unit `GB s` (GB * seconds), which is because it is the "accumulated memory usage of the job in Gbytes seconds".


## Full job summary

```sh
$ cat job_summary.sge.o2854740
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
-5.379004 -0.674312  0.000100  0.000069  0.674541  6.314641 
==============================================================
job_number:                 2854740
exec_file:                  job_scripts/2854740
submission_time:            Fri Nov  2 22:32:57 2018
owner:                      alice
uid:                        59999
group:                      cbi
gid:                        34001
sge_o_home:                 /wynton/home/alice
sge_o_log_name:             alice
sge_o_path:                 /opt/sge/bin:/opt/sge/bin/lx-amd64:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/wynton/home/alice/.local/bin:/wynton/home/alice/bin
sge_o_shell:                /bin/bash
sge_o_workdir:              /wynton/home/alice/ex
sge_o_host:                 qb3-dev1
account:                    sge
cwd:                        /wynton/home/alice/ex
merge:                      y
hard resource_list:         h_rt=300
mail_list:                  alice@qb3-dev1
notify:                     FALSE
job_name:                   job_summary.sge
jobshare:                   0
hard_queue_list:            !gpu.q
env_list:                   TERM=NONE
script_file:                job_summary.sge
project:                    boblab
binding:                    NONE
job_type:                   NONE
usage         1:            cpu=00:00:14, mem=6.82412 GB s, io=0.00903 GB, vmem=810.203M, maxvmem=810.203M
binding       1:            NONE
scheduling info:            queue instance "long.q@msg-test3" dropped because it is temporarily not available
                            queue instance "long.q@msg-iogpu14" dropped because it is temporarily not available
                            ...
                            queue instance "long.q@qb3-test3" dropped because it is disabled
                            queue instance "long.q@qb3-test7" dropped because it is disabled
                            ...
                            queue instance "gpu.q@msg-iogpu12" dropped because it is full
                            queue instance "gpu.q@msg-ihgpu2" dropped because it is full
                            queue instance "gpu.q@msg-iogpu13" dropped because it is full
```
