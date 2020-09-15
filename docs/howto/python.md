<div class="alert alert-warning" role="alert">
2019-11-13: Python 3 is now available.  If possible, we recommend to be explicit about which version to use by specifying either <code>python2</code> and <code>python3</code> in your scripts.
</div>

# Work with Python

Python 2 and Python 3 are both available via `python2` and `python3`.  The command `python` is an alias for `python2`.  We recommend to be explicit about which version you want to use, also when using the default Python 2, i.e. use `python2` when you know your script requires Python 2 and `python3` when you know it requires Python 3.

The below examples uses Python 3, but it works analogously in Python 2, i.e. just replace `python3` with `python2`.


## Installing Python packages

The standard way to install Python packages is by using the [_pip_](https://packaging.python.org/tutorials/installing-packages/) package management system.  You often find installation instructions online such as:

```sh
$ pip install HTSeq
```

It will _not_ work. If you attempt to run this as-is on the cluster, you get lots of errors complaining about lack of write permissions etc., which is because it tries to install the package in the system-wide Python package folder (to which only sysadms have write permission).  You might also see instructions saying you should use `sudo ...` - that will also not work for the same reason.

There are **two ways for non-privileged users to install Python packages using the 'pip' module**:

 1. Install globally to your home directory (typically `~/.local/lib/python3.6/site-packages/`) using `python3 -m pip install --user ...`

 2. Install locally to a project-specific folder (e.g. `~/my_project/`) using `python3 -m pip install ...` in a self-contained Python virtual environment

Both are done from the terminal.  Which one you choose depends on your needs; for some projects you may want to use the virtual environment approach whereas for your everyday work you might want to work toward your global Python package stack.
Installing globally is the easiest, because you don't have to remember to _activate_ a virtual environment and if you need the Python package in different places, you only have to install it once.  However, if you are concerned about reproducibility, or being able to coming back to an old project of yours, you most likely want to use a virtual environment for that project so that its Python packages are _not_ updated when you update or install Python packages globally. This is also true if you collaborate with others in a shared project folder.


### 1. Installing globally (aka "user-site")

First of all, if an online installation instructions says `pip install ...`, replace that with `python3 -m pip install ...`.  Second, to install globally to your home directory, remember to always specify the `--user` option.  For example,

<!-- code-block label="pip-install-htseq" -->
```sh
[alice@{{ site.devel.name }} ~]$ python3 -m pip install --user HTSeq
Collecting HTSeq
  Using cached https://files.pythonhosted.org/packages/c4/04/b9b0c5514dcd09e64481e8ebc242aef162646b6de956ffb44595d1de0f69/HTSeq-0.12.4.tar.gz
Requirement already satisfied: numpy in /usr/lib64/python3.6/site-packages (from HTSeq)
Collecting pysam (from HTSeq)
  Using cached https://files.pythonhosted.org/packages/87/a1/73e80a7a873f3fb0e52d368a4343eb9882b737c932b95020d82251f1087e/pysam-0.16.0.1-cp36-cp36m-manylinux1_x86_64.whl
Installing collected packages: pysam, HTSeq
  Running setup.py install for HTSeq: started
    Running setup.py install for HTSeq: finished with status 'done'
Successfully installed HTSeq-0.12.4 pysam-0.16.0.1
```

To see all Python packages that you have installed globally, use `python3 -m pip list --user`.  To also see packages installed site wide on the cluster, use `python3 -m pip list`.  Packages installed with `python3 -m pip list --user` are typically installed to your `~/.local/lib/python3.6/site-packages/` folder.  If CLI executables are installed with one of those packages, they are often installed to `~/.local/bin/`.



### 2. Installing to a virtual environment (aka "virtualenv")

<div class="alert alert-info" role="alert">
Virtual environment are not used just for cluster environments - many Python users and developers choose to use virtual environment on their local computers whenever they work in Python.
</div>

An alternative to install globally to your home directory, is to install to a local folder using a, so called, Python _virtual environment_.  A virtual environment is a self-contained folder that contains the Python executable and any Python packages you install.  When you _activate_ a virtual environment, environment variables like `PATH` is updated such that you will use the Python executable and the packages in the virtual environment and not the globally installed ones.

Below is an example on how to set up a virtual environment and install the [HTSeq](https://htseq.readthedocs.io/en/master/install.html#installation-on-linux) package and all of its dependencies into it.



#### 2.1 Install required tools (once per account)

In order to use virtual environments, we need the `virtualenv` tool.  Following the above instructions, you can install it to your _global stack_ as:

<!-- code-block label="pip-install-virtualenv" -->
```sh
[alice@{{ site.devel.name }} ~]$ python3 -m pip install --user virtualenv
Collecting virtualenv
  Using cached https://files.pythonhosted.org/packages/12/51/36c685ff2c1b2f7b4b5db29f3153159102ae0e0adaff3a26fd1448232e06/virtualenv-20.0.31-py2.py3-none-any.whl
Collecting importlib-resources>=1.0; python_version < "3.7" (from virtualenv)
  Using cached https://files.pythonhosted.org/packages/ba/03/0f9595c0c2ef12590877f3c47e5f579759ce5caf817f8256d5dcbd8a1177/importlib_resources-3.0.0-py2.py3-none-any.whl
Collecting appdirs<2,>=1.4.3 (from virtualenv)
  Using cached https://files.pythonhosted.org/packages/3b/00/2344469e2084fb287c2e0b57b72910309874c3245463acd6cf5e3db69324/appdirs-1.4.4-py2.py3-none-any.whl
Collecting distlib<1,>=0.3.1 (from virtualenv)
  Using cached https://files.pythonhosted.org/packages/f5/0a/490fa011d699bb5a5f3a0cf57de82237f52a6db9d40f33c53b2736c9a1f9/distlib-0.3.1-py2.py3-none-any.whl
Collecting importlib-metadata<2,>=0.12; python_version < "3.8" (from virtualenv)
  Using cached https://files.pythonhosted.org/packages/8e/58/cdea07eb51fc2b906db0968a94700866fc46249bdc75cac23f9d13168929/importlib_metadata-1.7.0-py2.py3-none-any.whl
Collecting filelock<4,>=3.0.0 (from virtualenv)
  Using cached https://files.pythonhosted.org/packages/93/83/71a2ee6158bb9f39a90c0dea1637f81d5eef866e188e1971a1b1ab01a35a/filelock-3.0.12-py3-none-any.whl
Collecting six<2,>=1.9.0 (from virtualenv)
  Using cached https://files.pythonhosted.org/packages/ee/ff/48bde5c0f013094d729fe4b0316ba2a24774b3ff1c52d924a8a4cb04078a/six-1.15.0-py2.py3-none-any.whl
Collecting zipp>=0.4; python_version < "3.8" (from importlib-resources>=1.0; python_version < "3.7"->virtualenv)
  Using cached https://files.pythonhosted.org/packages/b2/34/bfcb43cc0ba81f527bc4f40ef41ba2ff4080e047acb0586b56b3d017ace4/zipp-3.1.0-py3-none-any.whl
Installing collected packages: zipp, importlib-resources, appdirs, distlib, importlib-metadata, filelock, six, virtualenv
Successfully installed appdirs-1.4.4 distlib-0.3.1 filelock-3.0.12 importlib-metadata-1.7.0 importlib-resources-3.0.0 six-1.15.0 virtualenv-20.0.31 zipp-3.1.0
[alice@{{ site.devel.name }} ~]$ which virtualenv
~/.local/bin/virtualenv
[alice@{{ site.devel.name }} ~]$ virtualenv --version
virtualenv 20.0.31 from ~/.local/lib/python3.6/site-packages/virtualenv/__init__.py
```


#### 2.2 Create a virtual environment (once per project)

Start by creating a folder specific to the project you are currently working on.  Each project folder will have its own unique set of installed packages.  For a project that requires Python 2, do the following (once):

<!-- code-block label="virtualenv-init" -->
```sh
[alice@{{ site.devel.name }} ~]$ virtualenv -p python3 my_project
created virtual environment CPython3.6.8.final.0-64 in 7123ms
  creator CPython3Posix(dest=~/my_project, clear=False, global=False)
  seeder FromAppData(download=False, pip=bundle, setuptools=bundle, wheel=bundle, via=copy, app_data_dir=~/.local/share/virtualenv)
    added seed packages: pip==20.2.2, setuptools==49.6.0, wheel==0.35.1
  activators BashActivator,CShellActivator,FishActivator,PowerShellActivator,PythonActivator,XonshActivator
```

<div class="alert alert-warning" role="alert">
Always remember to specify option <code>-p python3</code> when you call <code>virtualenv</code>.  It makes sure that the intended version of Python is used in the virtual environment.
</div>


#### 2.3 Activate virtual environment (each time you use project)

Now, each time you want to work on your project, go to its folder and _active the virtual environment_:

<!-- code-block label="virtualenv-activate" -->
```sh
[alice@{{ site.devel.name }} ~]$ cd my_project
[alice@{{ site.devel.name }} my_project]$ . bin/activate   ## IMPORTANT! Note period in front
(my_project) [alice@{{ site.devel.name }} my_project]$ 
```

Note how `(my_project)` is prepended to the shell prompt when the virtual environment `my_project` is _activate_.  This tells you that you run in a customized Python environment.  Specifically, `python3` now points to a local, frozen version:

<!-- code-block label="virtualenv-which-python3" -->
```sh
(my_project) [alice@{{ site.devel.name }} my_project]$ which python3
~/my_project/bin/python3
```

Similarly, `python` points to:

<!-- code-block label="virtualenv-which-python" -->
```sh
(my_project) [alice@{{ site.devel.name }} my_project]$ which python
~/my_project/bin/python
(my_project) [alice@{{ site.devel.name }} my_project]$ python --version
Python 3.6.8
```

Note how this local `python` command points to the local `python3` command.  What is interesting, and important to notice, is that _if we set up a Python 3 virtual environment, then the local `python` command will point to the local `python3` command_.  In other words, when we use virtual environments, the `python` command will be using either Python 2 or Python3 at our choice.

To see what Python packages are installed _in the virtual environment_, use:

<!-- code-block label="virtualenv-pip-list" -->
```sh
(my_project) [alice@{{ site.devel.name }} my_project]$ python3 -m pip list
Package    Version
---------- -------
pip        20.2.2
setuptools 49.6.0
wheel      0.35.1
(my_project) [alice@{{ site.devel.name }} my_project]$ 
```


#### 2.4 Installing packages (once per package)

With a virtual environment enabled, you can install Python packages to the project folder using `python3 -m pip install ...` without specifying `--user`.  For instance,

<!-- code-block label="virtualenv-pip-install-htseq" -->
```sh
(my_project) [alice@{{ site.devel.name }} ~]$ python3 -m pip install HTSeq
Collecting HTSeq
  Downloading HTSeq-0.12.4-cp36-cp36m-manylinux2010_x86_64.whl (1.4 MB)
Collecting pysam
  Using cached pysam-0.16.0.1-cp36-cp36m-manylinux1_x86_64.whl (9.9 MB)
Collecting numpy
  Downloading numpy-1.19.1-cp36-cp36m-manylinux2010_x86_64.whl (14.5 MB)
Installing collected packages: pysam, numpy, HTSeq
Successfully installed HTSeq-0.12.4 numpy-1.19.1 pysam-0.16.0.1
```

To see which packages are now installed _in the virtual environment_ (the "project folder") and what their versions are, do:

<!-- code-block label="virtualenv-pip-list-2" -->
```sh
(my_project) [alice@{{ site.devel.name }} my_project]$ python3 -m pip list
Package    Version
---------- --------
HTSeq      0.12.4
numpy      1.19.1
pip        20.2.2
pysam      0.16.0.1
setuptools 49.6.0
wheel      0.35.1
(my_project) [alice@{{ site.devel.name }} my_project]$ 
```


#### 2.5 Returning to a project

Whenever you open a new terminal, make sure to _activate_ the virtual environment ("project folder"), otherwise it will not find the packages you've installed.  Pay attention to the shell prompt:

<!-- code-block label="virtualenv-activate-2" -->
```sh
[alice@{{ site.devel.name }} ~]$ cd my_project 
[alice@{{ site.devel.name }} my_project]$ . bin/activate   ## ACTIVATE
(my_project) [alice@{{ site.devel.name }} my_project]$ pip3 show HTSeq
Name: HTSeq
Version: 0.12.4
Summary: A framework to process and analyze data from high-throughput sequencing (HTS) assays
Home-page: https://github.com/htseq
Author: Simon Anders, Fabio Zanini
Author-email: fabio.zanini@unsw.edu.au
License: GPL3
Location: ~/my_project/lib64/python3.6/site-packages
Requires: numpy, pysam
Required-by: 
(my_project) [alice@{{ site.devel.name }} my_project]$ 
```

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
When submitting a job to the scheduler, make sure the job script loads all required modules and activates the virtual environment.
</div>

To _deactivate_ a Python virtual environment, either open a fresh terminal (e.g. log out and back in), or use:

<!-- code-block label="virtualenv-deactivate" -->
```sh
(my_project) [alice@{{ site.devel.name }} ~]$ deactivate
[alice@{{ site.devel.name }} ~]$ 
```

Note how prefix `(my_project)` was dropped from the shell prompt and `python3` now points to the system-wide installation;

<!-- code-block label="virtualenv-deactivate-which-python3" -->
```sh
[alice@{{ site.devel.name }} ~]$ which python3
/usr/bin/python3
```



## Appendix

### Upgrading pip

You will at times get warnings that you are running an old version of 'pip':

```sh
You are using pip version 8.1.2, however version 20.2.2 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
```

Don't use the suggested command call in that message.  Instead, use:

<!-- code-block label="pip-upgrade" -->
```sh
[alice@{{ site.devel.name }} ~]$ python3 -m pip install --user --upgrade pip
Cache entry deserialization failed, entry ignored
Retrying (Retry(total=4, connect=None, read=None, redirect=None, status=None)) after connection broken by 'ProxyError('Cannot connect to proxy.', timeout('timed out',))': /simple/pip/
Collecting pip
  Using cached https://files.pythonhosted.org/packages/5a/4a/39400ff9b36e719bdf8f31c99fe1fa7842a42fa77432e584f707a5080063/pip-20.2.2-py2.py3-none-any.whl
Installing collected packages: pip
Successfully installed pip-20.2.2
```

To check the installed version of the 'pip' module, use:

<!-- code-block label="pip-version-2" -->
```sh
[alice@{{ site.devel.name }} ~]$ python3 -m pip --version
pip 20.2.2 from ~/.local/lib/python3.6/site-packages/pip (python 3.6)
```
