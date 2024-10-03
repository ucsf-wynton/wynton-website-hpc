# List Jobs

You can list all your submitted jobs, queued and running, using:

```sh
qstat
```


To get detailed information on a specific job, your or others, use:

```sh
qstat -j <job_id>
```


## List jobs of other users

To see jobs of another user, use:

```sh
qstat -u <user>
```

To see jobs of all users, use:

```sh
qstat -u '*'
```

For example,

```sh
$ qstat -u '*'
job-ID  prior   name       user state submit/start at     queue           slots ja-task-ID
------------------------------------------------------------------------------------------
380725 0.05508 job_qb3.sh alice     r 04/20/2018 15:24:13 long.q@mac-inst-hmid1      24
380768 0.16819 proc0009.s carol     r 04/20/2018 15:00:28 long.q@msg-hmio3            4
380815 0.05508 job_qb3.sh alice     r 04/20/2018 15:59:58 long.q@mac-inst-id1        24
382375 0.05508 job_qb3.sh alice     r 04/21/2018 13:37:13 ondemand.q@mac-inst-id3    24
386295 0.06649 se_psev_sc bob       r 04/25/2018 08:42:39 long.q@msg-id19             6
386435 0.16819 proc0010.s carol     r 04/25/2018 10:54:24 member.q@cdhi-idgpu1        4
386532 0.05055 GATK_SUB_G charlie   r 04/25/2018 12:46:54 ondemand.q@mac-inst-id1    24
386533 0.05055 GATK_SUB_G charlie   r 04/25/2018 12:46:54 ondemand.q@mac-inst-hmid1  24
386435 0.16819 proc0010.s carol     r 04/25/2018 10:54:24 member.q@cdhi-idgpu1        4
386594 0.05055 GATK_SUB_G charlie   r 04/26/2018 00:22:30 long.q@cdhi-idgpu1         24
387048 0.17577 C3Db2_REST bob       r 04/25/2018 23:02:30 gpu.q@msg-iogpu11           4
387524 0.16566 class3d    alice     r 04/26/2018 10:34:00 gpu.q@msg-iogpu9            2
387674 0.16566 class3d    alice     r 04/26/2018 13:40:30 gpu.q@msg-ihgpu3            2
388578 0.05004 pedigree1  bob       r 04/27/2018 10:57:45 long.q@msg-ihgpu2           1 2
388578 0.05004 pedigree2  bob       r 04/27/2018 10:57:45 long.q@msg-iogpu4           1 3
388806 0.05004 run_cluste bob       r 04/27/2018 15:06:33 long.q@qb3-id3              1 20
388693 0.50000 run_0423.s carol    qw 04/27/2018 12:53:02                             2
388745 0.41908 test       carol   Eqw 04/27/2018 14:00:42                             3
372081 0.16240 DIAGS      alice    qw 04/12/2018 10:44:20                             1
```



## Explanation of the job state

In the output of `qstat`, there is a `state` column, which shows the
current state of each job.  Commonly seen states are:

 * `q` - the job is queued

 * `w` - the job is waiting to be launched

 * `h` - the job is held on the queue, e.g. waiting for another job
         dependency to finish
 
 * `r` - the job is currently running on a compute node
 
 * `E` - there was an error launching the job. See `qstat -j <job_id>`
   for the reason why the job failed
 
 * `d` - the job is being deleted (from calling `qdel`)

For more details, see `man qstat`.


## When will queued jobs start?

When your jobs will be launched depends on your jobs' _current priority_ on the queue.  _If_ one of your jobs is on the top of the priority queue _and_ the resources (CPU, memory, ...) you have requested are available, _then_ that job will be launched next.  If sufficient resources are not available, then a lower-priority jobs with lower resource may be launched in the meantime.

The priority scores of all jobs can be seen in column `prior` in the `qstat -u '*'` output (\*). The "priority scores" are constantly recalculated as a function of all users' jobs currently queued and running on the cluster.  They are a function of:

 * your group's _current priority_
 * your personal _current priority_ relative to other users in your group

There is no memory, that is, what you, your group, or others have run in the past does not matter.

(\*) The priorities of already running jobs (those with an `r` in column `state`) are irrelevant.

