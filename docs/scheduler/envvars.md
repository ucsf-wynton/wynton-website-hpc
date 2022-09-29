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
* `TMPDIR` (string) - the absolute path to a job-specific temporary directory (local on the compute node and owned by `$USER`) that is automatically removed when the job finishes


## Example

To see all environment variable available to a job, we can submit a quick job that outputs all environment variables and their values sorted by name;

```sh
$ cd ~/test/
$ echo "env | sort" | qsub -cwd -j yes -pe smp 4 -l h_rt=00:01:00 -N envvar
Your job 453717 ("envvar") has been submitted
```

When finished, check the content of the job output file:

```sh
$ grep -E "(HOSTNAME|PWD|TMPDIR|NSLOTS|NHOSTS|SGE_|JOB_|PE_)" envvar.o453717
HOSTNAME=qb3-id14
JOB_ID=453717
JOB_NAME=envvar
JOB_SCRIPT=/var/spool/sge/wynton/qb3-id14/job_scripts/453717
NHOSTS=1
NSLOTS=4
PE_HOSTFILE=/var/spool/sge/wynton/qb3-id14/active_jobs/453717.1/pe_hostfile
PWD=/wynton/home/boblab/alice/test
SGE_ACCOUNT=sge
SGE_ARCH=lx-amd64
SGE_BINARY_PATH=/opt/sge/bin/lx-amd64
SGE_CELL=wynton
SGE_CLUSTER_NAME=wynton_cluster
SGE_CWD_PATH=/wynton/home/boblab/alice/test
SGE_JOB_SPOOL_DIR=/var/spool/sge/wynton/qb3-id14/active_jobs/453717.1
SGE_O_HOME=/wynton/home/boblab/alice
SGE_O_HOST=dev3
SGE_O_LOGNAME=alice
SGE_O_MAIL=/var/spool/mail/alice
SGE_O_PATH=/opt/sge/bin:/opt/sge/bin/lx-amd64:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/wynton/home/boblab/alice/.local/bin:/wynton/home/boblab/alice/bin
SGE_O_SHELL=/bin/bash
SGE_O_WORKDIR=/wynton/home/boblab/alice/test
SGE_ROOT=/opt/sge
SGE_RSH_COMMAND=builtin
SGE_STDERR_PATH=/wynton/home/boblab/alice/test/envvar.o453717
SGE_STDIN_PATH=/dev/null
SGE_STDOUT_PATH=/wynton/home/boblab/alice/test/envvar.o453717
SGE_TASK_FIRST=undefined
SGE_TASK_ID=undefined
SGE_TASK_LAST=undefined
SGE_TASK_STEPSIZE=undefined
TMPDIR=/scratch/453717.1.long.q
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

See also the how-to page on ['Work with MATLAB'](/hpc/howto/matlab.html).



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

See also the how-to page on ['Work with R'](/hpc/howto/r.html).


### Ruby

```ruby
nslots = ENV["NSLOTS"] || "1"        # env var is always a 'String'
nslots = nslots.to_i                 # coerce to 'Integer'
puts "Number of slots available: #{nslots}"
```
