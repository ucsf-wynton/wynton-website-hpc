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


## Exclude one or more compute nodes

SGE resource `hostname` can be used to specify which compute nodes to
include and exclude when submitting a job. At times, some of the
compute nodes have issues, resulting in any job ending up on such a
node to fail. Until the admins have disabled the problematic compute
node, you can manually avoid it via the `hostname` resource
specification. For example, to avoid compute node `qb3-idgpu11`,
submit the job as:

```sh
$ qsub -l hostname='!qb3-idgpu11' ...
```

The `!` symbol means "not". Note that we must put the `hostname`
specification withing _single quotation marks_. To avoid more than one
problematic compute node, use:

```sh
$ qsub -l hostname='!(qb3-idgpu11|qb3-idgpu13|qb3-idgpu18)' ...
```

The `|` symbol means "or" and the `!` applies to everything within
parenthesis. By [De Morgan's Laws], the latter is equivalent to:

```sh
$ qsub -l hostname='!qb3-idgpu11&!qb3-idgpu13&!qb3-idgpu18' ...
```

where the `&` symbols means "and".

It is also possible to exclude a set of compute nodes via basic
[globbing], e.g.

```sh
$ qsub -l hostname='!qb3-idgpu*' ...
```


## Additional resources

For more help on the SGE scheduler, please see the [Grid Engine HOWTOs] page.

[De Morgan's Laws]: https://en.wikipedia.org/wiki/De_Morgan%27s_laws
[globbing]: https://en.wikipedia.org/wiki/Glob_(programming)
[Grid Engine HOWTOs]: https://web.archive.org/web/https://arc.liv.ac.uk/SGE/howto/howto.html
