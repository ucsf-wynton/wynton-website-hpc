# List Jobs

You can list all your submitted jobs, queued and running, using:
```sh
qstat
```

To get detailed information on one of you jobs, use:
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


## When will queued jobs start?

When your jobs will be launched depends on your _current priority_ on the queue.  Your "priority score" is constantly recalculated as a function of all users' jobs currently queued and running on the cluster.  It is a function of:

 * your group's _current priority_
 * your personal _current priority_ relative to other users in your group

There is no memory, that is, what you, your group, or others have run in the past does not matter.
