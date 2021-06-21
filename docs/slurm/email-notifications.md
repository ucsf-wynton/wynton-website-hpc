## Slurm Job Email Notifications

Instead of polling `sqeueue` to check whether submitted jobs are queued, running, or finished, one can tell the job scheduler to send email notifications as jobs are started or completed.  This is done by specifying `sbatch` option `--mail-type=<events>` and option `--mail-user=<recipients>`, where `<events>` specifies under what circumstances an email message should be sent to `<recipients>`.

Valid mail type values are NONE, BEGIN, END, FAIL, REQUEUE, ALL (equivalent to BEGIN, END, FAIL, REQUEUE, and STAGE_OUT), STAGE_OUT (burst buffer stage out and teardown completed), TIME_LIMIT, TIME_LIMIT_90 (reached 90 percent of time limit), TIME_LIMIT_80 (reached 80 percent of time limit), TIME_LIMIT_50 (reached 50 percent of time limit) and ARRAY_TASKS (do NOT send emails for each array task). Multiple type values may be specified in a comma separated list.

To send an email when the job (b)egins, (e)nds, or (a)borts, submit the job as:

```sh
$ sbatch --mail-type=BEGIN,END,FAIL myscript.sh
```

To send an email only when the job completed, successfully or not, skip (b)egin notifications by using only:

```sh
$ sbatch --mail-type=END,FAIL myscript.sh
```

### Configure a different recipient

By default, the notifications will go to the email address you specified in your Wynton Account creation request.

If, for some reason, you want the notifications to go to another of your email addresses, use the following. However, note that your email will now be in your script if you give it to someone else.

```sh
$ sbatch --mail-type=BEGIN,END,FAIL --mail-user=alice.bobson@ucsf.edu myscript.sh
```

### Email notifications for array jobs

**Do not request email notifications type ARRAY_TASKS!** By default, you will receive mail about the begin and end of a job array. If you specify --mail-type=ARRAY_TASKS, there will be multiple email messages sent for _every single task_ of the job array.

### Example messages

The email message sent when a job starts (`--mail-type=BEGIN`), will look like:

```sh
From: root <root@wynton.ucsf.edu>
To: alice.bobson@ucsf.edu
Subject: Slurm Job_id=8968283 Name=myscript.sh Began, Queued time 00:00:01
```

and the one sent when a job ends successfully (`--mail-type=END`), will look like:

```sh
From: SLURM <slurm@wynton.ucsf.edu>
To: alice.bobson@ucsf.edu
Subject: Slurm Job_id=8968283 Name=myscript.sh Ended, Run time 00:00:00, COMPLETED, ExitCode 0
```

The message sent when a job is cancelled (`--mail-type=END`),  for instance via `scancel`, will look like:

```sh
From: SLURM <slurm@wynton.ucsf.edu>
To: alice.bobson@ucsf.edu
Subject: Slurm Job_id=8974017 Name=myscript.sh Ended, Run time 00:00:18, CANCELLED, ExitCode 0
```


