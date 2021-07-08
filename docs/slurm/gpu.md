<div class="alert alert-info" role="alert">
2019-09-20: Wynton HPC has {{ site.data.specs.gpu_nodes }} GPU nodes with a total of {{ site.data.specs.gpus }} GPUs available to all users. Among these, {{ site.data.specs.gpu_nodes | minus: site.data.specs.communal_gpu_nodes }} GPU nodes, with a total of {{ site.data.specs.gpus | minus: site.data.specs.communal_gpus }} GPUs, were contributed by different research groups. GPU jobs are limited to 2 hours in length when run on GPUs not contributed by the running user's lab.  In contrast, <a href="{{ '/scheduler/queues.html' | relative_url }}">contributors are <em>not</em> limited to 2-hour GPU jobs on nodes they contributed</a>.
There is also one GPU development node that is available to all users.
</div>


# Slurm GPU Scheduling

## Compiling GPU applications

The [CUDA Toolkit] is installed on the [development nodes].  Several versions of CUDA are available via software modules.  To see the currently available versions, run the command:
```sh
module avail cuda
```


## Submitting GPU jobs

Batch GPU jobs run on dedicated GPU nodes and are submitted from login nodes or dev nodes, the Slurm scheduler will send the jobs to the appropriate GPU nodes. Interactive work or prototyping should be done on GPU dev nodes (gpudev1). 

For a job using a single GPU, the submission should look like:
```sh
sbatch --gres=gpu:1 ...
```
Jobs requiring more than one GPU must be submitted like this up to the number of GPUs in an individual server.
```sh
sbatch --gres=gpu:N --ntasks=1 --nodes=1
```
where N is the number of GPUs the job will use.

If your application requires MPI, you should still use the proper parallel environment regardless of how many GPUs you'll be using:
```sh
sbatch --gres=gpu:N --ntasks=M --nodes=1
mpirun -np M --oversubscribe ...
```
where N is the number of GPUs your job will use and M is the number of MPI processes your job will launch.  M does not have to equal N (see below).


## GPU relevant resource requests

The GPU nodes in {{ site.cluster.name }} contain many different generations and models of NVIDIA GPUs. 

Specifying the type of GPU resources is not required.  If you do specify one, your job will be scheduled on a GPU node of the model specified.  As an example, if you wanted to only run on a GPU node with a Tesla K80, you would specify:

```sh
--gres=gpu:telsa_k80
```
Note: that doesn't allow for "run on anything this generation or above" type jobs, rather it will only run the job on a GPU node with the exact model specified.

## Running GPU applications

Several CUDA runtimes are installed on the GPU nodes.  They can be loaded via modules just as above on the development nodes, e.g. `module load cuda` and `module load cuda/7.5`.

### GPU selection

When your job is assigned to a node, it will also be assigned specific GPUs on that node.  The GPU assignment will be contained in the environment variable `SLURM_JOB_GPUS` as a comma-delimited set of one or more non-negative integers where then number of integers corresponds to the number of GPU cores requested.  For example, a 3-core GPU job (`--ntasks=3`) may get assigned GPU cores `SLURM_JOB_GPUS=2,0,6` whereas a 1-core GPU job (`--ntasks=1`) may get assigned GPU core `SLURM_JOB_GPUS=5`.  Be sure to send this GPU-core assignment to your application using the proper format for your application.

For example, if your application uses CUDA, you should limit which GPUs are used with:
```sh
export CUDA_VISIBLE_DEVICES=$SLURM_JOB_GPUS
```

<div class="alert alert-warning" role="alert">
To avoid overloading GPUs, it is important that each job use only the GPUs it was assigned, which is given by environment variable <code>SLURM_JOB_GPUS</code>.
</div>


### CPU core usage

Users can now specify exactly how many CPUs and GPUs they want their jobs to use.


## GPU use monitoring

While it is not possible to log directly into the GPU nodes to monitor their usage, several statistics are available from the login hosts.  For example:
```sh
[alice@{{ site.devel.name }} ~]$  scontrol show node qb3-idgpu2
NodeName=qb3-idgpu2 Arch=x86_64 CoresPerSocket=14
   CPUAlloc=0 CPUTot=28 CPULoad=0.01
   AvailableFeatures=sse,sse2,sse41,sse42,ssd,10g,cpu_xeon
   ActiveFeatures=sse,sse2,sse41,sse42,ssd,10g,cpu_xeon
   Gres=gpu:geforce_gtx_1080:4
   NodeAddr=qb3-idgpu2 NodeHostName=qb3-idgpu2 Version=20.02.6
   OS=Linux 3.10.0-1160.11.1.el7.x86_64 #1 SMP Fri Dec 18 16:34:56 UTC 2020
   RealMemory=257847 AllocMem=0 FreeMem=249100 Sockets=2 Boards=1
   State=IDLE ThreadsPerCore=1 TmpDisk=1700000 Weight=1 Owner=N/A MCS_label=N/A
   Partitions=member,long
   BootTime=2021-03-04T15:11:36 SlurmdStartTime=2021-03-05T09:26:30
   CfgTRES=cpu=28,mem=257847M,billing=28
   AllocTRES=
   CapWatts=n/a
   CurrentWatts=0 AveWatts=0
   ExtSensorsJoules=n/s ExtSensorsWatts=0 ExtSensorsTemp=n/s

```
The above shows that host `qb3-idgpu2` has 4 geforce_gtx_1080.


[submit jobs]: {{ '/slurm/submit-jobs.html' | relative_url }}
[list jobs]: {{ '/slurm/list-jobs.html' | relative_url }}
[development nodes]: {{ 'get-started/development-prototyping.html' | relative_url }}
[CUDA Toolkit]: https://developer.nvidia.com/cuda-toolkit
[CUDA]: https://en.wikipedia.org/wiki/CUDA
[NVIDIA's CUDA GPU page]: https://developer.nvidia.com/cuda-gpus
[GeForce GTX 1080]: https://en.wikipedia.org/wiki/GeForce_10_series
