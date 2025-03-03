<div class="alert alert-warning" role="alert" markdown="1">

2024-08-21: We no longer recommend using Anaconda or Miniconda that is
distributed by Anaconda Inc., because of license issues. Anaconda
Inc. argues that using their default package channels requires UCSF to
acquire an enterprise license. If you used `module load CBI
miniconda3` in the past, we therefore recommend that you use `module
load CBI miniforge3` instead.

</div>


# Work with Conda

[Conda] is a package manager and an environment management system.
It's popular, because it simplifies installation of many scientific
software tools.  We recommend to use:

1. [Miniforge] - a Conda alternative to the [Miniconda] (~0.5 GiB of
   disk space), which defaults to the community-driven, libre-licensed
   **[conda-forge]** channels [**recommended**; preinstalled on {{
   site.cluster.nickname }}]

It provides the `conda` and `python` commands, among other tools and
libraries.

**Note**: The aim of this document is to give the essential best-practices for working with Conda on {{ site.cluster.nickname }}. It is not meant to be a complete introduction on how to work with Conda in general. A good complement to this document, is the official Conda documentation on [Managing environments].


## Loading Miniforge

On {{ site.cluster.name }}, up-to-date versions of the Miniforge distribution are available via the CBI software stack.  There is no need for you to install this yourself.  To load Miniforge, call:

<!-- code-block label="module-load-miniforge3" -->
```sh
[alice@{{ site.devel.name }} ~]$ module load CBI miniforge3/24.11.0-0
```

This gives access to:

<!-- code-block label="conda-version" -->
```sh
[alice@{{ site.devel.name }} ~]$ conda --version
conda 24.11.0
[alice@{{ site.devel.name }} ~]$ python --version
Python 3.12.8
```

To see what software packages come with this distribution, call:

