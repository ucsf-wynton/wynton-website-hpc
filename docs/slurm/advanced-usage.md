# Advanced Slurm Usage 

## Programmatically get job id

When submitting a job, the job id is outputted to standard output (stdout) as part of a long message, e.g.
```sh
$ sbatch hello_world
Your job 151711 ("hello_world") has been submitted
```

Using Bash syntax, you can capture the job id when submitting the job as:
```sh
$ job_id=$(sbatch hello_world | cut -f 4 -d " ")
$ echo $job_id
151720
```
This allows you to pass it in downstream calls, e.g. `squeue $job_id` and `scancel $job_id`.


## Additional resources

For more help on the Slurm scheduler, please see:

* [Slurm workload manager - Official documentation](https://slurm.schedmd.com/)
* [Slurm mailing lists](https://slurm.schedmd.com/mail.html)
