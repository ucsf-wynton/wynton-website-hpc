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
  - Create a Apptainer image on your own workstation and transfer the image to Wynton
  - Create a Docker image on your own workstation and transfer the image to Wynton

## Example

### Building a Apptainer container from an existing Docker Hub image

As an illustration on how to use Linux containers with Apptainer, we will use the Docker container [rocker/r-base] available on Docker Hub.  This particular container provides the latest release of the [R] software in an Ubuntu OS environment.  Containers available from Docker Hub, Biocontainers, and elsewhere, can be downloaded and used analogously.

To use this rocker/r-base container, we first pull it down to a Apptainer image file `~/lxc/rocker_r-base.sif` as:

<!-- code-block label="build" -->
```sh
[alice@{{ site.devel.name }} ~]$ mkdir lxc
[alice@{{ site.devel.name }} ~]$ cd lxc/
[alice@{{ site.devel.name }} lxc]$ apptainer build rocker_r-base.sif docker://rocker/r-base
INFO:    Starting build...
Getting image source signatures
Copying blob sha256:7b303595d9b321a9020d0ddbf1dea4c83237e2367117606a8d5466c446714ba1
Copying blob sha256:83ca482c84ae83b4e39c6cad8519cde7b2cb5b8f1d181b5be11271d91c01b583
Copying blob sha256:6046dc19e2b25f9181d9e5e9347fff916012d426f1de82aaaba5f0d29b647aeb
Copying blob sha256:ed3a653d2e7952b3187ab9cfc7be8cde4651e994d1085a1102a621e952530d9e
Copying blob sha256:111255bd9d45300e28c8a7727ad43f2979d66d6ac94d472699fe40fb079945a8
Copying blob sha256:f9510faa489c34c75dd8d92128e890d135ddd7aeb64c293306563abee64eb53b
Copying config sha256:b23cdc375e4c59d8a9c321b7b308116e0e3c2329c45f9be18d35dc95398565dc
Writing manifest to image destination
Storing signatures
2022/03/29 18:43:54  info unpack layer: sha256:7b303595d9b321a9020d0ddbf1dea4c83237e2367117606a8d5466c446714ba1
2022/03/29 18:43:57  info unpack layer: sha256:83ca482c84ae83b4e39c6cad8519cde7b2cb5b8f1d181b5be11271d91c01b583
2022/03/29 18:43:57  info unpack layer: sha256:6046dc19e2b25f9181d9e5e9347fff916012d426f1de82aaaba5f0d29b647aeb
2022/03/29 18:43:58  info unpack layer: sha256:ed3a653d2e7952b3187ab9cfc7be8cde4651e994d1085a1102a621e952530d9e
2022/03/29 18:43:59  info unpack layer: sha256:111255bd9d45300e28c8a7727ad43f2979d66d6ac94d472699fe40fb079945a8
2022/03/29 18:43:59  info unpack layer: sha256:f9510faa489c34c75dd8d92128e890d135ddd7aeb64c293306563abee64eb53b
INFO:    Creating SIF file...
INFO:    Build complete: rocker_r-base.sif
[alice@{{ site.devel.name }} lxc]$ ls -l rocker_r-base.sif
-rwxr-xr-x. 1 alice boblab 318054400 Mar 29 18:44 rocker_r-base.sif
```

The above may take a minute or two to complete.


### Running a container

After this, we can run R within this container using:

<!-- code-block label="run" -->
```sh
[alice@{{ site.devel.name }} lxc]$ apptainer run rocker_r-base.sif

R version 4.1.3 (2022-03-10) -- "One Push-Up"
Copyright (C) 2022 The R Foundation for Statistical Computing
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

R version 4.1.3 (2022-03-10) -- "One Push-Up"
Copyright (C) 2022 The R Foundation for Statistical Computing
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
[alice@{{ site.devel.name }} lxc]$ apptainer shell rocker_r-base.sif
Apptainer> head -3 /etc/os-release
PRETTY_NAME="Debian GNU/Linux buster/sid"
NAME="Debian GNU/Linux"
ID=debian
Apptainer> Rscript --version
R scripting front-end version 4.1.3 (2022-03-10)
Copyright (C) 2022 The R Foundation for Statistical Computing
Apptainer> exit

[alice@{{ site.devel.name }} lxc]$ head -3 /etc/os-release
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
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
Apptainer> echo $TMPDIR
/scratch/alice
Apptainer> ls "$TMPDIR"
ls: cannot access '/scratch/alice': No such file or directory
```

