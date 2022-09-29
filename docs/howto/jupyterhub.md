<div class="alert alert-warning" role="alert" markdown="1">
JHub login is restricted to non-PHI Wynton user accounts. If you have a Wynton PHI account, you will not be able to access JHub.
</div>

## Log in to Wynton JupyterHub (JHub)

As of now JHub can be accessed either by connecting to VPN or from campus network using [JupyterHub Login](https://jhub.wynton.ucsf.edu/hub/login).

Please set up your own environment before getting started. The base environment on JupyterHub is installed locally on the server and won't be accessible from the cluster. 

There are several ways one can set up an environment, we recommend using `virtualenv`. See [Installing packages to a virtual environment]({{ '/howto/python.html#2-installing-to-a-virtual-environment-aka-virtualenv' | relative_url }}) for instructions.


## Creating an IPython kernel for virtual environment

To create an IPython kernel that you can access from JHub follow the steps below.
First, activate the virtual environment, i.e.

```python
[alice@{{ site.devel.name }} ~]$ cd my_project
[alice@{{ site.devel.name }} my_project]$ . bin/activate
(my_project) [alice@{{ site.devel.name }} my_project]$ 
```

Second, install the **ipykernel** package and create an IPython kernel:

```bash
(my_project) [alice@{{ site.devel.name }} my_project]$ python -m pip install ipykernel
(my_project) [alice@{{ site.devel.name }} my_project]$ python -m ipykernel install --user --name=<my_project>
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
                         "host": "172.26.28.50:40000"
                     })
```

```python
import os

# Set environment variables
os.environ["SGE_ROOT"] = "/opt/sge"
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
