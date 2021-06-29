# Slurm 'Hello World' Job

The {{ site.cluster.name }} cluster farm consists of a large number of [compute nodes] that are ready to serve users' compute tasks (aka jobs).  Since all compute nodes are configured the same way, for instance, they have the exact same set software installed, it does not matter on which compute node your analysis runs.

At any time, there will be many users using the cluster where some users run a single analysis whereas other run many multi-day jobs in parallel.  In order for users not to step on each others toes and for users to get a fair share of the compute resources, the cluster uses a so called _job scheduler_ to orchestrate the compute requests.  This works by users submitting their compute jobs to the _job queue_.  Then the scheduler will locate a compute node with enough free resources to process the submitted job and launch the job on that compute node.  The scheduler is configured to distribute the compute load across all compute nodes for overall maximum performance and fare share among the users.


## Instructions

The most common way of running compute tasks on the {{ site.cluster.name }} cluster, consists of:

1. creating a script,

2. submitting the script to the queue,

3. waiting for the script to start and finish, and

4. looking at the results, e.g. output data files and text logs.

The {{ site.cluster.name }} cluster uses [Slurm] as its scheduler.  [Slurm] provides command `sbatch` to submit a script ("job") and command `squeue` to check the status of a job.


<div class="alert alert-info" role="alert" style="margin-top: 3ex">
Further information with detailed examples on job submissions can be found on separate pages under the 'Slurm' menu.
</div>


### Example

In this example we will run compute jobs that outputs the name of the compute node that runs the job, waits ten seconds to emulate some processing, and the time it runs.  The name of the current machine is available in environment variable `HOSTNAME` (standard in Unix) and the current time is outputted when calling the command `date`.  To do this as a compute job, create a script `~/tests/hello_world` containing:

```sh
#!/bin/env bash

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
Note how it takes ten seconds between the `Hello world` message and the time stamp.  We have now confirm that the shell script does what we expect it to do, and we are ready to submit it to the job queue of the scheduler.  To do this, do:
```sh
[alice@{{ site.devel.name }} tests]$ sbatch -J helloworld -o helloworld_%j.out -e helloworld_%j.err helloworld.sh
Submitted batch job 6142
```

When submitting a job, the scheduler assigned the job an identifier ("job id").  In the above example, the job id is '6142'.  Immediately after the job has been submitted it ran.

```sh
[alice@{{ site.devel.name }} ~]$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
              6142    member hellowor      eje  R       0:03      1 tc1
```
  
Eventually, when the job script finished, `squeue` will no longer list it.

So where is the output of the job? The default output is to a single file named "slurm_$SLURM_JOB_ID.out". But since we specified on the command line the -o and -e options, the output and error will be separated and the files will be named with our helloworld_6143.out and helloworld_6143.err.

```sh

[alice@{{ site.devel.name }} ~]$ cat helloworld6145.out
==========================================
SLURM_JOB_ID = 6145
SLURM_NODELIST = tc1
==========================================
Hello world, I am running on node tc1
Fri Jun 12 10:17:50 PDT 2020
 
```

There is of course nothing preventing us from submitting the same script multiple times.  If done, each submission will result in the script be launched on a compute node and a unique log file `helloworld.o<job_id>` will be outputted.  Please try that and see what `squeue` outputs.   Now, you may want to pass different arguments to your script each time, e.g. each job should process a different input data file.  For information on how to do this, see the [Submit Jobs] page.


[compute nodes]: {{ '/about/specs.html' | relative_url }}

[Slurm]: {{(https://slurm.schedmd.com/)}}

[Submit Jobs]: {{ '/slurm/submit-jobs.html' | relative_url }}