To make also these folders available within the container, we can use `apptainer` option `--bind`.  In its simplest form, we can just list the folders we want to make available, e.g.

<!-- code-block label="shell-bind" -->
```sh
[alice@{{ site.devel.name }} lxc]$ apptainer shell --bind /scratch,{{ site.path.global_scratch }},{{ site.user.labfolder }} rocker_r-base.sif
Apptainer> ls /scratch
alice
Apptainer> ls {{ site.path.global_scratch }}
alice
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
[alice@{{ site.devel.name }} lxc]$ apptainer exec rocker_r-base.sif Rscript -e "sum(1:10)"
[1] 55
[alice@{{ site.devel.name }} lxc]$ 
```

To run this as a batch job, we need to create a job script.

```sh
[alice@{{ site.devel.name }} lxc]$ cat demo-apptainer.sh
#!/usr/bin/bash
#$ -N demo-apptainer
#$ -l mem_free=100M
#$ -l h_rt=00:05:00
#$ -j y

apptainer exec rocker_r-base.sif Rscript -e "sum(1:10)"
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

```sh
Bootstrap: docker
From: continuumio/miniconda3

%post
  /opt/conda/bin/conda config --add channels bioconda
  /opt/conda/bin/conda install isoseq3

%runscript
  isoseq3 "$@"
```

To build a container image from this definition file, use `apptainer
build` as in:

```sh
[alice@{{ site.devel.name }} lxc]$ apptainer build isoseq3.sif isoseq3.def
INFO:    Starting build...
Getting image source signatures
Copying blob 7b4354700ca4 done
Copying blob 3f4ca61aafcd done
Copying blob 69a5d9e1ecd6 done
Copying config 8c73281886 done
Writing manifest to image destination
Storing signatures
2023/01/24 13:50:37  info unpack layer: sha256:3f4ca61aafcd4fc07267a105067db35c0f0ac630e1970f3cd0c7bf552780e985
2023/01/24 13:50:39  info unpack layer: sha256:69a5d9e1ecd6566da53d0978004bdf37dddfaba1d8a6117966f397b41cbbc529
2023/01/24 13:50:42  info unpack layer: sha256:7b4354700ca480732ead22a553cc45916dc5466709ca64d964c4647b5b9343e9
INFO:    Running post scriptlet
+ /opt/conda/bin/conda config --add channels bioconda
+ /opt/conda/bin/conda install isoseq3
Collecting package metadata (current_repodata.json): done
…
done
INFO:    Adding runscript
INFO:    Creating SIF file...
INFO:    Build complete: isoseq3.sif
[alice@{{ site.devel.name }} lxc]$ 
```

The results is a container image file named `isoseq3.sif`:

```sh
[alice@{{ site.devel.name }}]$ ls -l isoseq3.sif
-rwxr-xr-x. 1 alice boblab 164265984 Jan 24 13:51 isoseq3.sif
```

Because the definition file has an [`%runscript`] entry, we can call this image directly as-is, e.g.

```sh
[alice@{{ site.devel.name }}]$ ./isoseq3.sif --version
isoseq3 3.8.2 (commit v3.8.2)

Using:
  pbbam     : 2.2.0 (commit v2.2.0-1-g8c081f6)
  pbcopper  : 2.1.0 (commit v2.1.0)
  pbmm2     : 1.9.0 (commit v1.9.0-2-gbec8e28)
  minimap2  : 2.15
  parasail  : 2.1.3
  boost     : 1.77
  htslib    : 1.14
  zlib      : 1.2.11
[alice@{{ site.devel.name }}]$ 
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
