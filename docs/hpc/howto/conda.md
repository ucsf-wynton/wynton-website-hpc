<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
⚠️ 2022-10-28: **Beta version!** The instructions on this page are fresh and might be updated soon. That said, they have been validated and approved by a group of experienced Conda users. If you run into issues, please let us know.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
⚠️ 2023-06-11: If you've used `module load CBI miniconda3-py39/4.12.0` in the past, please update to use `module load CBI miniconda3/4.12.0-py39` instead. It loads the same Conda version - it's just the module name structure that has been tidied up.
</div>


# Work with Conda

[Conda] is a package manager and an environment management system.  It's popular, because it simplifies installation of many scientific software tools.  There are two main distributions of Conda:

1. Anaconda - comes with more than 1,500 scientific packages (~3 GiB of disk space) [_not_ preinstalled on {{ site.cluster.nickname }}]
2. [Miniconda] - a small subset of the much larger Anaconda distribution (~0.5 GiB of disk space) [**recommended**; preinstalled on {{ site.cluster.nickname }}]

Both come with Python and `conda` commands.  We _recommend_ working with the smaller Miniconda distribution, especially since it is preinstalled on {{ site.cluster.nickname }}.  Using Miniconda, you can install additional scientific packages as needed using the `conda install ...` command.

**Note**: The aim of this document is to give the essential best-practices for working with Conda on {{ site.cluster.nickname }}. It is not meant to be a complete introduction on how to work with Conda in general. A good complement to this document, is the official Conda documentation on [Managing environments].


## Loading Miniconda

On {{ site.cluster.name }}, up-to-date versions of the Miniconda distribution are available via the CBI software stack.  There is no need for you to install this yourself.  To load Miniconda v3 with Python 3.9, call:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI miniconda3/23.3.1-0-py39
```

This gives access to:

```sh
[alice@{{ site.devel.name }} ~]$ conda --version

conda 23.3.1

