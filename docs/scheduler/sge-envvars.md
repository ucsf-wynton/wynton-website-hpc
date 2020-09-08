# Useful Job Environment Variables

Some of the environment variables set by the scheduler and available to a job at runtime:

* `HOSTNAME` (string) - the name of the machine where the job is launched

* `JOB_ID` (integer) - a unique job identifier

* `JOB_NAME` (string) - the name of the job as it appears on the queue

* `NHOSTS` (integer) - the number of hosts for a parallel job (default: 1)

* `NSLOTS` (integer) - the number of slots allocated for a parallel job (default: 1)

* `PE_HOSTFILE` (string) - the absolute path of a file with rows of machines allocated to a parallel job

* `SGE_GPU` (comma-separated integers or `undefined`) - set of GPU core indices allocated to a GPU job (default: `undefined`)

* `SGE_TASK_ID` (integer or `undefined`) - subtask identifier for array jobs (default: `undefined`)

* `TMP` (string) - same as `TMPDIR`

* `TMPDIR` (string) - the absolute path to a job-specific temporary directory (local on the compute node and owned by `$USER`) that is automatically removed when the job finishes


## Example

To see all environment variable available to a job, submit a job that calls `env`:

```sh
$ cd ~/test/
$ echo "env" | qsub -cwd -j yes -pe smp 4 -l h_rt=00:01:00 -N test_envvar
Your job 135988 ("test_envvar") has been submitted
```

When finished, check the content of the job output file:
```sh
$ grep -E "(HOSTNAME|NSLOTS|NHOSTS|_ID|_NAME|PWD)" test_envvar.o135988
HOSTNAME=qb3-id1
NHOSTS=1
SGE_TASK_ID=undefined
PWD=/wynton/home/alice/test
JOB_NAME=test_envvar
JOB_ID=135988
SGE_CLUSTER_NAME=hpccoreclus
NSLOTS=4

$ cat test_envvar.o135988
MANPATH=/opt/sge/man:/usr/share/man/overrides:/usr/share/man:/usr/local/share/man
HOSTNAME=qb3-id1
SGE_TASK_STEPSIZE=undefined
SHELL=/bin/sh
TERM=
HISTSIZE=1000
NHOSTS=1
SGE_O_WORKDIR=/wynton/home/alice/test
TMPDIR=/scratch/135988.1.member.q
SGE_O_HOME=/wynton/home/alice
SGE_ARCH=lx-amd64
SGE_CELL=hpccore
RESTARTED=0
QT_GRAPHICSSYSTEM_CHECKED=1
ARC=lx-amd64
USER=alice
SGE_TASK_LAST=undefined
QUEUE=member.q
SGE_TASK_ID=undefined
MAIL=/var/spool/mail/alice
SGE_BINARY_PATH=/opt/sge/bin/lx-amd64
PATH=/opt/sge/bin:/opt/sge/bin/lx-amd64:/scratch/135988.1.member.q:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin
SGE_STDERR_PATH=/wynton/home/alice/test/test_envvar.o135988
PWD=/wynton/home/alice/test
SGE_STDOUT_PATH=/wynton/home/alice/test/test_envvar.o135988
SGE_ACCOUNT=sge
SGE_RSH_COMMAND=builtin
LANG=en_US.UTF-8
MODULEPATH=/usr/share/Modules/modulefiles:/etc/modulefiles
JOB_SCRIPT=/var/spool/sge/hpccore/qb3-id1/job_scripts/135988
JOB_NAME=test_envvar
LOADEDMODULES=
SGE_ROOT=/opt/sge
REQNAME=test_envvar
HISTCONTROL=ignoredups
SGE_JOB_SPOOL_DIR=/var/spool/sge/hpccore/qb3-id1/active_jobs/135988.1
ENVIRONMENT=BATCH
PE_HOSTFILE=/var/spool/sge/hpccore/qb3-id1/active_jobs/135988.1/pe_hostfile
HOME=/wynton/home/alice
SHLVL=2
SGE_CWD_PATH=/wynton/home/alice/test
NQUEUES=1
SGE_O_LOGNAME=alice
SGE_O_MAIL=/var/spool/mail/alice
TMP=/scratch/135988.1.member.q
JOB_ID=135988
LOGNAME=alice
PE=smp
MODULESHOME=/usr/share/Modules
SGE_TASK_FIRST=undefined
LESSOPEN=||/usr/bin/lesspipe.sh %s
SGE_O_PATH=/usr/lib64/openmpi/bin:/opt/sge/bin:/opt/sge/bin/lx-amd64:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
SGE_CLUSTER_NAME=hpccoreclus
SGE_O_HOST=qb3-login1
SGE_O_SHELL=/bin/bash
REQUEST=test_envvar
NSLOTS=4
SGE_STDIN_PATH=/dev/null
_=/bin/env
```


## Environment variables in different languages

Here are some examples how to get the value of environment variable `NSLOTS` in some of the most popular programming languages.  The value is assigned to a local variable `nslots`, and if not set, `1` is used as the default value.  All examples coerce the value to a numeric value and then outputs a message with the value.

### Bash

```sh
nslots=${NSLOTS:-1}
echo "Number of slots available: ${nslots}"
```

### MATLAB

```matlab
nslots = getenv('NSLOTS');              % env var is always a 'char'
if (isempty(nslots)) nslots = '1'; end  % default value
nslots = str2num(nslots);               % coerce to 'double'
fprintf('Number of slots available: %d\n', nslots);
```

### Python

```python
import os
nslots = os.getenv('NSLOTS', '1')  # env var is always a 'str'
nslots = int(nslots)               # coerce to an 'int'
print('Number of slots available: ' + nslots)
```

### R

```r
nslots <- Sys.getenv("NSLOTS", "1")  # env var is always a 'character'
nslots <- as.integer(nslots)         # coerce to an 'integer'
message("Number of slots available: ", nslots)
```


