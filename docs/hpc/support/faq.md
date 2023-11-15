# Frequently Asked Questions (FAQs)

## Jobs

### Waiting in job queue

**Q**. _My submitted job is still in the queue - why is it not
running?_

**A**. There could be several reason why your job is not running:

  1. If you have access to the members.q queue, it could be that you
     and other users in your lab are currently using all your slots,
     which in case your jobs are being queued in the communal long.q
     queue instead.
     
  2. The queue where your job is sitting may be full. If so, your job
     will eventually run.
     
  3. You might have asked for compute resources that cannot be met,
     e.g. more memory or more cores than available on any compute
     node, e.g. `-l mem=4048gb` or `-pe smp 256`.  If so, your job
     will never run.  Either lower the job's resource needs using
     `qdel`, or, alternatively, remove the job (`qdel`) and submit
     (`qsub`) a new one with adjusted resources.

  4. If there is a [downtime scheduled](/hpc/status/), you might have
     asked for a run-time that goes into the downtime period. If so,
     your job _cannot_ be started until after the downtime.  If you
     don't specify the run-time when you submit your job, the default
     is 14 days.
  
  5. `qstat -j <job_id>` will provide details on why a particular job
     is not running.  `qstat -u '*'` will show all jobs and their
     priority scores in the queue.

**A**: **[For QB3 migrants]** If you are coming from the legacy QB3
cluster (defunct since 2020), please make sure that your job script
does _not_ specify any of the below QB3-specific SGE resources.  **A
job submitted with one or more of these will sit in the queue
forever.**

  - `-l arch=linux-x64`: this architecture does not exist on {{
    site.cluster.name }}. This specification can safely be dropped on
    {{ site.cluster.name }}. (You could specify, `-l arch=lx-amd64`
    but that is not needed as all compute nodes now have the same
    architecture.)

  - `-l database=<size>`: this storage resource does not exist on {{
    site.cluster.name }}.

  - `-l netapp=<size>`: this storage resource does not exist on {{
    site.cluster.name }}. This specification can safely be dropped on
    {{ site.cluster.name }}.

  - `-l scrapp=<size>`: this storage resource does not exist on {{
    site.cluster.name }}.

  - `-l scrapp2=<size>`: this storage resource does not exist on {{
    site.cluster.name }}.


### Cannot delete jobs from queue

**Q**. _I tried to delete some jobs, and now they're stuck in the
state "dr". How can I get rid of them?_

**A**. The most likely cause of this is that node (or nodes) running
your jobs crashed.  Since the node(s) can't report back to SGE and
confirm the job deletion, the state of the jobs doesn't change.  To
force the issue:

```sh
qdel -f $JOB_ID [-t $SGE_TASK_ID]
```


### What do the different hostname prefixes stand for?

**Q**. _What is the difference between the `idgpu`, `iogpu`, and
`atgpu` parts used for GPU compute node names?_

**A**. They denotes _CPU_ architecture: `io` is for "**I**ntel
**O**cto-core" (i.e. Intel CPUs with 8 cores per CPU), `id` is for
"**I**ntel **D**odeca-core" (12 cores per CPU, but now encompasses all
Intel nodes with more 12+ nodes), and `at` is for "**A**MD
**T**riginti-core" (32 cores).



## Errors

### Cannot submit jobs

**Q**. _I just started to get SSL-related errors when using `qsub` and
`qstat` that I have never seen before;_

```sh
error: commlib error: ssl connect error (SSL handshake error)
ssl error (the used certificate is expired)
unable to contact qmaster using port 6444 on host "q"
```

**A**. Your {{ site.cluster.name }} account has expired.  If so, you
should already have received an email from us with instructions on how
to request the renewal.  If you have responded to that email, then
it's a mistake on our end (sorry) - please drop us another email.


### X2Go Troubleshooting

**Q**. _x2go authenticates, but then immediately disconnects without launching._

**A**. The first thing to check is your BeeGFS home directory quota. x2go creates a number of temporary files related to your sessions. If it cannot create those files, it will authenticate and then disconnect. Short version: `beegfs-ctl --getquota --storagepoolid=11 --uid "$USER"`. For more information on quotas and file systems, see the page on [File Sizes and Disk Quotas].

**Q**. _How do I terminate a saved x2go session if it seems "stuck" or "unresponsive"?_

**A**. Log in to the destination server you were connecting to (not the proxy/jump host) via ssh, type `x2golistsessions`. 
 
If something comes up, run `x2goterminate-session $SESSION`, replacing $SESSION by the second field in the output of `x2golistsessions`. 
 
