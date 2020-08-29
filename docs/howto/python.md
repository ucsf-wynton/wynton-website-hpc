<div class="alert alert-warning" role="alert">
2019-11-13: Python 3 is now available.  If possible, we recommend to be explicit about which version to use by specifying either <code>python2</code> and <code>python3</code> in your scripts.
</div>

# Work with Python

Python 2 and Python 3 are both available via `python2` and `python3`.  The command `python` is an alias for `python2`.  We recommend to be explicit about which version you want to use, also when using the default Python 2, i.e. use `python2` when you know your script requires Python 2 and `python3` when you know it requires Python 3.

The below examples uses Python 2, but it works analogously in Python 3, i.e. just replace `python2` with `python3`.


## Installing Python packages

The standard way to install Python packages is by using the [_pip_](https://packaging.python.org/tutorials/installing-packages/) package management system.  You often find installation instructions online such as:

```sh
$ pip install HTSeq
```

It will _not_ work. If you attempt to run this as-is on the cluster, you get lots of errors complaining about lack of write permissions etc., which is because it tries to install the package in the system-wide Python package folder (to which only sysadms have write permission).  You might also see instructions saying you should use `sudo ...` - that will also not work for the same reason.

There are **two ways for non-privileged users to install Python packages using the 'pip' module**:

 1. Install globally to your home directory (typically `~/.local/lib/python2.7/site-packages/`) using `python2 -m pip install --user ...`

 2. Install locally to a project-specific folder (e.g. `~/my_project/`) using `python2 -m pip install ...` in a self-contained Python virtual environment

Both are done from the terminal.  Which one you choose depends on your needs; for some projects you may want to use the virtual environment approach whereas for your everyday work you might want to work toward your global Python package stack.
Installing globally is the easiest, because you don't have to remember to _activate_ a virtual environment and if you need the Python package in different places, you only have to install it once.  However, if you are concerned about reproducibility, or being able to coming back to an old project of yours, you most likely want to use a virtual environment for that project so that its Python packages are _not_ updated when you update or install Python packages globally. This is also true if you collaborate with others in a shared project folder.


### 1. Installing globally (aka "user-site")

First of all, if an online installation instructions says `pip install ...`, replace that with `python2 -m pip install ...`.  Second, to install globally to your home directory, remember to always specify the `--user` option.  For example,

<!-- code-block #1 -->
```sh
[alice@dev3 ~]$ python2 -m pip install --user HTSeq
Collecting HTSeq
  Using cached https://files.pythonhosted.org/packages/c4/04/b9b0c5514dcd09e64481e8ebc242aef162646b6de956ffb44595d1de0f69/HTSeq-0.12.4.tar.gz
Requirement already satisfied (use --upgrade to upgrade): numpy in /usr/lib64/python2.7/site-packages (from HTSeq)
Collecting pysam (from HTSeq)
  Downloading https://files.pythonhosted.org/packages/9b/ab/a7f2637b5bc8fb278aa9b5a5d4eab70856625c09b1d95328e3b78132847c/pysam-0.16.0.1-cp27-cp27mu-manylinux1_x86_64.whl (9.2MB)
Installing collected packages: pysam, HTSeq
  Running setup.py install for HTSeq: started
    Running setup.py install for HTSeq: finished with status 'done'
Successfully installed HTSeq pysam
You are using pip version 8.1.2, however version 20.2.2 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
```

To see all Python packages that you have installed globally, use `python2 -m pip list --user`.  To also see packages installed site wide on the cluster, use `python2 -m pip list`.  Packages installed with `python2 -m pip list --user` are typically installed to your `~/.local/lib/python2.7/site-packages/` folder.  If CLI executables are installed with one of those packages, they are often installed to `~/.local/bin/`.



### 2. Installing to a virtual environment (aka "virtualenv")

<div class="alert alert-info" role="alert">
Virtual environment are not used just for cluster environments - many Python users and developers choose to use virtual environment on their local computers whenever they work in Python.
</div>

An alternative to install globally to your home directory, is to install to a local folder using a, so called, Python _virtual environment_.  A virtual environment is a self-contained folder that contains the Python executable and any Python packages you install.  When you _activate_ a virtual environment, environment variables like `PATH` is updated such that you will use the Python executable and the packages in the virtual environment and not the globally installed ones.

Below is an example on how to set up a virtual environment and install the [HTSeq](https://htseq.readthedocs.io/en/master/install.html#installation-on-linux) package and all of its dependencies into it.



#### 2.1 Install required tools (once per account)

In order to use virtual environments, we need the `virtualenv` tool.  Following the above instructions, you can install it to your _global stack_ as:

```sh
[alice@{{ site.devel.name }} ~]$ python2 -m pip install --user virtualenv
Collecting virtualenv
  Downloading https://files.pythonhosted.org/packages/c5/97/00dd42a0fc41e9016b23f07ec7f657f636cb672fad9cf72b80f8f65c6a46/virtualenv-16.7.7-py2.py3-none-any.whl (3.4MB)
     |████████████████████████████████| 3.4MB 16.4MB/s
Installing collected packages: virtualenv
Successfully installed virtualenv-16.7.7
[alice@{{ site.devel.name }} ~]$ which virtualenv
~/.local/bin/virtualenv
[alice@{{ site.devel.name }} ~]$ virtualenv --version
16.7.7
```


#### 2.2 Create a virtual environment (once per project)

Start by creating a folder specific to the project you are currently working on.  Each project folder will have its own unique set of installed packages.  For a project that requires Python 2, do the following (once):

```sh
[alice@{{ site.devel.name }} ~]$ virtualenv -p $(which python2) my_project
Running virtualenv with interpreter /usr/bin/python2
Already using interpreter /usr/bin/python2
  No LICENSE.txt / LICENSE found in source
New python executable in /wynton/home/boblab/alice/my_project/bin/python2
Also creating executable in /wynton/home/boblab/alice/my_project/bin/python
Installing setuptools, pip, wheel...
done.
```

<div class="alert alert-warning" role="alert">
Always remember to specify option <code>-p $(which python2)</code> when you call <code>virtualenv</code>.  It makes sure that the intended version of Python is used in the virtual environment.
</div>


#### 2.3 Activate virtual environment (each time you use project)

Now, each time you want to work on your project, go to its folder and _active the virtual environment_:

```sh
[alice@{{ site.devel.name }} ~]$ cd my_project
[alice@{{ site.devel.name }} my_project]$ . bin/activate   ## IMPORTANT! Note period in front
(my_project) [alice@{{ site.devel.name }} my_project]$
```

Note how `(my_project)` is prepended to the shell prompt when the virtual environment `my_project` is _activate_.  This tells you that you run in a customized Python environment.  Specifically, `python2` now points to a local, frozen version:

```sh
(my_project) [alice@{{ site.devel.name }} my_project]$ which python2
~/my_project/bin/python2
```

Similarly, `python` points to:

```sh
(my_project) [alice@{{ site.devel.name }} my_project]$ which python
~/my_project/bin/python

(my_project) [alice@{{ site.devel.name }} my_project]$ ls -l $(which python)
lrwxrwxrwx. 1 alice boblab 7 Nov 18 14:04 ./bin/python -> python2
```

Note how this local `python` command points to the local `python2` command.  What is interesting, and important to notice, is that _if we set up a Python 3 virtual environment, then the local `python` command will point to the local `python3` command_.  In other words, when we use virtual environments, the `python` command will be using either Python 2 or Python3 at our choice.

To see what Python packages are installed _in the virtual environment_, use:

```sh
(my_project) [alice@{{ site.devel.name }} my_project]$ python2 -m pip list
Package    Version
---------- -------
mpi4py     1.3.1  
pip        19.3.1
setuptools 41.6.0
wheel      0.33.6
(my_project) [alice@{{ site.devel.name }} my_project]$ 
```


#### 2.4 Installing packages (once per package)

Now you can install Python packages to the project folder using `python2 -m pip install ...` without specifying `--user`.  For instance,

```sh
(my_project) [alice@{{ site.devel.name }} my_project]$ python2 -m pip install HTSeq
Collecting HTSeq
  Using cached https://files.pythonhosted.org/packages/05/68/2f34983381d9efcdbbc63a551ab4265b5695d92e491532ef1f1d5dcc5375/HTSeq-0.11.2-cp27-cp27mu-manylinux1_x86_64.whl
Collecting numpy
  Downloading https://files.pythonhosted.org/packages/d7/b1/3367ea1f372957f97a6752ec725b87886e12af1415216feec9067e31df70/numpy-1.16.5-cp27-cp27mu-manylinux1_x86_64.whl (17.0MB)
     |████████████████████████████████| 17.0MB 14.4MB/s
Collecting pysam>=0.9.0
  Using cached https://files.pythonhosted.org/packages/15/e7/2dab8bb0ac739555e69586f1492f0ff6bc4a1f8312992a83001d3deb77ac/pysam-0.15.3.tar.gz
Building wheels for collected packages: pysam
  Building wheel for pysam (setup.py) ... done
  Created wheel for pysam: filename=pysam-0.15.3-cp27-cp27mu-linux_x86_64.whl size=8425720 sha256=110af7ad99aed0212c41e609a30ee9a707faf15ecc53928955c187b35869b8b5
  Stored in directory: /wynton/home/boblab/alice/.cache/pip/wheels/85/ab/84/86ca6dda37a6fc85687b67be7345b735cd82f6584bea56f327
Successfully built pysam
Installing collected packages: numpy, pysam, HTSeq
Successfully installed HTSeq-0.11.2 numpy-1.16.5 pysam-0.15.3
```

To see which packages are now installed _in the virtual environment_ (the "project folder") and what their versions are, do:

```sh
(my_project) [alice@{{ site.devel.name }} my_project]$ python2 -m pip list
Package    Version
---------- -------
HTSeq      0.11.2
mpi4py     1.3.1  
numpy      1.16.5
pip        19.3.1
pysam      0.15.3
setuptools 41.6.0
wheel      0.33.6
```


#### 2.5 Returning to a project

Whenever you open a new terminal, make sure to _activate_ the virtual environment ("project folder"), otherwise it will not find the packages you've installed.  Pay attention to the shell prompt:

```sh
[alice@{{ site.devel.name }} ~]$ cd my_project
[alice@{{ site.devel.name }} my_project]$ . bin/activate    ## ACTIVATE!
(my_project) [alice@{{ site.devel.name }} my_project]$ pip2 show HTSeq
Name: HTSeq
Version: 0.11.2
Summary: A framework to process and analyze data from high-throughput sequencing (HTS) assays
Home-page: https://github.com/simon-anders/htseq
Author: Simon Anders
Author-email: sanders@fs.tum.de
License: GPL3
Location: /wynton/home/boblab/alice/my_project/lib/python2.7/site-packages
Requires: numpy, pysam
Required-by:

[alice@{{ site.devel.name }} my_project]$ 
```

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
When submitting a job to the scheduler, make sure the job script loads all required modules and activates the virtual environment.
</div>

To _deactivate_ a Python virtual environment, either open a fresh terminal (e.g. log out and back in), or use:

```sh
(my_project) [alice@{{ site.devel.name }} ~]$ deactivate
[alice@{{ site.devel.name }} ~]$ deactivate
```

Note how prefix `(my_project)` was dropped from the shell prompt and `python2` now points to the system-wide installation;

```sh
[alice@{{ site.devel.name }} ~]$ which python2
/usr/bin/python2
```



## Appendix

### Upgrading pip

You will at times get warnings that you are running an old version of 'pip':

```sh
You are using pip version 8.1.2, however version 19.3.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
```

Don't use the suggested command call in that message.  Instead, use:

```sh
[alice@{{ site.devel.name }} ~]$ python2 -m pip install --user --upgrade pip
Cache entry deserialization failed, entry ignored
Collecting pip
  Downloading https://files.pythonhosted.org/packages/00/b6/9cfa56b4081ad13874b0c6f96af8ce16cfbc1cb06bedf8e9164ce5551ec1/pip-19.3.1-py2.py3-none-any.whl (1.4MB)
    100% |████████████████████████████████| 1.4MB 590kB/s
Installing collected packages: pip
Successfully installed pip-19.3.1
```

To check the installed version of the 'pip' module, use:

```sh
[alice@{{ site.devel.name }} ~]$ python2 -m pip --version
pip 19.3.1 from /wynton/home/boblab/alice/.local/lib/python2.7/site-packages/pip (python 2.7)
```
