# Job Summary

The more accurately you can specify the required resources (memory, running time, local scratch needs, ...) of your jobs, the better the job scheduler can serve your needs and often your jobs will be processed sooner.  For instance, if you have a good sense of the amount of memory and run time your job needs, then you can specify these via [SGE resource options]({{ '/scheduler/submit-jobs.html' | relative_url }}) `mem_free` and `h_rt`.  If you don't specify them, your job will use the default settings.

If you don't know how much resources your job consumes, you can add `qstat -j $JOB_ID` to the end of your job script.  This will output a summary of your job to the job output log.  Here is an example of a job that runs R, draws 100 million random numbers and calculates their sample mean (we sleep for 30 seconds so that the scheduler has a chance to snapshot the resources used).  At the end, we output the job summary.

```sh
#!/bin/env bash
#$ -cwd    ## use current working directory
#$ -j yes  ## merge stdout and stderr

## Calculate the mean of 100 million random numbers (~1.0 GiB RAM) in R
Rscript -e "x <- rnorm(n = 100e6); Sys.sleep(30); mean(x)"

## End-of-job summary
qstat -j $JOB_ID
```

As a first guess, we can assume that this script takes at most 5 minutes to run, but let's assume we don't have a good sense on how much memory it will consume, so we submit it as:

```sh
$ qsub -l h_rt=00:05:00 job_summary.pbs
Your job 2264194 ("job_summary.pbs") has been submitted
```

When the job completes, we can find the resources as part of the output file:

```sh
$ grep "usage" job_summary.pbs.o2264194
usage         1:            cpu=00:00:30, mem=1.38664 GB s, io=0.00968 GB, vmem=500.066M, maxvmem=500.066M
```
The full details are available at the end.

With this information, we can narrow down that the total processing time is roughly 30 seconds (`cpu=00:00:30`) and that the maximum amount of virtual memory used was ~500 MiB (`vmem=500.066M`).  If we want to submit this script again, we could submit it, with some margin, using:

```sh
$ qsub -l h_rt=00:01:00 -l mem=1G job_summary.pbs
```



## Full job summary

