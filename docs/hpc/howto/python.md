# Work with Python

Python 2 and Python 3 are both available via `python2` and `python3`.  There is no command `python` on Rocky 8; you have to specify either `python2` or `python3`.


## Installing Python packages

The standard way to install Python packages is by using the [_pip_](https://packaging.python.org/tutorials/installing-packages/) package management system.  You often find installation instructions online such as:

```sh
$ pip install pandas
```

It will _not_ work. If you attempt to run this as-is on the cluster, you get lots of errors complaining about lack of write permissions etc., which is because it tries to install the package in the system-wide Python package folder (to which only sysadms have write permission).  You might also see instructions saying you should use `sudo ...` - that will also not work for the same reason.

There are **two ways for non-privileged users to install Python packages using the 'pip' module**:

 1. Install globally to your home directory (typically `~/.local/lib/python3.11/site-packages/`) using `python3 -m pip install --user ...`

 2. Install locally to a project-specific folder (e.g. `~/my_project/`) using `python3 -m pip install ...` in a self-contained Python virtual environment

Both are done from the terminal.  Which one you choose depends on your needs; for some projects you may want to use the virtual environment approach whereas for your everyday work you might want to work toward your global Python package stack.
Installing globally is the easiest, because you don't have to remember to _activate_ a virtual environment and if you need the Python package in different places, you only have to install it once.  However, if you are concerned about reproducibility, or being able to coming back to an old project of yours, you most likely want to use a virtual environment for that project so that its Python packages are _not_ updated when you update or install Python packages globally. This is also true if you collaborate with others in a shared project folder.


### 1. Installing globally (aka "user-site")

First of all, if an online installation instructions says `pip install ...`, replace that with `python3 -m pip install ...`.  Second, to install globally to your home directory, remember to always specify the `--user` option.  For example,

<!-- code-block label="pip-install-ex" -->
```sh
[alice@{{ site.devel.name }} ~]$ python3 -m pip install --user pandas
Collecting pandas
  Downloading pandas-2.1.3-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (12.2 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 12.2/12.2 MB 1.1 MB/s eta 0:00:00
Collecting numpy<2,>=1.23.2
  Downloading numpy-1.26.2-cp311-cp311-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (18.2 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 18.2/18.2 MB 958.5 kB/s eta 0:00:00
Collecting python-dateutil>=2.8.2
  Downloading python_dateutil-2.8.2-py2.py3-none-any.whl (247 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 247.7/247.7 kB 996.7 kB/s eta 0:00:00
Collecting pytz>=2020.1
  Downloading pytz-2023.3.post1-py2.py3-none-any.whl (502 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 502.5/502.5 kB 1.4 MB/s eta 0:00:00
Collecting tzdata>=2022.1
  Downloading tzdata-2023.3-py2.py3-none-any.whl (341 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 341.8/341.8 kB 2.0 MB/s eta 0:00:00
Collecting six>=1.5
  Downloading six-1.16.0-py2.py3-none-any.whl (11 kB)
Installing collected packages: pytz, tzdata, six, numpy, python-dateutil, pandas
Successfully installed numpy-1.26.2 pandas-2.1.3 python-dateutil-2.8.2 pytz-2023.3.post1 six-1.16.0 tzdata-2023.3
```

To see all Python packages that you have installed globally, use `python3 -m pip list --user`.  To also see packages installed site wide on the cluster, use `python3 -m pip list`.  Packages installed with `python3 -m pip list --user` are typically installed to your `~/.local/lib/python3.11/site-packages/` folder.  If CLI executables are installed with one of those packages, they are often installed to `~/.local/bin/`.



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
  Downloading virtualenv-20.24.6-py3-none-any.whl (3.8 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 3.8/3.8 MB 1.3 MB/s eta 0:00:00
Collecting distlib<1,>=0.3.7
  Downloading distlib-0.3.7-py2.py3-none-any.whl (468 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 468.9/468.9 kB 1.4 MB/s eta 0:00:00
Collecting filelock<4,>=3.12.2
  Downloading filelock-3.13.1-py3-none-any.whl (11 kB)
Collecting platformdirs<4,>=3.9.1
  Downloading platformdirs-3.11.0-py3-none-any.whl (17 kB)
Installing collected packages: distlib, platformdirs, filelock, virtualenv
Successfully installed distlib-0.3.7 filelock-3.13.1 platformdirs-3.11.0 virtualenv-20.24.6
[alice@{{ site.devel.name }} ~]$ which virtualenv
~/.local/bin/virtualenv
[alice@{{ site.devel.name }} ~]$ virtualenv --version
virtualenv 20.24.6 from ~/.local/lib/python3.11/site-packages/virtualenv/__init__.py
```


#### 2.2 Create a virtual environment (once per project)

Start by creating a folder specific to the project you are currently working on.  Each project folder will have its own unique set of installed packages.  For a project that requires Python 3, do the following (once):

<!-- code-block label="virtualenv-init" -->
```sh
[alice@{{ site.devel.name }} ~]$ virtualenv -p python3 my_project
created virtual environment CPython3.11.2.final.0-64 in 5039ms
  creator CPython3Posix(dest=~/my_project, clear=False, no_vcs_ignore=False, global=False)
  seeder FromAppData(download=False, pip=bundle, setuptools=bundle, wheel=bundle, via=copy, app_data_dir=~/.local/share/virtualenv)
    added seed packages: numpy==1.26.2, pandas==2.1.3, pip==23.3.1, python_dateutil==2.8.2, pytz==2023.3.post1, setuptools==68.2.2, six==1.16.0, tzdata==2023.3, wheel==0.41.2
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
Python 3.11.2
```

Note how this local `python` command points to the local `python3` command.  What is interesting, and important to notice, is that _if we set up a Python 3 virtual environment, then the local `python` command will point to the local `python3` command_.  In other words, when we use virtual environments, the `python` command will be using either Python 2 or Python3 at our choice.

To see what Python packages are installed _in the virtual environment_, use:

<!-- code-block label="virtualenv-pip-list" -->
```sh
(my_project) [alice@{{ site.devel.name }} my_project]$ python3 -m pip list
Package         Version
--------------- ------------
numpy           1.26.2
pandas          2.1.3
pip             23.3.1
python-dateutil 2.8.2
pytz            2023.3.post1
setuptools      68.2.2
six             1.16.0
tzdata          2023.3
wheel           0.41.2
(my_project) [alice@{{ site.devel.name }} my_project]$ 
```


#### 2.4 Installing packages (once per package)

With a virtual environment enabled, you can install Python packages to the project folder using `python3 -m pip install ...` without specifying `--user`.  For instance,

<!-- code-block label="virtualenv-pip-install-ex" -->
```sh
(my_project) [alice@{{ site.devel.name }} ~]$ python3 -m pip install pandas
Requirement already satisfied: pandas in ./my_project/lib/python3.11/site-packages (2.1.3)
Requirement already satisfied: numpy<2,>=1.23.2 in ./my_project/lib/python3.11/site-packages (from pandas) (1.26.2)
Requirement already satisfied: python-dateutil>=2.8.2 in ./my_project/lib/python3.11/site-packages (from pandas) (2.8.2)
Requirement already satisfied: pytz>=2020.1 in ./my_project/lib/python3.11/site-packages (from pandas) (2023.3.post1)
Requirement already satisfied: tzdata>=2022.1 in ./my_project/lib/python3.11/site-packages (from pandas) (2023.3)
Requirement already satisfied: six>=1.5 in ./my_project/lib/python3.11/site-packages (from python-dateutil>=2.8.2->pandas) (1.16.0)
```

To see which packages are now installed _in the virtual environment_ (the "project folder") and what their versions are, do:

<!-- code-block label="virtualenv-pip-list-2" -->
```sh
(my_project) [alice@{{ site.devel.name }} my_project]$ python3 -m pip list
Package         Version
--------------- ------------
numpy           1.26.2
pandas          2.1.3
pip             23.3.1
python-dateutil 2.8.2
pytz            2023.3.post1
setuptools      68.2.2
six             1.16.0
tzdata          2023.3
wheel           0.41.2
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
Version: 2.1.3
Summary: Powerful data structures for data analysis, time series, and statistics
Home-page: https://pandas.pydata.org
Author: 
Author-email: The Pandas Development Team <pandas-dev@python.org>
License: BSD 3-Clause License

Copyright (c) 2008-2011, AQR Capital Management, LLC, Lambda Foundry, Inc. and PyData Development Team
All rights reserved.

Copyright (c) 2011-2023, Open source contributors.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

* Neither the name of the copyright holder nor the names of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
Location: ~/my_project/lib/python3.11/site-packages
Requires: numpy, python-dateutil, pytz, tzdata
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
Requirement already satisfied: pip in /usr/lib/python3.11/site-packages (22.3.1)
Collecting pip
  Downloading pip-23.3.1-py3-none-any.whl (2.1 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 2.1/2.1 MB 20.9 MB/s eta 0:00:00
Installing collected packages: pip
Successfully installed pip-23.3.1
```

_Note_, if you're using a virtual environment, drop `--user`, i.e.

```sh
[alice@{{ site.devel.name }} ~]$ python3 -m pip install --upgrade pip
```

To check the installed version of the 'pip' module, use:

<!-- code-block label="pip-version-2" -->
```sh
[alice@{{ site.devel.name }} ~]$ python3 -m pip --version
pip 23.3.1 from ~/.local/lib/python3.11/site-packages/pip (python 3.11)
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
