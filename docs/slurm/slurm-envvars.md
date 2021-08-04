# Useful Slurm Job Environment Variables

Some of the environment variables set by the scheduler and available to a job at runtime:

* `HOSTNAME` (string) - the name of the machine where the job is launched

* `SLURM_JOB_ID` (integer) - a unique job identifier

* `SLURM_JOB_NAME` (string) - the name of the job as it appears on the queue

* `SLURM_NNODES` (integer) - the number of hosts for a parallel job (default: 1)

* `SLURM_CPUS_ON_NODE` (integer) - the number of slots allocated for a parallel job (default: 1)

* `PE_HOSTFILE` (string) - the absolute path of a file with rows of machines allocated to a parallel job

* `SGE_GPU` (comma-separated integers or `undefined`) - set of GPU core indices allocated to a GPU job (default: `undefined`)

* `SLURM_ARRAY_JOB_ID` (integer or `undefined`) - subtask identifier for array jobs (default: `undefined`)

* `TMP` (string) - same as `TMPDIR`

* `TMPDIR` (string) - the absolute path to a job-specific temporary directory (local on the compute node and owned by `$USER`) that is automatically removed when the job finishes


## Example

To see all environment variable available to a job, submit a job that calls `env`:

```sh
$ cd ~/test/
$ echo "env" | sbatch --ntasks=4 --time=00:01:00 --job-name=test_envvar
Your job 135988 ("test_envvar") has been submitted
```

When finished, check the content of the job output file:
```sh
$ grep -E "(HOSTNAME|SLURM_CPUS_ON_NODE|SLURM_NNODES|SLURM_JOB_ID|SLURM_JOB_NAME|PWD)" test_envvar.o135988
HOSTNAME=qb3-id1
SLURM_NNODES=1
SLURM_JOB_ID=135988
SLURM_JOB_NAME=test_envvar
PWD=/wynton/home/alice/test
SLURM_CPUS_ON_NODE=1


$ cat test_envvar.o135988
SLURM_NODELIST=tc1
SLURM_JOB_NAME=environ.sh
MANPATH=/opt/sge/man:/usr/share/man/overrides:/usr/share/man:/usr/local/share/man
XDG_SESSION_ID=41999
SLURMD_NODENAME=tc1
SLURM_TOPOLOGY_ADDR=tc1
HOSTNAME=tc1
SLURM_PRIO_PROCESS=0
SELINUX_ROLE_REQUESTED=
SLURM_NODE_ALIASES=(null)
SHELL=/bin/bash
TERM=xterm-256color
SLURM_JOB_QOS=salilab
HISTSIZE=1000
TMPDIR=/scratch/135988
SLURM_TOPOLOGY_ADDR_PATTERN=node
SELINUX_USE_CURRENT_RANGE=
SSH_TTY=/dev/pts/3
SLURM_NNODES=1
USER=alice
SLURM_JOBID=135988
SLURM_TASKS_PER_NODE=1
PATH=/opt/sge/bin:/opt/sge/bin/lx-amd64:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/wynton/home/alice/.local/bin:/wynton/home/alice/bin
MAIL=/var/spool/mail/alice
SLURM_CONF=/etc/slurm/slurm.conf
SLURM_JOB_ID=135988
_=/usr/bin/env
SLURM_JOB_USER=alice
PWD=/wynton/home/alice
LANG=en_US.UTF-8
SLURM_JOB_UID=61167
SGE_ROOT=/opt/sge
SLURM_NODEID=0
SLURM_SUBMIT_DIR=/wynton/home/alice/
SELINUX_LEVEL_REQUESTED=
SLURM_TASK_PID=31801
SLURM_CPUS_ON_NODE=1
SLURM_PROCID=0
ENVIRONMENT=BATCH
KRB5CCNAME=KEYRING:persistent:61167
HISTCONTROL=ignoredups
SLURM_JOB_NODELIST=tc1
HOME=/wynton/home/alice
SHLVL=2
SLURM_LOCALID=0
SLURM_JOB_GID=60000
SLURM_JOB_CPUS_PER_NODE=1
SLURM_CLUSTER_NAME=wynton
SLURM_GTIDS=0
SLURM_SUBMIT_HOST=log1.wynton.ucsf.edu
SLURM_JOB_PARTITION=member
LOGNAME=alice
SLURM_JOB_ACCOUNT=salilab
SLURM_JOB_NUM_NODES=1
LESSOPEN=||/usr/bin/lesspipe.sh %s
XDG_RUNTIME_DIR=/run/user/61167
SLURM_MEM_PER_NODE=24099
```
