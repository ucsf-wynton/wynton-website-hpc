<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
**Do not request email notifications for large array jobs!**  If done, there will be email messages sent for _every single task_ in the job array.
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


### Configure the default email address

Normally, you would not set the email address for where SGE notifications are sent to.  By default, the email notifications are sent to the email address you have associated with your {{ site.cluster.nickname }} account.  To find out which address this is, run:

```sh
$ ldapsearch -LLL -x -H ldap://m1,ldap://m2 uidNumber="$(id -u)" mail
dn: uid=alice,ou=Accounts,dc=cgl,dc=ucsf,dc=edu
mail: alice.bobson@ucsf.edu
```

But, if you have to send to email another address than your Wynton-associated email address, you can set a new default in the `~/.sge_request` file (create if missing) as:

```sh
## Default recipient of job notifications
-M alice2@bobson.org
```

Technically, you could also specify `-M <email-address>` as an SGE directive comment in the job script, but we recommend using `~/.sge_request` for this.  The advantage is that your job scripts won't carry your email address, making them more generic and easy to share.  If you have the address specified part of the script, anyone who copies your script must remember to update the email address.  If not, you will be the one getting email notifications when the other person runs it on the cluster (or on other SGE clusters in the world).  It is also possible to specify `-M <email-address>` a command-line option to `qsub`.  When specifying `-M <email-address>` in multiple ways, e.g. in `~/.sge_request` and at the command line, then notifications will be sent to all email addresses specified _combined_.

To send to multiple email addresses, use semicolon (`;`) to separate the addresses, e.g. `-M {{ site.user.email }},alice2@bobson.org`.

_Technical details_: When not specifying `-M`, the `To:` address used for these notifications will be `<username>@<hostname>`, where `<hostname>` is a {{ site.cluster.nickname }} hostname, e.g. `alice@log1.wynton.ucsf.edu`.  That is a local address that only exists on the {{ site.cluster.nickname }} cluster. Any message sent to this address is redirected to your Wynton-associated email address.  If you configure SGE to use another email address (e.g. `-M alice2@bobson.org`), then that will become the `To:` address.


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