<!-- code-block label="conda-list" -->
```sh
[alice@{{ site.devel.name }} ~]$ conda list
# packages in environment at /wynton/home/boblab/shared/software/CBI/miniforge3-24.11.0-0:
#
# Name                    Version                   Build  Channel
_libgcc_mutex             0.1                 conda_forge    conda-forge
_openmp_mutex             4.5                       2_gnu    conda-forge
archspec                  0.2.3              pyhd8ed1ab_0    conda-forge
boltons                   24.0.0             pyhd8ed1ab_1    conda-forge
brotli-python             1.1.0           py312h2ec8cdc_2    conda-forge
bzip2                     1.0.8                h4bc722e_7    conda-forge
c-ares                    1.34.3               hb9d3cd8_1    conda-forge
ca-certificates           2024.8.30            hbcca054_0    conda-forge
certifi                   2024.8.30          pyhd8ed1ab_0    conda-forge
cffi                      1.17.1          py312h06ac9bb_0    conda-forge
charset-normalizer        3.4.0              pyhd8ed1ab_1    conda-forge
colorama                  0.4.6              pyhd8ed1ab_1    conda-forge
conda                     24.11.0         py312h7900ff3_0    conda-forge
conda-libmamba-solver     24.9.0             pyhd8ed1ab_0    conda-forge
conda-package-handling    2.4.0              pyha770c72_1    conda-forge
conda-package-streaming   0.11.0             pyhd8ed1ab_0    conda-forge
distro                    1.9.0              pyhd8ed1ab_0    conda-forge
fmt                       11.0.2               h434a139_0    conda-forge
frozendict                2.4.6           py312h66e93f0_0    conda-forge
h2                        4.1.0              pyhd8ed1ab_1    conda-forge
hpack                     4.0.0              pyhd8ed1ab_1    conda-forge
hyperframe                6.0.1              pyhd8ed1ab_1    conda-forge
idna                      3.10               pyhd8ed1ab_1    conda-forge
jsonpatch                 1.33               pyhd8ed1ab_1    conda-forge
jsonpointer               3.0.0           py312h7900ff3_1    conda-forge
keyutils                  1.6.1                h166bdaf_0    conda-forge
krb5                      1.21.3               h659f571_0    conda-forge
ld_impl_linux-64          2.43                 h712a8e2_2    conda-forge
libarchive                3.7.7                h4585015_2    conda-forge
libcurl                   8.10.1               hbbe4b11_0    conda-forge
libedit                   3.1.20191231         he28a2e2_2    conda-forge
libev                     4.33                 hd590300_2    conda-forge
libexpat                  2.6.4                h5888daf_0    conda-forge
libffi                    3.4.2                h7f98852_5    conda-forge
libgcc                    14.2.0               h77fa898_1    conda-forge
libgcc-ng                 14.2.0               h69a702a_1    conda-forge
libgomp                   14.2.0               h77fa898_1    conda-forge
libiconv                  1.17                 hd590300_2    conda-forge
liblzma                   5.6.3                hb9d3cd8_1    conda-forge
libmamba                  1.5.11               hf72d635_0    conda-forge
libmambapy                1.5.11          py312hf3f0a4e_0    conda-forge
libnghttp2                1.64.0               h161d5f1_0    conda-forge
libnsl                    2.0.1                hd590300_0    conda-forge
libsolv                   0.7.30               h3509ff9_0    conda-forge
libsqlite                 3.47.2               hee588c1_0    conda-forge
libssh2                   1.11.1               hf672d98_0    conda-forge
libstdcxx                 14.2.0               hc0a3c3a_1    conda-forge
libstdcxx-ng              14.2.0               h4852527_1    conda-forge
libuuid                   2.38.1               h0b41bf4_0    conda-forge
libxcrypt                 4.4.36               hd590300_1    conda-forge
libxml2                   2.13.5               h0d44e9d_1    conda-forge
libzlib                   1.3.1                hb9d3cd8_2    conda-forge
lz4-c                     1.10.0               h5888daf_1    conda-forge
lzo                       2.10              hd590300_1001    conda-forge
mamba                     1.5.11          py312h9460a1c_0    conda-forge
menuinst                  2.2.0           py312h7900ff3_0    conda-forge
ncurses                   6.5                  he02047a_1    conda-forge
openssl                   3.4.0                hb9d3cd8_0    conda-forge
packaging                 24.2               pyhd8ed1ab_2    conda-forge
pip                       24.3.1             pyh8b19718_0    conda-forge
platformdirs              4.3.6              pyhd8ed1ab_1    conda-forge
pluggy                    1.5.0              pyhd8ed1ab_1    conda-forge
pybind11-abi              4                    hd8ed1ab_3    conda-forge
pycosat                   0.6.6           py312h66e93f0_2    conda-forge
pycparser                 2.22               pyh29332c3_1    conda-forge
pysocks                   1.7.1              pyha55dd90_7    conda-forge
python                    3.12.8          h9e4cc4f_1_cpython    conda-forge
python_abi                3.12                    5_cp312    conda-forge
readline                  8.2                  h8228510_1    conda-forge
reproc                    14.2.5.post0         hb9d3cd8_0    conda-forge
reproc-cpp                14.2.5.post0         h5888daf_0    conda-forge
requests                  2.32.3             pyhd8ed1ab_1    conda-forge
ruamel.yaml               0.18.6          py312h66e93f0_1    conda-forge
ruamel.yaml.clib          0.2.8           py312h66e93f0_1    conda-forge
setuptools                75.6.0             pyhff2d567_1    conda-forge
tk                        8.6.13          noxft_h4845f30_101    conda-forge
tqdm                      4.67.1             pyhd8ed1ab_0    conda-forge
truststore                0.10.0             pyhd8ed1ab_0    conda-forge
tzdata                    2024b                hc8b5060_0    conda-forge
urllib3                   2.2.3              pyhd8ed1ab_1    conda-forge
wheel                     0.45.1             pyhd8ed1ab_1    conda-forge
yaml-cpp                  0.8.0                h59595ed_0    conda-forge
zstandard                 0.23.0          py312hef9b889_1    conda-forge
zstd                      1.5.6                ha6fb4c9_0    conda-forge
```


## Creating a Conda environment (required)

A Conda _environment_ is a mechanism for installing extra software tools and versions beyond the base Miniforge distribution in a controlled manner.  When using the **miniforge3** module, a Conda environment must be used to install extra software. The following command creates a new `myjupyter` environment:

