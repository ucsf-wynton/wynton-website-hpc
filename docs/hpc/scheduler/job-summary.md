# Job Summary

## Output job details at end of job

The more accurately you can specify the required resources (memory, running time, local scratch needs, ...) of your jobs, the better the job scheduler can serve your needs and often your jobs will be processed sooner.  For instance, if you have a good sense of the amount of memory and run time your job needs, then you can specify these via [SGE resource options](/hpc/scheduler/submit-jobs.html) `mem_free` and `h_rt`.  If you don't specify them, your job will use the default settings.

If you don't know how much resources your job consumes, you can add `qstat -j $JOB_ID` to the end of your job script.  This will output a summary of your job to the job output log.  Here is an example of a job that runs R, draws 100 million random numbers and calculates their summary statistics. We also call the garbage collector 1,000 times to emulate some CPU processing to give the scheduler enough time to snapshot the job.  At the end, we output the job summary.

```sh
#!/bin/env bash
#$ -S /bin/bash  # the shell language when run via the job scheduler [IMPORTANT]
#$ -cwd          # use current working directory
#$ -j yes        # merge stdout and stderr

## Summarize 100 million random numbers in R, which occupies
## 100e6 * 8 bytes = 0.80 GB of RAM.
## We also run the garbage collector 1,000 times to
## emulate some CPU processing time
Rscript -e "x <- rnorm(100e6); for (i in 1:1e3) gc(); summary(x)"

## End-of-job summary, if running as a job
[[ -n "$JOB_ID" ]] && qstat -j "$JOB_ID"
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


Here is an example of the job summary outputted from the above job script:

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
group:                      boblab
gid:                        34001
sge_o_home:                 /wynton/home/alice
sge_o_log_name:             alice
sge_o_path:                 /opt/sge/bin:/opt/sge/bin/lx-amd64:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/wynton/home/alice/.local/bin:/wynton/home/alice/bin
sge_o_shell:                /bin/bash
sge_o_workdir:              /wynton/home/alice/ex
sge_o_host:                 dev1
account:                    sge
cwd:                        /wynton/home/alice/ex
merge:                      y
hard resource_list:         h_rt=300
mail_list:                  alice@dev1
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


## Post-mortem job details

Sometimes your job "just dies". There is often a simply explanation to this but finding out why can be complicated at first, especially if there are no clues in the job log files.

One common reason for jobs terminating early is that it ran out of the requested runtime (`-l h_rt=<runtime>`).  When that happens, the log files appear to have ended abruptly (which is not too far from the truth).  It is tempting to try us `qstat -j <jobid>` to find out more;

```sh
$ qstat -j 191442
Following jobs do not exist: 
191442
```

Unfortunately, that does not work because the job no longer exist.  Instead, we have to go look into the SGE logs.  More specifically, we can scan the SGE "accounting" file, which records summaries of all jobs, for information on our terminated job.  The SGE accounting file is huge so we don't want to scan all of it.  Instead, we search only the end of it but making a best guess of what "end of it" means.  Below, we start at the 100,000 last rows and scan for our job. If no output is produced, try to increase the number of lines scanned.

```sh
$ tail -100000 /opt/sge/wynton/common/accounting | qacct -f - -j 191442
==============================================================
qname        long.q
hostname     qb3-id95
group        boblab
owner        alice
project      boblab
department   defaultdepartment
jobname      run.sge
jobnumber    191442
taskid       undefined
account      sge
priority     19
qsub_time    Wed Feb 12 20:59:18 2020
start_time   Wed Feb 12 21:01:50 2020
end_time     Wed Feb 12 22:01:50 2020
granted_pe   smp
slots        10
failed       37  : qmaster enforced h_rt, h_cpu, or h_vmem limit
exit_status  137                  (Killed)
ru_wallclock 3600s
ru_utime     1.373s
ru_stime     0.883s
ru_maxrss    58.508KB
ru_ixrss     0.000B
ru_ismrss    0.000B
ru_idrss     0.000B
ru_isrss     0.000B
ru_minflt    194382
ru_majflt    44
ru_nswap     0
ru_inblock   26278
ru_oublock   563
ru_msgsnd    0
ru_msgrcv    0
ru_nsignals  0
ru_nvcsw     10787
ru_nivcsw    316
cpu          12195.120s
mem          4.030TBs
io           379.956GB
iow          0.000s
maxvmem      20.610GB
arid         undefined
ar_sub_time  undefined
category     -u alice -q !gpu.q -l h_rt=3600,mem_free=25G -pe smp 10
```

When looking at this output, we first focus on the lines:

```sh
failed       37  : qmaster enforced h_rt, h_cpu, or h_vmem limit
exit_status  137                  (Killed)
```

First of all, the `exit_status` line is not zero (`0`); any software with an exit code other than zero indicates that something went wrong.  It could be due to an error (typically `exit_status = 1`), or as here `137` with suggests that the job was "killed".  If we look at `failed`, we see that some rules were enforced, which in our case suggests that the rule for resource `h_rt` was enforced.

Next, if we look at: 
```sh
ru_wallclock 3600s
ru_utime     1.373s
ru_stime     0.883s
```

We see that the job maxed out at a `ru_wallclock` runtime at 3600 seconds, i.e. 1 hour.  This is indeed the maximum runtime requested, which we can infer from:
```sh
category     -u alice -q !gpu.q -l h_rt=3600,mem_free=25G -pe smp 10
```

**Conclusion**: Job 191442 was killed by the job scheduler because it ran out of its requested runtime.

_Comment_: For jobs that finished on or prior to 2022-03-02, use the SGE accounting file `/opt/sge/wynton/common/accounting-20220302`.


### See also

You can read about all `qacct` output fields and what they mean in `man sge_status` and `man accounting`.
