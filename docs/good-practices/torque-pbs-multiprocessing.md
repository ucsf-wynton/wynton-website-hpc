## `PBS_NUM_PPN` - number of cores allotted

When submitting jobs to TORQUE/PBS one can request access to multiple cores/threads on the machine one get allocated to, e.g.
```sh
qsub -l "nodes=1:ppn=8,vmem=12gb"
```
requests one machine (`1`) with eight parallel tasks (`ppn=8`) using in total 12 GiB of RAM (`vmem=12gb`).  For more details on alternatives, see [Submit Jobs] to the scheduler.

When the above job is launched on a node (whichever is available with those resources), the `PBS_NUM_PPN` environment variable is set according to the `ppn=<n>` specifications.  In the above example, it is set as:
```sh
export PBS_NUM_PPN=8
```
Thus, instead of hard-coding the number of cores in your scripts, you can query this variable to see how many parallel tasks your job is allowed to use.  If `ppn=<n>` is not specified, then `PBS_NUM_PPN` is set to `1` (== single-core processing).

### Examples
When using the BWA mem aligner, use
```sh
bwa mem -t $PBS_NUM_PPN ...
```
in your call.  For GATK, one can use
```sh
java -jar /path/to/GenomeAnalysisTK.jar -nt $PBS_NUM_PPN ...
```
or equivalently
```sh
java -jar /path/to/GenomeAnalysisTK.jar --num_threads $PBS_NUM_PPN ...
```


[Submit Jobs]: {{ '/howto/submit-jobs-to-the-scheduler.html' | relative_url }}
