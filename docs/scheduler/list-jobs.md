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
qstat
```

For example,

```sh
$ qstat
job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID
-----------------------------------------------------------------------------------------------------------------
2321393 0.55500 t13175_lac mlafontaine  r     09/23/2019 15:05:07 brain.q@burlingame.radiology.u     1 7
2321393 0.55500 t13175_lac mlafontaine  r     09/23/2019 15:05:07 brain.q@concord.radiology.ucsf     1 2
2321393 0.55500 t13175_lac mlafontaine  r     09/23/2019 15:05:07 brain.q@concord.radiology.ucsf     1 5
2321393 0.55500 t13175_lac mlafontaine  r     09/23/2019 15:05:07 brain.q@dublin.radiology.ucsf.     1 3
2321393 0.55500 t13175_lac mlafontaine  r     09/23/2019 15:05:07 brain.q@dublin.radiology.ucsf.     1 6
2321393 0.55500 t13175_lac mlafontaine  r     09/23/2019 15:05:07 brain.q@elcerrito.radiology.uc     1 1
2321393 0.55500 t13175_lac mlafontaine  r     09/23/2019 15:05:07 brain.q@elcerrito.radiology.uc     1 4
2321393 0.55500 t13175_lac mlafontaine  r     09/23/2019 15:05:07 brain.q@fairfax.radiology.ucsf     1 8
2316486 0.55500 Output_CNN bastutoarouc r     09/16/2019 23:24:36 rad_dgx.q@juno.radiology.ucsf.     1
2316487 0.55500 Output_CNN bastutoarouc r     09/16/2019 23:25:51 rad_dgx.q@juno.radiology.ucsf.     1
2316488 0.55500 Output_CNN bastutoarouc r     09/16/2019 23:25:51 rad_dgx.q@juno.radiology.ucsf.     1
2316489 0.55500 Output_CNN bastutoarouc r     09/16/2019 23:25:51 rad_dgx.q@juno.radiology.ucsf.     1
2317040 0.55500 liver_segm bolson       r     09/18/2019 15:14:04 rad_dgx.q@juno.radiology.ucsf.     1
```



## When will queued jobs start?

When your jobs will be launched depends on your jobs' _current priority_ on the queue.  _If_ one of your jobs is on the top of the priority queue _and_ the resources (CPU, memory, ...) you have requested are available, _then_ that job will be launched next.  If sufficient resources are not available, then a lower-priority jobs with lower resource may be launched in the meantime.

The priority scores of all jobs can be seen in column `prior` in the `qstat -u '*'` output (\*). The "priority scores" are constantly recalculated as a function of all users' jobs currently queued and running on the cluster.  They are a function of:

 * your group's _current priority_
 * your personal _current priority_ relative to other users in your group

There is no memory, that is, what you, your group, or others have run in the past does not matter.

(\*) The priorities of already running jobs (those with an `r` in column `state`) are irrelevant.
