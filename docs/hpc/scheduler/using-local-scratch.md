# Using Local /scratch (TMPDIR) on Compute Nodes

All nodes (compute and development) have their own locally storage mounted as `/scratch`.  The `/scratch` storage is fast - faster than system-wide storage such as home folders but also <span class="non-protected">`/wynton/scratch`</span><span class="protected">`/wynton/protected/scratch`</span> - which make it ideal for holding intermediate data files.  This will also lower the load on the system-wide storage and the local network.  Using local `/scratch` is a win-win for everyone.

## Instructions

Here is how to use `/scratch`:

* **Use environment variable TMPDIR** - on compute nodes, it points to an already created job-specific folder under local `/scratch`.  On other machines, you need to set it.

* **Write intermediate files to folder `$TMPDIR`**.  Bonus: most software already acknowledges `TMPDIR` for their internal temporary files.

* When done, make sure to copy TMPDIR files to be kept to your persistent storage, e.g. to `$HOME`.

* The **job-specific TMPDIR folder (e.g. `/scratch/8327141.1.long.q`) will be deleted automatically when the job terminates**.

* **Specify how much local scratch (TMPDIR) storage your job will need**.  Local storage is limited to [{{ site.data.specs.local_scratch_size_min }}-{{ site.data.specs.local_scratch_size_max }} TiB/node](/hpc/about/specs.html).  If your job will use up to 200 GiB of disk space, you can specify this resource as `-l scratch=200G` (in units of GiB) when submitting the job.  A node with 800 GiB of scratch space can support up to four `-l scratch=200G` jobs running at the same time.


### Example

Here is a script called `ex-scratch.sh` that illustrates how to copy input files over from the `$HOME` folder to the local scratch folder (TMPDIR) of whatever node the job ends up running on.  After processing of the input files is complete, the output files are moved from the local scratch (TMPDIR) to HOME.

```sh
#!/bin/env bash
#$ -S /bin/bash     # the shell language when run via the job scheduler [IMPORTANT]
#$ -cwd             # use current working directory
#$ -l scratch=200G  # needs 200 GiB of /scratch space

## 0. In case TMPDIR is not set, set it to local /scratch, 
##    if it exists, otherwise to /tmp
if [[ -z "$TMPDIR" ]]; then
  if [[ -d /scratch ]]; then TMPDIR=/scratch/$USER; else TMPDIR=/tmp/$USER; fi
  mkdir -p "$TMPDIR"
  export TMPDIR
fi

## 1. Use a temporary working directory
cd "$TMPDIR"

## 2. Copy input files from global disk to local scratch
cp ~/sample.fq .
cp ~/reference.fa .

## 3. Process input files
/path/to/my_pipeline --cores="${NSLOTS:-1}" reference.fa sample.fq > output.bam

## 4. Move output files back to global disk
mv output.bam ~

## 5. End-of-job summary
[[ -n "$JOB_ID" ]] && qstat -j "$JOB_ID"
```

Assume that the total amount of local scratch you need for your input files and your output files and whatever intermediate files `my_pipeline` needs is 100 GiB, and assume that the process requires up to 8 GiB of RAM (=4 GiB per core) to complete.  Moreover, let's say you wish to run in parallel using two cores.  Then you should submit this job script as:

```sh
$ qsub -l scratch=100G -l mem_free=4G -pe smp 2 ex-scratch.sh
```


To understand the purpose of `qstat -j` at the end, see the [Job Summary](/hpc/scheduler/job-summary.html) page.
