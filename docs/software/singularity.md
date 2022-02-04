# Singularity - Linux Containers

The {{ site.cluster.name }} cluster supports [Linux containers] via the [Singularity] software.  A Linux container is an efficient and powerful virtualization method for running isolated Linux systems ("containers") on any Linux system including CentOS used by our cluster.

Singularity, and Linux containers in general, provides solutions to common problems and hurdles that HPC users often face, e.g.

* using software that is not installed on the system
* using software that is hard for user to install
* using software that only runs on a specific Linux distribution or version
* sharing scientific pipeline in a reproducible way
* using full scientific pipelines shared by others

Because you can create and customize your own containers, and because Singularity also supports [Docker] containers, you have immediate access to a very large number of Singularity and Docker containers available via repositories such as:

* [Singularity Library](https://cloud.sylabs.io/library) by Sylabs - the official repository for Singularity-specific containers
* [Singularity Hub](https://singularity-hub.org/) by Vanessa Sochat at Stanford - requires GitHub login (as of July 2019)
* [Docker Hub](https://hub.docker.com/explore/) - the official repository for Docker-based containers (100,000's of containers)
* [Biocontainers](https://biocontainers.pro/) - "community-driven framework which provides system-agnostic executable environments for bioinformatics software" (Docker-based containers)



## Instructions

All tasks for using Linux containers, such as downloading, building, and running containers, is done via the `singularity` client and supported on {{ site.cluster.name }}.  The most common command calls are:

* Use an existing container:
  - `singularity run <image>` - run predefined script within container
  - `singularity exec <image>` - execute any command within container
  - `singularity shell <image>` - run bash shell within container

* Build a container:
  - `singularity build <url>`  - import an existing Singularity or Docker container available online
  - `singularity build --remote <image> <def file>` - build a Singularity from local specifications in definition file

For full details, see `singularity --help`, `man singularity`, and the [Singularity] website.

* Install Singularity or Docker on your own machine:
  - Create a Singularity image on your own workstation and transfer the image to Wynton
  - Create a Docker image on your own workstation and transfer the image to Wynton

## Example

### Building a Singularity container from an existing Docker Hub image

As an illustration on how to use Linux containers with Singularity, we will use the Docker container [rocker/r-base] available on Docker Hub.  This particular container provides the latest release of the [R] software in an Ubuntu OS environment.  Containers available from Singularity Hub, Biocontainers, and elsewhere, can be downloaded and used analogously.

To use this rocker/r-base container, we first pull it down to a Singularity image file `~/lxc/rocker_r-base.sif` as:

<!-- code-block label="build" -->
```sh
[alice@{{ site.devel.name }} ~]$ mkdir lxc
[alice@{{ site.devel.name }} ~]$ cd lxc/
[alice@{{ site.devel.name }} lxc]$ singularity build rocker_r-base.sif docker://rocker/r-base
INFO:    Starting build...
Getting image source signatures
Copying blob sha256:420047682034904224708ffcbc863130ba6bce56f9d642605dccd2d375af6969
Copying blob sha256:e603e00f9478df8f9435c78d26e7ae28f5af4bdcb4132435141c8b515c6c8e18
Copying blob sha256:c6ea85836d4d314e5a036814df370488276d0cf327b6ceb9a0af6fe6a4bf6166
Copying blob sha256:d585e1cbeb2fd3ecc65c3200c0de6af1f3124b4a5679e08477d262919e880bc7
Copying blob sha256:5ac5c0d19fbb6c61f4e7d5b08f66fc659d3530ae2f01c874e154268a7648776c
Copying blob sha256:f833cf076231770cf7616d55ce466dd3e303eefff0185007978aff5a11709ac7
Copying blob sha256:52321ce7fbaf0726407f41ec0d8240bf3db1730a7d8b257e7ee66b311e168bc8
Copying config sha256:f1b04a6cdfec8d38e91f60af908c7e93d91b60b836f0075ab718c17271dd3f9c
Writing manifest to image destination
Storing signatures
2021/07/30 15:08:56  info unpack layer: sha256:420047682034904224708ffcbc863130ba6bce56f9d642605dccd2d375af6969
2021/07/30 15:09:00  info unpack layer: sha256:e603e00f9478df8f9435c78d26e7ae28f5af4bdcb4132435141c8b515c6c8e18
2021/07/30 15:09:00  info unpack layer: sha256:c6ea85836d4d314e5a036814df370488276d0cf327b6ceb9a0af6fe6a4bf6166
2021/07/30 15:09:01  info unpack layer: sha256:d585e1cbeb2fd3ecc65c3200c0de6af1f3124b4a5679e08477d262919e880bc7
2021/07/30 15:09:01  info unpack layer: sha256:5ac5c0d19fbb6c61f4e7d5b08f66fc659d3530ae2f01c874e154268a7648776c
2021/07/30 15:09:01  info unpack layer: sha256:f833cf076231770cf7616d55ce466dd3e303eefff0185007978aff5a11709ac7
2021/07/30 15:09:01  info unpack layer: sha256:52321ce7fbaf0726407f41ec0d8240bf3db1730a7d8b257e7ee66b311e168bc8
INFO:    Creating SIF file...
INFO:    Build complete: rocker_r-base.sif
[alice@{{ site.devel.name }} lxc]$ ls -l rocker_r-base.sif
-rwxr-xr-x. 1 alice boblab 308523008 Jul 30 15:09 rocker_r-base.sif
```

The above may take a minute or two to complete.


### Running a container

After this, we can run R within this container using:

<!-- code-block label="run" -->
```sh
[alice@{{ site.devel.name }} lxc]$ singularity run rocker_r-base.sif

R version 4.1.0 (2021-05-18) -- "Camp Pontanezen"
Copyright (C) 2021 The R Foundation for Statistical Computing
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

Exactly what is "run" is defined by the so called "runscript" of the Singularity container, or the ["CMD"](https://hub.docker.com/r/rocker/r-base/~/dockerfile/) if imported from a Docker container.  An alternative way to launch R within this container is by explicitly executing R, e.g.

<!-- code-block label="exec" -->
```sh
[alice@{{ site.devel.name }} lxc]$ singularity exec rocker_r-base.sif R --quiet
> sum(1:10)
[1] 55
> q("no")
[alice@{{ site.devel.name }} lxc]$ 
```

Note that, the Singularity image is marked as an _executable_, which means you can run it as any other executable, e.g.

<!-- code-block label="command" -->
```sh
[alice@{{ site.devel.name }} lxc]$ ./rocker_r-base.sif

R version 4.1.0 (2021-05-18) -- "Camp Pontanezen"
Copyright (C) 2021 The R Foundation for Statistical Computing
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

To launch a shell within this container, and to also convince yourselves that the container runs Ubuntu (and not CentOS as on the {{ site.cluster.name }} host system), do:

<!-- code-block label="shell" -->
```sh
[alice@{{ site.devel.name }} lxc]$ singularity shell rocker_r-base.sif
Singularity> head -3 /etc/os-release
PRETTY_NAME="Debian GNU/Linux buster/sid"
NAME="Debian GNU/Linux"
ID=debian
Singularity> Rscript --version
R scripting front-end version 4.1.0 (2021-05-18)
Singularity> exit

[alice@{{ site.devel.name }} lxc]$ head -3 /etc/os-release
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
```


### Access other cluster folders than your home folder

When running a container, only a few of the folders available "outside" are available "inside" the container.  By default, you have access to the current working directory (= `$PWD`) and your home folder (= `$HOME`).   In contrast, without further specifications, you will not have access to standard folders such as local `/scratch` and global `{{ site.path.global_scratch }}`.  Similarly, lab folders such as `{{ site.user.labfolder }}` are not available from inside the container.

<!-- code-block label="shell-nobind" -->
```sh
[alice@{{ site.devel.name }} lxc]$ singularity shell rocker_r-base.sif
Singularity> ls /scratch
ls: cannot access '/scratch': No such file or directory
Singularity> ls {{ site.path.global_scratch }}
ls: cannot access '{{ site.path.global_scratch }}': No such file or directory
Singularity> ls {{ site.user.labfolder }}
ls: cannot access '{{ site.user.labfolder }}': No such file or directory
Singularity> echo $TMPDIR
/scratch/alice
Singularity> ls "$TMPDIR"
ls: cannot access '/scratch/alice': No such file or directory
```

To make also these folders available within the container, we can use `singularity` option `--bind`.  In its simplest form, we can just list the folders we want to make available, e.g.

<!-- code-block label="shell-bind" -->
```sh
[alice@{{ site.devel.name }} lxc]$ singularity shell --bind /scratch,{{ site.path.global_scratch }},{{ site.user.labfolder }} rocker_r-base.sif
Singularity> ls /scratch
alice
Singularity> ls {{ site.path.global_scratch }}
alice
Singularity> ls {{ site.user.labfolder }}
data1  data2
```

See `singularity help instance start` for more details and other ways to mount and rename folders within the container.


### Running a container as a job

When it comes to the scheduler, there is nothing special about Singularity per se - the Singularity software can be used as any other software on the cluster.  As a proof of concept, here is how to calculate the sum of one to ten using R within the above Linux container at the command line:

<!-- code-block label="rscript-sum" -->
```sh
[alice@{{ site.devel.name }} lxc]$ singularity exec rocker_r-base.sif Rscript -e "sum(1:10)"
[1] 55
[alice@{{ site.devel.name }} lxc]$ 
```

To run this as a batch job, we need to create a job script.

```sh
[alice@{{ site.devel.name }} lxc]$ cat demo-singularity.sh
#!/usr/bin/bash
#$ -N demo-singularity
#$ -l mem_free=100M
#$ -l h_rt=00:05:00
#$ -j y

./rocker_r-base.sif Rscript -e "sum(1:10)"
```

And now submit with `qsub`:

```sh
[alice@{{ site.devel.name }} lxc]$ qsub demo-singularity.sh
Your job 1657 ("hello_world") has been submitted
```

Check results:

```sh
[alice@{{ site.devel.name }} lxc]$ cat demo-singularity.o5987
[1] 55
```

### Building a container using Singularity Remote Builder

The `singularity build` command requires sudo privileges to build from a local definition file, however one option is to use the Sylabs.io Remote Builder which does not require sudo. 

To use the remote build option one first needs a [Sylabs.io](https://cloud.sylabs.io/builder) access token, which can be generated after logging in to Sylabs.io.

Then add the `--remote` option to the `singularity build` command: `singularity build –remote <image> <def file>`  where \<image\> is the desired name of the Singularity image resulting from the build and \<def file\> is your Singularity definition file.

The official [Singularity documentation](https://sylabs.io/guides/3.8/user-guide/definition_files.html) has more information on definition files.

This is an example of building a Singularity container using the Remote Builder to run the [IsoSeq3](https://github.com/PacificBiosciences/IsoSeq) application:

- Create a definition file using a text editor on Wynton containing

```sh
Bootstrap: docker
From: continuumio/miniconda3

%post
  /opt/conda/bin/conda config --add channels bioconda
  /opt/conda/bin/conda install isoseq3

%runscript
  /opt/conda/bin/isoseq3
```

- from one of the Wynton dev nodes use the `singularity build --remote` command

```sh
[alice@{{ site.devel.name }}]$ singularity build --remote isoseq3 isoseq3.def
INFO:    Remote "default" added.
INFO:    Access Token Verified!
INFO:    Token stored in /root/.singularity/remote.yaml
INFO:    Remote "default" now in use.
INFO:    Starting build...
Getting image source signatures
...
INFO:    Adding runscript
INFO:    Creating SIF file...
INFO:    Build complete: /tmp/image-4018701584
WARNING: Skipping container verification
148.5MiB / 148.5MiB [======================================] 100 % 68.0 MiB/s 0s

Library storage: using 297.00 MiB out of 11.00 GiB quota (2.6% used)
Container URL: https://cloud.sylabs.io/library/...
INFO:    Build complete: isoseq3
```

- a Singularity container image file named `isoseq3` should now exist along with the definition file

```sh
[alice@{{ site.devel.name }}]$ ls -1
isoseq3
isoseq3.def
```

- Singularity images are executable, since the `%runscript` in the definition file specifies to run the isoseq3 command, you can use it like this

```sh
[alice@{{ site.devel.name }}]$ isoseq3 --version
isoseq3 3.4.0 (commit v3.4.0)
```


### Create a Singularity image on your own workstation and transfer the image to Wynton

You can install Singularity on a Linux host where you have root access and build the container image there using `sudo singularity build`.

Then the finished container image can be transferred to Wynton for use.

If you do not have a Linux workstation, a Linux virtual machine is easy to install on Windows and macOS.

### Create a Docker image on your own workstation and transfer the image to Wynton

Similarity to installing Singularity on a Linux workstation, you can install Docker on a workstation you have access to and upload the Docker image to a registry such as [Docker Hub](https://hub.docker.com/) or [quay.io](https://quay.io/search). Docker images can be converted to a Singularity container.


## FAQ

Q. _Why not Docker?_  
A. Docker is one of the most popular and well-known software solutions for using Linux Containers. However, contrary to Singularity, it turns out that it is hard to get Docker to play well with multi-tenant HPC environments.

Q. _What's the filename extension `*.sif`?_  
A. First of all, the filename extension is optional, and some prefer to drop them, e.g. `rocker_r-base` instead of `rocker_r-base.sif`.  SIF, which is short for the [Singularity Container Image Format](https://github.com/hpcng/sif), is a file format that can hold a Linux container environments in a single file.  You might also see Singularity images named `*.img` and `*.simg`, which are legacy file formats that Singularity used in the past, where `*.img` indicates a _writable_ (ext3) images whereas `*.simg` indicates a read-only (squashfs) image.](https://groups.google.com/a/lbl.gov/d/msg/singularity/Cq7kIbN_L68/2mOdkwx2BAAJ)


[Linux containers]: https://www.wikipedia.org/wiki/Linux_containers
[Singularity]: https://sylabs.io/docs/
[Docker]: https://www.docker.com/
[Docker Hub]: https://hub.docker.com/
[rocker/r-base]: https://hub.docker.com/r/rocker/r-base/
[R]: https://www.r-project.org/

