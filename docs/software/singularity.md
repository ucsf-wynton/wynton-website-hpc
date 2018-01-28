l
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

* Using an existing container:
  - `singularity run <image>` - run predefined script within container
  - `singularity exec <image>` - execute any command within container
  - `singularity shell <image>` - run bash shell within container

* Build a container:
  - `singularity build <path>` - build a Singularity from local specifications
  - `singularity build <url>` - import Singularity or Docker container available online

* Building containers:
  - `singularity build ...` - build Singularity containers locally

For full details, see `singularity --help`, `man singularity`, and the [Singularity] website.


## Example

### Building a container

As an illustration on how to use Linux containers with Singularity, we will use the Docker container [rocker/r-base] available on Docker Hub.  This particular container provides the latest release of the [R] software in an Ubuntu OS environment.  Containers available from Singularity Hub, Biocontainers, and elsewhere, can be downloaded and used analogously.

To use this rocker/r-base container, we first pull it down to a Singularity image file `~/lxc/r-base.img` as:

```sh
[alice@{{ site.interactive.name }} ~]$ mkdir lxc
[alice@{{ site.interactive.name }} ~]$ cd lxc/
[alice@{{ site.interactive.name }} lxc]$ singularity build rocker_r-base.img docker://rocker/r-base
Docker image path: index.docker.io/rocker/r-base:latest
Cache folder set to /home/alice/.singularity/docker
Importing: base Singularity environment
Importing: /home/alice/.singularity/docker/sha256:4f84e00c7348f149af1ef748d8431d9754bd3245ec4d6ddf73adf2952c4e4be4.tar.gz
Importing: /home/alice/.singularity/docker/sha256:6d84121dba27a17179cb6c24cd91cf109b77d6ce8d2f1cf0612fa1526a0b51e8.tar.gz
Importing: /home/alice/.singularity/docker/sha256:3116a1a43400953f8e40a137611c4999210ef7aa05a24a65d2c8c51b6d291978.tar.gz
Importing: /home/alice/.singularity/docker/sha256:3b2ca9764399b0b9d8575060bccf94b9d9c8619c2ecb4285f63923c3e9db5702.tar.gz
Importing: /home/alice/.singularity/docker/sha256:e182d2795ab935761ec6a8c7361055d2bc634fca704cf460069a2bac63510626.tar.gz
Importing: /home/alice/.singularity/docker/sha256:6208eca81e6c462e7013014477ae4454a09257644ed2131601bd4a6a80526961.tar.gz
Importing: /home/alice/.singularity/metadata/sha256:4ca2d1e46a06be85900f2c56d14208e5563a3ba1a0412b4c5e092b71d80fcf1f.tar.gz
WARNING: Building container as an unprivileged user. If you run this container as root
WARNING: it may be missing some functionality.
Building Singularity image...
Singularity container built: rocker_r-base.img
Cleaning up...

[alice@{{ site.interactive.name }} lxc]$ ll rocker_r-base.img 
-rwxr-xr-x 1 alice alice 257032223 Jan 27 15:56 rocker_r-base.img
```

The above takes a minute or so to complete.


### Running a container

After this, we can run R within this container using:
```sh
[alice@{{ site.interactive.name }} lxc]$ singularity run rocker_r-base.img

R version 3.4.3 (2017-11-30) -- "Kite-Eating Tree"
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

[alice@{{ site.interactive.name }} lxc]$ 
```

Exactly what is "run" is defined by the so called "runscript" of the Singularity container, or the ["CMD"](https://hub.docker.com/r/rocker/r-base/~/dockerfile/) if imported from a Docker container.  An alternative way to launch R within this container is by explicitly executing R, e.g.
```sh
[alice@{{ site.interactive.name }} lxc]$ singularity exec rocker_r-base.img R --quiet
> sum(1:10)
[1] 55
> quit("no")
[alice@{{ site.interactive.name }} lxc]$ 
```

Note that, if you mark the image to be an executable, that is,
```sh
[alice@{{ site.interactive.name }} lxc]$ chmod ugo+x rocker_r-base.img
```
then you can run it as any other executable, e.g.
```sh
[alice@{{ site.interactive.name }} lxc]$ ./rocker_r-base.img --quiet
> sum(1:10)
[1] 55
> quit("no")
[alice@{{ site.interactive.name }} lxc]$ 								
```

To launch a shell within this container, and to also convince yourselves that the container runs Ubuntu (and not CentOS as on the Wynton host system), do:
```sh
[alice@{{ site.interactive.name }} lxc]$ singularity shell rocker_r-base.img
Singularity: Invoking an interactive shell within container...

Singularity rocker_r-base.img:~/tests> head -3 /etc/os-release
PRETTY_NAME="Debian GNU/Linux buster/sid"
NAME="Debian GNU/Linux"
ID=debian
Singularity rocker_r-base.img:~/tests> Rscript --version
R scripting front-end version 3.4.3 (2017-11-30)
Singularity rocker_r-base.img:~/tests> exit
exit
[alice@{{ site.interactive.name }} lxc]$ head -3 /etc/os-release
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
```

### Running a container as job

When it comes to the scheduler, there is nothing special about Singularity per se - the Singularity software can be used as any other software on the cluster.  As a proof of concept, here is how to calculate the sum of one to ten using R within the above Linux container at the command line:
```sh
[alice@{{ site.interactive.name }} ~]$ singularity exec ~/lxc/rocker_r-base.img Rscript -e "sum(1:10)"
[1] 55
[alice@{{ site.interactive.name }} ~]$
```
and here is how to do the same via the job scheduler:
```sh
[alice@{{ site.interactive.name }} ~]$ echo 'singularity exec ~/lxc/rocker_r-base.img Rscript -e "sum(1:10)"' | qsub -cwd -j yes -N r-test
Your job 107356 ("r-test") has been submitted
[alice@{{ site.interactive.name }} ~]$ cat r-test.o150909
[1] 55
```


<br>
<br>
<div class="alert alert-info" role="alert">
Why not Docker? Docker is one of the most popular and well-known software solutions for using Linux Containers. However, contrary to Singularity, it turns out that it is hard to get Docker to play well with multi-tenant HPC environments.
</div>


[LXC]: https://en.wikipedia.org/wiki/LXC
[Singularity]: http://singularity.lbl.gov/
[Docker]: https://www.docker.com/
[Docker Hub]: https://hub.docker.com/
[rocker/r-base]: https://hub.docker.com/r/rocker/r-base/
[R]: https://www.r-project.org/

