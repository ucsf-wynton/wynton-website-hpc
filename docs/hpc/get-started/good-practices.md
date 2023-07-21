# Good Practices

The {{ site.cluster.name }} cluster is high-performance compute resource used by a variety of UCSF researchers.  It is designed to handle a large number of analyses run in parallel by a large number of groups and users.  Despite this, there will times when the demand is higher than the supply, resulting in longer queueing times and possibly also slower processing times when the jobs are started.

In order to maximize the efficiency of the cluster and **decrease your** (and others) **queuing and processing times**, please try make yourself familiar with the following guidelines:

* Identify and [specify](/hpc/scheduler/submit-jobs.html) the amount of resources your jobs need (&rArr; better utilization and load balancing)
* Make your script agile to [SGE resources allocated to your job](/hpc/scheduler/envvars.html) (&rArr; scalable and lower risk of using resources not requested)

* [Work toward local scratch](/hpc/scheduler/using-local-scratch.html) on the compute nodes (&rArr; faster processing and less load on shared disk I/O)

Some additional guidelines for optimum use of the BeeGFS file system on Wynton:

* Prefer fewer, large files over many small ones
* If writing many files, spread them out over a number of directories including SGE output and error files
* Users are strongly encouraged to keep the number of reads and writes to a single directory to a reasonable number
* Don't include anything in `/wynton` in your default `LD_LIBRARY_PATH`
