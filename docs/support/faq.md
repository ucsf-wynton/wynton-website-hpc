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
```sh
qdel -f $JOB_ID [-t $SGE_TASK_ID]
```

## Errors

**Q**. _I just started to get SSL-related errors when using `qsub` and `qstat` that I have never seen before;_
```sh
error: commlib error: ssl connect error (SSL handshake error)
ssl error (the used certificate is expired)
unable to contact qmaster using port 6444 on host "q"
```

**A**. Your {{ site.cluster.name }} account has expired.  If so, you should already have received an email from us with instructions on how to request the renewal.  If you have responded to that email, then it's a mistake on our end (sorry) - please drop us another email.

**Q**. _I am getting timeout errors when trying to connect via x2go from a MacOS Computer, the x2go status hangs on "connecting"; In the x2go logs you will see:_

```sh
Info: Forwarding X11 connections to display '/private/tmp/com.apple.launchd.C24DSqSnIF/org.xquartz:0'.
Info: Forwarding auxiliary X11 connections to display '/private/tmp/com.apple.launchd.C24DSqSnIF/org.xquartz:0'.
Session: Session started at 'Tue Mar  2 13:00:37 2021'.
Connection timeout, abortingSession: Terminating session at 'Tue Mar  2 13:01:05 2021'.
Info: Waiting the cleanup timeout to complete.
Session: Session terminated at 'Tue Mar  2 13:01:07 2021'.
```

**A**. This appears to be a communication problem between x2go and XQuartz. The only way we've found to resolve this issue is to **Completely** remove XQuartz from the MacOS Computer and then re-install XQuartz. Please follow recommendations for completely removing the XQuartz application and all related files. (Search for any files or folders with the program’s name or developer’s name in the ~/Library/Preferences/, ~/Library/Application Support/ and ~/Library/Caches/ folders.) After re-installation of XQuartz, x2go should work again. If not, please contact [the {{ site.cluster.nickname }} team]({{ '/about/contact.html' | relative_url }}).

**Q**. _I tried to change my shell using the unix command `chsh` and I got an error telling me, "chsh: user "alice" does not exist"._

**A**. First, let me assure you, your account does exist! You ARE logged in, after all. However, {{ site.cluster.nickname}} account attributes are managed via a remote directory system which is not manipulable via local tools like `chsh`. If you would like to change your shell, Please [get in touch with the {{ site.cluster.nickname }} team]({{ '/about/contact.html' | relative_url }}), let us know your preferred shell, and we will change it for you. Note: The {{ site.cluster.nickname}} team supports `csh/tcsh` and `sh/bash` login shells. Any other shell than these may result in reduced functionality or errors which may be beyond the scope of our support.

**Q**. _I cannot SSH into the development nodes - I get 'IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!' and 'Host key verification failed.'.  What is going on?_

**A**. This most likely happens because we have re-built the problematic development node resulting in its internal security keys having changed since you last access that machine.  If the problem error looks like:

```lang-none
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
SHA256:FaARLbkE3sHP2a33Zgqa/sNXTqqWzZAeu6T43wST4ok.
Please contact your system administrator.
Add correct host key in /wynton/home/bobson/alice/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /wynton/home/bobson/alice/.ssh/known_hosts:18
ECDSA host key for dev1 has changed and you have requested strict checking.
Host key verification failed.
```

then the solution is to remove that offending key from your personal `~/.ssh/known_hosts` file.  If we look at:

```lang-none
Offending ECDSA key in /wynton/home/bobson/alice/.ssh/known_hosts:18
```

we see that the problematic key is in this case on line 18.  To remove that line, use:

```sh
$ sed -i '18d' ~/.ssh/known_hosts
```

Then retry.


## Files and folders

**Q**. _Is it possible to have a common folder where our lab group members can share files and software?_

**A1**. If you belong to a specific group, we can set up a `/wynton/home/your_group/shared/` folder that group members (part of the same Unix group) have write access to. Any such files will count toward the disk quota of the user who owns the files. The typical use case is then that one or more members maintain subdirectories therein.  If you need this, please drop us an email.  Note, if the `groups` command reports `lsd` for you, then you do not belong to a specific group and can unfortunately not get a group-specific folder.

**A2**. Labs who [purchase additional storage]({{ '/about/pricing-storage.html' | relative_url }}) will get a `/wynton/group/your_group/` folder.  Files written in that folder will not count toward users disk quota.

## Contributing to {{ site.cluster.nickname }}

**Q**. _Our lab would contribute to {{ site.cluster.name }} in order to increase our priority.  How can we do this?_

**A**. We welcome donations of any size.  In return, your lab will receive a number of slots in member.q equivalent to the number of cores in a current Standard Node that your contribution would purchase.  As of May 2020, that cost is $170 per slot.

**Q**. _Our lab has some old nodes we'd like to contribute to {{ site.cluster.name }} in return for priority. Will you take them?_

**A**. Please [get in touch with the {{ site.cluster.nickname }} team]({{ '/about/contact.html' | relative_url }}).
