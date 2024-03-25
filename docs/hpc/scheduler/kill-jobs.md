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


_Technical details_: If the job was submitted with SGE option `-notify`, then the scheduler send signal `SIGUSR2` twice to the job notifying that it is about to be terminated. The second signal is sent momentarily after the first. This is also the case when the job exhausts its maximum runtime.  The job process can choose to capture this signal to perform a clean-up task before exiting.  If the job process is still running 60 seconds after these notification signals, then it will be terminated with signal `SIGKILL`, which cannot be caught.  If `-notify` was not specified, then only `SIGKILL` is signaled.

