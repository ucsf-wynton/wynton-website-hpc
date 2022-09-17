<div class="alert alert-danger" role="alert" style="margin-top: 3ex" markdown="1">
⚠️ **This is page is under development.** Until finalized, you have use `module load CBI miniconda3-py39/.4.12.0` (sic!) to load Miniconda, because it is currently a _hidden_ module. Please give it a spin. Feedback is appreciated. /2022-09-17
</div>

# Work with Conda

[Conda] is a package-manager and an environment management system.  It's popular, because it simplifies installation of several scientific software tools.  There are two main distributions of Conda:

1. Anaconda - comes with more than 1,500 scientific packages (~3 GiB of disk space) [_not_ preinstalled on  {{ site.cluster.nickname }}]
2. [Miniconda] - a small subset of the much larger Anaconda distribution (~0.5 GiB of disk space) [**recommended**; preinstalled on {{ site.cluster.nickname }}]

Both comes with Python and `conda` commands.  We _recommend_ to work with the smaller Miniconda distribution, especially since it is preinstalled on {{ site.cluster.nickname }}].  Using Miniconda, you can install additional scientific packages as needed using the `conda install ...` command.


## Loading Miniconda

On {{ site.cluster.name }}, up-to-date versions of the Miniconda distribution are available via the CBI software stack.  There is no need for you to install this yourself.  To load Miniconda v3 with Python 3.9, call:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI miniconda3-py39/.4.12.0
```

This gives access to:

```sh
[alice@{{ site.devel.name }} ~]$ conda --version

conda 4.12.0

[alice@{{ site.devel.name }} ~]$ python --version
Python 3.9.12
```

To see what software packages comes with this Miniconda distribution, call:

```sh
[alice@{{ site.devel.name }} ~]$ conda list
# packages in environment at /wynton/home/cbi/shared/software/CBI/miniconda3-py39-4.12.0:
#
# Name                    Version                   Build  Channel
_libgcc_mutex             0.1                        main  
_openmp_mutex             4.5                       1_gnu  
brotlipy                  0.7.0           py39h27cfd23_1003  
ca-certificates           2022.3.29            h06a4308_1  
certifi                   2021.10.8        py39h06a4308_2  
cffi                      1.15.0           py39hd667e15_1  
charset-normalizer        2.0.4              pyhd3eb1b0_0  
colorama                  0.4.4              pyhd3eb1b0_0  
conda                     4.12.0           py39h06a4308_0  
conda-content-trust       0.1.1              pyhd3eb1b0_0  
conda-package-handling    1.8.1            py39h7f8727e_0  
cryptography              36.0.0           py39h9ce1e76_0  
idna                      3.3                pyhd3eb1b0_0  
ld_impl_linux-64          2.35.1               h7274673_9  
libffi                    3.3                  he6710b0_2  
libgcc-ng                 9.3.0               h5101ec6_17  
libgomp                   9.3.0               h5101ec6_17  
libstdcxx-ng              9.3.0               hd4cf53a_17  
ncurses                   6.3                  h7f8727e_2  
openssl                   1.1.1n               h7f8727e_0  
pip                       21.2.4           py39h06a4308_0  
pycosat                   0.6.3            py39h27cfd23_0  
pycparser                 2.21               pyhd3eb1b0_0  
pyopenssl                 22.0.0             pyhd3eb1b0_0  
pysocks                   1.7.1            py39h06a4308_0  
python                    3.9.12               h12debd9_0  
readline                  8.1.2                h7f8727e_1  
requests                  2.27.1             pyhd3eb1b0_0  
ruamel_yaml               0.15.100         py39h27cfd23_0  
setuptools                61.2.0           py39h06a4308_0  
six                       1.16.0             pyhd3eb1b0_1  
sqlite                    3.38.2               hc218d9a_0  
tk                        8.6.11               h1ccaba5_0  
tqdm                      4.63.0             pyhd3eb1b0_0  
tzdata                    2022a                hda174b7_0  
urllib3                   1.26.8             pyhd3eb1b0_0  
wheel                     0.37.1             pyhd3eb1b0_0  
xz                        5.2.5                h7b6447c_0  
yaml                      0.2.5                h7b6447c_0  
zlib                      1.2.12               h7f8727e_1
```


## Create a Conda environment (required)

Working with Conda _environments_ is a mechanism for installing specific software tools and versions in a controlled manner.  It is required to use Conda environments, when using the **miniconda3-py39** module.

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
    _openmp_mutex-5.1          |            1_gnu          21 KB
    argon2-cffi-21.3.0         |     pyhd3eb1b0_0          15 KB
    ...
    zeromq-4.3.4               |       h2531618_0         331 KB
    zlib-1.2.12                |       h5eee18b_3         103 KB
    ------------------------------------------------------------
                                           Total:        62.4 MB

The following NEW packages will be INSTALLED:

  _libgcc_mutex      pkgs/main/linux-64::_libgcc_mutex-0.1-main
  _openmp_mutex      pkgs/main/linux-64::_openmp_mutex-5.1-1_gnu
  ...
  zeromq             pkgs/main/linux-64::zeromq-4.3.4-h2531618_0
  zlib               pkgs/main/linux-64::zlib-1.2.12-h5eee18b_3


Proceed ([y]/n)? y


Downloading and Extracting Packages
...
jupyterlab_pygments- | 8 KB      | #################################### | 100% 
jupyter_client-7.3.5 | 194 KB    | #################################### | 100% 
nbformat-5.3.0       | 129 KB    | #################################Preparing transaction: done
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


## Activating a Conda environment (required)

Next time you log in to a development node, you can activate the `myjupyter`, or any other Conda environment you've created by:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI miniconda3-py39/.4.12.0
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ jupyter notebook --version
6.4.12

(myjupyter) [alice@{{ site.devel.name }} ~]$
```

