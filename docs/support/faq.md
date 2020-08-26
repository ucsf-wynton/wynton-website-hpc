# Frequently Asked Questions (FAQs)

## Jobs

**Q**. _My submitted job is still in the queue - why is it not running?_

**A**. There could be several reason why your job is not running:
  1. If you have access to the members.q queue, it could be that you and other users in your lab are currently using all your slots, which in case your jobs are being queued in the communal long.q queue instead.
  2. The queue where your job is sitting may be full. If so, your job will eventually run.
  3. You might have asked for compute resources that cannot be met, e.g. more memory or more cores than available on any compute node, e.g. `-l mem=4048gb` or `-pe smp 256`.  If so, your job will never run.  Either lower the job's resource needs using `qdel`, or, alternatively,  remove the job (`qdel`) and submit (`qsub`) a new one with adjusted resources.
  4. `qstat -j <job_id>` will provide details on why a particular job is not running.  `qstat -u '*'` will show all jobs and their priority scores in the queue.

**A**: **[For QB3 migrants]** If you are coming from the QB3 cluster, please make sure that your job script does _not_ specify any of the below [QB3-specific SGE resources](https://salilab.org/qb3cluster/Cluster_Topology).  **A job submitted with one or more of these will sit in the queue forever.**

  - `-l arch=linux-x64`: this architecture does not exist on {{ site.cluster.name }}. This specification can safely be dropped on {{ site.cluster.name }}. (You could specify, `-l arch=lx-amd64` but that is not needed as all compute nodes now have the same architecture.)

  - `-l database=<size>`: this storage resource does not exist on {{ site.cluster.name }}.

  - `-l netapp=<size>`: this storage resource does not exist on {{ site.cluster.name }}. This specification can safely be dropped on {{ site.cluster.name }}.

  - `-l scrapp=<size>`: this storage resource does not exist on {{ site.cluster.name }}.

  - `-l scrapp2=<size>`: this storage resource does not exist on {{ site.cluster.name }}.

**Q**. _I tried to delete some jobs, and now they're stuck in the state "dr". How can I get rid of them?_

**A**. The most likely cause of this is that node (or nodes) running your jobs crashed.  Since the node(s) can't report back to SGE and confirm the job deletion, the state of the jobs doesn't change.  To force the issue:
```
qdel -f $JOB_ID [-t $SGE_TASK_ID]
```

## Errors

**Q**. _I just started to get SSL-related errors when using `qsub` and `qstat` that I have never seen before;_
```
error: commlib error: ssl connect error (SSL handshake error)
ssl error (the used certificate is expired)
unable to contact qmaster using port 6444 on host "q"
```

**A**. Your {{ site.cluster.name }} account has expired.  If so, you should already have received an email from us with instructions on how to request the renewal.  If you have responded to that email, then it's a mistake on our end (sorry) - please drop us another email.


## Files and folders

**Q**. _Is it possible to have a common folder where our lab group members can share files and software?_

**A1**. If you belong to a specific group, we can set up a `/wynton/home/your_group/shared/` folder that group members (part of the same Unix group) have write access to. Any such files will count toward the disk quota of the user who owns the files. The typical use case is then that one or more members maintain subdirectories therein.  If you need this, please drop us an email.  Note, if the `groups` command reports `lsd` for you, then you do not belong to a specific group and can unfortunately not get a group-specific folder.

**A2**. Labs who [purchase additional storage]({{ '/about/pricing-storage.html' | relative_url }}) will get a `/wynton/group/your_group/` folder.  Files written in that folder will not count toward users disk quota.

## Contributing to {{ site.cluster.nickname }}

**Q**. _Our lab would contribute to {{ site.cluster.name }} in order to increase our priority.  How can we do this?_

**A**. We welcome donations of any size.  In return, your lab will receive a number of slots in member.q equivalent to the number of cores in a current Standard Node that your contribution would purchase.  As of May 2020, that cost is $170 per slot.

**Q**. _Our lab has some old nodes we'd like to contribute to {{ site.cluster.name }} in return for priority. Will you take them?_

**A**. Please [get in touch with the {{ site.cluster.nickname }} team]({{ '/about/contact.html' | relative_url }}).
