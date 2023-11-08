# Work with Python

<div class="alert alert-warning" role="alert" markdown="1">
If possible, we recommend to be explicit about which version to use by specifying either `python2` and `python3` in your scripts.
</div>

Python 2 and Python 3 are both available via `python2` and `python3`.  There is no command `python` on Rocky 8; you have to specify either `python2` or `python3`.


## Installing Python packages

The standard way to install Python packages is by using the [_pip_](https://packaging.python.org/tutorials/installing-packages/) package management system.  You often find installation instructions online such as:

```sh
$ pip install pandas
```

It will _not_ work. If you attempt to run this as-is on the cluster, you get lots of errors complaining about lack of write permissions etc., which is because it tries to install the package in the system-wide Python package folder (to which only sysadms have write permission).  You might also see instructions saying you should use `sudo ...` - that will also not work for the same reason.

There are **two ways for non-privileged users to install Python packages using the 'pip' module**:

 1. Install globally to your home directory (typically `~/.local/lib/python3.6/site-packages/`) using `python3 -m pip install --user ...`

 2. Install locally to a project-specific folder (e.g. `~/my_project/`) using `python3 -m pip install ...` in a self-contained Python virtual environment

Both are done from the terminal.  Which one you choose depends on your needs; for some projects you may want to use the virtual environment approach whereas for your everyday work you might want to work toward your global Python package stack.
Installing globally is the easiest, because you don't have to remember to _activate_ a virtual environment and if you need the Python package in different places, you only have to install it once.  However, if you are concerned about reproducibility, or being able to coming back to an old project of yours, you most likely want to use a virtual environment for that project so that its Python packages are _not_ updated when you update or install Python packages globally. This is also true if you collaborate with others in a shared project folder.


### 1. Installing globally (aka "user-site")

First of all, if an online installation instructions says `pip install ...`, replace that with `python3 -m pip install ...`.  Second, to install globally to your home directory, remember to always specify the `--user` option.  For example,

<!-- code-block label="pip-install-ex" -->
```sh
[alice@{{ site.devel.name }} ~]$ python3 -m pip install --user pandas
Collecting pandas
  Downloading https://files.pythonhosted.org/packages/c3/e2/00cacecafbab071c787019f00ad84ca3185952f6bb9bca9550ed83870d4d/pandas-1.1.5-cp36-cp36m-manylinux1_x86_64.whl (9.5MB)
Collecting python-dateutil>=2.7.3 (from pandas)
  Downloading https://files.pythonhosted.org/packages/36/7a/87837f39d0296e723bb9b62bbb257d0355c7f6128853c78955f57342a56d/python_dateutil-2.8.2-py2.py3-none-any.whl (247kB)
Collecting numpy>=1.15.4 (from pandas)
  Downloading https://files.pythonhosted.org/packages/45/b2/6c7545bb7a38754d63048c7696804a0d947328125d81bf12beaa692c3ae3/numpy-1.19.5-cp36-cp36m-manylinux1_x86_64.whl (13.4MB)
Collecting pytz>=2017.2 (from pandas)
  Downloading https://files.pythonhosted.org/packages/85/ac/92f998fc52a70afd7f6b788142632afb27cd60c8c782d1452b7466603332/pytz-2022.6-py2.py3-none-any.whl (498kB)
Requirement already satisfied: six>=1.5 in /usr/lib/python3.6/site-packages (from python-dateutil>=2.7.3->pandas)
Installing collected packages: python-dateutil, numpy, pytz, pandas
Successfully installed numpy-1.19.5 pandas-1.1.5 python-dateutil-2.8.2 pytz-2022.6
```

To see all Python packages that you have installed globally, use `python3 -m pip list --user`.  To also see packages installed site wide on the cluster, use `python3 -m pip list`.  Packages installed with `python3 -m pip list --user` are typically installed to your `~/.local/lib/python3.6/site-packages/` folder.  If CLI executables are installed with one of those packages, they are often installed to `~/.local/bin/`.



### 2. Installing to a virtual environment (aka "virtualenv")

<div class="alert alert-info" role="alert" markdown="1">
Virtual environment are not used just on computer clusters - many Python users and developers choose to use virtual environment on their local computers whenever they work in Python.
</div>

An alternative to install globally to your home directory, is to install to a local folder using a, so called, Python _virtual environment_.  A virtual environment is a self-contained folder that contains the Python executable and any Python packages you install.  When you _activate_ a virtual environment, environment variables like `PATH` is updated such that you will use the Python executable and the packages in the virtual environment and not the globally installed ones.

Below is an example on how to set up a virtual environment and install the [pandas](https://pandas.pydata.org/docs/) package and all of its dependencies into it.



#### 2.1 Install required tools (once per account)

In order to use virtual environments, we need the `virtualenv` tool.  Following the above instructions, you can install it to your _global stack_ as:

<!-- code-block label="pip-install-virtualenv" -->
```sh
[alice@{{ site.devel.name }} ~]$ python3 -m pip install --user virtualenv
Collecting virtualenv
  Downloading https://files.pythonhosted.org/packages/fd/76/c99d37939e17e3c53f1c1b7e4f5365a9160b1cd0b37700657eed9a2a6775/virtualenv-20.16.7-py3-none-any.whl (8.8MB)
Collecting platformdirs<3,>=2.4 (from virtualenv)
  Downloading https://files.pythonhosted.org/packages/b1/78/dcfd84d3aabd46a9c77260fb47ea5d244806e4daef83aa6fe5d83adb182c/platformdirs-2.4.0-py3-none-any.whl
Collecting distlib<1,>=0.3.6 (from virtualenv)
  Downloading https://files.pythonhosted.org/packages/76/cb/6bbd2b10170ed991cf64e8c8b85e01f2fb38f95d1bc77617569e0b0b26ac/distlib-0.3.6-py2.py3-none-any.whl (468kB)
Collecting filelock<4,>=3.4.1 (from virtualenv)
  Downloading https://files.pythonhosted.org/packages/84/ce/8916d10ef537f3f3b046843255f9799504aa41862bfa87844b9bdc5361cd/filelock-3.4.1-py3-none-any.whl
Collecting importlib-metadata>=4.8.3; python_version < "3.8" (from virtualenv)
  Downloading https://files.pythonhosted.org/packages/a0/a1/b153a0a4caf7a7e3f15c2cd56c7702e2cf3d89b1b359d1f1c5e59d68f4ce/importlib_metadata-4.8.3-py3-none-any.whl
Collecting importlib-resources>=5.4; python_version < "3.7" (from virtualenv)
  Downloading https://files.pythonhosted.org/packages/24/1b/33e489669a94da3ef4562938cd306e8fa915e13939d7b8277cb5569cb405/importlib_resources-5.4.0-py3-none-any.whl
Collecting zipp>=0.5 (from importlib-metadata>=4.8.3; python_version < "3.8"->virtualenv)
  Downloading https://files.pythonhosted.org/packages/bd/df/d4a4974a3e3957fd1c1fa3082366d7fff6e428ddb55f074bf64876f8e8ad/zipp-3.6.0-py3-none-any.whl
Collecting typing-extensions>=3.6.4; python_version < "3.8" (from importlib-metadata>=4.8.3; python_version < "3.8"->virtualenv)
  Downloading https://files.pythonhosted.org/packages/45/6b/44f7f8f1e110027cf88956b59f2fad776cca7e1704396d043f89effd3a0e/typing_extensions-4.1.1-py3-none-any.whl
Installing collected packages: platformdirs, distlib, filelock, zipp, typing-extensions, importlib-metadata, importlib-resources, virtualenv
Successfully installed distlib-0.3.6 filelock-3.4.1 importlib-metadata-4.8.3 importlib-resources-5.4.0 platformdirs-2.4.0 typing-extensions-4.1.1 virtualenv-20.16.7 zipp-3.6.0
[alice@{{ site.devel.name }} ~]$ which virtualenv
~/.local/bin/virtualenv
[alice@{{ site.devel.name }} ~]$ virtualenv --version
virtualenv 20.16.7 from ~/.local/lib/python3.6/site-packages/virtualenv/__init__.py
```


#### 2.2 Create a virtual environment (once per project)

Start by creating a folder specific to the project you are currently working on.  Each project folder will have its own unique set of installed packages.  For a project that requires Python 3, do the following (once):

<!-- code-block label="virtualenv-init" -->
```sh
[alice@{{ site.devel.name }} ~]$ virtualenv -p python3 my_project
created virtual environment CPython3.6.8.final.0-64 in 3162ms
  creator CPython3Posix(dest=~/my_project, clear=False, no_vcs_ignore=False, global=False)
  seeder FromAppData(download=False, pip=bundle, setuptools=bundle, wheel=bundle, via=copy, app_data_dir=~/.local/share/virtualenv)
    added seed packages: certifi==2022.9.24, charset_normalizer==2.0.12, idna==3.4, panda==0.3.1, pip==21.3.1, python_dateutil==2.8.2, pytz==2022.6, requests==2.27.1, setuptools==59.6.0, six==1.16.0, urllib3==1.26.12, wheel==0.37.1
  activators BashActivator,CShellActivator,FishActivator,NushellActivator,PowerShellActivator,PythonActivator
```

<div class="alert alert-warning" role="alert" markdown="1">
Always remember to specify option `-p python3` or `-p python2` when you call `virtualenv`.  It makes sure that the intended version of Python is used in the virtual environment when `python` is called.
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
Package            Version
------------------ ---------
certifi            2022.9.24
charset-normalizer 2.0.12
idna               3.4
numpy              1.19.5
panda              0.3.1
pandas             1.1.5
pip                21.3.1
python-dateutil    2.8.2
pytz               2022.6
requests           2.27.1
setuptools         59.6.0
six                1.16.0
urllib3            1.26.12
wheel              0.37.1
(my_project) [alice@{{ site.devel.name }} my_project]$ 
```


#### 2.4 Installing packages (once per package)

With a virtual environment enabled, you can install Python packages to the project folder using `python3 -m pip install ...` without specifying `--user`.  For instance,

<!-- code-block label="virtualenv-pip-install-ex" -->
```sh
(my_project) [alice@{{ site.devel.name }} ~]$ python3 -m pip install pandas
Requirement already satisfied: pandas in ./my_project/lib64/python3.6/site-packages (1.1.5)
Requirement already satisfied: pytz>=2017.2 in ./my_project/lib/python3.6/site-packages (from pandas) (2022.6)
Requirement already satisfied: python-dateutil>=2.7.3 in ./my_project/lib/python3.6/site-packages (from pandas) (2.8.2)
Requirement already satisfied: numpy>=1.15.4 in ./my_project/lib64/python3.6/site-packages (from pandas) (1.19.5)
Requirement already satisfied: six>=1.5 in ./my_project/lib/python3.6/site-packages (from python-dateutil>=2.7.3->pandas) (1.16.0)
```

To see which packages are now installed _in the virtual environment_ (the "project folder") and what their versions are, do:

<!-- code-block label="virtualenv-pip-list-2" -->
```sh
(my_project) [alice@{{ site.devel.name }} my_project]$ python3 -m pip list
Package            Version
------------------ ---------
certifi            2022.9.24
charset-normalizer 2.0.12
idna               3.4
numpy              1.19.5
panda              0.3.1
pandas             1.1.5
pip                21.3.1
python-dateutil    2.8.2
pytz               2022.6
requests           2.27.1
setuptools         59.6.0
six                1.16.0
urllib3            1.26.12
wheel              0.37.1
(my_project) [alice@{{ site.devel.name }} my_project]$ 
```


#### 2.5 Returning to a project

Whenever you open a new terminal, make sure to _activate_ the virtual environment ("project folder"), otherwise it will not find the packages you've installed.  Pay attention to the shell prompt:

<!-- code-block label="virtualenv-activate-2" -->
```sh
[alice@{{ site.devel.name }} ~]$ cd my_project 
[alice@{{ site.devel.name }} my_project]$ . bin/activate   ## ACTIVATE
(my_project) [alice@{{ site.devel.name }} my_project]$ pip3 show pandas
Name: pandas
Version: 1.1.5
Summary: Powerful data structures for data analysis, time series, and statistics
Home-page: https://pandas.pydata.org
Author: 
Author-email: 
License: BSD
Location: ~/my_project/lib64/python3.6/site-packages
Requires: numpy, python-dateutil, pytz
Required-by: 
(my_project) [alice@{{ site.devel.name }} my_project]$ 
```

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
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

You will at times get a warning that you are running an old version of 'pip':

```sh
You are using pip version 8.1.2, however version 20.3.3 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
```

Don't use the suggested command call in that message.  Instead, use:

<!-- code-block label="pip-upgrade" -->
```sh
[alice@{{ site.devel.name }} ~]$ python3 -m pip install --user --upgrade pip
Cache entry deserialization failed, entry ignored
Collecting pip
  Downloading https://files.pythonhosted.org/packages/a4/6d/6463d49a933f547439d6b5b98b46af8742cc03ae83543e4d7688c2420f8b/pip-21.3.1-py3-none-any.whl (1.7MB)
Installing collected packages: pip
Successfully installed pip-21.3.1
You are using pip version 21.3.1, however version 22.3.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
```

_Note_, if you're using a virtual environment, drop `--user`, i.e.

```sh
[alice@{{ site.devel.name }} ~]$ python3 -m pip install --upgrade pip
```

To check the installed version of the 'pip' module, use:

<!-- code-block label="pip-version-2" -->
```sh
[alice@{{ site.devel.name }} ~]$ python3 -m pip --version
pip 21.3.1 from ~/.local/lib/python3.6/site-packages/pip (python 3.6)
```


#### Python 2: Only pip (< 21) is supported

Python 2 reached the end of its life on 2020-01-01 in favor of Python 3. At this point, the pip maintainers decided to stop making newer versions backward compatible with Python 2. Because of this, Python 2 only supports pip (< 21). To upgrade to the latest supported pip version for Python 2, we can use:

<!-- code-block label="pip2-upgrade" -->
```sh
[alice@{{ site.devel.name }} ~]$ python2 -m pip install --user --upgrade "pip<21"
DEPRECATION: Python 2.7 reached the end of its life on January 1st, 2020. Please upgrade your Python as Python 2.7 is no longer maintained. pip 21.0 will drop support for Python 2.7 in January 2021. More details about Python 2 support in pip can be found at https://pip.pypa.io/en/latest/development/release-process/#python-2-support pip 21.0 will remove support for this functionality.
Collecting pip<21
  Downloading pip-20.3.4-py2.py3-none-any.whl (1.5 MB)
Installing collected packages: pip
  Attempting uninstall: pip
    Found existing installation: pip 20.3
    Uninstalling pip-20.3:
      Successfully uninstalled pip-20.3
Successfully installed pip-20.3.4
```


[SCL]: ../software/scl.html
