### SGE to Slurm Job/Batch Conversion

Sun Grid Engine (SGE) and Slurm job scheduler concepts are overall somewhat similar, but the commands for interacting with the scheduler are different. Below is a table of some common SGE commands and their Slurm equivalents to make use of as you use the new cluster and adapt your batch scripts to SLURM.

This page is a partial adaption of the SchedMD ["rosetta"](https://slurm.schedmd.com/rosetta.pdf) PDF. For more details and equivalent commands from other schedulers, i.e. PBS and LSF, see that document. 

In addition, the ["Slurm Command Reference"](https://slurm.schedmd.com/pdfs/summary.pdf) PDF from SchedMD is extremely useful. I suggest you print it that PDF out and pin it to your bulletin board to aid in learning your way around Slurm.

|**User Commands**|**SGE**|**Slurm**|
|:---|:---|:---|
|**Job Submission**|`qsub [script file]`|`sbatch [script file]`|
|**Job deletion**|`qdel [job_id]`|`scancel [SLURM_JOB_ID]`|
|**Job status by job**|`qstat -u \* [-j job_id]`|`squeue [-j job_id]`|
|**Job status by user**|`qstat [-u user_name]`|`squeue -u [user_name]`|
|**Job hold**|`qhold [job_id]`|`scontrol hold [job_id]`|
|**Job release**|`qrls [job_id]`|`scontrol release [job_id]`|
|**Queue list**|`qconf -sql`|`squeue`|
|**List nodes**|`qhost`|`sinfo -N` OR `scontrol show nodes`|
|**Cluster status**|`qhost -q`|`sinfo`|
||||
|**Environmental Variables**|**SGE**|**Slurm**|
|**Job ID**|$JOB_ID|$SLURM_JOB_ID|
|**Submit directory**|$SGE_O_WORKDIR|$SLURM_SUBMIT_DIR|
|**Submit host**|$SGE_O_HOST|$SLURM_SUBMIT_HOST|
|**Node list**|$PE_HOSTFILE|$SLURM_JOB_NODELIST|
|**Job Array Index**|$SGE_TASK_ID|$SLURM_ARRAY_TASK_ID|
||||
|**Job Specification**|**SGE**|**Slurm**|
|**Script directive**|#$|#SBATCH|
|**queue**|`-q [queue`]|`-p [queue]`|
|**count of nodes**|`N/A`|`-N [min[-max]]` OR `--nodes=[min[-max]`|
|**CPU count**|`-pe [PE] [count]`|`-n [count]` OR `--ntasks=[count]`|
|**Wall clock limit**|`-l h_rt=[seconds]`|`-t [min]` OR `-t [days-hh:mm:ss]`|
|**Standard out file**|`-o [file_name]`|`-o [file_name]`|
|**Standard error file**|`-e [file_name]`|`-e [file_name]`|
|**Combine STDOUT & STDERR files**|`-j yes`|`(use -o without -e)`|
|**Copy environment**|`-V`| `--export=[ALL or NONE or variables]`|
|**Treat Job As Run In Login Shell**|DEFAULT| Include the following line in your script: `. $HOME/.bash_profile`|
|**Event notification**|`-m abe`|`--mail-type=[events]`|
|**Specify Email Notification Recipient**|`-M [address]`|`--mail-user=[address]`|
|**Job name**|`-N [name]`|`--job-name=[name]`|
|**Job name**|`-N [name]`|`--job-name=[name]`|
|**Set working directory**|`-wd [directory]`|`--workdir=[dir_name]`|
|**Resource sharing**|`-l exclusive`|`--exclusive` OR `--shared`|
|**Memory size**|`-l mem_free=[memory][K,M,G]`|`--mem=[mem][M,G,T]` OR `--mem-per-cpu=[mem][M,G,T]`|
|**Use Lab Account**|`-A [account]`|`--account=[account]`|
|**Tasks per node**|(Fixed allocation_rule in PE)|`--tasks-per-node=[count]`|
|**Job dependency**|`-hold_jid [job_id or job_name]`|`--depend=[state:job_id]`|
|**Job project**|`-P [name]`|`--wckey=[name]`|
|**Job host preference**|`-q [queue]@[node]` OR `-q[queue]@@[hostgroup]`|`--nodelist=[nodes]` AND/OR `--exclude=[nodes]`|
|**Quality of service**|n/a|`--qos=[name]`|
|**Job arrays**|`-t [array_spec]`|`--array=[array_spec]`|
|**Generic Resources**|`-l [resource]=[value]`|`--gres=[resource_spec]`|
|**Constraint**|`-f`|`-C` OR `--constraint=[list of features required or desired by job]`|
|**Begin Time**|`-a [YYMMDDhhmm]`|`--begin=YYYY-MM-DD[THH:MM[:SS]]`|

**SGE**
```sh
   qstat
   qstat -u username 
   qstat -f
```
```sh
   qsub
   qsub -N jobname
   qsub -l h_rt=24:00:00
   qsub -pe dmp4 16
   qsub -l mem=4G
   qsub -o filename
   qsub -e filename
   qsub -l scratch_free=20G
```   
**Slurm**
```sh
   squeue
   squeue -u username 
   squeue -al
```
```sh
   sbatch
   sbatch -J jobname
   sbatch -t 24:00:00
   sbatch -p node -n 16
   sbatch --mem=4000
   sbatch -o filename
   sbatch -e filename
```
**Example SGE batch script for a single-core application**
```sh
#!/bin/bash
#
#
#$ -N test
#$ -j y
#$ -o test.output
#$ -cwd
#$ -M alice.bobson@ucsf.edu
#$ -m bea
# Request 5 hours run time
#$ -l h_rt=05:00:00
#$ -P your_project_id_here
#
#$ -l mem=4G
# 
 
<call your app here>
```
**Example Slurm batch script for a single-core application**
```sh
#!/bin/bash
#
#
#SBATCH -J test
#SBATCH -o test."%j".out
#SBATCH -e test."%j".err
#SBATCH --mail-user=alice.bobson@ucsf.edu
#SBATCH --mail-type=BEGIN,END,FAIL
# Request 5 hours run time
#SBATCH -t 05:00:00
## SBATCH -A $LAB_ACCOUNT or --account=$LAB_ACCOUNT #(only necessary if you have more than one Lab association, otherwise default Lab Account association used)
#SBATCH --mem=4GB

 
<load modules, call your app here>
```
