<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong>Do not request email notifications for array jobs!</strong>  If done, there will be email messages sent for <em>every single task</em> in the job array.
</div>

## Job Email Notifications

Instead of polling `qstat` to check whether submitted jobs are queued, running, or finished, one can tell the job scheduler to send email notifications as jobs are started or completed.  This is done by specifying `qsub` option `-m <when>` and option `-M <recipients>`, where `<when>` specifies under what circumstances an email message should be sent to `<recipients>`.

To send an email when the job starts, and when it (b)egins, (e)nds, or (a)borts, submit the job as:

```sh
$ qsub -m bea -M alice.bobson@ucsf.edu myscript.sh
```

To send an email only when the job completed, successfully or not, skip (b)egin notifications by using only:

```sh
$ qsub -m ea -M alice.bobson@ucsf.edu myscript.sh
```


### Email notifications for array jobs

**Do not request email notifications for array jobs!**  If done, there will be email messages sent for _every single task_ of the job array.  Instead, to get an email notification when a job array completes, submit a "dummy" job that depend on the job array such that it will only launch when the job array completes.  The sole purpose of this dummy job is to trigger an email notification.  For instance, if the job array has job ID 9156754, then submit a job:

```sh
$ job_id=9156754
$ echo 'date' | qsub -N "Array_job_${job_id}_done" -m b  -l h_rt=00:00:05 -hold_jid "${job_id}"
```

This will send an email with 'Array_job_9156754_done' in the subject line as soon as the dummy job launches.



### Configure a default recipient

To avoid having to specify the email address in each `qsub` call, or as an SGE directive in the job script, one can set the default in the `~/.sge_request` (create if missing) by adding:

```
## Default recipient of job notifications
-M alice.bobsom@ucsf.edu
```

The advantage of specifying the recipient in `~/.sge_request`, instead of in the job script, is that the job script does not carry your personal email address.  If the job script has your email address, then it will be you that get email notifications if someone else copy your script as-is and runs it on the cluster (also other SGE clusters).

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Please do not specify <code>-m bea</code> in <code>~/.sge_request</code></strong> to make it the default for <em>all</em> of your jobs. If done, you might end up producing thousands of email messages when you submit array job.
</div>


### Example messages

The email message sent when a job starts (`-m b`), will look like:

```
From: root <root@wynton.ucsf.edu>
To: alice.bobson@ucsf.edu
Subject: Job 8968283 (myscript.sh) Started

Job 8968283 (myscript.sh) Started
 User       = alice
 Queue      = long.q
 Host       = qb3-ad4
 Start Time = 11/14/2019 00:07:00
```

and the one sent when a job ends successfully (`-m e`), will look like:

```
From: root <root@wynton.ucsf.edu>
To: alice.bobson@ucsf.edu
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

```
From: root <root@wynton.ucsf.edu>
To: alice.bobson@ucsf.edu
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


