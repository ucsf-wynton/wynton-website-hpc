## Job Email Notifications

Instead of polling `qstat` to check whether submitted jobs are queued, running, or finished, one can tell the job scheduler to send email notifications as jobs are started or completed.  This is done by specifying `qsub` option `-m <when>` and option `-M <recipients>`, where `<when>` specifies under what circumstances an email message should be sent to `<recipients>`.

To send an email when the job starts, and when it (b)egins, (e)nds, or (a)borts, submit the job as:

```sh
$ qsub -m bea -M alice.bobson@ucsf.edu myscript.sh
```

To send an email only when the job completed, successfully or not, skip `b` and use:

```sh
$ qsub -m ea -M alice.bobson@ucsf.edu myscript.sh
```


### Configure a default recipient

To avoid having to specify the email address in each `qsub` call, or as an SGE directive in the job script, one can set the default in the `~/.sge_request` (create if missing) by adding:

```
## Default recipient of job notifications
-M alice.bobsom@ucsf.edu
```

The advantage of specifying the recipient in `~/.sge_request`, instead of in the job script, is that the job script does not carry your personal email address.  If the job script has your email address, then it will be you that get email notifications if someone else copy your script as-is and runs it on the cluster (also other SGE clusters).


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

The message send when a job is aborted (`-m a`),  for instance via `qdel`, will look like:

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