Note how the command-line prompt is prefixed with `(myjupyter)`; it highlights that Conda environment `myjupyter` is activated.  To deactivate, call:

```sh
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda deactivate
[alice@{{ site.devel.name }} ~]$ jupyter notebook --version
jupyter: command not found

[alice@{{ site.devel.name }} ~]$ 
```




## Configure auto-staging of a Conda environment (recommended)

We highly recommend configuring Conda environment to be automatically staged only local disk whenever activated.  This results in the software to run significantly faster.  Auto-staging is straightforward to configure using the [conda-stage] tool, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI miniconda3-py39/.4.12.0
[alice@{{ site.devel.name }} ~]$ module load CBI conda-stage
[alice@{{ site.devel.name }} ~]$ conda activate myjupyter
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda-stage --auto-stage=enable
INFO: Configuring automatic staging and unstaging of original Conda environment  ...
INFO: Enabled auto-staging
INFO: Enabled auto-unstaging
(myjupyter) [alice@{{ site.devel.name }} ~]$ conda deactivate
[alice@{{ site.devel.name }} ~]$ 
```

Next time you activate the Conda environment, it'll be automatically packaged and then staged onto the local disk, and therefore run much faster there:

```sh
INFO: Staging current Conda environment ({{ site.user.home }}/.conda/envs/myjupyter) to local disk ...
INFO: [ONCE] Installing conda-pack, because it was missing ...
Collecting package metadata (current_repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: {{ site.user.home }}/.conda/envs/myjupyter

  added / updated specs:
    - conda-pack


The following NEW packages will be INSTALLED:

  conda-pack         conda-forge/noarch::conda-pack-0.7.0-pyh6c4a22f_0

...
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
INFO: Total installation time: 30 seconds
INFO: [ONCE] Packaging Conda environment, because it hasn't been done before ...
Collecting packages...
Packing environment at '{{ site.user.home }}/.conda/envs/myjupyter' to '{{ site.user.home }}/.conda/envs/.tmp.myjupyter.tar.gz'
[########################################] | 100% Completed | 42.6s
INFO: Total 'conda-pack' time: 51 seconds
INFO: Extracting {{ site.user.home }}/.conda/envs/myjupyter.tar.gz (91500087 bytes; 2022-09-17 09:00:19.000000000 -0700) to /scratch/alice/conda-stage-gleN/myjupyter
INFO: Total extract time: 4 seconds
INFO: Disable any /scratch/alice/conda-stage-gleN/myjupyter/etc/conda/activate.d/*.conda-stage-auto.sh scripts
INFO: Activating staged environment
INFO: Unpacking (relocating)
INFO: Total 'conda-unpack' time: 0 seconds
INFO: Making staged environment read-only (use --writable to disable)
INFO: Activating staged Conda environment: /scratch/alice/conda-stage-gleN/myjupyter

(/scratch/hb-test/conda-stage-2Umb/myjupyter) [alice@{{ site.devel.name }} ~]$ jupyter notebook --version               
6.4.12
(/scratch/hb-test/conda-stage-2Umb/myjupyter) [alice@{{ site.devel.name }} ~]$ 
```

Note that the slow packing step will one have to be done this first time. A following calls to `conda activate myjupyter` will be quick.  For more details, see the instructions and benchmarks on the [conda-stage] page.


[Conda]: https://conda.io
[Miniconda]: https://docs.conda.io/en/latest/miniconda.html
[conda-stage]: {{ '/howto/conda-stage.html' | relative_url }}
