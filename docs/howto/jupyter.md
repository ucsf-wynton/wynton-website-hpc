# Jupyter Notebook

## Where to to run Jupyter Notebook

[Jupyter Notebook] should only be run on the {{ site.cluster.name }} development nodes.

## Connect to Jupyter Notebook

The easiest method to run a Jupyter Notebook on one of the development nodes and interact with on your local computer is to use the X2Go software to connect to one of the development nodes, then launch a Jupyter Notebook and a web browser on the development node. The web browser will appear on your remote computer in the X2Go interface while the Jupyter Notebook will be running on {{ site.cluster.name }}.

See the ['Graphical User Interfaces (GUI)'](https://wynton.ucsf.edu/hpc/howto/gui-x11fwd.html) for how to setup and use X2Go via one of the {{ site.cluster.name }} development nodes.

<div class="alert alert-info" role="alert">
If you use Python via your own <em>Anaconda</em> installation, instead of the Python version provided by Wynton, you can launch a Jupyter Notebook using the <code>jupyter notebook</code> command from the terminal connected by X2Go, which will also launch the web browser.
</div>




[Jupyter Notebook]: https://jupyter-notebook.readthedocs.io/en/stable/