```sh
$  cat job_summary.pbs.o2264194
[1] -0.0001014335
==============================================================
job_number:                 2264194
exec_file:                  job_scripts/2264194
submission_time:            Sun Oct  7 19:15:29 2018
owner:                      alice
uid:                        60839
group:                      lsd
gid:                        900
sge_o_home:                 /netapp/home/alice
sge_o_log_name:             alice
sge_o_path:                 /opt/sge/bin:/opt/sge/bin/lx-amd64:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/netapp/home/alice/.local/bin:/netapp/home/alice/bin
sge_o_shell:                /bin/bash
sge_o_workdir:              /netapp/home/alice/examples
sge_o_host:                 qb3-dev1
account:                    sge
cwd:                        /netapp/home/alice/examples
merge:                      y
hard resource_list:         h_rt=300
mail_list:                  alice@qb3-dev1
notify:                     FALSE
job_name:                   job_summary.pbs
jobshare:                   0
hard_queue_list:            !gpu.q
env_list:                   TERM=NONE
script_file:                job_summary.pbs
project:                    alicelab
binding:                    NONE
job_type:                   NONE
usage         1:            cpu=00:00:30, mem=1.38664 GB s, io=0.00968 GB, vmem=500.066M, maxvmem=500.066M
binding       1:            NONE
scheduling info:            queue instance "long.q@msg-iogpu1" dropped because it is temporarily not available
                            queue instance "long.q@msg-test3" dropped because it is temporarily not available
                            queue instance "long.q@msg-idgpu1" dropped because it is temporarily not available
                            queue instance "long.q@msg-iogpu14" dropped because it is temporarily not available
                            queue instance "long.q@msg-testgpu1" dropped because it is temporarily not available
                            queue instance "long.q@msg-io9" dropped because it is temporarily not available
                            queue instance "member.q@msg-io9" dropped because it is temporarily not available
                            queue instance "short.q@msg-testgpu1" dropped because it is temporarily not available
                            queue instance "short.q@msg-iogpu1" dropped because it is temporarily not available
                            queue instance "short.q@msg-test3" dropped because it is temporarily not available
                            queue instance "short.q@msg-idgpu1" dropped because it is temporarily not available
                            queue instance "short.q@msg-iogpu14" dropped because it is temporarily not available
                            queue instance "short.q@msg-io9" dropped because it is temporarily not available
                            queue instance "ondemand.q@qb3-int1" dropped because it is temporarily not available
                            queue instance "gpu.q@msg-idgpu1" dropped because it is temporarily not available
                            queue instance "gpu.q@msg-iogpu1" dropped because it is temporarily not available
                            queue instance "gpu.q@msg-iogpu14" dropped because it is temporarily not available
                            queue instance "gpu.q@msg-testgpu1" dropped because it is temporarily not available
                            queue instance "long.q@msg-iogpu11" dropped because it is overloaded: np_load_avg=0.946875 (no load adjustment) >= 0.5
                            queue instance "long.q@msg-io6" dropped because it is overloaded: np_load_avg=0.500000 (no load adjustment) >= 0.5
                            queue instance "long.q@msg-io1" dropped because it is overloaded: np_load_avg=0.500313 (no load adjustment) >= 0.5
                            queue instance "long.q@cdhi-idgpu1" dropped because it is overloaded: np_load_avg=0.537857 (no load adjustment) >= 0.5
                            queue instance "long.q@msg-iogpu10" dropped because it is overloaded: np_load_avg=0.847812 (no load adjustment) >= 0.5
                            queue instance "long.q@mac-id8" dropped because it is overloaded: np_load_avg=0.745179 (no load adjustment) >= 0.5
                            queue instance "long.q@msg-id33" dropped because it is overloaded: np_load_avg=0.750833 (no load adjustment) >= 0.5
                            queue instance "long.q@msg-iogpu9" dropped because it is overloaded: np_load_avg=0.507500 (no load adjustment) >= 0.5
                            queue instance "long.q@msg-id35" dropped because it is overloaded: np_load_avg=0.620625 (no load adjustment) >= 0.5
                            queue instance "long.q@msg-id11" dropped because it is overloaded: np_load_avg=0.510500 (no load adjustment) >= 0.5
                            queue instance "long.q@msg-id31" dropped because it is overloaded: np_load_avg=0.684375 (no load adjustment) >= 0.5
                            queue instance "long.q@msg-id14" dropped because it is overloaded: np_load_avg=0.500500 (no load adjustment) >= 0.5
                            queue instance "long.q@msg-id26" dropped because it is overloaded: np_load_avg=0.507500 (no load adjustment) >= 0.5
                            queue instance "long.q@msg-iogpu12" dropped because it is overloaded: np_load_avg=0.754687 (no load adjustment) >= 0.5
                            queue instance "long.q@msg-iogpu6" dropped because it is overloaded: np_load_avg=0.516875 (no load adjustment) >= 0.5
                            queue instance "short.q@msg-iogpu10" dropped because it is overloaded: np_load_avg=0.847812 (no load adjustment) >= 0.75
                            queue instance "short.q@msg-iogpu12" dropped because it is overloaded: np_load_avg=0.754687 (no load adjustment) >= 0.75
                            queue instance "short.q@msg-iogpu11" dropped because it is overloaded: np_load_avg=0.946875 (no load adjustment) >= 0.75
                            queue instance "short.q@msg-id33" dropped because it is overloaded: np_load_avg=0.750833 (no load adjustment) >= 0.75
                            queue instance "long.q@qb3-test1" dropped because it is disabled
                            queue instance "long.q@qb3-test2" dropped because it is disabled
                            queue instance "long.q@qb3-test7" dropped because it is disabled
                            queue instance "long.q@qb3-test4" dropped because it is disabled
                            queue instance "long.q@qb3-test8" dropped because it is disabled
                            queue instance "long.q@qb3-test5" dropped because it is disabled
                            queue instance "long.q@qb3-test3" dropped because it is disabled
                            queue instance "long.q@qb3-test6" dropped because it is disabled
                            queue instance "long.q@msg-id29" dropped because it is disabled
                            queue instance "long.q@mac-id6" dropped because it is disabled
                            queue instance "member.q@qb3-test1" dropped because it is disabled
                            queue instance "member.q@qb3-test2" dropped because it is disabled
                            queue instance "member.q@qb3-test7" dropped because it is disabled
                            queue instance "member.q@qb3-test4" dropped because it is disabled
                            queue instance "member.q@qb3-test8" dropped because it is disabled
                            queue instance "member.q@qb3-test5" dropped because it is disabled
                            queue instance "member.q@qb3-test3" dropped because it is disabled
                            queue instance "member.q@qb3-test6" dropped because it is disabled
                            queue instance "member.q@msg-id29" dropped because it is disabled
                            queue instance "member.q@mac-id6" dropped because it is disabled
                            queue instance "short.q@qb3-test1" dropped because it is disabled
                            queue instance "short.q@qb3-test2" dropped because it is disabled
                            queue instance "short.q@qb3-test7" dropped because it is disabled
                            queue instance "short.q@mac-id6" dropped because it is disabled
                            queue instance "short.q@qb3-test4" dropped because it is disabled
                            queue instance "short.q@qb3-test8" dropped because it is disabled
                            queue instance "short.q@qb3-test5" dropped because it is disabled
                            queue instance "short.q@qb3-test3" dropped because it is disabled
                            queue instance "short.q@qb3-test6" dropped because it is disabled
                            queue instance "short.q@msg-id29" dropped because it is disabled
                            queue instance "short.q@qb3-hmid1" dropped because it is disabled
                            queue instance "ondemand.q@qb3-hmid1" dropped because it is disabled
                            queue instance "long.q@msg-io7" dropped because it is full
                            queue instance "long.q@msg-io4" dropped because it is full
                            queue instance "long.q@msg-io10" dropped because it is full
                            queue instance "long.q@msg-hmio2" dropped because it is full
                            queue instance "long.q@msg-hmio3" dropped because it is full
                            queue instance "long.q@msg-id10" dropped because it is full
                            queue instance "long.q@msg-iogpu5" dropped because it is full
                            queue instance "long.q@msg-id20" dropped because it is full
                            queue instance "long.q@msg-id7" dropped because it is full
                            queue instance "long.q@msg-io5" dropped because it is full
                            queue instance "long.q@mac-inst-id2" dropped because it is full
                            queue instance "long.q@msg-id13" dropped because it is full
                            queue instance "long.q@msg-id6" dropped because it is full
                            queue instance "long.q@msg-iogpu4" dropped because it is full
                            queue instance "long.q@msg-ihgpu1" dropped because it is full
                            queue instance "long.q@qb3-id3" dropped because it is full
                            queue instance "long.q@msg-id17" dropped because it is full
                            queue instance "long.q@msg-id27" dropped because it is full
                            queue instance "long.q@mac-id4" dropped because it is full
                            queue instance "long.q@msg-id28" dropped because it is full
                            queue instance "long.q@msg-id2" dropped because it is full
                            queue instance "long.q@mac-id2" dropped because it is full
                            queue instance "long.q@msg-id19" dropped because it is full
                            queue instance "long.q@msg-io3" dropped because it is full
                            queue instance "long.q@mac-id3" dropped because it is full
                            queue instance "long.q@msg-id1" dropped because it is full
                            queue instance "long.q@cc-id3" dropped because it is full
                            queue instance "long.q@cc-id1" dropped because it is full
                            queue instance "long.q@msg-hmio1" dropped because it is full
                            queue instance "long.q@qb3-id1" dropped because it is full
                            queue instance "long.q@msg-id38" dropped because it is full
                            queue instance "long.q@msg-id15" dropped because it is full
                            queue instance "long.q@msg-id32" dropped because it is full
                            queue instance "long.q@msg-id4" dropped because it is full
                            queue instance "long.q@msg-id16" dropped because it is full
                            queue instance "long.q@msg-id8" dropped because it is full
                            queue instance "long.q@cc-id2" dropped because it is full
                            queue instance "long.q@mac-id5" dropped because it is full
                            queue instance "long.q@msg-ihgpu3" dropped because it is full
                            queue instance "long.q@mac-inst-id3" dropped because it is full
                            queue instance "long.q@msg-id36" dropped because it is full
                            queue instance "long.q@mac-inst-id1" dropped because it is full
                            queue instance "long.q@msg-iogpu7" dropped because it is full
                            queue instance "long.q@msg-iogpu13" dropped because it is full
                            queue instance "long.q@msg-io2" dropped because it is full
                            queue instance "long.q@msg-iogpu2" dropped because it is full
                            queue instance "long.q@msg-iogpu3" dropped because it is full
                            queue instance "long.q@msg-id22" dropped because it is full
                            queue instance "long.q@msg-id21" dropped because it is full
                            queue instance "long.q@msg-id37" dropped because it is full
                            queue instance "long.q@msg-id9" dropped because it is full
                            queue instance "long.q@msg-id18" dropped because it is full
                            queue instance "long.q@msg-id23" dropped because it is full
                            queue instance "long.q@msg-id40" dropped because it is full
                            queue instance "long.q@msg-id3" dropped because it is full
                            queue instance "long.q@msg-id39" dropped because it is full
                            queue instance "long.q@qb3-id2" dropped because it is full
                            queue instance "long.q@msg-ihgpu2" dropped because it is full
                            queue instance "long.q@cc-hmid1" dropped because it is full
                            queue instance "long.q@msg-id34" dropped because it is full
                            queue instance "long.q@msg-io8" dropped because it is full
                            queue instance "long.q@msg-id30" dropped because it is full
                            queue instance "long.q@mac-id1" dropped because it is full
                            queue instance "long.q@msg-id12" dropped because it is full
                            queue instance "long.q@mac-id7" dropped because it is full
                            queue instance "long.q@msg-id25" dropped because it is full
                            queue instance "long.q@msg-id5" dropped because it is full
                            queue instance "long.q@mac-inst-hmid1" dropped because it is full
                            queue instance "long.q@msg-iogpu8" dropped because it is full
                            queue instance "long.q@msg-id24" dropped because it is full
                            queue instance "member.q@msg-id35" dropped because it is full
                            queue instance "member.q@msg-id33" dropped because it is full
                            queue instance "gpu.q@msg-iogpu11" dropped because it is full
                            queue instance "gpu.q@msg-iogpu10" dropped because it is full
                            queue instance "gpu.q@msg-iogpu6" dropped because it is full
                            queue instance "gpu.q@msg-iogpu4" dropped because it is full
                            queue instance "gpu.q@msg-iogpu9" dropped because it is full
                            queue instance "gpu.q@msg-iogpu12" dropped because it is full
```
