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
