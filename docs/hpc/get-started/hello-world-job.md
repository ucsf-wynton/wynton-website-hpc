# 'Hello World' Job

The {{ site.cluster.name }} cluster farm consists of a large number of [compute nodes] that are ready to serve users' compute tasks (aka jobs).  Since all compute nodes are configured the same way, for instance, they have the exact same set software installed, it does not matter on which compute node your analysis runs.

At any time, there will be many users using the cluster where some users run a single analysis whereas other run many multi-day jobs in parallel.  In order for users not to step on each others toes and for users to get a fair share of the compute resources, the cluster uses a so called _job scheduler_ to orchestrate the compute requests.  This works by users submitting their compute jobs to the _job queue_.  Then the scheduler will locate a compute node with enough free resources to process the submitted job and launch the job on that compute node.  The scheduler is configured to distribute the compute load across all compute nodes for overall maximum performance and fare share among the users.


## Instructions

The most common way of running compute tasks on the {{ site.cluster.name }} cluster, consists of:

1. creating a script,

2. submitting the script to the queue,

3. waiting for the script to start and finish, and

4. looking at the results, e.g. output data files and text logs.

The {{ site.cluster.name }} cluster uses [Son of Grid Engine] (SGE) as its scheduler.  SGE provides command `qsub` to submit a script ("job") and command `qstat` to check the status of a job.


<div class="alert alert-info" role="alert" style="margin-top: 3ex" markdown="1">
Further information with detailed examples on job submissions can be found on separate pages under the 'Scheduler' menu.
</div>


### Example

In this example we will run compute jobs that outputs the name of the compute node that runs the job, waits ten seconds to emulate some processing, and the time it runs.  The name of the current machine is available in environment variable `HOSTNAME` (standard in Unix) and the current time is outputted when calling the command `date`.  To do this as a compute job, create a script `~/tests/hello_world` containing:

```sh
#! /usr/bin/env bash
#$ -S /bin/bash  # run job as a Bash shell [IMPORTANT]
#$ -cwd          # run job in the current working directory

echo "Hello world, I am running on node $HOSTNAME"
sleep 10
date
```

_Hint_: To create this file, make sure that the folder exists first.  If doesn't, call `mkdir ~/tests`.

Although not critical for the job scheduler, it is always convenient to set the file permission on this script file to be executable, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ cd tests/
[alice@{{ site.devel.name }} tests]$ chmod ugo+x hello_world
```

This, in combination with the so called "she-bang" (`#! ...`) on the first line, allows you call the script just any other software, e.g.

```sh
[alice@{{ site.devel.name }} tests]$ ./hello_world
Hello world, I am running on node {{ site.devel.name }}.
Mon Aug 28 16:31:29 PDT 2017
```

Note how it takes ten seconds between the `Hello world` message and the time stamp.  We have now confirmed that the shell script does what we expect it to do, and we are ready to submit it to the job queue of the scheduler.  To do this, do:

```sh
[alice@{{ site.devel.name }} tests]$ qsub -cwd -j yes hello_world
Your job 201 ("hello_world") has been submitted
```

_Explanation of command-line options_: The `-cwd` option tells the scheduler to launch the `hello_world` script and output the job log files to the current working directory (here `~/tests/`).  The `-j yes` option specifies that error message should be merged with regular output (instead of outputting to separate log files).

When submitting a job, the scheduler assigned the job an identifier ("job id").  In the above example, the job id is '201'.  Immediately after the job has been submitted, we can see that it queued but not launched;

```sh
[alice@{{ site.devel.name }} tests]$ qstat
job-ID prior   name       user   state submit/start at     queue              slots ja-task-ID
----------------------------------------------------------------------------------------------
   201 0.00000 hello_worl alice  qw    08/01/2017 03:34:19                        1        
```

Later, when the job has been launched on one of the compute nodes, and we will something like:

```sh
[alice@{{ site.devel.name }} tests]$ qstat
job-ID prior   name       user   state submit/start at     queue              slots ja-task-ID
----------------------------------------------------------------------------------------------
   201 0.95000 hello_worl alice  r     08/01/2017 03:34:19 member.q@cin-hmid1     1
```

Eventually, when the job script finished, `qstat` will no longer list it (if you have no other jobs on the queue, `qstat` will not output anything).

So where is the output of the job?  Since we used `-j yes` and `-cwd` we will find a job output file in the current directory named `hello_world.o201` that contains:

```sh
[alice@{{ site.devel.name }} tests]$ cat hello_world.o201
Hello world, I am running on node cin-hmid1
Mon Aug 28 16:32:12 PDT 2017
[alice@{{ site.devel.name }} tests]$ 
```

There is of course nothing preventing us from submitting the same script multiple times.  If done, each submission will result in the script be launched on a compute node and a unique log file `hello_world.o<job_id>` will be outputted.  Please try that and see what `qstat` outputs.   Now, you may want to pass different arguments to your script each time, e.g. each job should process a different input data file.  For information on how to do this, see the [Submit Jobs] page.


[Son of Grid Engine]: https://web.archive.org/web/https://arc.liv.ac.uk/trac/SGE
[compute nodes]: /hpc/about/specs.html
[Submit Jobs]: /hpc/scheduler/submit-jobs.html

