# Install Software from Source Code

A lot of scientific software is developed using C, C++, and
Fortran. Sometimes the maintainers provide prebuilt software binaries
from Linux, but more often you have to compile their software from
source code.  Building from source might sound daunting, especially if
it's your first time - there is new terminology to understand, new
tools to use, and sometimes hard-to-understand error messages.

This document gives the gist of one of to the most common way to build
software from source code, namely the "configure -> make -> make
install" approach.  Please be aware that not all software tools use
this approach, so it's not universal, but it is by far the most common
approach.


## configure -> make -> make install

Compiling software from source often involves three steps:

 1. Configuration - configure the following build step to work with
    your current set of tools and libraries

 2. Building - compiling the source code into binary executables

 3. Installation - install the compiled binaries to its final destination

Lets use the [samtools] software as a real-world example to illustrate
these steps.


### Download and extract source code

We start by downloading the latest software "tarball" from
<https://github.com/samtools/samtools/releases> to a temporary working
location:

```sh
[alice@{{ site.devel.name }} ~]$ mkdir -p "/scratch/$USER"
[alice@{{ site.devel.name }} ~]$ cd "/scratch/$USER"
[alice@{{ site.devel.name }} alice]$ wget https://github.com/samtools/samtools/releases/download/1.14/samtools-1.14.tar.bz2
[alice@{{ site.devel.name }} alice]$ ls -l samtools-1.14.tar.bz2 
-rw-r--r-- 1 alice boblab 7744794 Dec  7 14:41 samtools-1.14.tar.bz2
```

The next step is to extract the content of this tarball, which we can
do using `tar -x -f` ("extract file"):

```sh
[alice@{{ site.devel.name }} alice]$ tar -x -f samtools-1.14.tar.bz2
[alice@{{ site.devel.name }} alice]$ ls -l
total 7568
drwxr-xr-x 9 alice boblab    4096 Oct 22 04:48 samtools-1.14
-rw-r--r-- 1 alice boblab 7744794 Dec  7 14:41 samtools-1.14.tar.bz2
```

As we see, the content of the tarball was extracted into a subfolder
`samtools-1.14`.  The tarball file is no longer needed after this
stage.  Let's enter that new folder and look at its content:

```sh
[alice@{{ site.devel.name }} alice]$ cd samtools-1.14
[alice@{{ site.devel.name }} samtools-1.14]$ ls
amplicon_stats.c    bam_markdup.c       bedcov.c       Makefile
AUTHORS             bam_mate.c          bedidx.c       misc
bam2bcf.c           bam_md.c            bedidx.h       NEWS
bam2bcf.h           bam_plbuf.c         ChangeLog.old  padding.c
bam2bcf_indel.c     bam_plbuf.h         config.h.in    phase.c
bam2depth.c         bam_plcmd.c         config.mk.in   README
bam_addrprg.c       bam_quickcheck.c    configure      sam_opts.c
bam_ampliconclip.c  bam_reheader.c      configure.ac   sam_opts.h
...
bam.h               bamtk.c             INSTALL        stats_isize.h
bam_import.c        bam_tview.c         install-sh     test
bam_index.c         bam_tview_curses.c  LICENSE        tmp_file.c
bam_lpileup.c       bam_tview.h         lz4            tmp_file.h
bam_lpileup.h       bam_tview_html.c    m4             version.sh
```

