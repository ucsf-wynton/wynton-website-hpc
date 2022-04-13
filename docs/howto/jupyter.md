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
Note: During startup Python does a lot of small file operations locating all the required files. 

The system version Python is installed on the local filesystem on Wynton nodes and should have a faster startup time. 

For Anaconda and conda environments installed in a home directory both the Python interpreter and all of it's modules reside on the shared parallel file system.  The operations to look up the needed files are metadata heavy and can strain the parallel file system resulting in slower startup performance for the script. In particular if the script is a batch job executing on many compute nodes, the performance impact has the potential to slow operations down for all users. 
</div>

## Connect to Jupyter Notebook - using SSH port forwarding 

In this example the local port your web browser would connect to is 8157 and the remote port the Jupyter Notebook is running on the development node is 8890.  These ports are configured when you establish the SSH tunnel:

```sh
   local                                  remote 
   port 8157 ◀──────────────────────────▶ port 8890                            
                                                                                               
┌────────┐          ┌────────┐            ┌────────┐                                        
│  home  │          │ login  │            │  dev   │  
│ laptop │────────▶ │  node  │──────────▶ │  node  │                       
└────────┘          └────────┘            └────────┘ 
```

To establish the "tunnel" using SSH port forwarding:

```sh
[alice@local ~]$ ssh alice@{{ site.devel.name }}.wynton.ucsf.edu -J alice@log2.wynton.ucsf.edu -L 8157:localhost:8890

Duo two-factor login for alice
Enter a passcode or select one of the following options:

 1. Duo Push to XXX-XXX-9999
 2. Phone call to XXX-XXX-9999
 3. SMS passcodes to XXX-XXX-9999

Passcode or option (1-3): 1
Success. Logging you in...
Remember connection authentication from c-73-70-233-129 for 12 hours? [y/N] n  

[alice@{{ site.devel.name }} ~]$ 
```

Then launch a new Jupyter Notebook running on the development node:

```sh
[alice@{{ site.devel.name }}]$ jupyter notebook --port 8890
[I 10:50:23.319 NotebookApp] Serving notebooks from local directory: {{ site.user.home }}
[I 10:50:23.319 NotebookApp] Jupyter Notebook 6.4.3 is running at:
[I 10:50:23.319 NotebookApp] http://localhost:8890/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98
[I 10:50:23.319 NotebookApp]  or http://127.0.0.1:8890/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98
[I 10:50:23.319 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[W 10:50:23.580 NotebookApp] No web browser found: could not locate runnable browser.
[C 10:50:23.581 NotebookApp]

    To access the notebook, open this file in a browser:
        file://{{ site.user.home }}/.local/share/jupyter/runtime/nbserver-27971-open.html
    Or copy and paste one of these URLs:
        http://localhost:8890/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98
     or http://127.0.0.1:8890/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98
```

From a web browser on your local system, enter localhost in the address bar followed by the local port (8157 in this example) that was assigned to map to the remote port on the development node (8890 in this example), followed by the access token listed in the terminal.

The address bar in the web browser in this case should resemble:
  
`http://localhost:8157/?token=57041544d4cacfdc71c2201d6bebe5b16fcec6bc8397fc98`

Note: the port assigned on the local machine is used in the web browser, rather than the port specified as running on the development node.


## Connect to Jupyter Notebook - using X2Go

An alternative method to run a Jupyter Notebook on one of the development nodes and interact with on your local computer is to use the X2Go software to connect to one of the development nodes, then launch a Jupyter Notebook and a web browser on the development node. The web browser will appear on your remote computer in the X2Go interface while the Jupyter Notebook will be running on {{ site.cluster.name }}.

See the ['Graphical User Interfaces (GUI)']({{ '/howto/gui-x11fwd.html' | relative_url }}) for how to setup and use X2Go via one of the {{ site.cluster.name }} development nodes.

<div class="alert alert-info" role="alert" markdown="1">
If you use Python via your own Anaconda installation, instead of the Python version provided by Wynton, you can launch a Jupyter Notebook using the `jupyter notebook` command from the terminal connected by X2Go, which will also launch the web browser.
</div>




[Jupyter Notebook]: https://jupyter-notebook.readthedocs.io/en/stable/
