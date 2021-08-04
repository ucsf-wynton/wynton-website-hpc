## Cancel Slurm Jobs

To cancel a specific job, use:

```sh
scancel <jobid>
```

Note that this command can take a long time to complete (up to a couple of minutes) if the node is non-responsive.


To cancel all of your jobs, use:
```sh
scancel -u $USER
```

To cancel all of your pending jobs, use:
```sh
scancel -t PENDING -u $USER
```

To cancel one or more jobs by name:
```sh
scancel --name <jobname>
```
