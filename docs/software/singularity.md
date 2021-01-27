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

To use this rocker/r-base container, we first pull it down to a Singularity image file `~/lxc/rocker_r-base.img` as:

<!-- code-block label="build" -->
```sh
[alice@{{ site.devel.name }} ~]$ mkdir lxc
[alice@{{ site.devel.name }} ~]$ cd lxc/
[alice@{{ site.devel.name }} lxc]$ singularity build rocker_r-base.img docker://rocker/r-base
INFO:    Starting build...
Getting image source signatures
Copying blob sha256:4363cc52203477cd66948034ae4a1db71cbfd27fddb648dd9c590161de1f8634
Copying blob sha256:84b4f34362bc84334554760f8f2546095e5fef74322efaa7979fd1121ae927e5
Copying blob sha256:5a06f0a021cad74bf9b4aa18538585dbef393e3e227fbb960f8bc327e6547581
Copying blob sha256:642a4d4f99ab3f2cf657380497eeede11a9d0263428287296bdc8f71de78795f
Copying blob sha256:d36c605538a66ebff6ae01e73f30069b5bd8e8292ffd7d275cd65f4804b2edae
Copying blob sha256:b6393690e1508d90cb0d3cb9a31dc8679ecc46a949d796e2447b91b4af45e159
Copying config sha256:97c4fe6614a8a627eceeeb91e2fabcffd9fceb89b6e36d526462de4fefbcaab5
Writing manifest to image destination
Storing signatures
2021/01/20 18:15:46  info unpack layer: sha256:4363cc52203477cd66948034ae4a1db71cbfd27fddb648dd9c590161de1f8634
2021/01/20 18:15:49  info unpack layer: sha256:84b4f34362bc84334554760f8f2546095e5fef74322efaa7979fd1121ae927e5
2021/01/20 18:15:49  info unpack layer: sha256:5a06f0a021cad74bf9b4aa18538585dbef393e3e227fbb960f8bc327e6547581
2021/01/20 18:15:50  info unpack layer: sha256:642a4d4f99ab3f2cf657380497eeede11a9d0263428287296bdc8f71de78795f
2021/01/20 18:15:50  info unpack layer: sha256:d36c605538a66ebff6ae01e73f30069b5bd8e8292ffd7d275cd65f4804b2edae
2021/01/20 18:15:50  info unpack layer: sha256:b6393690e1508d90cb0d3cb9a31dc8679ecc46a949d796e2447b91b4af45e159
INFO:    Creating SIF file...
INFO:    Build complete: rocker_r-base.img
[alice@{{ site.devel.name }} lxc]$ ls -l rocker_r-base.img
-rwxr-xr-x. 1 alice boblab 297025536 Jan 20 18:16 rocker_r-base.img
```

The above may take a minute or two to complete.


### Running a container

After this, we can run R within this container using:

<!-- code-block label="run" -->
```sh
[alice@{{ site.devel.name }} lxc]$ singularity run rocker_r-base.img

R version 4.0.3 (2020-10-10) -- "Bunny-Wunnies Freak Out"
Copyright (C) 2020 The R Foundation for Statistical Computing
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
[alice@{{ site.devel.name }} lxc]$ singularity exec rocker_r-base.img R --quiet
> sum(1:10)
[1] 55
> q("no")
[alice@{{ site.devel.name }} lxc]$ 
```

Note that, the Singularity image is marked as an _executable_, which means you can run it as any other executable, e.g.

<!-- code-block label="command" -->
```sh
[alice@{{ site.devel.name }} lxc]$ ./rocker_r-base.img

R version 4.0.3 (2020-10-10) -- "Bunny-Wunnies Freak Out"
Copyright (C) 2020 The R Foundation for Statistical Computing
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
[alice@{{ site.devel.name }} lxc]$ singularity shell rocker_r-base.img
Singularity rocker_r-base.img:~/lxc> head -3 /etc/os-release
PRETTY_NAME="Debian GNU/Linux buster/sid"
NAME="Debian GNU/Linux"
ID=debian
Singularity r-base.img:~/lxc> Rscript --version
R scripting front-end version 4.0.3 (2020-10-10)
Singularity r-base.img:~/lxc> exit

[alice@{{ site.devel.name }} lxc]$ head -3 /etc/os-release
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
```


### Access other cluster folders than your home folder

When running a container, only a few of the folders available "outside" are available "inside" the container.  By default, you have access to the current working directory (= `$PWD`) and your home folder (= `$HOME`).   In contrast, without further specifications, you will not have access to standard folders such as local `/scratch` and global `/c4/scratch`.  Similarly, lab folders such as `{{ site.user.labfolder }}` are not available from inside the container.

<!-- code-block label="shell-nobind" -->
```sh
[alice@{{ site.devel.name }} lxc]$ singularity shell rocker_r-base.img
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
[alice@{{ site.devel.name }} lxc]$ singularity shell --bind /scratch,/c4/scratch,/boblab rocker_r-base.img
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
[alice@{{ site.devel.name }} lxc]$ singularity exec rocker_r-base.img Rscript -e "sum(1:10)"
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

./rocker_r-base.img Rscript -e "sum(1:10)"
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

Q. _What's the difference between `*.img` and `*.simg`?_  
A. The filename extension of Singularity images are optional, but using one helps clarify that an executable is a Singularity image.  [The `*.img` indicates a _writable_ (ext3) images whereas `*.simg` indicates a read-only (squashfs) image.](https://groups.google.com/a/lbl.gov/d/msg/singularity/Cq7kIbN_L68/2mOdkwx2BAAJ)


[Linux containers]: https://www.wikipedia.org/wiki/Linux_containers
[Singularity]: https://sylabs.io/docs/
[Docker]: https://www.docker.com/
[Docker Hub]: https://hub.docker.com/
[rocker/r-base]: https://hub.docker.com/r/rocker/r-base/
[R]: https://www.r-project.org/