We see that there are lots of files, but a few standard files stand
out: `configure`, `INSTALL`, `Makefile`, `NEWS`, and `README`.  The
files `README`, `NEWS` and `INSTALL` are standard file names for
human-readable text files.  These are often useful to read when trying
to understand what the software is about and how to install it.  If
there is an `INSTALL` file, as here, it most likely contain
instructions on how to install the software.  In our case,
[`INSTALL`](https://github.com/samtools/samtools/blob/84dfab2520661ee09f96fcbdc62f31f33be70478/INSTALL#L66)
contains a section:

```plain
Basic Installation
==================

To build and install Samtools, 'cd' to the samtools-1.x directory containing
the package's source and type the following commands:

    ./configure
    make
    make install
...
```

Familiar, eh?


### Step 1 - Configuration

Default installation instructions, like the ones above, often assume
we will install the software as an administrator to a central location
available to all users on the system.  That is not possible to
individual users on the cluster.  Instead, we need to install it to a
location where we have permission to create and write files and
folders.

A common pattern is to install into a subfolder in our home folder
that reflects the name of the software and its version. This way we
can have multiple versions of the same software installed at the same
time.  Lets install samtools to the following folder:

```sh
[alice@{{ site.devel.name }} samtools-1.14]$ mkdir -p $HOME/software/samtools-1.14
```

Now we can configure the build to install to this folder:

```sh
[alice@{{ site.devel.name }} samtools-1.14]$ ./configure --prefix=$HOME/software/samtools-1.14
configure: running /bin/sh ./configure --disable-option-checking '--prefix={{ site.user.home }}/software/samtools-1.14'  --cache-file=/dev/null --srcdir=.
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking for ranlib... ranlib
checking for grep that handles long lines and -e... /usr/bin/grep
checking for C compiler warning flags... -Wall
checking for pkg-config... /usr/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking shared library type for unknown-Linux... plain .so
checking whether the compiler accepts -fvisibility=hidden... yes
checking how to run the C preprocessor... gcc -E
checking for egrep... /usr/bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for stdlib.h... (cached) yes
checking for unistd.h... (cached) yes
checking for sys/param.h... yes
checking for getpagesize... yes
checking for working mmap... yes
checking for gmtime_r... yes
checking for fsync... yes
checking for drand48... yes
checking for srand48_deterministic... no
checking whether fdatasync is declared... yes
checking for fdatasync... yes
checking for library containing log... -lm
checking for zlib.h... yes
checking for inflate in -lz... yes
checking for library containing recv... none required
checking for bzlib.h... yes
checking for BZ2_bzBuffToBuffCompress in -lbz2... yes
checking for lzma.h... yes
checking for lzma_easy_buffer_encode in -llzma... yes
checking whether htscodecs files are present... yes
checking for libdeflate.h... no
checking for libdeflate_deflate_compress in -ldeflate... no
checking for curl/curl.h... yes
checking for curl_easy_pause in -lcurl... yes
checking for CCHmac... no
checking for library containing HMAC... -lcrypto
checking for library containing regcomp... none required
checking whether PTHREAD_MUTEX_RECURSIVE is declared... yes
configure: creating ./config.status
config.status: creating config.mk
config.status: creating htslib.pc.tmp
config.status: creating config.h
config.status: linking htscodecs_bundled.mk to htscodecs.mk
[alice@{{ site.devel.name }} samtools-1.14]$  
```

_Importantly, make sure there are no errors reported.  If there are,
they need to be resolved before continuing._  This document does not
explain how to resolve configuration errors.  If you cannot figure it
out yourself, please reach out on one of our [Support Channels].


### Step 2 - Building

If the configuration steps complete without errors, it is often
straightforward to build ("compile") the software my calling `make`.
The `make` command will use formal build instruction in the
`Makefile`, but we don't have to know about those details.  Just call
`make` as in:

```sh
[alice@{{ site.devel.name }} samtools-1.14]$ make
...
config.mk:46: htslib-1.14/htslib_static.mk: No such file or directory
cd htslib-1.14 && make htslib_static.mk
make[1]: Entering directory `/scratch/alice/samtools-1.14/htslib-1.14'
sed -n '/^static_libs=/s/[^=]*=/HTSLIB_static_LIBS = /p;/^static_ldflags=/s/[^=]*=/HTSLIB_static_LDFLAGS = /p' htslib.pc.tmp > htslib_static.mk
make[1]: Leaving directory `/scratch/alice/samtools-1.14/htslib-1.14'
gcc -Wall -g -O2 -I. -Ihtslib-1.14 -I./lz4  -c -o bam.o bam.c
gcc -Wall -g -O2 -I. -Ihtslib-1.14 -I./lz4  -c -o bam_aux.o bam_aux.c

[ ... lots of output ... ]

gcc -Wall -g -O2 -I. -Ihtslib-1.14 -I./lz4  -c -o test/vcf-miniview.o test/vcf-miniview.c
gcc  -L./lz4  -o test/vcf-miniview test/vcf-miniview.o htslib-1.14/libhts.a -lpthread -lz -lm -lbz2 -llzma -lcurl -lcrypto -lz  -lpthread
[alice@{{ site.devel.name }} samtools-1.14]$ 
```

Make sure there are no compilation errors.  If you get errors at this
stage, it could be because the `gcc` compiler is too old.  If that
happens, try to use a newer compiler version following the
instructions in Section 'Too old compiler?' below.


### Step 3 - Installation

If we got this far, all we have to do is to install the software, we
just configured and built, to its final destination, which was
specified and recorded in the configure step.  All we have to do now
is:

```sh
[alice@{{ site.devel.name }} samtools-1.14]$ make install
mkdir -p -m 755 {{ site.user.home }}/software/samtools-1.14/bin {{ site.user.home }}/software/samtools-1.14/bin {{ site.user.home }}/software/samtools-1.14/share/man/man1
install -p samtools {{ site.user.home }}/software/samtools-1.14/bin
install -p misc/ace2sam misc/maq2sam-long misc/maq2sam-short misc/md5fa misc/md5sum-lite misc/wgsim {{ site.user.home }}/software/samtools-1.14/bin
install -p misc/blast2sam.pl misc/bowtie2sam.pl misc/export2sam.pl misc/fasta-sanitize.pl misc/interpolate_sam.pl misc/novo2sam.pl misc/plot-ampliconstats misc/plot-bamstats misc/psl2sam.pl misc/sam2vcf.pl misc/samtools.pl misc/seq_cache_populate.pl misc/soap2sam.pl misc/wgsim_eval.pl misc/zoom2sam.pl {{ site.user.home }}/software/samtools-1.14/bin
install -p -m 644 doc/samtools*.1 misc/wgsim.1 {{ site.user.home }}/software/samtools-1.14/share/man/man1
[alice@{{ site.devel.name }} samtools-1.14]$ 
```


### Testing

If we pay attention to the `make install` output, we see that the
`samtools` executable was installed in the `bin/` subfolder of our
installation directory `~/software/samtools-1.14/`.  Since this is not
yet on the search path, we have to specify the full path for our
initial test:

```sh
[alice@{{ site.devel.name }} samtools-1.14]$ $HOME/software/samtools-1.14/bin/samtools --version | head -3
samtools 1.14
Using htslib 1.14
Copyright (C) 2021 Genome Research Ltd.
```

In order to call this `samtools` executable without having to specify
the full path each time, prepend its path to the `PATH` environment
variable, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ export PATH=~/software/samtools-1.14/bin:$PATH
[alice@{{ site.devel.name }} samtools-1.14]$ which samtools
~/software/samtools-1.14/bin/samtools
[alice@{{ site.devel.name }} samtools-1.14]$ samtools --version | head -3
samtools 1.14
Using htslib 1.14
Copyright (C) 2021 Genome Research Ltd.
```

For convenience, you might want to add:

```sh
export PATH=~/software/samtools-1.14/bin:$PATH
```

to your `~/.bashrc` file.



## Too old compiler?

The GCC development tools that come built-in on our Rocky 8 system is
sufficient for most needs.  For example, the default `gcc` version is:

<!-- code-block label="gcc-version" -->
```sh
[alice@{{ site.devel.name }} ~]$ gcc --version
gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-18)
Copyright (C) 2018 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

