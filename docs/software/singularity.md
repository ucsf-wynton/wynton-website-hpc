# Singularity - Linux Containers

<!---
<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
2019-06-12: Singularity 3.2.1 is now available. We will update the below instructions, which were based on Singularity 2.6.1, as soon as we can.
</div>
--->

The Wynton cluster supports [Linux containers] via the [Singularity] software.  A Linux container is an efficient and powerful virtualization method for running isolated Linux systems ("containers") on any Linux system including CentOS used by our cluster.

Singularity, and Linux containers in general, provides solutions to common problems and hurdles that HPC users often face, e.g.

* using software that is not installed on the system
* using software that is hard for user to install
* using software that only runs on a specific Linux distribution or version
* sharing scientific pipeline in a reproducible way
* using full scientific pipelines shared by others

Because you can create and customize your own containers, and because Singularity also supports [Docker] containers, you have immediate access to a very large number of Singularity and Docker containers available via repositories such as:

* [Singularity Hub](https://singularity-hub.org/collections) - the official repository for Singularity-specific containers ("still early days")
* [Docker Hub](https://hub.docker.com/explore/) - the official repository for Docker-based containers (100,000's of containers)
* [Biocontainers](https://biocontainers.pro/) - "community-driven framework which provides system-agnostic executable environments for bioinformatics software" (Docker-based containers)



## Instructions

All tasks for using Linux containers, such as downloading, building, and running containers, is done via the `singularity` client and supported on Wynton.  The most common command calls are:

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

To use this rocker/r-base container, we first pull it down to a Singularity image file `~/lxc/rocker_r-base.img` as:

```sh
[alice@{{ site.devel.name }} ~]$ mkdir lxc
[alice@{{ site.devel.name }} ~]$ cd lxc/
[alice@{{ site.devel.name }} lxc]$ singularity build rocker_r-base.img docker://rocker/r-base
INFO:    Starting build...
Getting image source signatures
Copying blob sha256:2666d10a4f80f49cccd17b0595e4ae921fdb549aca89a64a3ef58279ccd98906
 47.90 MiB / 47.90 MiB [====================================================] 1s
Copying blob sha256:2c0f31f3b229517087318909ffeccba5a6492e98e96583d5aa3eddbea6f184d2
 1.80 KiB / 1.80 KiB [======================================================] 0s
Copying blob sha256:8978e71a606b9425f3b310bcd759aabfc2bcc2855b4e40ce3e589f436c812e68
 26.11 MiB / 26.11 MiB [====================================================] 0s
Copying blob sha256:3a18d5b41e174e9774e5c326e009b7b81204c81cc20d0cc122f19dc0a20e060d
 842.65 KiB / 842.65 KiB [==================================================] 0s
Copying blob sha256:3b9876199949ef5adac357dada6fe57f62a5d31a2b678cecdb20b946e46c2bca
 296 B / 296 B [============================================================] 0s
Copying blob sha256:1ecd21a8af49252586a8812abbec50fcbde5b490f3ac5893b061602d5c88ea13
 199.44 MiB / 199.44 MiB [==================================================] 5s
Copying config sha256:de0dcc63ac6e2793cefa41886635cb01e88b41c52862bc33d7cbef195f075091
 3.73 KiB / 3.73 KiB [======================================================] 0s
Writing manifest to image destination
Storing signatures
INFO:    Creating SIF file...
INFO:    Build complete: rocker_r-base.img
[hb-test@qb3-dev3 lxc]$ 
[hb-test@qb3-dev3 lxc]$ ll rocker_r-base.img
-rwxr-xr-x. 1 alice lsd 265625600 Jun 13 21:06 rocker_r-base.img
```

The above may take a minute or two to complete.


### Running a container

After this, we can run R within this container using:
```sh
[alice@{{ site.devel.name }} lxc]$ singularity run rocker_r-base.img


R version 3.6.0 (2019-04-26) -- "Planting of a Tree"
Copyright (C) 2019 The R Foundation for Statistical Computing
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
```sh
[alice@{{ site.devel.name }} lxc]$ singularity exec rocker_r-base.img R --quiet
> sum(1:10)
[1] 55
> q("no")
[alice@{{ site.devel.name }} lxc]$ 
```

Note that, the Singularity image is marked as an _executable_, which means you can run it as any other executable, e.g.
```sh
[alice@{{ site.devel.name }} lxc]$ ./rocker_r-base.img

R version 3.6.0 (2019-04-26) -- "Planting of a Tree"
Copyright (C) 2019 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)
...

> sum(1:10)
[1] 55
> q("no")
[alice@{{ site.devel.name }} lxc]$ 								
```

To launch a shell within this container, and to also convince yourselves that the container runs Ubuntu (and not CentOS as on the Wynton host system), do:
```sh
[alice@{{ site.devel.name }} lxc]$ singularity shell rocker_r-base.img
Singularity rocker_r-base.img:~/lxc> head -3 /etc/os-release
PRETTY_NAME="Debian GNU/Linux buster/sid"
NAME="Debian GNU/Linux"
ID=debian
Singularity r-base.img:~/lxc> Rscript --version
R scripting front-end version 3.6.0 (2019-04-26)
Singularity r-base.img:~/lxc> exit

[alice@{{ site.devel.name }} lxc]$ head -3 /etc/os-release
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
```

### Running a container as a job

When it comes to the scheduler, there is nothing special about Singularity per se - the Singularity software can be used as any other software on the cluster.  As a proof of concept, here is how to calculate the sum of one to ten using R within the above Linux container at the command line:
```sh
[alice@{{ site.devel.name }} ~]$ singularity exec rocker_r-base.img Rscript -e "sum(1:10)"
[1] 55
[alice@{{ site.devel.name }} ~]$
```
and here is how to do the same via the job scheduler:
```sh
[alice@{{ site.devel.name }} ~]$ echo 'singularity exec rocker_r-base.img Rscript -e "sum(1:10)"' | qsub -cwd -j yes -N r-base
Your job 5570948 ("r-base") has been submitted
[alice@{{ site.devel.name }} ~]$ cat r-base.o5570948
[1] 55
```



## FAQ

Q. _Why not Docker?_  
A. Docker is one of the most popular and well-known software solutions for using Linux Containers. However, contrary to Singularity, it turns out that it is hard to get Docker to play well with multi-tenant HPC environments.

Q. _What's the difference between `*.img` and `*.simg`?_  
A. The filename extension of Singularity images are optional, but using one helps clarify that an executable is a Singularity image.  [The `*.img` indicates a _writable_ (ext3) images whereas `*.simg` indicates a read-only (squashfs) image.](https://groups.google.com/a/lbl.gov/d/msg/singularity/Cq7kIbN_L68/2mOdkwx2BAAJ)


[Linux containers]: https://www.wikipedia.org/wiki/Linux_containers
[Singularity]: http://singularity.lbl.gov/
[Docker]: https://www.docker.com/
[Docker Hub]: https://hub.docker.com/
[rocker/r-base]: https://hub.docker.com/r/rocker/r-base/
[R]: https://www.r-project.org/