[alice@{{ site.devel.name }} ~]$ python --version
Python 3.9.16
```

To see what software packages come with this Miniconda distribution, call:

```sh
[alice@{{ site.devel.name }} ~]$ conda list
# packages in environment at {{ site.path.cbi_software }}/CBI/miniconda3-23.3.1-0-py39:
#
# Name                    Version                   Build  Channel
_libgcc_mutex             0.1                        main  
_openmp_mutex             5.1                       1_gnu  
boltons                   23.0.0           py39h06a4308_0  
brotlipy                  0.7.0           py39h27cfd23_1003  
ca-certificates           2023.01.10           h06a4308_0  
certifi                   2022.12.7        py39h06a4308_0  
cffi                      1.15.1           py39h5eee18b_3  
charset-normalizer        2.0.4              pyhd3eb1b0_0  
conda                     23.3.1           py39h06a4308_0  
conda-content-trust       0.1.3            py39h06a4308_0  
conda-package-handling    2.0.2            py39h06a4308_0  
conda-package-streaming   0.7.0            py39h06a4308_0  
cryptography              39.0.1           py39h9ce1e76_0  
idna                      3.4              py39h06a4308_0  
jsonpatch                 1.32               pyhd3eb1b0_0  
jsonpointer               2.1                pyhd3eb1b0_0  
ld_impl_linux-64          2.38                 h1181459_1  
libffi                    3.4.2                h6a678d5_6  
libgcc-ng                 11.2.0               h1234567_1  
libgomp                   11.2.0               h1234567_1  
libstdcxx-ng              11.2.0               h1234567_1  
ncurses                   6.4                  h6a678d5_0  
openssl                   1.1.1t               h7f8727e_0  
packaging                 23.0             py39h06a4308_0  
pip                       23.0.1           py39h06a4308_0  
pluggy                    1.0.0            py39h06a4308_1  
pycosat                   0.6.4            py39h5eee18b_0  
pycparser                 2.21               pyhd3eb1b0_0  
pyopenssl                 23.0.0           py39h06a4308_0  
pysocks                   1.7.1            py39h06a4308_0  
python                    3.9.16               h7a1cb2a_2  
readline                  8.2                  h5eee18b_0  
requests                  2.28.1           py39h06a4308_1  
ruamel.yaml               0.17.21          py39h5eee18b_0  
ruamel.yaml.clib          0.2.6            py39h5eee18b_1  
setuptools                65.6.3           py39h06a4308_0  
six                       1.16.0             pyhd3eb1b0_1  
sqlite                    3.41.1               h5eee18b_0  
tk                        8.6.12               h1ccaba5_0  
toolz                     0.12.0           py39h06a4308_0  
tqdm                      4.65.0           py39hb070fc8_0  
tzdata                    2023c                h04d1e81_0  
urllib3                   1.26.15          py39h06a4308_0  
wheel                     0.38.4           py39h06a4308_0  
xz                        5.2.10               h5eee18b_1  
zlib                      1.2.13               h5eee18b_0  
zstandard                 0.19.0           py39h5eee18b_0  
```


## Creating a Conda environment (required)

A Conda _environment_ is a mechanism for installing extra software tools and versions beyond the base Miniconda distribution in a controlled manner.  When using the **miniconda3** module, a Conda environment must be used to install extra software. The following command creates a new `myjupyter` environment:

```sh
[alice@{{ site.devel.name }} ~]$ conda create -n myjupyter notebook
Collecting package metadata (current_repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: {{ site.user.home }}/.conda/envs/myjupyter

  added / updated specs:
    - notebook


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    anyio-3.5.0                |  py311h06a4308_0         214 KB
    argon2-cffi-bindings-21.2.0|  py311h5eee18b_0          33 KB
    ...
    xz-5.4.2                   |       h5eee18b_0         642 KB
    yaml-0.2.5                 |       h7b6447c_0          75 KB
    ------------------------------------------------------------
                                           Total:        67.6 MB

The following NEW packages will be INSTALLED:

  _libgcc_mutex      pkgs/main/linux-64::_libgcc_mutex-0.1-main 
  _openmp_mutex      pkgs/main/linux-64::_openmp_mutex-5.1-1_gnu 
  ...
  zeromq             pkgs/main/linux-64::zeromq-4.3.4-h2531618_0 
  zlib               pkgs/main/linux-64::zlib-1.2.13-h5eee18b_0 

Proceed ([y]/n)? y


Downloading and Extracting Packages
...
jupyterlab_pygments- | 8 KB      | #################################### | 100% 
jupyter_client-7.3.5 | 194 KB    | #################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate myjupyter
#
# To deactivate an active environment, use
#
#     $ conda deactivate

[alice@{{ site.devel.name }} ~]$ 
```

By default, the environment is created in your home directory under `~/.conda/`.  To create the environment at a specific location, see [Managing environments] part of the official Conda documentation.  That section covers many useful topics such as removing a Conda environment, and creating an environment with a specific Python version.


## Activating a Conda environment (required)

After an environment is created, the next time you log in to a development node, you can set `myjupyter` (or any other Conda environment you've created) as your active environment by calling:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI miniconda3
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ jupyter notebook --version
6.5.4

(myjupyter) [alice@{{ site.devel.name }} ~]$ 
```

Note how the command-line prompt is prefixed with `(myjupyter)`; it highlights that the Conda environment `myjupyter` is activated.  To deactivate an environment and return to the base environment, call:

```sh
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda deactivate
[alice@{{ site.devel.name }} ~]$ jupyter notebook --version
jupyter: command not found

[alice@{{ site.devel.name }} ~]$ 
```


## Speed up software by auto-staging Conda environment (recommended)

We highly recommend configuring Conda environment to be automatically staged only on the local disk whenever activated.  This results in your software running _significantly faster_.  Auto-staging is straightforward to configure using the `conda-stage` tool, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI miniconda3
[alice@{{ site.devel.name }} ~]$ module load CBI conda-stage
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda-stage --auto-stage=enable
INFO: Configuring automatic staging and unstaging of original Conda environment  ...
INFO: Enabled auto-staging
INFO: Enabled auto-unstaging
```

For the complete, easy-to-follow instructions, see the [conda-stage] documentation.


## Back up, migrate, and restore Conda environments (recommended)

Once you have your Conda environment built, we recommend that you back up its core configuration.  The process is quick and straightforward, and fully documented in the official Conda [Managing environments] documentation.  For example, to back up the above `myjupyter` environment, call:

```sh
[alice@{{ site.devel.name }} ~]$ conda env export --name myjupyter | grep -v "^prefix: " > myjupyter.yml
[alice@{{ site.devel.name }} ~]$ ls -l myjupyter.yml
-rw-rw-r-- 1 alice boblab 3597 Jun 11 03:48 myjupyter.yml
```

This configuration file is useful:

* when migrating the environment from {{ site.cluster.nickname }} to another Conda version, another computer, or another HPC environment

* for sharing the environment with collaborators

* for making a snapshot of the software stack used in a project

* for disaster recovery, e.g. if you remove the Conda environment by mistake

* for updating the dependencies in a Conda environment


To restore a backed up Conda environment from a yaml file, _on the target machine_:

1. download the yaml file, e.g. `myjupyter.yml`

2. make sure there is no existing environment with the same name, i.e. check `conda env list`

3. create a new Conda environment from the yaml file


For example, assume we have downloaded `myjupyter.yml` to our local machine.  Then we start by getting the name of the backed-up Conda environment and making sure it does not already exist;

```sh
{local}$ grep "name:" myjupyter.yml
name: myjupyter

{local}$ conda env list
# conda environments:
#
sandbox  {{ site.user.home }}/.conda/envs/sandbox
base     /path/to/anaconda3
```

When have confirmed that there is no name clash, we can restore the backed up environment on our local machine using:

```sh
{local}$ conda env create -f myjupyter.yml 
```

This will install the exact same software versions as when we made the backup.

_Warning_: This is _not_ a fool-proof backup method, because it depends on packages to be available from the package repositories also when you try to restore the Conda environment.  To lower the risk for failure, keep your environments up to date with the latest packages and test frequently that your `myjupyter.yml` file can be restored.


We can also use `myjupyter.yml` to update an existing environment.  The gist is to edit the file to reflect what we want to be updated, and then run `conda env update ...`.  See [Managing environments] part of the official Conda documentation for exact instructions.



## Conda revisions

If you updated or installed new packages in your Conda environment and need to roll back to a previous version, it is possible to do this using Conda's revision utility.  To list available revisions in the current Conda environment, use:

```sh
[alice@{{ site.devel.name }} ~]$ CONDA_STAGE=false conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda list --revisions
2023-06-11 03:46:03  (rev 0)
    +_libgcc_mutex-0.1 (defaults/linux-64)
    +_openmp_mutex-5.1 (defaults/linux-64)
    +anyio-3.5.0 (defaults/linux-64)
    +argon2-cffi-21.3.0 (defaults/noarch)
    ...

2023-06-11 03:52:03  (rev 1)
    +conda-pack-0.7.0 (conda-forge/noarch)
    +python_abi-3.11 (conda-forge/linux-64)
```

To roll back to a specific revision, say revision zero, use:

```sh
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda install --revision 0
```

_Warning_: This only works with packages installed using `conda install`.  Packages installed via `python3 -m pip install` will _not_ be recorded by the revision system.  In such cases, we have to do manual backup snapshots (as explained above).


## Appendix

### Disable automatic activation of the 'base' environment (highly recommended)

If you previously have _installed_ Conda yourself, there is a risk that it installed itself into your `~/.bashrc` file such that it automatically activates the 'base' environment whenever you start a new shell, e.g.

```sh
{local}$ ssh alice@{{ site.login.hostname }}
alice1@{{ site.login.hostname }}:s password: XXXXXXXXXXXXXXXXXXX
(base) [alice@{{ site.login.name }} ~]$ 
```

If you see a `(base)` prefix in your prompt, then you have this set up and the Conda 'base' environment is active.  You can verify this by querying `conda info` as:

```sh
[alice@{{ site.devel.name }} ~]$ conda info | grep active
conda info | grep active
     active environment : base
    active env location : {{ site.user.home }}/miniconda3
```

This auto-activation might sound convenient, but we _strongly recommend_ against using it, because Conda software stacks have a great chance to cause conflicts (read: wreak havoc) with other software tools installed outside of Conda.  For example, people that have Conda activated and then run R via `module load CBI r`, often report on endless, hard-to-understand problems when trying to install common R packages.  Instead, we recommend to activate your Conda environments only when you need them, and leave them non-activated otherwise.  This will give you a much smoother day-to-day experience.  To clarify, if you never installed Conda yourself, and only used `module load CBI miniconda3-py39/23.3.1-0-py39`, then you should not have this problem.

To reconfigure Conda to no longer activate the 'base' Conda environment by default, call:

```sh
(base) [alice@{{ site.devel.name }} ~]$ conda config --set auto_activate_base false
(base) [alice@{{ site.devel.name }} ~]$ 
```

Next time you log in, the 'base' environment should no longer be activated by default.

If you want to completely retire you personal Conda installation, and move on to only using `module load CBI miniconda3`, you can uninstall the Conda setup code that were injected to your `~/.bashrc` file by calling:

```sh
[alice@{{ site.devel.name }} ~]$ conda init --reverse
no change     {{ site.user.home }}/miniconda3/condabin/conda
no change     {{ site.user.home }}/miniconda3/bin/conda
no change     {{ site.user.home }}/miniconda3/bin/conda-env
no change     {{ site.user.home }}/miniconda3/bin/activate
no change     {{ site.user.home }}/miniconda3/bin/deactivate
no change     {{ site.user.home }}/miniconda3/etc/profile.d/conda.sh
no change     {{ site.user.home }}/miniconda3/etc/fish/conf.d/conda.fish
no change     {{ site.user.home }}/miniconda3/shell/condabin/Conda.psm1
no change     {{ site.user.home }}/miniconda3/shell/condabin/conda-hook.ps1
no change     {{ site.user.home }}/miniconda3/lib/python3.9/site-packages/xontrib/conda.xsh
no change     {{ site.user.home }}/miniconda3/etc/profile.d/conda.csh
modified      {{ site.user.home }}/.bashrc

==> For changes to take effect, close and re-open your current shell. <==

[alice@{{ site.devel.name }} ~]$ 
```


[Conda]: https://conda.io
[Miniconda]: https://docs.conda.io/en/latest/miniconda.html
[conda-stage]: conda-stage.html
[Managing environments]: https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html
