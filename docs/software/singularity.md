<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong>Where is Singularity 2.4.2?</strong>:  Although the current release version is Singularity 2.4.2, Wynton only provides Singularity 2.3.1.  The reason is that <a href="https://github.com/singularityware/singularity/pull/1218#issuecomment-362023939">2.4.2 has a show-stopping bug</a>.  As soon as Singularity has fixed this, we will upgrade.  /2018-02-08
</div>

# Singularity - Linux Containers

The Wynton cluster supports Linux Containers ([LXC]) via the [Singularity] software.  A Linux container is an efficient and powerful virtualization method for running isolated Linux systems ("containers") on any Linux system including CentOS used by our cluster.

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

* Using an existing container image:
  - `singularity run <image>` - run predefined script within container
  - `singularity exec <image>` - execute any command within container
  - `singularity shell <image>` - run bash shell within container

* Downloading containers available online:
  - `singularity pull <url>` - import Singularity or Docker container

* Building containers:
  - `singularity build ...` - build Singularity containers locally

For full details, see `singularity --help`, `man singularity`, and the [Singularity] website.


## Example

As an illustration on how to use Linux containers with Singularity, we will use the Docker container [rocker/r-base] available on Docker Hub.  This particular container provides the latest release of the [R] software in an Ubuntu OS environment.  Containers available from Singularity Hub, Biocontainers, and elsewhere, can be downloaded and used analogously.

To use this rocker/r-base container, we first pull it down to a Singularity image file `~/lxc/r-base.img` as:

```sh
[alice@{{ site.devel.name }} ~]$ mkdir lxc
[alice@{{ site.devel.name }} ~]$ cd lxc/
[alice@{{ site.devel.name }} lxc]$ singularity pull docker://rocker/r-base
Initializing Singularity image subsystem
Opening image file: r-base.img
Creating 1290MiB image
Binding image to loop
Creating file system within image
Image is done: r-base.img
Docker image path: index.docker.io/rocker/r-base:latest
Cache folder set to /netapp/home/alice/.singularity/docker
[6/6] |===================================| 100.0% 
Importing: base Singularity environment
Importing: /netapp/home/alice/.singularity/docker/sha256:dcc248e321fc0450bb176a499d598ea0e00a061a4866cda57b4c823cc593a7e0.tar.gz
Importing: /netapp/home/alice/.singularity/docker/sha256:6c7404962a97270898c9924f8d174f5ba73b8d663d4442cfad5efa1866b63f58.tar.gz
Importing: /netapp/home/alice/.singularity/docker/sha256:41ab95b19c7e39d396a1252b57a6d46392b243aff19c7ae2b3b1fd2442e17082.tar.gz
Importing: /netapp/home/alice/.singularity/docker/sha256:c88bc6d3282408e0997f1ae8517a2f061a804741e14c5bfae45dbdcc46326e50.tar.gz
Importing: /netapp/home/alice/.singularity/docker/sha256:f3532c5b4720cb6c9b3eb5f6da2eadbd45b56d6e23dcc5a55a166be2255e25aa.tar.gz
Importing: /netapp/home/alice/.singularity/docker/sha256:3f41d580fce287afb9c7c21072c974e8295edb8f22dc9963be9efb087aa1c1a5.tar.gz
Done. Container is at: r-base.img

[alice@{{ site.devel.name }} lxc]$ ll r-base.img 
-rwxr-xr-x. 1 alice lsd 1352663072 Jul 31 08:05 r-base.img
```

The above may take a few minutes to complete.  After this, we can run R within this container using:
```sh
[alice@{{ site.devel.name }} lxc]$ singularity run r-base.img

R version 3.4.1 (2017-06-30) -- "Single Candle"
Copyright (C) 2017 The R Foundation for Statistical Computing
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
> quit()
Save workspace image? [y/n/c]: n
[alice@{{ site.devel.name }} lxc]$ 
```

What is "run" is defined by the so called "runscript" of the container.  An alternative way to launch R within this container is by explicitly executing R, e.g.
```sh
[alice@{{ site.devel.name }} lxc]$ singularity exec r-base.img R --quiet
> sum(1:10)
[1] 55
> quit("no")
[alice@{{ site.devel.name }} lxc]$ 
```

To launch a shell within this container, and to also convince yourselves that the container runs Ubuntu (and not CentOS as on the Wynton host system), do:
```sh
[alice@{{ site.devel.name }} lxc]$ singularity shell r-base.img
Singularity: Invoking an interactive shell within container...

Singularity r-base.img:~> head -3 /etc/os-release
PRETTY_NAME="Debian GNU/Linux buster/sid"
NAME="Debian GNU/Linux"
ID=debian
Singularity r-base.img:~> Rscript --version
R scripting front-end version 3.4.1 (2017-06-30)
Singularity r-base.img:~> exit
exit

[alice@{{ site.devel.name }} lxc]$ head -3 /etc/os-release
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
```

## Running Singularity software as job

When it comes to the scheduler, there is nothing special about Singularity per se - the Singularity software can be used as any other software on the cluster.  As a proof of concept, here is how to calculate the sum of one to ten using R within the above Linux container at the command line:
```sh
[alice@{{ site.devel.name }} ~]$ singularity exec ~/lxc/r-base.img Rscript -e "sum(1:10)"
[1] 55
[alice@{{ site.devel.name }} ~]$
```
and here is how to do the same via the job scheduler:
```sh
[alice@{{ site.devel.name }} ~]$ echo 'singularity exec ~/lxc/r-base.img Rscript -e "sum(1:10)"' | qsub -cwd -j yes -N r-base
Your job 150909 ("r-base") has been submitted
[alice@{{ site.devel.name }} ~]$ cat r-base.o150909
```



## FAQ

Q. _Why not Docker?_  
A. Docker is one of the most popular and well-known software solutions for using Linux Containers. However, contrary to Singularity, it turns out that it is hard to get Docker to play well with multi-tenant HPC environments.

Q. _What's the difference between `*.img` and `*.simg`?_  
A. The filename extension of Singularity images are optional, but using one helps clarify that an executable is a Singularity image.  [The `*.img` indicates a _writeable_ (ext3) images whereas `*.simg` indicates a read-only (squashfs) image.](https://groups.google.com/a/lbl.gov/d/msg/singularity/Cq7kIbN_L68/2mOdkwx2BAAJ)


[LXC]: https://en.wikipedia.org/wiki/LXC
[Singularity]: http://singularity.lbl.gov/
[Docker]: https://www.docker.com/
[Docker Hub]: https://hub.docker.com/
[rocker/r-base]: https://hub.docker.com/r/rocker/r-base/
[R]: https://www.r-project.org/

