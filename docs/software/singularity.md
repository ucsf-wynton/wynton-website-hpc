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
  - `singularity build <path>` - build a Singularity from local specifications
  - `singularity build <url>`  - import Singularity or Docker container available online

For full details, see `singularity --help`, `man singularity`, and the [Singularity] website.


## Example

### Building a container

As an illustration on how to use Linux containers with Singularity, we will use the Docker container [rocker/r-base] available on Docker Hub.  This particular container provides the latest release of the [R] software in an Ubuntu OS environment.  Containers available from Singularity Hub, Biocontainers, and elsewhere, can be downloaded and used analogously.

To use this rocker/r-base container, we first pull it down to a Singularity image file `~/lxc/rocker_r-base.sif` as:

<!-- code-block label="build" -->
```sh
[alice@{{ site.devel.name }} ~]$ mkdir lxc
[alice@{{ site.devel.name }} ~]$ cd lxc/
[alice@{{ site.devel.name }} lxc]$ singularity build rocker_r-base.sif docker://rocker/r-base
INFO:    Starting build...
Getting image source signatures
Copying blob sha256:2aa31e5eaa2f63b21f0a451e58e0bdf8a356a365b4a0edc3cb0f7699c463a538
Copying blob sha256:8153434e6f7c9253254e97e38daa52ab228a7d088d3c3a9a654b416d7698d32d
Copying blob sha256:7c1ce3d135b31965248be165220b014c91f17e8df3e8a25c380e8a419221565d
Copying blob sha256:299b00db75f9f67fa990b93ba16fe3c3ea69715daae498345ae8fd9978c0b392
Copying blob sha256:fbb97aa921ad54c0f02b06a4df7b5097dcd9d39a7c0db85bebe4b87d02721026
Copying blob sha256:3f6521b7b8173d4e888f4c0b5eec5e163dd139dede728cfa96f51fd8e633116e
Copying blob sha256:46c03ae7f5ccb76a0643ce9b59ae502bedaf5e87721da070eca11eb4a7dc3e1a
Copying config sha256:21b47887f3a15cf7ed3c99f463763843133d84346a773ec78a44abd8ffeb9505
Writing manifest to image destination
Storing signatures
2021/05/11 16:51:14  info unpack layer: sha256:2aa31e5eaa2f63b21f0a451e58e0bdf8a356a365b4a0edc3cb0f7699c463a538
2021/05/11 16:51:17  info unpack layer: sha256:8153434e6f7c9253254e97e38daa52ab228a7d088d3c3a9a654b416d7698d32d
2021/05/11 16:51:17  info unpack layer: sha256:7c1ce3d135b31965248be165220b014c91f17e8df3e8a25c380e8a419221565d
2021/05/11 16:51:18  info unpack layer: sha256:299b00db75f9f67fa990b93ba16fe3c3ea69715daae498345ae8fd9978c0b392
2021/05/11 16:51:18  info unpack layer: sha256:fbb97aa921ad54c0f02b06a4df7b5097dcd9d39a7c0db85bebe4b87d02721026
2021/05/11 16:51:18  info unpack layer: sha256:3f6521b7b8173d4e888f4c0b5eec5e163dd139dede728cfa96f51fd8e633116e
2021/05/11 16:51:18  info unpack layer: sha256:46c03ae7f5ccb76a0643ce9b59ae502bedaf5e87721da070eca11eb4a7dc3e1a
INFO:    Creating SIF file...
INFO:    Build complete: rocker_r-base.sif
[alice@{{ site.devel.name }} lxc]$ ls -l rocker_r-base.sif
-rwxr-xr-x. 1 alice boblab 309747712 May 11 16:51 rocker_r-base.sif
```

The above may take a minute or two to complete.


### Building a container using Singularity Remote Builder

The `singularity build` command requires sudo privileges to build from a local definition file, however if you build from a Docker or Singularity online hub, the command should work without sudo.

To use the remote build option one first needs a [Sylabs.io](https://cloud.sylabs.io/builder) access token, which can be generated after logging in to Sylabs.io.

Then add the `--remote` option to the command: `singularity build --remote output.sif ./example.def` where output.sif is the output Singularity image resulting from the build and example.def is your Singularity definition file.


### Running a container

After this, we can run R within this container using:

<!-- code-block label="run" -->
```sh
[alice@{{ site.devel.name }} lxc]$ singularity run rocker_r-base.sif

R version 4.0.5 (2021-03-31) -- "Shake and Throw"
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

R version 4.0.5 (2021-03-31) -- "Shake and Throw"
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
Singularity rocker_r-base.sif:~/lxc> head -3 /etc/os-release
PRETTY_NAME="Debian GNU/Linux buster/sid"
NAME="Debian GNU/Linux"
ID=debian
Singularity r-base.sif:~/lxc> Rscript --version
R scripting front-end version 4.0.5 (2021-03-31)
Singularity r-base.sif:~/lxc> exit

[alice@{{ site.devel.name }} lxc]$ head -3 /etc/os-release
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
```


### Access other cluster folders than your home folder

When running a container, only a few of the folders available "outside" are available "inside" the container.  By default, you have access to the current working directory (= `$PWD`) and your home folder (= `$HOME`).   In contrast, without further specifications, you will not have access to standard folders such as local `/scratch` and global `/c4/scratch`.  Similarly, lab folders such as `{{ site.user.labfolder }}` are not available from inside the container.

<!-- code-block label="shell-nobind" -->
```sh
[alice@{{ site.devel.name }} lxc]$ singularity shell rocker_r-base.sif
Singularity> ls /scratch
ls: cannot access '/scratch': No such file or directory
Singularity> ls /c4/scratch
ls: cannot access '/c4/scratch': No such file or directory
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
[alice@{{ site.devel.name }} lxc]$ singularity shell --bind /scratch,/c4/scratch,{{ site.user.labfolder }} rocker_r-base.sif
Singularity> ls /scratch
alice
Singularity> ls /c4/scratch
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



## FAQ

Q. _Why not Docker?_  
A. Docker is one of the most popular and well-known software solutions for using Linux Containers. However, contrary to Singularity, it turns out that it is hard to get Docker to play well with multi-tenant HPC environments.

Q. _What's the filename extension `*.sif`?_

First of all, the filename extension is optional, and some prefer to drop them, e.g. `rocker_r-base` instead of `rocker_r-base.sif`.  SIF, which is short for the [Singularity Container Image Format](https://github.com/hpcng/sif), is a file format that can hold a Linux container environments in a single file.  You might also see Singularity images named `*.img` and `*.simg`, which are legacy file formats that Singularity used in the past, where `*.img` indicates a _writable_ (ext3) images whereas `*.simg` indicates a read-only (squashfs) image.](https://groups.google.com/a/lbl.gov/d/msg/singularity/Cq7kIbN_L68/2mOdkwx2BAAJ)


[Linux containers]: https://www.wikipedia.org/wiki/Linux_containers
[Singularity]: https://sylabs.io/docs/
[Docker]: https://www.docker.com/
[Docker Hub]: https://hub.docker.com/
[rocker/r-base]: https://hub.docker.com/r/rocker/r-base/
[R]: https://www.r-project.org/

