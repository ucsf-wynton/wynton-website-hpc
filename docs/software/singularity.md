# Singularity - Linux Containers

<!---
<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
2019-06-12: Singularity 3.2.1 is now available. We will update the below instructions, which were based on Singularity 2.6.1, as soon as we can.
</div>
--->

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

To use this rocker/r-base container, we first pull it down to a Singularity image file `~/lxc/rocker_r-base.img` as:

<!-- code-block label="build" -->
```sh
[alice@{{ site.devel.name }} ~]$ mkdir lxc
[alice@{{ site.devel.name }} ~]$ cd lxc/
[alice@{{ site.devel.name }} lxc]$ singularity build rocker_r-base.img docker://rocker/r-base
INFO:    Starting build...
Getting image source signatures
Copying blob sha256:0ab9185ddfe50c951de582032c5e29e21a851a328056e6bee6299e0ff55ec807
Copying blob sha256:d44275cd8663e9ba25fc43e9bdeca4cbba0a711051884d880231d5a63d9a24f3
Copying blob sha256:611ac85ce34ee0780b510f3feb8b5555cc4c0d5191747178cdd7a8cf8dc9c53c
Copying blob sha256:1d9c7fe5df96dd6fe55e9ddc736da684a9bf2df8b5b9d282f2f58e45b27ab256
Copying blob sha256:915f6b39903d5d5cd1800149b495a92040d0e9c3169acaf488c1225906ad817b
Copying blob sha256:1cf4e812adf61b22b89b92855730a767dcabf3c7da9676ec1e1e16546ce20ae1
Copying config sha256:3d369bfa045d9a54f5770aca574512a9b470cea9c0fb543066b218ac2f84b671
Writing manifest to image destination
Storing signatures
2020/09/01 15:01:51  info unpack layer: sha256:0ab9185ddfe50c951de582032c5e29e21a851a328056e6bee6299e0ff55ec807
2020/09/01 15:01:51  warn xattr{etc/gshadow} ignoring ENOTSUP on setxattr "user.rootlesscontainers"
2020/09/01 15:01:51  warn xattr{/tmp/rootfs-b0e5b484-ec9e-11ea-86bf-1418773e5343/etc/gshadow} destination filesystem does not support xattrs, further warnings will be suppressed
2020/09/01 15:01:54  info unpack layer: sha256:d44275cd8663e9ba25fc43e9bdeca4cbba0a711051884d880231d5a63d9a24f3
2020/09/01 15:01:54  warn xattr{etc/gshadow} ignoring ENOTSUP on setxattr "user.rootlesscontainers"
2020/09/01 15:01:54  warn xattr{/tmp/rootfs-b0e5b484-ec9e-11ea-86bf-1418773e5343/etc/gshadow} destination filesystem does not support xattrs, further warnings will be suppressed
2020/09/01 15:01:54  info unpack layer: sha256:611ac85ce34ee0780b510f3feb8b5555cc4c0d5191747178cdd7a8cf8dc9c53c
2020/09/01 15:01:55  warn xattr{var/cache/apt/archives/partial} ignoring ENOTSUP on setxattr "user.rootlesscontainers"
2020/09/01 15:01:55  warn xattr{/tmp/rootfs-b0e5b484-ec9e-11ea-86bf-1418773e5343/var/cache/apt/archives/partial} destination filesystem does not support xattrs, further warnings will be suppressed
2020/09/01 15:01:55  info unpack layer: sha256:1d9c7fe5df96dd6fe55e9ddc736da684a9bf2df8b5b9d282f2f58e45b27ab256
2020/09/01 15:01:55  info unpack layer: sha256:915f6b39903d5d5cd1800149b495a92040d0e9c3169acaf488c1225906ad817b
2020/09/01 15:01:55  info unpack layer: sha256:1cf4e812adf61b22b89b92855730a767dcabf3c7da9676ec1e1e16546ce20ae1
2020/09/01 15:02:02  warn xattr{usr/local/lib/R} ignoring ENOTSUP on setxattr "user.rootlesscontainers"
2020/09/01 15:02:02  warn xattr{/tmp/rootfs-b0e5b484-ec9e-11ea-86bf-1418773e5343/usr/local/lib/R} destination filesystem does not support xattrs, further warnings will be suppressed
INFO:    Creating SIF file...
INFO:    Build complete: rocker_r-base.img
[alice@{{ site.devel.name }} lxc]$ ls -l rocker_r-base.img
-rwxr-xr-x. 1 hb-test lsd 307957760 Sep  1 15:02 rocker_r-base.img
```

The above may take a minute or two to complete.


### Running a container

After this, we can run R within this container using:
```sh
[alice@{{ site.devel.name }} lxc]$ singularity run rocker_r-base.img

R version 3.6.1 (2019-07-05) -- "Action of the Toes"
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

R version 3.6.1 (2019-07-05) -- "Action of the Toes"
Copyright (C) 2019 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)
...

> sum(1:10)
[1] 55
> q("no")
[alice@{{ site.devel.name }} lxc]$
```

To launch a shell within this container, and to also convince yourselves that the container runs Ubuntu (and not CentOS as on the {{ site.cluster.name }} host system), do:
```sh
[alice@{{ site.devel.name }} lxc]$ singularity shell rocker_r-base.img
Singularity rocker_r-base.img:~/lxc> head -3 /etc/os-release
PRETTY_NAME="Debian GNU/Linux buster/sid"
NAME="Debian GNU/Linux"
ID=debian
Singularity r-base.img:~/lxc> Rscript --version
R scripting front-end version 3.6.1 (2019-07-05)
Singularity r-base.img:~/lxc> exit

[alice@{{ site.devel.name }} lxc]$ head -3 /etc/os-release
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
```

### Running a container as a job

When it comes to the scheduler, there is nothing special about Singularity per se - the Singularity software can be used as any other software on the cluster.  As a proof of concept, here is how to calculate the sum of one to ten using R within the above Linux container at the command line:

<!-- code-block label="rscript-sum" -->
```sh
[alice@{{ site.devel.name }} lxc]$ singularity exec rocker_r-base.img Rscript -e "sum(1:10)"
[1] 55
[alice@{{ site.devel.name }} lxc]$ 
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
[Singularity]: https://sylabs.io/docs/
[Docker]: https://www.docker.com/
[Docker Hub]: https://hub.docker.com/
[rocker/r-base]: https://hub.docker.com/r/rocker/r-base/
[R]: https://www.r-project.org/

