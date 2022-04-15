<div class="alert alert-warning" role="alert" markdown="1">
2022-04-13: This is just a draft! The below instructions are currently _not_ ready for users to try out. Stay tuned!
</div>

<div class="alert alert-warning" role="alert" markdown="1">
Please, **always stage your Conda environment to local disk!** Your software and job scripts will run much faster this way, and it will significantly decrease the load on the BeeGFS file system. It is a win-win for everyone. See Appendix below for some benchmark results.
</div>


# Work with Conda

TO DO.

## Do not activate Conda by default (recommended)

```sh
[alice@dev2 ~]$ conda config --set auto_activate_base false
```


## Install select software to Conda environment

In this example, we install Jupyter Notebook to a new Conda environment that we call `myjupyter`.  We start by create the environment:

```sh
[alice@{{ site.devel.name }} ~]$ conda create --name=myjupyter
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$
```

At this point, the Conda environment is empty. Next, we install Jupyter Notebook to this environment:

```sh
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda install conda-forge::notebook
(myjupyter) [alice@{{ site.devel.name }} ~]$ command -v jupyter
{{ site.user.home }}/miniconda3/envs/myjupyter/bin/jupyter
```

To deactivate a Conda environment, call:

```sh
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda deactivate
[alice@{{ site.devel.name }} ~]$ command -v jupyter
[alice@{{ site.devel.name }} ~]$ 
```


## Use software in a Conda environment

To access software previous installed to a Conda environment, all you need to do is activate the environment by its name;

```sh
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ command -v jupyter
{{ site.user.home }}/miniconda3/envs/myjupyter/bin/jupyter
```

This shows that the software tool is available. For example,

```sh
(myjupyter) [alice@{{ site.devel.name }} ~]$ jupyter --version
Selected Jupyter core packages...
IPython          : 8.2.0
ipykernel        : 6.9.1
ipywidgets       : not installed
jupyter_client   : 7.1.2
jupyter_core     : 4.9.2
jupyter_server   : not installed
jupyterlab       : not installed
nbclient         : 0.5.11
nbconvert        : 6.4.4
nbformat         : 5.1.3
notebook         : 6.4.10
qtconsole        : not installed
traitlets        : 5.1.1
```


## Stage Conda environment on local disk (required)

Working with a Conda environment on local disk greatly improves the performance.  This is because the local disk (`/scratch`) on the current machine is much faster than any network-based file system, including BeeGFS (`{{ site.path.global_root }}`) used on {{ site.cluster.nickname }}.  This is particularly beneficial when running many instances of a software tool, e.g. in job scripts.