```

This GCC 8.5.0 compiler supports older C++ standards such as C++17,
but none of the newer standards, including C++20 and C++23,
cf. <https://gcc.gnu.org/projects/cxx-status.html>.  Most software are
configured to validate that we have a sufficient compiler version when
built, and if a too old version is used, there is often an informative
error message.  Examples might be:

```plain
g++: error: unrecognized command line option '-std=gnu++20'
```

From this error message (`-std=c++20`), we can see that we need a
compiler that requires C++20. From
<https://gcc.gnu.org/projects/cxx-status.html#cxx20>, we see that we
need at least GCC 8, but possibly even GCC 11 or GCC 12.  Newer
version of compilers are available via the 'gcc-toolset' [Software
Collections (SCLs)].  The easiest way to access these is via the
`scl-gcctoolset` modules in the [CBI software repository], e.g.


<!-- code-block label="module-load-scl-gcc-toolset" -->
```sh
[alice@{{ site.devel.name }} ~]$ module load CBI scl-gcc-toolset/12
[alice@{{ site.devel.name }} ~]$ gcc --version
gcc (GCC) 12.2.1 20221121 (Red Hat 12.2.1-7)
Copyright (C) 2022 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

```

You only need to load these compiler tools prior to installing the
software.  With very few exception, they are not needed for running
the installed software later on.



[Software Collections (SCLs)]: ../software/scl.html#development-nodes
[CBI software repository]: ../software/software-repositories.html
[Support Channels]: ../support/index.html
[samtools]: https://github.com/samtools/samtools
