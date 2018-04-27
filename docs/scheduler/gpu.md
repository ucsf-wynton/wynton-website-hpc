# GPU Scheduling

## Compiling GPU applications

The CUDA development toolkit is installed on the [development nodes].  Several versions of CUDA are available via software modules.  To see the currently available versions, run the command:
```sh
module avail
```

## Submitting GPU jobs

GPU jobs run in a dedicated queue which must be requested in the job submission.  Each slot in this queue represents a GPU that the job will use.  Therefore, users must ensure that every job's GPU use matches its submission request.  For a job using a single GPU, the submission should look like:
```sh
qsub -q gpu.q ...
```
Jobs requiring more than one GPU must be submited like this:
```sh
qsub -q gpu.q -pe smp N ...
```
where N is the number of GPUs the job will use.

If your application requires MPI, you should still use the proper parallel environment regardless of how many GPUs you'll be using:
```sh
qsub -q gpu.q -pe mpi_onehost N ...
mpirun -np M --oversubscribe ...
```
where N is the number of GPUs your job will use and M is the number of MPI processes your job will launch.  M does not have to equal N (see below).

## Running GPU applications
Several CUDA runtimes are installed on the GPU nodes.  They can be loaded via modules just as above on the development nodes.  
### GPU selection
When your job is assigned to a node, it will also be assigned specific GPUs on that node.  The GPU assignment will be contained in the environment variable `SGE_GPU` as a comma-delimited set of numbers.  Be sure to send this assignment to your application using the proper format for your application.

### CPU core usage
Since we are using gpu.q slots to represent GPUs rather than the usual CPU cores, there is no way to ensure that a GPU node's CPU cores don't get oversubscribed.  For this reason, please limit your CPU core usage to 4 CPU cores per GPU requested.  This will prevent CPU core overloading on all the GPU node types.

## GPU use monitoring
While it is not possible to log directly into the GPU nodes to monitor their usage, several statistics are availble from the login hosts.  For example:
```sh
$ qconf -se msg-iogpu3
hostname              msg-iogpu3
load_scaling          NONE
complex_values        mem_free=128000M
load_values           arch=lx-amd64,num_proc=32,mem_total=128739.226562M, \
                      swap_total=4095.996094M,virtual_total=132835.222656M, \
                      m_topology=SCTTCTTCTTCTTCTTCTTCTTCTTSCTTCTTCTTCTTCTTCTTCTTCTT, \
                      m_socket=2,m_core=16,m_thread=32,load_avg=5.020000, \
                      load_short=4.640000,load_medium=5.020000, \
                      load_long=5.110000,mem_free=124798.726562M, \
                      swap_free=4095.996094M,virtual_free=128894.722656M, \
                      mem_used=3940.500000M,swap_used=0.000000M, \
                      virtual_used=3940.500000M,cpu=17.700000, \
                      m_topology_inuse=SCTTCTTCTTCTTCTTCTTCTTCTTSCTTCTTCTTCTTCTTCTTCTTCTT, \
                      np_load_avg=0.156875,np_load_short=0.145000, \
                      np_load_medium=0.156875,np_load_long=0.159688, \
                      gpu.ncuda=2,gpu.ndev=2,gpu.cuda.0.mem_free=758054912, \
                      gpu.cuda.0.procs=1,gpu.cuda.0.clock=2025, \
                      gpu.cuda.0.util=57,gpu.cuda.1.mem_free=758054912, \
                      gpu.cuda.1.procs=1,gpu.cuda.1.clock=2025, \
                      gpu.cuda.1.util=54,gpu.names=GeForce GTX 1080;GeForce \
                      GTX 1080;
processors            32
user_lists            NONE
xuser_lists           NONE
projects              NONE
xprojects             NONE
usage_scaling         NONE
report_variables      NONE
```
The above shows that host `msg-iogpu3` has 2 GTX 1080 GPUs.  Each GPU is running one process, each is just over 50% utilized, and each has approximately 722 MiB (758,054,912 bytes) of free memory.

[submit jobs]: {{ '/scheduler/submit-jobs.html' | relative_url }}
[list jobs]: {{ '/scheduler/list-jobs.html' | relative_url }}
[development nodes]: {{ 'get-started/development-prototyping.html' | relative_url }}
