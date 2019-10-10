## Kill Jobs

To kill a specific job, use:

```sh
qdel <jobid>
```

If the node, where the job is running, is non-responsive, you can _force_ the scheduler to remove the job by using:

```sh
qdel -f <jobid>
```

Note that this command can take a long time to complete (up to a couple of minutes) if the node is non-responsive.


To kill all of your jobs, use:
```sh
qdel -u $USER
```