```sh
[alice@{{ site.devel.name }} ~]$ conda create -n myjupyter notebook
Channels:
 - conda-forge
Platform: linux-64
Collecting package metadata (current_repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: {{ site.user.home }}/.conda/envs/myjupyter
  
  added / updated specs:
    - notebook
    
The following NEW packages will be INSTALLED:

  _libgcc_mutex      conda-forge/linux-64::_libgcc_mutex-0.1-conda_forge
  _openmp_mutex      conda-forge/linux-64::_openmp_mutex-4.5-2_gnu
  ...
  zstandard          conda-forge/linux-64::zstandard-0.23.0-py312h3483029_0 
  zstd               conda-forge/linux-64::zstd-1.5.6-ha6fb4c9_0 

Proceed ([y]/n)? y


Downloading and Extracting Packages

...
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

By default, the environment is created in your home directory under `~/.conda/envs/`.  To create the environment at a specific location, see [Managing environments] part of the official Conda documentation.  That section covers many useful topics such as removing a Conda environment, and creating an environment with a specific Python version.


## Activating a Conda environment (required)

After an environment is created, the next time you log in to a development node, you can set `myjupyter` (or any other Conda environment you've created) as your active environment by calling:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI miniforge3
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ jupyter notebook --version
7.2.1

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
[alice@{{ site.devel.name }} ~]$ conda stage --auto-stage=enable myjupyter
INFO: Configuring automatic staging and unstaging of original Conda environment  ...
INFO: [ONCE] Packaging Conda environment, because it hasn't been done before ...
Collecting packages...
Packing environment at '{{ site.user.home }}/.conda/envs/myjupyter' to
'{{ site.user.home }}/.conda/envs/.tmp.myjupyter.tar.gz'
[########################################] | 100% Completed |  4min  5.6s
INFO: Total 'conda-pack' time: 274 seconds
INFO: Created conda-pack tarball: {{ site.user.home }}/.conda/envs/myjupyter.tar.gz
      (140099022 bytes; 2025-03-02 19:33:08.108806755 -0800)
INFO: Enabled auto-staging
INFO: Enabled auto-unstaging
[alice@{{ site.devel.name }} ~]$ 
```

That's it. For the complete, easy-to-follow instructions, see the [conda-stage] documentation.


## Back up, migrate, and restore Conda environments (recommended)

Once you have your Conda environment built, we recommend that you back up its core configuration.  The process is quick and straightforward, and fully documented in the official Conda [Managing environments] documentation.  For example, to back up the above `myjupyter` environment, call:

```sh
[alice@{{ site.devel.name }} ~]$ conda env export --name myjupyter | grep -v "^prefix: " > myjupyter.yml
[alice@{{ site.devel.name }} ~]$ ls -l myjupyter.yml
-rw-rw-r-- 1 alice boblab 4982 Aug 21 17:56 myjupyter.yml
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
myjupyter {{ site.user.home }}/.conda/envs/myjupyter
base      /path/to/miniforge3
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
    active env location : {{ site.user.home }}/.conda
```

This auto-activation might sound convenient, but we _strongly recommend_ against using it, because Conda software stacks have a great chance to cause conflicts (read: wreak havoc) with other software tools installed outside of Conda.  For example, people that have Conda activated and then run R via `module load CBI r`, often report on endless, hard-to-understand problems when trying to install common R packages.  Instead, we recommend to activate your Conda environments only when you need them, and leave them non-activated otherwise.  This will give you a much smoother day-to-day experience.  To clarify, if you never installed Conda yourself, and only used `module load CBI miniforge3`, then you should not have this problem.

To reconfigure Conda to no longer activate the 'base' Conda environment by default, call:

```sh
(base) [alice@{{ site.devel.name }} ~]$ conda config --set auto_activate_base false
(base) [alice@{{ site.devel.name }} ~]$ 
```

Next time you log in, the 'base' environment should no longer be activated by default.

If you want to completely retire you personal Conda installation, and move on to only using `module load CBI miniforge3`, you can uninstall the Conda setup code that were injected to your `~/.bashrc` file by calling:

```sh
[alice@{{ site.devel.name }} ~]$ conda init --reverse
no change     {{ site.user.home }}/.conda/condabin/conda
no change     {{ site.user.home }}/.conda/bin/conda
no change     {{ site.user.home }}/.conda/bin/conda-env
no change     {{ site.user.home }}/.conda/bin/activate
no change     {{ site.user.home }}/.conda/bin/deactivate
no change     {{ site.user.home }}/.conda/etc/profile.d/conda.sh
no change     {{ site.user.home }}/.conda/etc/fish/conf.d/conda.fish
no change     {{ site.user.home }}/.conda/shell/condabin/Conda.psm1
no change     {{ site.user.home }}/.conda/shell/condabin/conda-hook.ps1
no change     {{ site.user.home }}/.conda/lib/python3.9/site-packages/xontrib/conda.xsh
no change     {{ site.user.home }}/.conda/etc/profile.d/conda.csh
modified      {{ site.user.home }}/.bashrc

==> For changes to take effect, close and re-open your current shell. <==

[alice@{{ site.devel.name }} ~]$ 
```


[Conda]: https://conda.io
[Miniconda]: https://docs.conda.io/en/latest/miniconda.html
[Miniforge]: https://conda-forge.org/miniforge/
[conda-forge]: https://conda-forge.org/
[conda-stage]: conda-stage.html
[Managing environments]: https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html
