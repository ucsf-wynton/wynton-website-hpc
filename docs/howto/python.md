# Work with Python

## Installing Python packages

The standard way to install Python packages is by using the [_pip_](https://packaging.python.org/tutorials/installing-packages/) package management system.  You often see installation instructions such as:
```sh
$ pip install keras
```

If you attempt to run this as is on the cluster, you get lots of errors complaining about lack of write permissions etc., which is because it tries to install the package in the system-wide Python package folder.

We recommend users using a virtual environment to install packages locally in their own directories.


### Installing to a virtual environment:

A Python _virtual environment_ is basically a self-contained folder that contains the Python executable and any Python packages you install.  When you _activate_ a virtual environment, environment variables like `PATH` is updated such that you will use the Python executable and the packages in the virtual environment and not the globally installed ones.

Here is an example on how to install [scikit-learn](https://scikit-learn.org/) in a Python _virtual environment_.

<div class="alert alert-info" role="alert">
The example below uses Anaconda3-5. For other Anaconda versions, check out the `/netopt/rhel7/versions/python/` directory.
</div>

#### Setup (once per account)

In order to use virtual environments, we use `conda` which is already installed in `/netopt/rhel7/versions/python/`.

In order to use it, we need to first export its location to `$PATH`:

```sh
[alice@{{ site.devel.name }} ~]$ /bin/bash
[alice@{{ site.devel.name }} ~]$ export PATH='/netopt/rhel7/versions/python/Anaconda3-5.2.0/bin:$PATH'
```

<div class="alert alert-info" role="alert">
If you don't want to do this every time, add the 2 commands above to your `~/.bash_profile`.
</div>

#### Create virtual environment

```sh
[alice@{{ site.devel.name }} ~]$ conda create --name sklearn_env python=3.7

The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    certifi-2019.9.11          |           py37_0         154 KB
    setuptools-41.2.0          |           py37_0         630 KB
    wheel-0.33.6               |           py37_0          40 KB
    pip-19.2.3                 |           py37_0         1.9 MB
    ca-certificates-2019.8.28  |                0         132 KB
    openssl-1.1.1d             |       h7b6447c_1         3.7 MB
    python-3.7.4               |       h265db76_1        36.5 MB
    ------------------------------------------------------------
                                           Total:        43.0 MB

The following NEW packages will be INSTALLED:

    _libgcc_mutex:   0.1-main
    ca-certificates: 2019.8.28-0
    certifi:         2019.9.11-py37_0
    libedit:         3.1.20181209-hc058e9b_0
    libffi:          3.2.1-hd88cf55_4
    libgcc-ng:       9.1.0-hdf63c60_0
    libstdcxx-ng:    9.1.0-hdf63c60_0
    ncurses:         6.1-he6710b0_1
    openssl:         1.1.1d-h7b6447c_1
    pip:             19.2.3-py37_0
    python:          3.7.4-h265db76_1
    readline:        7.0-h7b6447c_5
    setuptools:      41.2.0-py37_0
    sqlite:          3.29.0-h7b6447c_0
    tk:              8.6.8-hbc83047_0
    wheel:           0.33.6-py37_0
    xz:              5.2.4-h14c3975_4
    zlib:            1.2.11-h7b6447c_3

Proceed ([y]/n)?
```

#### Install packages into environment

Once the basic python packages have been installed, it's time to install `scikit-learn`:

```sh
[alice@{{ site.login.name }} ~]$ conda activate sklearn_env
(sklearn_env) {{ site.login.name }}> pip install sklearn
Collecting sklearn
  Downloading https://files.pythonhosted.org/packages/1e/7a/dbb3be0ce9bd5c8b7e3d87328e79063f8b263b2b1bfa4774cb1147bfcd3f/sklearn-0.0.tar.gz
Collecting scikit-learn (from sklearn)
  Downloading https://files.pythonhosted.org/packages/9f/c5/e5267eb84994e9a92a2c6a6ee768514f255d036f3c8378acfa694e9f2c99/scikit_learn-0.21.3-cp37-cp37m-manylinux1_x86_64.whl (6.7MB)
     |████████████████████████████████| 6.7MB 156kB/s

```

#### Test environment
```sh
(sklearn_env) {{ site.login.name }}> python
Python 3.7.4 (default, Aug 13 2019, 20:35:49)
[GCC 7.3.0] :: Anaconda, Inc. on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import sklearn
>>>
```

To see which packages are installed in the virtual environment (the "project folder") and what their versions are, do:
```sh
(sklearn_env) {{ site.login.name }}> pip list
Package             Version
------------------- ---------
certifi             2019.9.11
h5py                2.10.0
joblib              0.13.2
Keras               2.3.0
Keras-Applications  1.0.8
Keras-Preprocessing 1.1.0
numpy               1.17.2
pip                 19.2.3
PyYAML              5.1.2
scikit-learn        0.21.3
scipy               1.3.1
setuptools          41.2.0
six                 1.12.0
sklearn             0.0
wheel               0.33.6
```



#### Activate a virtual environment

Whenever you open a new terminal, make sure to _activate_ the virtual environment ("project folder"), otherwise it will not find the packages you've installed.  Pay attention to the shell prompt:

```sh
alice@{{ site.login.name}}> /bin/bash
alice@{{ site.login.name}}> export PATH='/netopt/rhel7/versions/python/Anaconda3-5.2.0/bin:/bin:$PATH'
alice@{{ site.login.name}}> export PATH=/bin:$PATH
alice@{{ site.login.name}}> source activate sklearn_env
(sklearn_env) {{ site.login.name}}> pip show scikit-learn
Name: scikit-learn
Version: 0.21.3
Summary: A set of python modules for machine learning and data mining
Home-page: http://scikit-learn.org
Author: None
Author-email: None
License: new BSD
Location: /data/rajlab1/user_data/pablo/conda/envs/sklearn_env/lib/python3.7/site-packages
Requires: numpy, scipy, joblib
Required-by: sklearn

```

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
When submitting jobs to the scheduler, make sure the job scripts load all required modules and activate the virtual environment.
</div>

To _deactivate_ a Python virtual environment, either open a fresh terminal (e.g. log out and back in), or use:
```sh
alice@{{ site.login.name}}> source deactivate
```

Note how prefix `(sklearn_env) ` was dropped from the shell prompt.
