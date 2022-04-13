<div class="alert alert-warning" role="alert" markdown="1">
2022-04-13: This is just a draft! The below instructions are currently _not_ ready for users to try out. Stay tuned!
</div>


# Work with Conda

We will use [conda-pack] to deploy our conda environments to local `/scratch` for maximum performance by minimizing the need for the conda software to use the BeeGFS parallel file system. This approach is a win-win for everyone on the cluster, because the overall load on the shared parallel file system is kept low.


## Set up a conda environment with select software

### Step 1. Create a core environment

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI miniconda3-py39
[alice@{{ site.devel.name }} ~]$ conda create --name=myproject
...
[alice@{{ site.devel.name }} ~]$ conda activate myproject
[alice@{{ site.devel.name }} ~]$ conda install conda-forge::conda-pack
...
```

### Step 2. Install select software tools

In this example, we install Jupyter Notebook to our conda `myproject` environment:

```r
[alice@{{ site.devel.name }} ~]$ conda install conda-forge::notebook
```

### Step 3. Inspect content

```sh
[alice@{{ site.devel.name }} ~]$ conda list
# packages in environment at {{ site.user.home }}/.conda/envs/myproject:
#
# Name                    Version                   Build  Channel
_libgcc_mutex             0.1                        main  
_openmp_mutex             4.5                       1_gnu  
argon2-cffi               21.3.0             pyhd3eb1b0_0  
argon2-cffi-bindings      21.2.0           py39h7f8727e_0  
asttokens                 2.0.5              pyhd3eb1b0_0  
attrs                     21.4.0             pyhd3eb1b0_0  
backcall                  0.2.0              pyhd3eb1b0_0  
beautifulsoup4            4.10.0             pyh06a4308_0  
bleach                    4.1.0              pyhd3eb1b0_0  
ca-certificates           2022.3.29            h06a4308_0  
certifi                   2021.10.8        py39h06a4308_2  
cffi                      1.15.0           py39hd667e15_1  
conda-pack                0.7.0              pyh6c4a22f_0    conda-forge
debugpy                   1.5.1            py39h295c915_0  
decorator                 5.1.1              pyhd3eb1b0_0  
defusedxml                0.7.1              pyhd3eb1b0_0  
entrypoints               0.3              py39h06a4308_0  
executing                 0.8.3              pyhd3eb1b0_0  
importlib-metadata        4.11.3           py39h06a4308_0  
importlib_metadata        4.11.3               hd3eb1b0_0  
ipykernel                 6.9.1            py39h06a4308_0  
ipython                   8.2.0            py39h06a4308_0  
ipython_genutils          0.2.0              pyhd3eb1b0_1  
jedi                      0.18.1           py39h06a4308_1  
jinja2                    3.0.3              pyhd3eb1b0_0  
jsonschema                3.2.0              pyhd3eb1b0_2  
jupyter_client            7.1.2              pyhd3eb1b0_0  
jupyter_core              4.9.2            py39h06a4308_0  
jupyterlab_pygments       0.1.2                      py_0  
ld_impl_linux-64          2.35.1               h7274673_9  
libffi                    3.3                  he6710b0_2  
libgcc-ng                 9.3.0               h5101ec6_17  
libgomp                   9.3.0               h5101ec6_17  
libsodium                 1.0.18               h7b6447c_0  
libstdcxx-ng              9.3.0               hd4cf53a_17  
markupsafe                2.0.1            py39h27cfd23_0  
matplotlib-inline         0.1.2              pyhd3eb1b0_2  
mistune                   0.8.4           py39h27cfd23_1000  
nbclient                  0.5.11             pyhd3eb1b0_0  
nbconvert                 6.4.4            py39h06a4308_0  
nbformat                  5.1.3              pyhd3eb1b0_0  
ncurses                   6.3                  h7f8727e_2  
nest-asyncio              1.5.1              pyhd3eb1b0_0  
notebook                  6.4.10             pyha770c72_0    conda-forge
openssl                   1.1.1n               h7f8727e_0  
packaging                 21.3               pyhd3eb1b0_0  
pandocfilters             1.5.0              pyhd3eb1b0_0  
parso                     0.8.3              pyhd3eb1b0_0  
pexpect                   4.8.0              pyhd3eb1b0_3  
pickleshare               0.7.5           pyhd3eb1b0_1003  
pip                       21.2.4           py39h06a4308_0  
prometheus_client         0.13.1             pyhd3eb1b0_0  
prompt-toolkit            3.0.20             pyhd3eb1b0_0  
ptyprocess                0.7.0              pyhd3eb1b0_2  
pure_eval                 0.2.2              pyhd3eb1b0_0  
pycparser                 2.21               pyhd3eb1b0_0  
pygments                  2.11.2             pyhd3eb1b0_0  
pyparsing                 3.0.4              pyhd3eb1b0_0  
pyrsistent                0.18.0           py39heee7806_0  
python                    3.9.12               h12debd9_0  
python-dateutil           2.8.2              pyhd3eb1b0_0  
pyzmq                     22.3.0           py39h295c915_2  
readline                  8.1.2                h7f8727e_1  
send2trash                1.8.0              pyhd3eb1b0_1  
setuptools                61.2.0           py39h06a4308_0  
six                       1.16.0             pyhd3eb1b0_1  
soupsieve                 2.3.1              pyhd3eb1b0_0  
sqlite                    3.38.2               hc218d9a_0  
stack_data                0.2.0              pyhd3eb1b0_0  
terminado                 0.13.1           py39h06a4308_0  
testpath                  0.5.0              pyhd3eb1b0_0  
tk                        8.6.11               h1ccaba5_0  
tornado                   6.1              py39h27cfd23_0  
traitlets                 5.1.1              pyhd3eb1b0_0  
typing-extensions         4.1.1                hd3eb1b0_0  
typing_extensions         4.1.1              pyh06a4308_0  
tzdata                    2022a                hda174b7_0  
wcwidth                   0.2.5              pyhd3eb1b0_0  
webencodings              0.5.1            py39h06a4308_1  
wheel                     0.37.1             pyhd3eb1b0_0  
xz                        5.2.5                h7b6447c_0  
zeromq                    4.3.4                h2531618_0  
zipp                      3.7.0              pyhd3eb1b0_0  
zlib                      1.2.11               h7f8727e_4 
```

### Step 4. Pack up our conda environment

```sh
[alice@{{ site.devel.name }} ~]$ conda pack
Collecting packages...
Packing environment at '{{ site.user.home }}/.conda/envs/myproject' to 'myproject.tar.gz'
[########################################] | 100% Completed | 15.3s
      Regenerating: 1 file(s) changed at 2022-04-12 23:48:33
                    myproject.tar.gz

[alice@{{ site.devel.name }} ~]$ ls -l myproject.tar.gz
-rw------- 1 alice boblab 83729565 Apr 12 23:48 myproject.tar.gz
```

### Step 5. Exit

```sh
[alice@{{ site.devel.name }} ~]$ conda deactivate
```



## Deploy packed-up conda environment to local disk

### Step 1. Unpack to local disk

```sh
[alice@{{ site.devel.name }} ~]$ target=$(mktemp -d)
[alice@{{ site.devel.name }} ~]$ tar -xf myproject.tar.gz -C "$target"
[alice@{{ site.devel.name }} ~]$ source "$target/bin/activate"
[alice@{{ site.devel.name }} ~]$ chmod -R u+w "$target"
[alice@{{ site.devel.name }} ~]$ conda-unpack
```

TODO: Can we safely do `chmod -R u-w "$target"` at this point? That would prevent any attempts to install additional software to this temporary, transient conda environment.

TODO: Write a small tool that does all of the above in one step, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ conda-deploy myproject.tar.gz
```


### Step 2. Inspect content

```sh
[alice@{{ site.devel.name }} ~]$ conda list
# packages in environment at /scratch/alice/tmp.tPFYG91qKs:
#
# Name                    Version                   Build  Channel
_libgcc_mutex             0.1                        main  
_openmp_mutex             4.5                       1_gnu  
argon2-cffi               21.3.0             pyhd3eb1b0_0  
argon2-cffi-bindings      21.2.0           py39h7f8727e_0  
asttokens                 2.0.5              pyhd3eb1b0_0  
attrs                     21.4.0             pyhd3eb1b0_0  
backcall                  0.2.0              pyhd3eb1b0_0  
beautifulsoup4            4.10.0             pyh06a4308_0  
bleach                    4.1.0              pyhd3eb1b0_0  
ca-certificates           2022.3.29            h06a4308_0  
certifi                   2021.10.8        py39h06a4308_2  
cffi                      1.15.0           py39hd667e15_1  
conda-pack                0.7.0              pyh6c4a22f_0    conda-forge
debugpy                   1.5.1            py39h295c915_0  
decorator                 5.1.1              pyhd3eb1b0_0  
defusedxml                0.7.1              pyhd3eb1b0_0  
entrypoints               0.3              py39h06a4308_0  
executing                 0.8.3              pyhd3eb1b0_0  
importlib-metadata        4.11.3           py39h06a4308_0  
importlib_metadata        4.11.3               hd3eb1b0_0  
ipykernel                 6.9.1            py39h06a4308_0  
ipython                   8.2.0            py39h06a4308_0  
ipython_genutils          0.2.0              pyhd3eb1b0_1  
jedi                      0.18.1           py39h06a4308_1  
jinja2                    3.0.3              pyhd3eb1b0_0  
jsonschema                3.2.0              pyhd3eb1b0_2  
jupyter_client            7.1.2              pyhd3eb1b0_0  
jupyter_core              4.9.2            py39h06a4308_0  
jupyterlab_pygments       0.1.2                      py_0  
ld_impl_linux-64          2.35.1               h7274673_9  
libffi                    3.3                  he6710b0_2  
libgcc-ng                 9.3.0               h5101ec6_17  
libgomp                   9.3.0               h5101ec6_17  
libsodium                 1.0.18               h7b6447c_0  
libstdcxx-ng              9.3.0               hd4cf53a_17  
markupsafe                2.0.1            py39h27cfd23_0  
matplotlib-inline         0.1.2              pyhd3eb1b0_2  
mistune                   0.8.4           py39h27cfd23_1000  
nbclient                  0.5.11             pyhd3eb1b0_0  
nbconvert                 6.4.4            py39h06a4308_0  
nbformat                  5.1.3              pyhd3eb1b0_0  
ncurses                   6.3                  h7f8727e_2  
nest-asyncio              1.5.1              pyhd3eb1b0_0  
notebook                  6.4.10             pyha770c72_0    conda-forge
openssl                   1.1.1n               h7f8727e_0  
packaging                 21.3               pyhd3eb1b0_0  
pandocfilters             1.5.0              pyhd3eb1b0_0  
parso                     0.8.3              pyhd3eb1b0_0  
pexpect                   4.8.0              pyhd3eb1b0_3  
pickleshare               0.7.5           pyhd3eb1b0_1003  
pip                       21.2.4           py39h06a4308_0  
prometheus_client         0.13.1             pyhd3eb1b0_0  
prompt-toolkit            3.0.20             pyhd3eb1b0_0  
ptyprocess                0.7.0              pyhd3eb1b0_2  
pure_eval                 0.2.2              pyhd3eb1b0_0  
pycparser                 2.21               pyhd3eb1b0_0  
pygments                  2.11.2             pyhd3eb1b0_0  
pyparsing                 3.0.4              pyhd3eb1b0_0  
pyrsistent                0.18.0           py39heee7806_0  
python                    3.9.12               h12debd9_0  
python-dateutil           2.8.2              pyhd3eb1b0_0  
pyzmq                     22.3.0           py39h295c915_2  
readline                  8.1.2                h7f8727e_1  
send2trash                1.8.0              pyhd3eb1b0_1  
setuptools                61.2.0           py39h06a4308_0  
six                       1.16.0             pyhd3eb1b0_1  
soupsieve                 2.3.1              pyhd3eb1b0_0  
sqlite                    3.38.2               hc218d9a_0  
stack_data                0.2.0              pyhd3eb1b0_0  
terminado                 0.13.1           py39h06a4308_0  
testpath                  0.5.0              pyhd3eb1b0_0  
tk                        8.6.11               h1ccaba5_0  
tornado                   6.1              py39h27cfd23_0  
traitlets                 5.1.1              pyhd3eb1b0_0  
typing-extensions         4.1.1                hd3eb1b0_0  
typing_extensions         4.1.1              pyh06a4308_0  
tzdata                    2022a                hda174b7_0  
wcwidth                   0.2.5              pyhd3eb1b0_0  
webencodings              0.5.1            py39h06a4308_1  
wheel                     0.37.1             pyhd3eb1b0_0  
xz                        5.2.5                h7b6447c_0  
zeromq                    4.3.4                h2531618_0  
zipp                      3.7.0              pyhd3eb1b0_0  
zlib                      1.2.11               h7f8727e_4
```


### Step 3. Proof that all of the stack lives on local disk

If we run `jupyter --version` through `strace` to log _all_ files accessed;

```sh
[alice@{{ site.devel.name }} ~]$ strace -e trace=stat --output=jupyter.strace jupyter --version

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

we see that all but two of the 4,043 file accesses were done toward the local disk (=`$target`) instead of the parallel file system (=`{{ site.user.home }}/.conda/envs/myproject`):

```sh
$ grep -c -F "stat(\"$target" jupyter.strace 
4041
$ grep -c -F "stat(" jupyter.strace 
4043
```

Thus, almost none of those hits our parallel filesystem.


### Step 4. Run software

```sh
[alice@{{ site.devel.name }} ~]$ jupyter notebook --port 8890
```

### Step 5. Exit

```sh
[alice@{{ site.devel.name }} ~]$ conda deactivate
```


[conda-pack]: https://github.com/conda/conda-pack
