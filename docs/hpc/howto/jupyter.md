# Jupyter Notebook

## Where to to run Jupyter Notebook

[Jupyter Notebook] should only be run on the {{ site.cluster.name }} development nodes. However you cannot connect from outside {{ site.cluster.name }} directly to a development node but rather either need to use SSH port forwarding to establish the connection with a local web browser, else use X2Go to redirect the desktop from the development server to your local desktop and launch a remote web browser there.

This assumes you have Jupyter installed with whichever Python you usually use.

If using the standard system Python, Jupyter Notebook can be installed using `pip`:

```sh
[alice@dev3 ~]$ python3 -m pip install --user notebook
```

If using an Anaconda/Miniconda environment, using the `conda` package manager to install Jupyter Notebook should be used:

```sh
[alice@dev3 ~]$ conda install -c conda-forge notebook
```

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
Note: During startup, Python does a lot of small file operations locating all the required files. The system version Python is installed on the local filesystem on {{ site.cluster.name }} nodes and should have a faster startup time. 

In contrast, for Anaconda and conda environments installed in a home directory, both the Python interpreter and all of it's modules reside on the shared parallel file system.  The operations to look up the needed files are metadata heavy and can strain the parallel file system, resulting in slower startup performance for the script. In particular, if the script is a batch job executing on many compute nodes, the performance impact has the potential to slow operations down for all users. 
</div>


## Connect to Jupyter Notebook - using SSH port forwarding 

In this example, the local port your web browser would connect to is 8888 and the remote port on the development node that the Jupyter Notebook is available is 47467.  You can choose any port in [1024,65535] of your choice to use on your local computer as long as it is not already used by another software.  In this example, we assume port 8888 is free on your local computer.  Similarly, the port used for Jupyter Notebook must be free on the development node.  Since there are other users on machine too, there is always a risk that the port is already occupied by another user already.  If so, there is a risk that port 47467 used in this example will not work.  If so, try another port in [1024,65535].

These ports are configured when you establish the SSH tunnel:

```sh
 local                                  remote
 port 8888 ◀──────────────────────────▶ port 47467
                                                                                               
┌────────┐          ┌────────┐          ┌────────┐
│  home  │          │ login  │          │  dev   │
│ laptop │────────▶ │  node  │────────▶ │  node  │
└────────┘          └────────┘          └────────┘
```

To establish the "tunnel" using SSH port forwarding:

```sh
{local}$ ssh -J alice@{{ site.login.hostname }} -L 8888:localhost:47467 alice@{{ site.devel.name }}
...
[alice@{{ site.devel.name }} ~]$ 
```

Then launch a new Jupyter Notebook running on the development node:

```sh
[alice@{{ site.devel.name }}]$ jupyter notebook --no-browser --port 47467
[I 10:50:23.319 NotebookApp] Serving notebooks from local directory: {{ site.user.home }}
[I 10:50:23.319 NotebookApp] Jupyter Notebook 6.4.10 is running at:
[I 10:50:23.319 NotebookApp] http://localhost:47467/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98
[I 10:50:23.319 NotebookApp]  or http://127.0.0.1:47467/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98
[I 10:50:23.319 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 10:50:23.581 NotebookApp]

    To access the notebook, open this file in a browser:
        file://{{ site.user.home }}/.local/share/jupyter/runtime/nbserver-27971-open.html
    Or copy and paste one of these URLs:
        http://localhost:47467/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98
     or http://127.0.0.1:47467/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98
```

From a web browser on your local system, enter localhost in the address bar followed by the local port (8888 in this example) that was assigned to map to the remote port on the development node (47467 in this example), followed by the access token listed in the terminal.

The address bar in the web browser in this case should resemble:
  
`http://localhost:8888/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98`

Note: the port assigned on the local machine is used in the web browser, rather than the port specified as running on the development node.


## Connect to Jupyter Notebook - using X2Go

An alternative method to run a Jupyter Notebook on one of the development nodes and interact with on your local computer is to use the X2Go software to connect to one of the development nodes, then launch a Jupyter Notebook and a web browser on the development node. The web browser will appear on your remote computer in the X2Go interface while the Jupyter Notebook will be running on {{ site.cluster.name }}.

See the ['Graphical User Interfaces (GUI)'](/hpc/howto/gui-x11fwd.html) for how to setup and use X2Go via one of the {{ site.cluster.name }} development nodes.

<div class="alert alert-info" role="alert" markdown="1">
If you use Python via your own Anaconda installation, instead of the Python version provided by {{ site.cluster.name }}, you can launch a Jupyter Notebook using the `jupyter notebook` command from the terminal connected by X2Go, which will also launch the web browser.
</div>



[Jupyter Notebook]: https://jupyter-notebook.readthedocs.io/en/stable/
