<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
**Do not request email notifications for array jobs!**  If done, there will be email messages sent for _every single task_ in the job array.
</div>

## Job Email Notifications

Instead of polling `qstat` to check whether submitted jobs are queued, running, or finished, one can tell the job scheduler to send email notifications as jobs are started or completed.  This is done by specifying `qsub` option `-m <when>`, where `<when>` specifies under what circumstances an email notification should be sent.

To send an email when the job (b)egins, (e)nds, or (a)borts, submit the job as:

```sh
$ qsub -m bea myscript.sh
```

To send an email only when the job completed, successfully or not, skip (b)egin notifications by using only:

```sh
$ qsub -m ea myscript.sh
```

See below for examples what these email notifications look like.


### Configure the default email address

The email notifications are by default sent to the email address you have associated with your {{ site.cluster.nickname }} account.  To find out which address this is, call:

```sh
$ ldapsearch -LLL -x -H ldap://m1,ldap://m2 uidNumber="$(id -u)" mail
dn: uid=alice,ou=Accounts,dc=cgl,dc=ucsf,dc=edu
mail: alice.bobson@ucsf.edu
```

If you wish to sent to another address that your Wynton-associated email address, you an set a new default in the `~/.sge_request` file (create if missing) as:

```sh
## Default recipient of job notifications
-M alice@bobson.org
```

Technically, you could also specify the `-M <email address>` as a command-line option to `qsub`, or as an SGE directive comment in the job script, but we recommend using `~/.sge_request` for this.  The advantage is that your job scripts won't carry your email address, making them more generic.  In contrast, if a job script has your email address, then it will be you that get email notifications if someone else copies your script as-is and runs it on the cluster (or on other SGE clusters).

<div class="alert alert-danger" role="alert" style="margin-top: 3ex" markdown="1">
**Please do not specify `-m bea` in `~/.sge_request`** to make it the default for _all_ of your jobs. If done, you might end up producing thousands of email messages when you submit array jobs.
</div>


### Email notifications for array jobs

**Do not request email notifications for array jobs!**  If done, there will be email messages sent for _every single task_ of the job array.  Instead, to get an email notification when a job array completes, submit a "dummy" job that depend on the job array such that it will only launch when the job array completes.  The sole purpose of this dummy job is to trigger an email notification.  For instance, if the job array has job ID 9156754, then submit a job:

```sh
$ job_id=9156754
$ echo 'date' | qsub -N "Array_job_${job_id}_done" -m b  -l h_rt=00:00:05 -hold_jid "${job_id}"
```

This will send an email with 'Array_job_9156754_done' in the subject line as soon as the dummy job launches.


### Example messages

The email message sent when a job starts (`-m b`), will look like:

```lang-none
From: root <root@wynton.ucsf.edu>
To: alice@log1.wynton.ucsf.edu
Subject: Job 8968283 (myscript.sh) Started

Job 8968283 (myscript.sh) Started
 User       = alice
 Queue      = long.q
 Host       = qb3-ad4
 Start Time = 11/14/2019 00:07:00
```

and the one sent when a job ends successfully (`-m e`), will look like:

```lang-none
From: root <root@wynton.ucsf.edu>
To: alice@log1.wynton.ucsf.edu
Subject: Job 8968283 (myscript.sh) Complete

Job 8968283 (myscript.sh) Complete
 User             = alice
 Queue            = long.q@qb3-ad4
 Host             = qb3-ad4
 Start Time       = 11/14/2019 00:07:00
 End Time         = 11/14/2019 00:07:01
 User Time        = 00:00:00
 System Time      = 00:00:00
 Wallclock Time   = 00:00:01
 CPU              = 00:00:00
 Max vmem         = 5.410M
 Exit Status      = 0
```

The message sent when a job is aborted (`-m a`),  for instance via `qdel`, will look like:

```lang-none
From: root <root@wynton.ucsf.edu>
To: alice@log1.wynton.ucsf.edu
Subject: Job 8974017 (myscript.sh) Aborted

Job 8974017 (myscript.sh) Aborted
 Exit Status      = 137
 Signal           = KILL
 User             = alice
 Queue            = long.q@msg-id7
 Host             = msg-id7
 Start Time       = 11/14/2019 08:07:02
 End Time         = 11/14/2019 08:07:07
 CPU              = 00:00:00
 Max vmem         = 1.965M
failed assumedly after job because:
job 8974017.1 died through signal KILL (9)
```

The _displayed_ `To:` address in these notifications will be `<username>@<hostname>`, which is an email address for you that only exists on the {{ site.cluster.nickname }} cluster. Any messages sent to this address will then be redirected to your Wynton-associated email address.  The `<hostname>` part is the name of the node from which the job script was submitted.  For instance, in the above example, the job script was submitted from the `log1.wynton.ucsf.edu` login node.  If you configure SGE to use another email address (e.g. `-M alice@bobson.org`), then that will be the `To:` address shown.
