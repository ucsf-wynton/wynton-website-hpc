<div class="alert alert-info" role="alert" style="margin-top: 3ex" markdown="1">
2022-11-21: **Beta version!** The Jupyter Hub server is under development. If you find any issues, please reach out to us.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
⚠️ 2023-01-09: The Jupyter Hub server can only be accessed from the UCSF network. Wynton 2FA is currently not supported.  If you're outside, please use the UCSF VPN, if you have the option.
</div>

<div class="alert alert-warning" role="alert" markdown="1">
JHub login is restricted to non-PHI Wynton user accounts. If you have a Wynton PHI account, you will not be able to access JHub.
</div>


## Log in to Wynton JupyterHub (JHub)

As of now JHub can be accessed either by connecting to VPN or from campus network using [JupyterHub Login](https://jhub.wynton.ucsf.edu/hub/login).

Please set up your own environment before getting started. The base environment on JupyterHub is installed locally on the server and won't be accessible from the cluster. 

There are several ways one can set up an environment, we recommend using `virtualenv`. See [Installing packages to a virtual environment](/hpc/howto/python.html#2-installing-to-a-virtual-environment-aka-virtualenv) for instructions.


## Creating an IPython kernel for virtual environment

To create an IPython kernel that you can access from JHub follow the steps below.
First, activate the virtual environment, i.e.

```sh
[alice@{{ site.devel.name }} ~]$ cd my_project
[alice@{{ site.devel.name }} my_project]$ . bin/activate
(my_project) [alice@{{ site.devel.name }} my_project]$ 
```

Second, install the **ipykernel** package and create an IPython kernel:

```sh
(my_project) [alice@{{ site.devel.name }} my_project]$ python3 -m pip install ipykernel
(my_project) [alice@{{ site.devel.name }} my_project]$ python3 -m ipykernel install --user --name=<my_project>
```

Refresh JHub page and you should see the new IPython kernel. 


## Interactive Data Science on SGE with Dask

[Dask] can scale Python natively by distributing the job to compute nodes. You would have to use Dask-specific libraries to be able to leverage this. 

```python
from dask_jobqueue import SGECluster
from dask.distributed import Client

cluster = SGECluster(queue = "short.q",
                     cores = 1,
                     memory = "1GB",
                     walltime = "00:10:00",
                     death_timeout = 60,
                     local_directory = "/wynton/scratch/$USER",
                     log_directory = "~/dask_logs",
                     
                     # Python for Dask worker to use, visible to the grid nodes
                     python = "/wynton/group/jhadmin/base-clone/bin/python",
                     
                     # Increment the port up from 40000 if it's taken. 
                     # Needed for the Dask workers to communicate back
                     # to the scheduler on the app server
                     scheduler_options = {
                         "host": "jhub.wynton.ucsf.edu:40000"
                     })
```

```python
import os

# Set environment variables
os.environ["SGE_ROOT"] = "/opt/sge"
os.environ["SGE_CLUSTER_NAME"]="wynton_cluster"
os.environ["SGE_CELL"]="wynton"
os.environ["SGE_ARCH"]="lx-amd64"
```

```python
cluster.scale(2) # number of workers needed for your job
client = Client(cluster)
client
```

You can check if the workers are assigned, by running the `qstat` command from the Python prompt as:

```python
!qstat
```

To print the assigned SGE parameters, call:

```python
print(cluster.job_script())
```


[Dask]: https://www.dask.org
