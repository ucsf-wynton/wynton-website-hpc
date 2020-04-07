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

```sh
[alice@{{ site.devel.name }} ~]$ mkdir lxc
[alice@{{ site.devel.name }} ~]$ cd lxc/
[alice@{{ site.devel.name }} lxc]$ singularity build rocker_r-base.img docker://rocker/r-base
INFO:    Starting build...
Getting image source signatures
Copying blob sha256:6359bcfdcac7731506d8e89a85e5882f23711354ffe717d8228087cfd6a31fc3
 48.65 MiB / 48.65 MiB [====================================================] 2s
Copying blob sha256:7921cd62653e41062bfc021b7d7475b4a8ff16cb249a4c29974d0d010635d591
 1.80 KiB / 1.80 KiB [======================================================] 0s
Copying blob sha256:d835b7b583179a707477a96f6e35248894a2effed6af535b01e88e24f051a273
 25.93 MiB / 25.93 MiB [====================================================] 1s
Copying blob sha256:7d1e021b0f81cdcc447f012b462c892a3573a2d879c5b01493367d089cf60782
 842.65 KiB / 842.65 KiB [==================================================] 0s
Copying blob sha256:8e435d138f2bba19b6f85a2f3ef301f4a5d65bdc16ff417b746f9e926e738741
 297 B / 297 B [============================================================] 0s
Copying blob sha256:93d86fef617f6bd75b377f72981c7e8e28113020154f98e121942de5f828d591
 199.05 MiB / 199.05 MiB [==================================================] 7s
Copying config sha256:58ff9f07c993587fd9c31743c22bc4422852eae0b47a8b0d9b5e10e966f8db0d
 3.72 KiB / 3.72 KiB [======================================================] 0s
Writing manifest to image destination
Storing signatures
2019/10/31 17:09:37  info unpack layer: sha256:6359bcfdcac7731506d8e89a85e5882f23711354ffe717d8228087cfd6a31fc3
2019/10/31 17:09:40  info unpack layer: sha256:7921cd62653e41062bfc021b7d7475b4a8ff16cb249a4c29974d0d010635d591
2019/10/31 17:09:40  info unpack layer: sha256:d835b7b583179a707477a96f6e35248894a2effed6af535b01e88e24f051a273
2019/10/31 17:09:41  info unpack layer: sha256:7d1e021b0f81cdcc447f012b462c892a3573a2d879c5b01493367d089cf60782
2019/10/31 17:09:41  info unpack layer: sha256:8e435d138f2bba19b6f85a2f3ef301f4a5d65bdc16ff417b746f9e926e738741
2019/10/31 17:09:41  info unpack layer: sha256:93d86fef617f6bd75b377f72981c7e8e28113020154f98e121942de5f828d591
INFO:    Creating SIF file...
INFO:    Build complete: rocker_r-base.img

[hb-test@qb3-dev3 lxc]$ ll rocker_r-base.img
-rwxr-xr-x. 1 alice lsd 271249408 Oct 31 17:09 rocker_r-base.img
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
[Singularity]: https://sylabs.io/docs/
[Docker]: https://www.docker.com/
[Docker Hub]: https://hub.docker.com/
[rocker/r-base]: https://hub.docker.com/r/rocker/r-base/
[R]: https://www.r-project.org/

