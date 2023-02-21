# Jupyter Notebook

## Where to to run Jupyter Notebook

[Jupyter Notebook] should only be run on the {{ site.cluster.name }}
development nodes. However, you cannot connect from outside
{{ site.cluster.name }} directly to a development node, but rather
either need to use SSH port forwarding to establish the connection
with a local web browser, else use X2Go to redirect the desktop from
the development server to your local desktop and launch a remote web
browser there.

This assumes you have Jupyter installed with whichever Python you
usually use.

If using the standard system Python, Jupyter Notebook can be installed
using `pip`:

```sh
[alice@{{ site.devel.name }} ~]$ python3 -m pip install --user notebook
```

If using a Conda environment, using the `conda` package manager to
install Jupyter Notebook should be used:

```sh
[alice@{{ site.devel.name }} ~]$ conda install -c conda-forge notebook
```

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">

Note: During startup, Python does a lot of small file operations
locating all the required files. The system version Python is
installed on the local filesystem on {{ site.cluster.name }} nodes and
should have a faster startup time.

In contrast, for Conda environments installed in a home directory,
both the Python interpreter and all of it's modules reside on the
shared parallel file system.  The operations to look up the needed
files are metadata heavy and can strain the parallel file system,
resulting in slower startup performance for the script. In particular,
if the script is a batch job executing on many compute nodes, the
performance impact has the potential to slow operations down for all
users.

</div>


## Running Jupyter Notebook

Running Jupyter Notebook on {{ site.cluster.name }} involves three
steps.  On an development node,

1. find an available TCP port

2. launch Jupyter Notebook on select port, and

3. set up a TCP port tunnel from your local machine to the {{
   site.cluster.nickname }} development node where Jupyter runs


### Step 1. Find an available TCP port

Jupyter Notebook makes itself available via the web browser.  In order
for multiple users to run Jupyter at the same time, each Jupyter
instance must be served on a unique port in [1024,65535].  This port
has to be free, that is, it must _not_ already be used by any other
processes on the same machine.  One way to find such a port is to
simply pick a random port and hope no one else is already using the
port.  An alternative approach, is to use the **port4me** tool, which
will find a free port, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI port4me
[alice@{{ site.devel.name }} ~]$ port4me --tool=jupypter
13583
```

_Make a note of the port number you get - you will need it next._

Comment: The **port4me** tool is designed to find the same free port
each time you use it. It is only when that port happens to be already
occupied that you will get another port, but most of the time, you
will be using the same one over time.


### Step 2. Launch Jupyter Notebook

Next, we launch Jupyter Notebook on the same development node:

```sh
[alice@{{ site.devel.name }}]$ jupyter notebook --no-browser --port 13583
[I 10:50:23.319 NotebookApp] Serving notebooks from local directory: {{ site.user.home }}
[I 10:50:23.319 NotebookApp] Jupyter Notebook 6.4.10 is running at:
[I 10:50:23.319 NotebookApp] http://localhost:13583/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98
[I 10:50:23.319 NotebookApp]  or http://127.0.0.1:13583/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98
[I 10:50:23.319 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 10:50:23.581 NotebookApp]

    To access the notebook, open this file in a browser:
        file://{{ site.user.home }}/.local/share/jupyter/runtime/nbserver-27971-open.html
    Or copy and paste one of these URLs:
        http://localhost:13583/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98
     or http://127.0.0.1:13583/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98
```

However, these instructions do _not_ work out of the box, because they
are based on the assumption that you run Jupyter on your local
machine.  If you try to open one of these links, your browser produces
a "site-not-found" error.  To solve this, we need to complete the next
step.


### Step 3. Set up SSH port forwarding 

Above, Jupyter makes itself available on the local machine _where it
runs_, which in our case is development node `{{ site.devel.name }}`.
In order for us to access this from the web browser running on our
local machine, we need to tunnel the TCP port from on your local
machine to the port on the development node.  This can be achieved
using SSH port forward. To do this, _open a terminal on your local
machine_, and run:

```sh
{local}$ ssh -J {{ site.login.hostname }} -L 13583:localhost:13583 alice@{{ site.devel.name }}
...
[alice@{{ site.devel.name }} ~]$ 
```
_Importantly_, in your case, you will need to replace both instance of
`13583` with the port number that you used in Step 2.


Now your personal Jupyter Notebook instance running on
`{{ site.devel.name }}` is accessible directly from the web
browser running on your local computer.  To do this, open one of the
HTTP links outputted by Jupyter in Step 2, e.g.
  
 * <http://localhost:13583/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98> (your port and token will be different)


## Alternative: Run Jupyter Notebook via X2Go

An alternative method to run a Jupyter Notebook on one of the
development nodes and interact with on your local computer is to use
the X2Go software to connect to one of the development nodes, then
launch a Jupyter Notebook and a web browser on the development
node. The web browser will appear on your remote computer in the X2Go
interface while the Jupyter Notebook will be running on
{{ site.cluster.name }}.

See the ['Graphical User Interfaces (GUI)'] for how to setup and use
X2Go via one of the {{ site.cluster.name }} development nodes.


<div class="alert alert-info" role="alert" markdown="1">
If you use Python via your own Anaconda installation, instead of the
Python version provided by {{ site.cluster.name }}, you can launch a
Jupyter Notebook using the `jupyter notebook` command from the
terminal connected by X2Go, which will also launch the web browser.
</div>



[Jupyter Notebook]: https://jupyter-notebook.readthedocs.io/en/stable/
['Graphical User Interfaces (GUI)']: /hpc/howto/gui-x11fwd.html