# Slurm List Jobs

You can list all your submitted jobs, queued and running, using:
```sh
squeue -u <username>
```


To get detailed information on a specific job, your or others, use:
```sh
squeue <job_id>
```


## List jobs of other users

To see jobs of another user, use:
```sh
squeue -u <user>
```

To see jobs of all users, use:
```sh
squeue
```

For example,

```sh
$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
              380725     member job_qb3.sh  alice  R       0:02      1 tc1
              380768     member proc0009.sh carol  R       0:05      1 tc2
              380815     member job_qb3.sh  alice  R       0:03      1 tc1
              386295     member se_psev_sc  bob    R       0:04      1 tc2
```



## When will queued jobs start?

When your jobs will be launched depends on your jobs' _current priority_ on the queue.  _If_ one of your jobs is on the top of the priority queue _and_ the resources (CPU, memory, ...) you have requested are available, _then_ that job will be launched next.  If sufficient resources are not available, then a lower-priority jobs with lower resource may be launched in the meantime.

The priority scores of all jobs can be seen in column `prior` in the `squeue` output (\*). The "priority scores" are constantly recalculated as a function of all users' jobs currently queued and running on the cluster.  They are a function of:

 * your group's _current priority_
 * your personal _current priority_ relative to other users in your group

There is no memory, that is, what you, your group, or others have run in the past does not matter.

(\*) The priorities of already running jobs (those with an `R` in column `state`) are irrelevant.

