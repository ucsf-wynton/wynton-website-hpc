<div class="alert alert-warning" role="alert" markdown="1">
2023-04-02: The Singularity software was migrated to Apptainer in November 2021. We will suggest using the `apptainer` command, but the alias `singularity` will continue to work for the time being.
</div>

# Apptainer - Linux Containers

The {{ site.cluster.name }} cluster supports [Linux containers] via the [Apptainer] software (formerly known as [Singularity]).  A Linux container is an efficient and powerful virtualization method for running isolated Linux systems ("containers") on any Linux system including the one used by our cluster.

Apptainer, and Linux containers in general, provides solutions to common problems and hurdles that HPC users often face, e.g.

* using software that is not installed on the system
* using software that is hard for user to install
* using software that only runs on a specific Linux distribution or version
* sharing scientific pipeline in a reproducible way
* using full scientific pipelines shared by others

Because you can create and customize your own containers, and because Apptainer also supports [Docker] containers, you have immediate access to a very large number of Apptainer and Docker containers available via repositories such as:

* [Docker Hub](https://hub.docker.com/explore/) - the official repository for Docker-based containers (100,000's of containers)
* [Biocontainers](https://biocontainers.pro/) - "community-driven framework which provides system-agnostic executable environments for bioinformatics software" (Docker-based containers)
* [Singularity Library](https://cloud.sylabs.io/library) by Sylabs - the official repository for Singularity-specific containers (compatible with Apptainer)
<!-- * [Singularity Hub](https://singularity-hub.org/) by Vanessa Sochat at Stanford - requires GitHub login (as of July 2019) -->



## Instructions

All tasks for using Linux containers, such as downloading, building, and running containers, is done via the `apptainer` client and supported on {{ site.cluster.name }}.  The most common command calls are:

* Use an existing container:
  - `apptainer run <image>` - run predefined script within container
  - `apptainer exec <image>` - execute any command within container
  - `apptainer shell <image>` - run bash shell within container

* Build a container:
  - `apptainer build <url>`  - import an existing Apptainer or Docker container available online
  - `apptainer build --remote <image> <def file>` - build a Apptainer from local specifications in definition file

For full details, see `apptainer --help`, `man apptainer`, and the [Apptainer] website.

* Install Apptainer or Docker on your own machine:
  - Create a Apptainer image on your own workstation and transfer the image to {{ site.cluster.name }}
  - Create a Docker image on your own workstation and transfer the image to {{ site.cluster.name }}

## Example

### Building a Apptainer container from an existing Docker Hub image

As an illustration on how to use Linux containers with Apptainer, we will use the Docker container [rocker/r-base] available on Docker Hub.  This particular container provides the latest release of the [R] software in an Ubuntu OS environment.  Containers available from Docker Hub, Biocontainers, and elsewhere, can be downloaded and used analogously.

To use this rocker/r-base container, we first pull it down to a Apptainer image file `~/lxc/rocker_r-base.sif` as:

<!-- code-block label="build" -->
```sh
[alice@{{ site.devel.name }} ~]$ mkdir lxc
mkdir: cannot create directory ‘lxc’: File exists
[alice@{{ site.devel.name }} ~]$ cd lxc/
[alice@{{ site.devel.name }} lxc]$ apptainer build rocker_r-base.sif docker://rocker/r-base
INFO:    Starting build...
Getting image source signatures
Copying blob sha256:bd556fe2886dac2a22b5e02cf43558766730e3423978522b24f2457ff2d489d0
Copying blob sha256:4ade4cbe0c7e776cd60102751e29ec82271b08f5a086da6ccfef0574f6a040db
Copying blob sha256:5fe7cbdf1a7c13b846f5fa6e716cf72a115b877f48d2693b9a1fbe7788d36b1d
Copying blob sha256:ebbe46658ae1eddd748e3222cbc9dd7109f9fd7f279a4b2f9d6a32d0a58b4c16
Copying blob sha256:4be550b6d67c5ef8b2ae801804eabe3acefc327f4abfa62a3e364f311a1e25b4
Copying blob sha256:5790fe4db759efadbc15af34fc7b9ae6f5ebadf8ce05baec4309b73b79cec810
Copying config sha256:6de003fbdce5b64853257f2e3d540251123c25006977d544680b6c38c21942b9
Writing manifest to image destination
Storing signatures
2023/11/15 12:34:02  info unpack layer: sha256:ebbe46658ae1eddd748e3222cbc9dd7109f9fd7f279a4b2f9d6a32d0a58b4c16
2023/11/15 12:34:04  info unpack layer: sha256:4ade4cbe0c7e776cd60102751e29ec82271b08f5a086da6ccfef0574f6a040db
2023/11/15 12:34:04  info unpack layer: sha256:4be550b6d67c5ef8b2ae801804eabe3acefc327f4abfa62a3e364f311a1e25b4
2023/11/15 12:34:05  info unpack layer: sha256:5fe7cbdf1a7c13b846f5fa6e716cf72a115b877f48d2693b9a1fbe7788d36b1d
2023/11/15 12:34:05  info unpack layer: sha256:5790fe4db759efadbc15af34fc7b9ae6f5ebadf8ce05baec4309b73b79cec810
2023/11/15 12:34:05  info unpack layer: sha256:bd556fe2886dac2a22b5e02cf43558766730e3423978522b24f2457ff2d489d0
INFO:    Creating SIF file...
INFO:    Build complete: rocker_r-base.sif
[alice@{{ site.devel.name }} lxc]$ ls -l rocker_r-base.sif
-rwxr-xr-x. 1 alice boblab 325574656 Nov 15 12:34 rocker_r-base.sif
```

The above may take a minute or two to complete.


### Running a container

After this, we can run R within this container using:

<!-- code-block label="run" -->
```sh
[alice@{{ site.devel.name }} lxc]$ apptainer run rocker_r-base.sif

R version 4.3.1 (2023-06-16) -- "Beagle Scouts"
Copyright (C) 2023 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> sum(1:10)
[1] 55
> q()
Save workspace image? [y/n/c]: n
[alice@{{ site.devel.name }} lxc]$
```

Exactly what is "run" is defined by the so called [`%runscript`] of the Apptainer container, or the [`CMD`] entry if imported from a Docker container.  An alternative way to launch R within this container is by explicitly executing R, e.g.

<!-- code-block label="exec" -->
```sh
[alice@{{ site.devel.name }} lxc]$ apptainer exec rocker_r-base.sif R --quiet
> sum(1:10)
[1] 55
> q("no")
[alice@{{ site.devel.name }} lxc]$ 
```

Note that, the Apptainer image is marked as an _executable_, which means you can run it as any other executable, e.g.

<!-- code-block label="command" -->
```sh
[alice@{{ site.devel.name }} lxc]$ ./rocker_r-base.sif

R version 4.3.1 (2023-06-16) -- "Beagle Scouts"
Copyright (C) 2023 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> sum(1:10)
[1] 55
> q("no")
[alice@{{ site.devel.name }} lxc]$
```

To launch a shell within this container, and to also convince yourselves that the container runs Ubuntu (and not Rocky 8 as on the {{ site.cluster.name }} host system), do:

<!-- code-block label="shell" -->
```sh
[alice@{{ site.devel.name }} lxc]$ apptainer shell rocker_r-base.sif
Apptainer> head -3 /etc/os-release
PRETTY_NAME="Debian GNU/Linux bookworm/sid"
NAME="Debian GNU/Linux"
VERSION_CODENAME=bookworm
Apptainer> Rscript --version
Rscript (R) version 4.3.1 (2023-06-16)
Apptainer> exit

[alice@{{ site.devel.name }} lxc]$ head -3 /etc/os-release
NAME="Rocky Linux"
VERSION="8.8 (Green Obsidian)"
ID="rocky"

```


### Access other cluster folders than your home folder

When running a container, only a few of the folders available "outside" are available "inside" the container.  By default, you have access to the current working directory (= `$PWD`) and your home folder (= `$HOME`).   In contrast, without further specifications, you will not have access to standard folders such as local `/scratch` and global `{{ site.path.global_scratch }}`.  Similarly, lab folders such as `{{ site.user.labfolder }}` are not available from inside the container.

<!-- code-block label="shell-nobind" -->
```sh
[alice@{{ site.devel.name }} lxc]$ apptainer shell rocker_r-base.sif
Apptainer> ls /scratch
ls: cannot access '/scratch': No such file or directory
Apptainer> ls {{ site.path.global_scratch }}
ls: cannot access '{{ site.path.global_scratch }}': No such file or directory
Apptainer> ls {{ site.user.labfolder }}
ls: cannot access '{{ site.user.labfolder }}': No such file or directory
Apptainer> echo "$TMPDIR"
/scratch/alice
Apptainer> ls -dF "$TMPDIR"
ls: cannot access '/scratch/alice': No such file or directory
Apptainer> mktemp
mktemp: failed to create file via template ‘/scratch/alice/tmp.XXXXXXXXXX’: No such file or directory
```

To make also these folders available within the container, we can use `apptainer` option `--bind`.  In its simplest form, we can just list the folders we want to make available, e.g.

<!-- code-block label="shell-bind" -->
```sh
[alice@{{ site.devel.name }} lxc]$ apptainer shell --bind /scratch,{{ site.path.global_scratch }},{{ site.user.labfolder }} rocker_r-base.sif
Apptainer> echo "$TMPDIR"
/scratch/alice
Apptainer> ls -dF "$TMPDIR"
/scratch/alice/
Apptainer> mktemp
/scratch/alice/tmp.UfD7e9LlxV
Apptainer> ls -dF {{ site.path.global_scratch }}/alice
/wynton/scratch/alice/
Apptainer> ls {{ site.user.labfolder }}
data1  data2
```

One can also use `--bind` to bind a folder inside the container to a folder at another location with a different name outside the container.  For example, if a tool writes to `/var/log`, you can access those log files outside of the container afterward by using:

```sh
[alice@{{ site.devel.name }} lxc]$ mkdir -p extra/logs
[alice@{{ site.devel.name }} lxc]$ echo "Hello world" > extra/logs/hello.txt
[alice@{{ site.devel.name }} lxc]$ apptainer shell --bind extra/logs:/var/log rocker_r-base.sif
Apptainer> date > /var/log/timestamp
Apptainer> ls /var/log
hello.txt  timestamp
Apptainer> exit
exit
[alice@{{ site.devel.name }} lxc]$ ls extra/logs
hello.txt  timestamp
```

See `apptainer help instance start` for more details and other ways to mount and rename folders within the container.


### Running a container as a job

When it comes to the scheduler, there is nothing special about Apptainer per se - the Apptainer software can be used as any other software on the cluster.  As a proof of concept, here is how to calculate the sum of one to ten using R within the above Linux container at the command line:

<!-- code-block label="rscript-sum" -->
```sh
[alice@{{ site.devel.name }} lxc]$ apptainer exec "rocker_r-base.sif" Rscript -e "sum(1:10)"
[1] 55
[alice@{{ site.devel.name }} lxc]$ 
```

To run this as a batch job, we need to create a job script.

```sh
[alice@{{ site.devel.name }} lxc]$ cat demo-apptainer.sh
#!/usr/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -j y
#$ -N demo-apptainer
#$ -l mem_free=100M
#$ -l h_rt=00:05:00

## Remember to bind TMPDIR
apptainer exec --bind "$TMPDIR" rocker_r-base.sif Rscript -e "sum(1:10)"
```

And now submit with `qsub`:

```sh
[alice@{{ site.devel.name }} lxc]$ qsub demo-apptainer.sh
Your job 1657 ("hello_world") has been submitted
```

Check results:

```sh
[alice@{{ site.devel.name }} lxc]$ cat demo-apptainer.o5987
[1] 55
```


### Building a container from scratch

Sometimes you need to build custom Linux container from a `*.def`
definition file.  In the past, when Singularity was used, this
required administrative ("sudo") privileges. However, with the
introduction of Apptainer, any user can now build container images
also from scratch from one of the {{ site.cluster.name }} development
nodes.

For example, consider the following `isoseq3.def` file, which builds
upon a Docker Miniconda3 image (available at
<https://hub.docker.com/r/continuumio/miniconda3>) and extends it by
installing `isoseq3` from the Bioconda channel (available at
<https://anaconda.org/bioconda/isoseq3>):

<!-- code-block label="isoseq3-def" -->
```sh
Bootstrap: docker
From: continuumio/miniconda3

%post
  /opt/conda/bin/conda config --set notify_outdated_conda false
  /opt/conda/bin/conda config --add channels bioconda
  /opt/conda/bin/conda install isoseq3

%runscript
  isoseq3 "$@"
```

To build a container image from this definition file, use `apptainer
build` as in:

<!-- code-block label="isoseq3-build" -->
```sh
[alice@{{ site.devel.name }} ~]$ mkdir lxc
mkdir: cannot create directory ‘lxc’: File exists
[alice@{{ site.devel.name }} ~]$ cd lxc/
[alice@{{ site.devel.name }} lxc]$ apptainer build isoseq3.sif isoseq3.def
INFO:    User not listed in /etc/subuid, trying root-mapped namespace
INFO:    The %post section will be run under fakeroot
INFO:    Starting build...
Getting image source signatures
Copying blob sha256:129bc9a4304fe3a6ef0435e6698ab6bc2728b6f92078718fb28cb4b54ac59e96
Copying blob sha256:e67fdae3559346105027c63e7fb032bba57e62b1fe9f2da23e6fdfb56384e00b
Copying blob sha256:62aa66a9c405da603a06d242539b8f0dd178ae4179bf52584bbcce7a0471795f
Copying config sha256:6fbaadd54391b461351b02c0ddaf2bf284a2dcc9817f5685e07b2602e30f2b5c
Writing manifest to image destination
Storing signatures
2023/11/15 13:18:59  info unpack layer: sha256:e67fdae3559346105027c63e7fb032bba57e62b1fe9f2da23e6fdfb56384e00b
2023/11/15 13:19:01  info unpack layer: sha256:62aa66a9c405da603a06d242539b8f0dd178ae4179bf52584bbcce7a0471795f
2023/11/15 13:19:03  info unpack layer: sha256:129bc9a4304fe3a6ef0435e6698ab6bc2728b6f92078718fb28cb4b54ac59e96
INFO:    Running post scriptlet
+ /opt/conda/bin/conda config --set notify_outdated_conda false
+ /opt/conda/bin/conda config --add channels bioconda
+ /opt/conda/bin/conda install isoseq3
Collecting package metadata (current_repodata.json): ...working... done
Solving environment: ...working... done

## Package Plan ##

  environment location: /opt/conda

  added / updated specs:
    - isoseq3


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    isoseq-4.0.0               |       h9ee0642_0         2.9 MB  bioconda
    isoseq3-4.0.0              |       h9ee0642_0           7 KB  bioconda
    openssl-3.0.12             |       h7f8727e_0         5.2 MB
    ------------------------------------------------------------
                                           Total:         8.1 MB

The following NEW packages will be INSTALLED:

  isoseq             bioconda/linux-64::isoseq-4.0.0-h9ee0642_0 
  isoseq3            bioconda/linux-64::isoseq3-4.0.0-h9ee0642_0 

The following packages will be UPDATED:

  openssl                                 3.0.11-h7f8727e_2 --> 3.0.12-h7f8727e_0 


Proceed ([y]/n)? 

Downloading and Extracting Packages: ...working... done
Preparing transaction: ...working... done
Verifying transaction: ...working... done
Executing transaction: ...working... done
INFO:    Adding runscript
INFO:    Creating SIF file...
INFO:    Build complete: isoseq3.sif
```

The results is a container image file named `isoseq3.sif`:

<!-- code-block label="isoseq3-ls" -->
```sh
[alice@{{ site.devel.name }} lxc]$ ls -l isoseq3.sif
-rwxr-xr-x. 1 alice boblab 214814720 Nov 15 13:19 isoseq3.sif
[alice@{{ site.devel.name }} lxc]$ 
```

Because the definition file has a [`%runscript`] entry, we can call this image directly as-is, e.g.

<!-- code-block label="isoseq3-version" -->
```sh
[alice@{{ site.devel.name }} lxc]$ ./isoseq3.sif --version
isoseq 4.0.0 (commit v4.0.0)

Using:
  pbbam     : 2.4.99 (commit v2.4.0-16-g5cc6e4b)
  pbcopper  : 2.3.99 (commit v2.3.0-14-g5ac5693)
  pbmm2     : 1.11.99 (commit v1.11.0-1-g1b5a417)
  minimap2  : 2.15
  parasail  : 2.1.3
  boost     : 1.77
  htslib    : 1.17
  zlib      : 1.2.13
[alice@{{ site.devel.name }} lxc]$ 
```


## Frequently asked questions (FAQ)

Q. _Why not Docker?_  
A. Docker is one of the most popular and well-known software solutions for using Linux Containers. However, contrary to Apptainer, it turns out that it is hard to get Docker to play well with multi-tenant HPC environments.

Q. _What happened to Singularity?_   
A. The Apptainer software is a fork of the Singularity software from 2021. For backward compatibility, the `singularity` command is an alias to the `apptainer` command.  We suggest that you update your script to use `apptainer`.

Q. _What's the filename extension `*.sif`?_  
A. First of all, the filename extension is optional, and some prefer to drop them, e.g. `rocker_r-base` instead of `rocker_r-base.sif`.  SIF, which is short for the [Singularity Container Image Format], is a file format that can hold a Linux container environments in a single file.  You might also run into old Singularity images named `*.img` and `*.simg`, which are legacy file formats that Singularity used in the past, where [`*.img` indicates a _writable_ (ext3) images whereas `*.simg` indicates a read-only (squashfs) image.](https://groups.google.com/a/lbl.gov/d/msg/singularity/Cq7kIbN_L68/2mOdkwx2BAAJ)


[Linux containers]: https://www.wikipedia.org/wiki/Linux_containers
[Apptainer]: https://apptainer.org/
[Singularity]: https://sylabs.io/docs/
[Singularity Container Image Format]: https://github.com/apptainer/sif
[Docker]: https://www.docker.com/
[Docker Hub]: https://hub.docker.com/
[rocker/r-base]: https://hub.docker.com/r/rocker/r-base/
[R]: https://www.r-project.org/
[`%runscript`]: https://apptainer.org/docs/user/latest/definition_files.html
[`CMD`]: https://hub.docker.com/r/rocker/r-base/~/dockerfile/
