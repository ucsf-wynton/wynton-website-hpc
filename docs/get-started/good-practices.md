# Good Practices

The Wynton cluster is high-performance compute resource used by many a variety of UCSF researchers. It designed to handle a large number of analyses run in parallel by a large number of groups and users.  Despite this, there will times when the demand is higher than the supply, resulting in longer queing times and possibly also slower processing times.

In order to maximize the efficieny of the cluster and **decrease your (and others) queuing and processing times**, please try make yourself familary with the following guidelines:

* Identify and [specify]({{ '/scheduler/submit-jobs.html' | relative_url }}) the amount of resources your jobs need (&rArr; better utilization and load balancing)

* Make your script agile to [SGE resources allocated to your job]({{ '/scheduler/sge-envvars.html' | relative_url }}) (&rArr; scalable and lower risk of using resources not requested)

* [Work toward local scratch]({{ '/scheduler/using-local-scratch.html' | relative_url }}) on the compute nodes (&rArr; faster processing and less load on shared disk I/O)

* Use a [queue most suitable for your needs]({{ '/scheduler/queues.html' | relative_url }}) (&rArr; lower latency and faster processing)