Staging an active Conda environment to local disk is straightforward using the **[conda-stage]** tool.  For example, assume we have an existing Conda environment named `myjupyter`.  After having loaded the `conda-stage` module, all we need to do is activate it and call `conda-stage`;

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI conda-stage
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda-stage
INFO: Staging current conda environment ({{ site.user.home }}/miniconda3/envs/myjupyter) to local disk ...
INFO: Installing conda-pack ...
Collecting package metadata (current_repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: {{ site.user.home }}/miniconda3/envs/myjupyter

  added / updated specs:
    - conda-pack


The following NEW packages will be INSTALLED:

  conda-pack         conda-forge/noarch::conda-pack-0.7.0-pyh6c4a22f_0
  python_abi         conda-forge/linux-64::python_abi-3.9-2_cp39

The following packages will be SUPERSEDED by a higher-priority channel:

  ca-certificates    pkgs/main::ca-certificates-2022.3.29-~ --> conda-forge::ca-certificates-2021.10.8-ha878542_0
  certifi            pkgs/main::certifi-2021.10.8-py39h06a~ --> conda-forge::certifi-2021.10.8-py39hf3d152e_2


Preparing transaction: done
Verifying transaction: done
Executing transaction: done
INFO: Total installation time: 45 seconds
INFO: Packaging conda environment ...
Collecting packages...
Packing environment at '{{ site.user.home }}/miniconda3/envs/myjupyter' to '{{ site.user.home }}/miniconda3/envs/.tmp.myjupyter.tar.gz'
[########################################] | 100% Completed |  5min 42.1s
INFO: Total 'conda-pack' time: 363 seconds
INFO: Extracting {{ site.user.home }}/miniconda3/envs/myjupyter.tar.gz (83710719 bytes; 2022-04-14 15:10:23.000000000 -0700) to /scratch/alice/conda-stage_wFWY
INFO: Total extract time: 4 seconds
INFO: Unpacking
INFO: Total 'conda-unpack' time: 0 seconds
INFO: Activating staged conda environment: /scratch/alice/conda-stage_wFWY
(myjupyter*) [alice@{{ site.devel.name }} ~]$
```

**Please, be patient**. The first time you use `conda-stage` on a Conda environment, it also has to install dependency **[conda-pack]** and package up the environment into a "tarball" that is saved to cache.  Both these steps are automatically skipped when `conda-stage` is used in the future and the staging to local disk is much quicker, e.g.

```sh
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda-stage
INFO: Staging current conda environment ({{ site.user.home }}/miniconda3/envs/myjupyter) to
 local disk ...
INFO: Extracting {{ site.user.home }}/miniconda3/envs/myjupyter.tar.gz (83710719 bytes; 202
2-04-14 15:10:23.000000000 -0700) to /scratch/alice/conda-stage_wFWY
INFO: Total extract time: 3 seconds
INFO: Unpacking
INFO: Total 'conda-unpack' time: 0 seconds
INFO: Activating staged conda environment: /scratch/alice/conda-stage_wFWY
(myjupyter*) [alice@{{ site.devel.name }} ~]$ 
```

Continuing, when staging is done, all software tools now lives on the local disk, e.g.

```sh
(myjupyter*) [alice@{{ site.devel.name }} ~]$ command -v jupyter
/scratch/alice/conda-stage_wFWY/myjupyter/bin/jupyter
```

To unstage the staged environment and re-activate the original Conda environment, call:

```sh
(myjupyter*) [alice@{{ site.devel.name }} ~]$ conda-stage --unstage
INFO: Unstaging and reverting to original conda environment  ...
INFO: Original conda environment: {{ site.user.home }}/miniconda3/envs/myjupyter
INFO: Removing all staged files: /scratch/alice/conda-stage_wFWY
INFO: Activating original conda environment: {{ site.user.home }}/miniconda3/envs/myjupyter
INFO: Total unstage time: 0 seconds
(myjupyter) [alice@{{ site.devel.name }} ~]$ command -v jupyter
{{ site.user.home }}/miniconda3/envs/myjupyter/bin/jupyter
```

Note how the software tools are now found in the original location, which is left as-is through out the staging.


If a packaged tarball already exists, you can rebuild it using:

```sh
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda-stage --pack --force
```

This can used when software tools have been updated since last time, or when additional software have been installed to the environment.


### Use Conda staging in job scripts

To work with staged conda environments in your job scripts, just call `conda-stage` after activating the conda environment of interest.  That is, if your script used to do:

```sh
#! /usr/bin/env bash

conda activate myenv
...
```

all you need to do is to update it to:

```sh
#! /usr/bin/env bash

module load CBI conda-stage
conda activate myenv
conda-stage
...
```


### Automatically stage Conda environment when activated

If you think calling `conda-stage` is too much to remember and you wish it could be done automatically, then your in luck.  You can configure the environment to call `conda-stage` whenever it is activated.  Here is how to do it:

```sh
(myjupyter) [alice@{{ site.devel.name }} ~]$ module load CBI conda-stage
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda-stage --read-only --auto-stage=enable
INFO: Configuring automatic staging of original conda environment  ...
INFO: Enabled auto staging
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda deactivate
[alice@{{ site.devel.name }} ~]$ 
```

From now on, this Conda environment will be automatically staged when activated;

```sh
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
Auto staging conda environment 'myjupyter'. To disable, call 'conda-stage --auto-stage=disable'
INFO: Staging current conda environment ({{ site.user.home }}/miniconda3/envs/myjupyter) to local disk ...
INFO: Extracting {{ site.user.home }}/miniconda3/envs/myjupyter.tar.gz (83710719 bytes; 2022-04-14 15:10:23.000000000 -0700) to /scratch/alice/conda-stage_wFWY
INFO: Total extract time: 4 seconds
INFO: Unpacking
INFO: Total 'conda-unpack' time: 0 seconds
INFO: Make staged environment read-only
INFO: Activating staged conda environment: /scratch/alice/conda-stage_wFWY
(myjupyter*) [alice@{{ site.devel.name }} ~]$ command -v jupyter
/scratch/alice/conda-stage_wFWY
```

To disable automatic staging, just call:

```sh
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda-stage --auto-stage=disable
(myjupyter) [alice@{{ site.devel.name }} ~]$ 
```

Note also how we in the above example configured the auto-staging with `--read-only`. This will make the staged environment to be read-only, that is, we cannot install additional software to it, or update the existing ones. To do that, you need to unstage it first, install or update the original environment, and the call `conda-stage --pack --force`.


## Appendix

### Benchmark staged Conda environment

<!-- These benchmarks where collected on 2022-04-13 at 18:50 -->

To illustrate the benefit of staging a Conda environment to local disk, we will benchmark how long it takes for `jupyter --version` to complete.

Without staging to local disk, the call takes a whopping 32 seconds to return:

```sh
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ command -v jupyter
{{ site.user.home }}/miniconda3/envs/myjupyter/bin/jupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ command time --portability jupyter --version > /dev/null
real 32.06
user 1.42
sys 0.76
```

This was test was done during a time when the cluster did indeed experience heavy load on the BeeGFS file system at the time.  The fact that `real` is much greater than `user + sys` suggests our process spends a lot of time just waiting.  **When staging to local disk, we can avoid being affected by this load.**  When running from the local disk, the same call takes less than a second;

```sh
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda-stage
(myjupyter*) [alice@{{ site.devel.name }} ~]$ command -v jupyter
/scratch/alice/conda-stage_wFWY/myjupyter/bin/jupyter
(myjupyter*) [alice@{{ site.devel.name }} ~]$ command time --portability jupyter --version > /dev/null
real 0.75
user 0.67
sys 0.07
```


### Proof that a staged Conda environment lives on local disk

If we run `jupyter --version` through `strace` to log _all_ files accessed;

```sh
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda-stage
(myjupyter*) [alice@{{ site.devel.name }} ~]$ strace -e trace=stat -o jupyter.strace jupyter --version

Selected Jupyter core packages...
IPython          : 8.2.0
ipykernel        : 6.9.1
ipywidgets       : not installed
jupyter_client   : 7.1.2
jupyter_core     : 4.9.2
jupyter_server   : not installed
jupyterlab       : not installed
nbclient         : 0.5.11
nbconvert        : 6.4.4
nbformat         : 5.1.3
notebook         : 6.4.10
qtconsole        : not installed
traitlets        : 5.1.1
```

If we inspect the `jupyter.strace` log file, we find that most file-access calls go to the local disk:

```sh
(myjupyter*) [alice@{{ site.devel.name }} ~]$ head -6 jupyter.strace 
stat("/scratch/alice/conda-stage_b721EnZLRs/bin/../lib/tls/x86_64", 0x7ffc9a9ea980) = -1 ENOENT (No such file or directory)
stat("/scratch/alice/conda-stage_b721EnZLRs/bin/../lib/tls", 0x7ffc9a9ea980) = -1 ENOENT (No such file or directory)
stat("/scratch/alice/conda-stage_b721EnZLRs/bin/../lib/x86_64", 0x7ffc9a9ea980) = -1 ENOENT (No such file or directory)
stat("/scratch/alice/conda-stage_b721EnZLRs/bin/../lib", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/etc/sysconfig/64bit_strstr_via_64bit_strstr_sse2_unaligned", 0x7ffc9a9eaf10) = -1 ENOENT (No such file or directory)
stat("/scratch/alice/conda-stage_b721EnZLRs/bin/python", {st_mode=S_IFREG|0755, st_size=15880080, ...}) = 0
```

Exactly, how many of them?  In this simple example where we only query the version of Jupyter Notebook and its dependencies, there are 4,027 queries to the file system;

```sh
(myjupyter*) [alice@{{ site.devel.name }} ~]$ grep -c stat jupyter.strace 
4027
```

Out of these, 4,021 are done toward the local disk (`/scratch`);

```sh
(myjupyter*) [alice@{{ site.devel.name }} ~]$ grep -c 'stat("/scratch' jupyter.strace 
4021
```

and only _one_ toward the BeeGFS file system (`{{ site.path.global_root }}`):

```sh
(myjupyter*) [alice@{{ site.devel.name }} ~]$ grep -v 'stat("{{ site.path.global_root }}' jupyter.strace 
stat("{{ site.user.home }}/.local/lib/python3.9/site-packages", 0x7ffc9a9ea820) = -1 ENOENT (No such file or directory)
```

In other words, by staging the Conda environment to local disk, we saved ourselves, and the system, 4,021 queries to the BeeGFS file system. And, this only for the very simple `jupyter --version` call.


[conda-stage]: https://github.com/HenrikBengtsson/conda-stage/
[conda-pack]: https://conda.github.io/conda-pack/
