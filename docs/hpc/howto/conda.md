<div class="alert alert-warning" role="alert" markdown="1">

We no longer recommend using Anaconda or Miniconda that is distributed
by Anaconda Inc., because of license issues. Anaconda Inc. argues that
using their default package channels requires UCSF to acquire an
enterprise license.

</div>


# Work with Conda

[Conda] is a package manager and an environment management system.
It's popular, because it simplifies installation of many scientific
software tools.  We recommend to use:

1. [Miniforge] - a community-driven, libre-licensed alternative to the
   [Miniconda] (~0.5 GiB of disk space) [**recommended**; preinstalled
   on {{ site.cluster.nickname }}]

It provides the `conda` and `python` commands, among other tools and
libraries.

**Note**: The aim of this document is to give the essential best-practices for working with Conda on {{ site.cluster.nickname }}. It is not meant to be a complete introduction on how to work with Conda in general. A good complement to this document, is the official Conda documentation on [Managing environments].


## Loading Miniforge

<<<<<<< Updated upstream
On {{ site.cluster.name }}, up-to-date versions of the Miniconda distribution are available via the CBI software stack.  There is no need for you to install this yourself.  To load Miniconda v3, call:

<!-- code-block label="module-load-miniforge3" -->
```sh
[alice@{{ site.devel.name }} ~]$ module load CBI miniforge3/24.3.0-0
=======
On {{ site.cluster.name }}, up-to-date versions of the Miniforge distribution are available via the CBI software stack.  There is no need for you to install this yourself.  To load Miniforge v3, call:

<!-- code-block label="module-load-miniforge3" -->
```sh
[alice@{{ site.devel.name }} ~]$ module load CBI miniforge3/23.5.2-0-py311
>>>>>>> Stashed changes
```

This gives access to:

<!-- code-block label="conda-version" -->
```sh
[alice@{{ site.devel.name }} ~]$ conda --version
conda 24.3.0
[alice@{{ site.devel.name }} ~]$ python --version
Python 3.10.14
```

To see what software packages come with this Miniconda distribution, call:

<!-- code-block label="conda-list" -->
```sh
[alice@{{ site.devel.name }} ~]$ conda list
<<<<<<< Updated upstream
# packages in environment at /wynton/home/boblab/shared/software/CBI/miniforge3-24.3.0-0:
=======
# packages in environment at /wynton/home/boblab/shared/software/CBI/miniforge3-23.5.2-0-py311:
>>>>>>> Stashed changes
#
# Name                    Version                   Build  Channel
_libgcc_mutex             0.1                 conda_forge    conda-forge
_openmp_mutex             4.5                       2_gnu    conda-forge
archspec                  0.2.3              pyhd8ed1ab_0    conda-forge
boltons                   24.0.0             pyhd8ed1ab_0    conda-forge
brotli-python             1.1.0           py310hc6cd4ac_1    conda-forge
bzip2                     1.0.8                hd590300_5    conda-forge
c-ares                    1.28.1               hd590300_0    conda-forge
ca-certificates           2024.2.2             hbcca054_0    conda-forge
certifi                   2024.2.2           pyhd8ed1ab_0    conda-forge
cffi                      1.16.0          py310h2fee648_0    conda-forge
charset-normalizer        3.3.2              pyhd8ed1ab_0    conda-forge
colorama                  0.4.6              pyhd8ed1ab_0    conda-forge
conda                     24.3.0          py310hff52083_0    conda-forge
conda-libmamba-solver     24.1.0             pyhd8ed1ab_0    conda-forge
conda-package-handling    2.2.0              pyh38be061_0    conda-forge
conda-package-streaming   0.9.0              pyhd8ed1ab_0    conda-forge
distro                    1.9.0              pyhd8ed1ab_0    conda-forge
fmt                       10.2.1               h00ab1b0_0    conda-forge
icu                       73.2                 h59595ed_0    conda-forge
idna                      3.6                pyhd8ed1ab_0    conda-forge
jsonpatch                 1.33               pyhd8ed1ab_0    conda-forge
jsonpointer               2.4             py310hff52083_3    conda-forge
keyutils                  1.6.1                h166bdaf_0    conda-forge
krb5                      1.21.2               h659d440_0    conda-forge
ld_impl_linux-64          2.40                 h41732ed_0    conda-forge
libarchive                3.7.2                h2aa1ff5_1    conda-forge
libcurl                   8.7.1                hca28451_0    conda-forge
libedit                   3.1.20191231         he28a2e2_2    conda-forge
libev                     4.33                 hd590300_2    conda-forge
libffi                    3.4.2                h7f98852_5    conda-forge
libgcc-ng                 13.2.0               h807b86a_5    conda-forge
libgomp                   13.2.0               h807b86a_5    conda-forge
libiconv                  1.17                 hd590300_2    conda-forge
libmamba                  1.5.8                had39da4_0    conda-forge
libmambapy                1.5.8           py310h39ff949_0    conda-forge
libnghttp2                1.58.0               h47da74e_1    conda-forge
libnsl                    2.0.1                hd590300_0    conda-forge
libsolv                   0.7.28               hfc55251_2    conda-forge
libsqlite                 3.45.2               h2797004_0    conda-forge
libssh2                   1.11.0               h0841786_0    conda-forge
libstdcxx-ng              13.2.0               h7e041cc_5    conda-forge
libuuid                   2.38.1               h0b41bf4_0    conda-forge
libxcrypt                 4.4.36               hd590300_1    conda-forge
libxml2                   2.12.6               h232c23b_1    conda-forge
libzlib                   1.2.13               hd590300_5    conda-forge
lz4-c                     1.9.4                hcb278e6_0    conda-forge
lzo                       2.10              h516909a_1000    conda-forge
mamba                     1.5.8           py310h51d5547_0    conda-forge
menuinst                  2.0.2           py310hff52083_0    conda-forge
ncurses                   6.4.20240210         h59595ed_0    conda-forge
openssl                   3.2.1                hd590300_1    conda-forge
packaging                 24.0               pyhd8ed1ab_0    conda-forge
pip                       24.0               pyhd8ed1ab_0    conda-forge
platformdirs              4.2.0              pyhd8ed1ab_0    conda-forge
pluggy                    1.4.0              pyhd8ed1ab_0    conda-forge
pybind11-abi              4                    hd8ed1ab_3    conda-forge
pycosat                   0.6.6           py310h2372a71_0    conda-forge
pycparser                 2.22               pyhd8ed1ab_0    conda-forge
pysocks                   1.7.1              pyha2e5f31_6    conda-forge
python                    3.10.14         hd12c33a_0_cpython    conda-forge
python_abi                3.10                    4_cp310    conda-forge
readline                  8.2                  h8228510_1    conda-forge
reproc                    14.2.4.post0         hd590300_1    conda-forge
reproc-cpp                14.2.4.post0         h59595ed_1    conda-forge
requests                  2.31.0             pyhd8ed1ab_0    conda-forge
ruamel.yaml               0.18.6          py310h2372a71_0    conda-forge
ruamel.yaml.clib          0.2.8           py310h2372a71_0    conda-forge
setuptools                69.5.1             pyhd8ed1ab_0    conda-forge
tk                        8.6.13          noxft_h4845f30_101    conda-forge
tqdm                      4.66.2             pyhd8ed1ab_0    conda-forge
truststore                0.8.0              pyhd8ed1ab_0    conda-forge
tzdata                    2024a                h0c530f3_0    conda-forge
urllib3                   2.2.1              pyhd8ed1ab_0    conda-forge
wheel                     0.43.0             pyhd8ed1ab_1    conda-forge
xz                        5.2.6                h166bdaf_0    conda-forge
yaml-cpp                  0.8.0                h59595ed_0    conda-forge
zstandard                 0.22.0          py310h1275a96_0    conda-forge
zstd                      1.5.5                hfc55251_0    conda-forge
```


## Creating a Conda environment (required)

A Conda _environment_ is a mechanism for installing extra software tools and versions beyond the base Miniconda distribution in a controlled manner.  When using the **miniforge3** module, a Conda environment must be used to install extra software. The following command creates a new `myjupyter` environment:

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
[alice@{{ site.devel.name }} ~]$ module load CBI miniforge3
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
[alice@{{ site.devel.name }} ~]$ module load CBI miniforge3
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
    active env location : {{ site.user.home }}/miniforge3
```