Then try connecting again with your x2go client.

**Q**. _I am getting timeout errors when trying to connect via X2Go
from a macOS computer, the X2Go status hangs on "connecting"; In the
X2Go logs you will see:_

```sh
Info: Forwarding X11 connections to display '/private/tmp/com.apple.launchd.C24DSqSnIF/org.xquartz:0'.
Info: Forwarding auxiliary X11 connections to display '/private/tmp/com.apple.launchd.C24DSqSnIF/org.xquartz:0'.
Session: Session started at 'Tue Mar  2 13:00:37 2021'.
Connection timeout, abortingSession: Terminating session at 'Tue Mar  2 13:01:05 2021'.
Info: Waiting the cleanup timeout to complete.
Session: Session terminated at 'Tue Mar  2 13:01:07 2021'.
```

**A**. This appears to be a communication problem between X2Go and
XQuartz. The only way we've found to resolve this issue is to
**Completely** remove XQuartz from the macOS computer and then
re-install XQuartz. Please follow recommendations for completely
removing the XQuartz application and all related files. (Search for
any files or folders with the program’s name or developer’s name in
the ~/Library/Preferences/, ~/Library/Application Support/ and
~/Library/Caches/ folders.) After re-installing XQuartz, X2Go should
work again. If not, please contact the [{{ site.cluster.nickname }}
team].


### chsh: user 'alice' does not exist

**Q**. _I tried to change my shell using the unix command `chsh` and I
got an error telling me, "chsh: user 'alice' does not exist"._

**A**. First, let me assure you, your account does exist! You _are_
logged in, after all. However, {{ site.cluster.nickname}} account
attributes are managed via a remote directory system which is not
manipulable via local tools like `chsh`. If you would like to change
your shell, Please get in touch with the [{{ site.cluster.nickname }}
team], let us know your preferred shell, and we will change it for
you. Note: The {{ site.cluster.nickname}} team supports `csh/tcsh` and
`sh/bash` login shells. Any other shell than these may result in
reduced functionality or errors which may be beyond the scope of our
support.


### Scary error when trying to log in to a development node

**Q**. _I cannot SSH into the development nodes - I get 'IT IS
POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!' and 'Host key
verification failed.'  What is going on?_

**A**. This most likely happens because we have re-built the
problematic development node resulting in its internal security keys
having changed since you last access that machine.  If the problem
error looks like:

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
Add correct host key in {{ site.user.home }}/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in {{ site.user.home }}/.ssh/known_hosts:18
ECDSA host key for {{ site.devel.name }} has changed and you have requested strict checking.
Host key verification failed.
```

then the solution is to remove that offending key from your personal
`~/.ssh/known_hosts` file on {{ site.cluster.nickname }}.  If you get
this error when you try to access, say, {{ site.devel.name }}, then
use:

```sh
$ ssh-keygen -R {{ site.devel.name }}
```

to remove all SSH keys associated with that machine.  Alternatively,
you can manually remove the problematic key by looking at:

```lang-none
Offending ECDSA key in {{ site.user.home }}/.ssh/known_hosts:18
```

to identify that we want to remove the key on line 18.  To remove that
line, use:

```sh
$ sed -i '18d' ~/.ssh/known_hosts
```

Then retry.


### Don't use sudo

**Q**. _Why do I get "incorrect password attempts" when using `sudo`
despite entering my password correctly?_

**A**. The `sudo` command is only available to system administrators.
It is a command used to run a specific software as root, that is, with
administrator privileges.  First of all, for security reasons, users
do _not_ have the rights to use `sudo`.  Second, `sudo` is often used
to install a software tool _centrally_ on the current machine for
_all_ users.  If you think about it, it would wreak havoc if any user
would be able to install or update software that other users use.

By the way, **if you ever get prompted for your {{ site.cluster.name
}} password, please stop and think!**  Except for when you access the
cluster, or one of the development nodes, no software should ever need
to know you password. So, if you get asked for your {{
site.cluster.name }} password, do not enter it.

Now, if you do call `sudo`, **the system administrators will be
notified automatically, and you will most likely get a follow-up email
from them.  Please respond to such a message, if you get one.**  That
said, if you end up using `sudo`, press <kbd>Ctrl-C</kbd> when you are
prompted for your password.  This will prevent the command from being
completed, e.g.

```sh
$ sudo make install

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for alice: <Ctrl-C>

