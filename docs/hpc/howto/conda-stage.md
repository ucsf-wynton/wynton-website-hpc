<div class="alert alert-warning" role="alert" markdown="1">
Currently, the **conda-stage** tool has only been tested with the Bash shell, and it is unlikely it will work with other shells. Most users on {{ site.cluster.nickname }} use Bash, but a few have explicitly asked to use another. Type `echo $SHELL` if you're not sure what shell you use.
</div>



## Stage Conda environment on local disk (highly recommended)

<div class="alert alert-info" role="alert" markdown="1">
Please, **stage your Conda environment to local disk!** [Your software and job scripts will run _much_ faster](/hpc/howto/conda-stage.html#benchmark-staged-conda-environment), and it will _significantly decrease the load on our global filesystem_ (BeeGFS). **It is a win-win for everyone!**
</div>

Working with a Conda environment that lives on _local disk_ greatly improves the performance.  This is because the local disk (`/scratch`) on the current machine is much faster than any network-based file system, including BeeGFS (`{{ site.path.global_root }}`) used on {{ site.cluster.nickname }}.  This is particularly beneficial when running many instances of a software tool, e.g. in job scripts.

Staging a Conda environment to local disk is straightforward using the **[conda-stage]** tool.  All we have to do is configure the environment once, and from then on we can work with `conda activate ...` and `conda deactivate` as normal.

Below is a walk-through that illustrates the process. It assumes we have already create a Conda environment named `myjupyter` with some software installed.


### Configure Conda environment for automatic staging (once)

To configure Conda environment `myjupyter` for automatic staging, activate it first and then call `conda-stage --auto-stage=enable`;

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI conda-stage
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda-stage --auto-stage=enable
INFO: Configuring automatic staging and unstaging of original Conda environment  ...
INFO: Enabled auto-staging
INFO: Enabled auto-unstaging
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda deactivate
[alice@{{ site.devel.name }} ~]$ 
```

This configuration step is quick and needs to be done only once per environment.

**That's basically it!** From now on, you can do what you have always done with Conda environments, as illustrated next.


### Activating and deactivating Conda environment

Each time you activate the environment, it is automatically staged to local disk;

```sh
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
INFO: Staging current Conda environment ({{ site.user.home }}/.conda/envs/myjupyter) to local disk ...
INFO: [ONCE] Packaging Conda environment, because it hasn't been done before ...
Collecting packages...
Packing environment at '{{ site.user.home }}/.conda/envs/myjupyter' to '{{ site.user.home }}/.conda/envs/.tmp.myjupyter.tar.gz'
[########################################] | 100% Completed |  4min  5.6s
INFO: Total 'conda-pack' time: 274 seconds
INFO: Extracting {{ site.user.home }}/.conda/envs/myjupyter.tar.gz (86965746 byte
s; 2022-04-15 16:53:50.000000000 -0700) to /scratch/alice/conda-stage-grWA/myjupyter
INFO: Total extract time: 4 seconds
INFO: Disable any /scratch/alice/conda-stage-grWA/myjupyter/etc/conda/activate.d/*.cond
a-stage-auto.sh scripts
INFO: Activating staged environment
INFO: Unpacking (relocating)
INFO: Total 'conda-unpack' time: 0 seconds
INFO: Making staged environment read-only (use --writable to disable)
INFO: Activating staged Conda environment: /scratch/alice/conda-stage-grWA/myjupyter
(/scratch/alice/conda-stage-grWA/myjupyter) [alice@{{ site.devel.name }} ~]$ 
```

**Please, be patient the first time you do this.**  This is, because _all_ of the software in the environment has to be packaged up into a "tarball" that is saved to cache.  This is a step that has to be done only once per environment.  Also, if you don't have dependency **[conda-pack]** already installed, it is also automatically installed at this stage.  But don't worry.  From now on, when we activate the environment, both of these steps can be skipped, and only the much quicker "extracting" and "unpacking" steps take place.

To convince ourselves that, at this point, everything runs off the local disk, try this:

```sh
(/scratch/alice/conda-stage-grWA/myjupyter) [alice@{{ site.devel.name }} ~]$ command -v python
/scratch/alice/conda-stage-grWA/myjupyter/bin/python
(/scratch/alice/conda-stage-grWA/myjupyter) [alice@{{ site.devel.name }} ~]$ command -v jupyter
/scratch/alice/conda-stage-grWA/myjupyter/bin/jupyter
```

**Success!** This means that these **software tools run much faster**, because they no longer rely on the much slower BeeGFS filesystem. Another advantage is that your Conda software stack **adds much less load to BeeGFS**, which otherwise can be quite significant when using Conda. This is a **win-win for everyone**. See '[Benchmark staged Conda environment]' below for some benchmark results.


When deactivated, the staged environment is automatically unstaged and all of the temporary, staged files are automatically removed. No surprises here either;

```sh
(/scratch/alice/conda-stage-grWA/myjupyter) [alice@{{ site.devel.name }} ~]$ conda deactivate
INFO: Unstaging and reverting to original Conda environment  ...
INFO: Preparing removal of staged files: /scratch/alice/conda-stage-grWA/myjupyter
INFO: Deactivating and removing staged Conda environment: /scratch/alice/conda-stage-gr
WA/myjupyter
INFO: Total unstage time: 0 seconds
[alice@{{ site.devel.name }} ~]$ command -v jupyter
[alice@{{ site.devel.name }} ~]$ command -v python
/usr/bin/python
```



### Using Conda staging in job scripts

To work with staged conda environments in your job scripts, make sure to first configure it to do automatic staging interactively from a development node, e.g.

```sh
#! /usr/bin/env bash
#$ -S /bin/bash   # Run in bash
#$ -cwd           # Current working directory
#$ -j y           # Join STDERR and STDOUT
#$ -R yes         # SGE host reservation, highly recommended

conda activate myenv
trap 'conda deactivate' EXIT

…
```

In this example, we have also added a shell "trap" that deactivates the environment when the script exits. This makes sure the staged environment is unstaged, including all of its temporary files are removed.


<div class="alert alert-warning" role="alert" markdown="1">
If you get an error on `/usr/share/lmod/lmod/init/sh: line 14: 'conda-stage': not a valid identifier`, make sure to declare the shell (`#$ -S /bin/bash`) to use in your job script.
</div>


### Update an automatically-staged Conda environment

If we would update or install new Conda packages to a staged environment, they will all be lost when unstaged.  Because of this staged environments are by default read-only (**conda-stage** option `--writable` overrides this).  Instead, for installation to be persistent, we need to install to the original Conda environment before it is staged.  To do this, we need to temporarily disable the automatic staging, otherwise it will be staged before we get to install.  This can be done by setting environment variable `CONDA_STAGE` to `false` before activation.  Here is an example how to update all packages in the `myjupyter` environment:

```sh
[alice@{{ site.devel.name }} ~]$ export CONDA_STAGE=false
[alice@{{ site.devel.name }} ~]$ conda enable myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda update --all
…
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda deactivate
[alice@{{ site.devel.name }} ~]$ unset CONDA_STAGE
```


### Disable automatic staging

Just like we have to disable automatic staging when we want to update or install new software to a Conda environment, we also have to disable it when we want to remove automatic staging from an environment;

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI conda-stage
[alice@{{ site.devel.name }} ~]$ CONDA_STAGE=false conda enable myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda-stage --auto-stage=disable
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda deactivate
[alice@{{ site.devel.name }} ~]$ 
```


## Appendix


### Benchmark staged Conda environment

<!-- These benchmarks where collected on 2022-04-13 at 18:50 -->

To illustrate the benefit of staging a Conda environment to local disk, we will benchmark how long it takes for `jupyter --version` to complete without staging and with staging.

Without staging to local disk, the call takes a whopping 32 seconds to return:

```sh
[alice@{{ site.devel.name }} ~]$ CONDA_STAGE=false conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ command -v jupyter
{{ site.user.home }}/.conda/envs/myjupyter/bin/jupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ command time --portability jupyter --version > /dev/null
real 32.06
user 1.42
sys 0.76
```

This test was conducted during a time when the cluster did indeed experience heavy load on the BeeGFS file system at the time.  The fact that `real` is much greater than `user + sys` suggests our process spends a lot of time just waiting.  **When staging to local disk, we can avoid being affected by this load.**  When running from the local disk, the same call takes less than a second;

```sh
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(/scratch/alice/conda-stage_wFWY/myjupyter) [alice@{{ site.devel.name }} ~]$ command -v jupyter
/scratch/alice/conda-stage_wFWY/myjupyter/bin/jupyter
(/scratch/alice/conda-stage_wFWY/myjupyter) [alice@{{ site.devel.name }} ~]$ command time --portability jupyter --version > /dev/null
real 0.75
user 0.67
sys 0.07
```


### Proof that a staged Conda environment lives on local disk

If we run `jupyter --version` through `strace` to log _all_ files accessed,

```sh
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(/scratch/alice/conda-stage_wFWY/myjupyter) [alice@{{ site.devel.name }} ~]$ strace -e trace=stat -o jupyter.strace jupyter --version

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

and inspect the `jupyter.strace` log file, we find that most file-access calls go to the local disk:

```sh
$ head -6 jupyter.strace 
stat("/scratch/alice/conda-stage_wFWY/myjupyter/bin/../lib/tls/x86_64", 0x7ffc9a9ea980) = -1 ENOENT (No such file or directory)
stat("/scratch/alice/conda-stage_wFWY/myjupyter/bin/../lib/tls", 0x7ffc9a9ea980) = -1 ENOENT (No such file or directory)
stat("/scratch/alice/conda-stage_wFWY/myjupyter/bin/../lib/x86_64", 0x7ffc9a9ea980) = -1 ENOENT (No such file or directory)
stat("/scratch/alice/conda-stage_wFWY/myjupyter/bin/../lib", {st_mode=S_IFDIR|0755, st_size=8192, ...}) = 0
stat("/etc/sysconfig/64bit_strstr_via_64bit_strstr_sse2_unaligned", 0x7ffc9a9eaf10) = -1 ENOENT (No such file or directory)
stat("/scratch/alice/conda-stage_wFWY/myjupyter/bin/python", {st_mode=S_IFREG|0755, st_size=15880080, ...}) = 0
```

Exactly, how many of them?  In this simple example where we only query the version of Jupyter Notebook and its dependencies, there are 4,027 queries to the file system;

```sh
$ grep -c stat jupyter.strace 
4027
```

Out of these, 4,021 are done toward the local disk (`/scratch`);

```sh
$ grep -c 'stat("/scratch' jupyter.strace 
4021
```

and only _one_ toward the BeeGFS file system (`{{ site.path.global_root }}`):

```sh
$ grep -v 'stat("{{ site.path.global_root }}' jupyter.strace 
stat("{{ site.user.home }}/.local/lib/python3.9/site-packages", 0x7ffc9a9ea820) = -1 ENOENT (No such file or directory)
```

In other words, by staging the Conda environment to local disk, we saved ourselves, and the system, 4,021 queries to the BeeGFS file system. And, this only for the very simple `jupyter --version` call.


[conda-stage]: https://github.com/HenrikBengtsson/conda-stage/
[conda-pack]: https://conda.github.io/conda-pack/
[Benchmark staged Conda environment]: /hpc/howto/conda-stage.html#benchmark-staged-conda-environment
