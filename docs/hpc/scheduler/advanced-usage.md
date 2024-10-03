# Advanced Scheduler Usage

## Programmatically get job id

When submitting a job, the job id is outputted to standard output (stdout) as part of a long message, e.g.

```sh
$ qsub -cwd hello_world
Your job 151711 ("hello_world") has been submitted
```

Although it possible to parse this output string to infer the job id, by adding option `-terse` only the job id itself is outputted removing any needs for parsing, e.g.

```sh
$ qsub -terse -cwd hello_world
151712
```

Using Bash syntax, you can capture the job id when submitting the job as:

```sh
$ job_id=$(qsub -terse -cwd hello_world)
$ echo $job_id
151720
```

This allows you to pass it in downstream calls, e.g. `qstat -j $job_id` and `qdel $job_id`.


## Additional resources

For more help on the SGE scheduler, please see the [Grid Engine HOWTOs] page.


[Grid Engine HOWTOs]: https://web.archive.org/web/https://arc.liv.ac.uk/SGE/howto/howto.html
