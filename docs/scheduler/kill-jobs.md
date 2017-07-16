## Kill jobs

To kill a specific job, use:

```sh
$ qdel <jobid>
```

If the node is non-responsive, you can force the scheduler to remove the job by using:

```sh
$ qdel -f <jobid>
```