This auto-activation might sound convenient, but we _strongly recommend_ against using it, because Conda software stacks have a great chance to cause conflicts (read: wreak havoc) with other software tools installed outside of Conda.  For example, people that have Conda activated and then run R via `module load CBI r`, often report on endless, hard-to-understand problems when trying to install common R packages.  Instead, we recommend to activate your Conda environments only when you need them, and leave them non-activated otherwise.  This will give you a much smoother day-to-day experience.  To clarify, if you never installed Conda yourself, and only used `module load CBI miniforge3-py39/23.3.1-0-py39`, then you should not have this problem.

To reconfigure Conda to no longer activate the 'base' Conda environment by default, call:

```sh
(base) [alice@{{ site.devel.name }} ~]$ conda config --set auto_activate_base false
(base) [alice@{{ site.devel.name }} ~]$ 
```

Next time you log in, the 'base' environment should no longer be activated by default.

If you want to completely retire you personal Conda installation, and move on to only using `module load CBI miniforge3`, you can uninstall the Conda setup code that were injected to your `~/.bashrc` file by calling:

```sh
[alice@{{ site.devel.name }} ~]$ conda init --reverse
no change     {{ site.user.home }}/miniforge3/condabin/conda
no change     {{ site.user.home }}/miniforge3/bin/conda
no change     {{ site.user.home }}/miniforge3/bin/conda-env
no change     {{ site.user.home }}/miniforge3/bin/activate
no change     {{ site.user.home }}/miniforge3/bin/deactivate
no change     {{ site.user.home }}/miniforge3/etc/profile.d/conda.sh
no change     {{ site.user.home }}/miniforge3/etc/fish/conf.d/conda.fish
no change     {{ site.user.home }}/miniforge3/shell/condabin/Conda.psm1
no change     {{ site.user.home }}/miniforge3/shell/condabin/conda-hook.ps1
no change     {{ site.user.home }}/miniforge3/lib/python3.9/site-packages/xontrib/conda.xsh
no change     {{ site.user.home }}/miniforge3/etc/profile.d/conda.csh
modified      {{ site.user.home }}/.bashrc

==> For changes to take effect, close and re-open your current shell. <==

[alice@{{ site.devel.name }} ~]$ 
```


[Conda]: https://conda.io
[Miniconda]: https://docs.conda.io/en/latest/miniconda.html
[conda-stage]: conda-stage.html
[Managing environments]: https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html
