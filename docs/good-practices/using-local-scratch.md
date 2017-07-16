# Using local /scratch/ space

All nodes have their own locally storage mounted as `/scratch/`.  The `/scratch/` storage is fast - faster than system-wide storage such as `/home/` and `/work/` - which make it ideal for holding intermediate data files.  This will also lower the load on the system-wide storage and the local network.


Here is how you should use `/scratch/`:

* **Write to `/scratch/$USER/`**.  This will minimize the risk for clashing with other users, which may happen if you use the same filename and write to `/scratch/`.

* **Write _intermediate_ data files to `/scratch/$USER/` whenever possible**.  Any job that writes _intermediate_ data to file and later read then back will run faster if using the local scratch storage on the node.

* **Don't leave files on `/scratch/` longer than necessary**.  For instance, have your jobs cleanup after themselves.

* **Specify how much local storage your job will need**.  Local storage is limited to [0.84 - 10.7 TiB depending on node]({{ '/about/cluster-hardware.html' | relative_url }}).  If your job will use up to 400 GiB of disk space, you can specify this resource as `-l gres=scratch:400` (in units of GiB) when submitting the job.  A node with 2,000 GiB of scratch space will at most have five `-l gres=scratch:400` jobs running at the same time.

* **All files on `/scratch/` are local to that node**.  Any files copied / written to a node's `/scratch/` space will only be accessible from that node and not from anywhere else.

## Example

Here is a script called `ex-scratch.sh` that illustrates how to copy input files over from the NFS-mounted `/data` drive to the local scratch of whatever node the job ends up running on.  After processing of the input files is complete, the output files are moved from the local scratch to `/data`.  At the very end, the local scratch is cleaned up.

```sh
#!/bin/env bash
#PBS -j oe

## 0. Create job-specific scratch folder
SCRATCH_JOB=/scratch/$USER/job/$PBS_JOBID
mkdir -p $SCRATCH_JOB

## 1. Copy input files from global disk to local scratch
cp /data/$USER/sample.fq $SCRATCH_JOB/
cp /data/$USER/reference.fa $SCRATCH_JOB/

## 2. Process input files
cd $SCRATCH_JOB
/path/to/my_pipeline --cores=$PBS_NUM_PPN reference.fa sample.fq > output.bam

## 3. Move output files back to global disk
mv output.bam /data/$USER/

## 4. Remove job-specific scratch folder
cd /scratch/$USER
rm -rf $SCRATCH_JOB
```

Assume that the total amount of local scratch you need for your input files and your output files and whatever intermediate files `my_pipeline` needs is 300 GiB, and assume that the process requires up to 4 GiB of RAM to complete.  Moreover, let's say you wish to run in parallel using two cores.  Then you should submit this job script as:
```sh
$ qsub -l gres=scratch:300 -l vmem=4gb -l nodes=1:ppn=2 ex-scratch.sh
```


## Technical details
To clarify, the `gres:scratch` resource is just a bunch of tokens available per node that are handed out to jobs and recollected when those jobs are done.  The number of tokens available for a given node depends on how big it's `/scratch/` drive is.  What is not automatically accounted for is the actual _free_ disk space available on `/scratch/`.  Because of this, it is important that we all have our jobs clean up `/scratch/` usage after themselves so the next user / job can safely run.