$ 
```



## Files and folders

### Are my files backed up?

**Q.** _Is data on Wynton backed up?_

**A.** Data on Wynton is not backed up! Users and labs are responsible
to back up their own data outside of the {{ site.cluster.name }}
environment.


### Share folder with group members?

**Q**. _Is it possible to have a common folder where our lab group
members can share files and software?_

**A**. Labs who [purchase additional storage] will get a
`/wynton/group/your_group/` folder.  Files written in that folder will
not count toward users disk quota.


## Things that used to work before we migrated to Rocky 8

### Sudden Python errors

**Q**. When I run Jupyter, I now get an error saying
`/opt/rh/rh-python38/root/usr/bin/python3: bad interpreter: No such
file or directory`. How can I fix it.

**A**. This is because the Python software, here Jupyter, was
installed using the `rh-python38` SCL, which was only available on
CentOS 7.  To fix this, you need to reinstall the broken software,
which in this example means reinstall Jupyter.


## Miscellaneous

### Reset my shell startup file

**Q**. _I might have corrupted my Bash startup files. How do I reset
them?_

**A**. To get a fresh `~/.bashrc` file, make a backup of your old one
and copy the default one by:

```sh
$ cp ~/.bashrc ~/.bashrc.20231115
$ cp /etc/skel/.bashrc ~/
```

**A**. To get a fresh `~/.bash_profile` file, make a backup of your
old one and copy the default one by:

```sh
$ cp ~/.bash_profile ~/.bash_profile.20231115
$ cp /etc/skel/.bash_profile ~/
```


### Using Microsoft VS Code

**Q**. _Can I use Microsoft VS Code with {{ site.cluster.nickname }}?_

**A**. Yes, but, importantly, do _not_ use Microsoft Visual Studio
Code (VS Code) on the login nodes.  Because of this, you need to
configure VS Code on your local machine to connect directly to a
development nodes instead.  To achieve this, start by configuring your
local SSH environment to connect directly to a development node via a
"jump host" directive as described in ['Connect directly to a
development node'].  When you know that works, consult VS Code's
documentation regarding using an SSH "Jump Host" or "Ssh Proxy". In
short, configure VS Code by clicking on the SSH extension, "new
remote", and then enter `ssh dev1`.  This should allow VS Code to
connect directly to `dev1`.


### Avoid screenshots when asking for help

**Q**. _Why don't you like screenshots of output and error messages?_

**A**. We, and others, strongly prefer that you cut-and-paste textual
       output from your SSH terminal in your email, Slack,
       ... messages.  There are several reason for this.  First, and
       most importantly, screenshots are _not_ accessible, which means
       they are useless to a person using a screen reader.  For
       others, text in screenshots might be very hard to read and
       require zooming in on the image.  Second, it is not possible to
       cut-and-paste from a screenshot, which adds unnecessary
       friction to anyone trying to reproduce your problem and help
       you.  Third, contrary to plain text, screenshots are not
       searchable in email clients and on Slack.


## Contributing to {{ site.cluster.nickname }}

### Purchase compute slots

**Q**. _Our lab would contribute to {{ site.cluster.name }} in order
to increase our priority.  How can we do this?_

**A**. We welcome donations of any size.  In return, your lab will
receive a number of slots in member.q equivalent to the number of
cores in a current Standard Node that your contribution would
purchase.  As of May 2020, that cost is 170 USD per slot.

### Contribute hardware

**Q**. _Our lab has some old nodes we'd like to contribute to {{
site.cluster.name }} in return for priority. Will you take them?_

**A**. Please get in touch with the [{{ site.cluster.nickname }}
team].


### What {{ site.cluster.nickname }} offers

**Q**. Does {{ site.cluster.nickname }} Provide Server Hosting, Data Storage, or Application Hosting Services?

**A**. Wynton HPC provides High Performance Computing resources to the UCSF Research community.  We are _not_ able to provide server hosting, application hosting, data storage, or consulting services outside of our core mission in Research High Performance Computing.  For these, and related services, we suggest you contact UCSF IT regarding their offerings, e.g. [UCSF IT Virtual Server Hosting](https://it.ucsf.edu/service/virtual-server-hosting), [UCSF IT Physical Server Hosting](https://it.ucsf.edu/service/physical-server-hosting), and [UCSF IT Cloud Services](https://cloudservices.ucsf.edu/).


[{{ site.cluster.nickname }} team]: /hpc/about/contact.html
[purchase additional storage]: /hpc/about/pricing-storage.html
[File Sizes and Disk Quotas]: /hpc/howto/storage-size.html
['Connect directly to a development node']: /hpc/howto/log-in-without-pwd.html#connect-directly-to-a-development-node
