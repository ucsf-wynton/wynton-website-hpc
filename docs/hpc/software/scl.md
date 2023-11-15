# Software Collections (SCL)

[Software Collections (SCL)] provides software versions that are [...]
more recent > than their equivalent versions included in the base
Rocky 8 distribution.


## Available SCLs and their Packages

To list all Software Collections installed on the _development nodes_, use:

<!-- code-block label="list" -->
```sh
[alice@{{ site.devel.name }} ~]$ scl list-collections
gcc-toolset-10
gcc-toolset-11
gcc-toolset-12
gcc-toolset-9
```

_Importantly_, the above SCLs are available only on the _development
nodes_.


To list all the packages that are part of one or more of these SCLs,
use:

<!-- code-block label="list-one" -->
```sh
[alice@{{ site.devel.name }} ~]$ scl list-packages gcc-toolset-11
gcc-toolset-11-toolchain-11.1-1.el8.x86_64
gcc-toolset-11-gdb-10.2-5.el8.x86_64
gcc-toolset-11-dwz-0.14-2.el8.x86_64
gcc-toolset-11-runtime-11.1-1.el8.x86_64
gcc-toolset-11-valgrind-1:3.17.0-6.el8.x86_64
gcc-toolset-11-systemtap-runtime-4.5-6.el8.x86_64
gcc-toolset-11-gcc-gdb-plugin-11.2.1-9.1.el8.x86_64
gcc-toolset-11-elfutils-0.185-5.el8.x86_64
gcc-toolset-11-libstdc++-devel-11.2.1-9.1.el8.x86_64
gcc-toolset-11-11.1-1.el8.x86_64
gcc-toolset-11-elfutils-libelf-0.185-5.el8.x86_64
gcc-toolset-11-strace-5.13-7.el8.x86_64
gcc-toolset-11-libquadmath-devel-11.2.1-9.1.el8.x86_64
gcc-toolset-11-systemtap-client-4.5-6.el8.x86_64
gcc-toolset-11-make-1:4.3-2.el8.x86_64
gcc-toolset-11-gcc-11.2.1-9.1.el8.x86_64
gcc-toolset-11-gcc-c++-11.2.1-9.1.el8.x86_64
gcc-toolset-11-systemtap-4.5-6.el8.x86_64
gcc-toolset-11-systemtap-devel-4.5-6.el8.x86_64
gcc-toolset-11-elfutils-libs-0.185-5.el8.x86_64
gcc-toolset-11-perftools-11.1-1.el8.x86_64
gcc-toolset-11-elfutils-debuginfod-client-0.185-5.el8.x86_64
gcc-toolset-11-annobin-docs-10.23-1.el8.noarch
gcc-toolset-11-gcc-gfortran-11.2.1-9.1.el8.x86_64
gcc-toolset-11-binutils-2.36.1-2.el8.x86_64
gcc-toolset-11-ltrace-0.7.91-1.el8.x86_64
```


## Using SCLs

Rocky 8 comes with GCC 8.5.0 (2021-05-14).  Never versions are
available via the `gcc-toolset-NN` SCLs.  Here is an example how to
check the version of one of the newer version:

<!-- code-block label="gcc-toolset-version" -->
```sh
[alice@{{ site.devel.name }} ~]$ scl enable gcc-toolset-12 "gcc --version"
gcc (GCC) 12.2.1 20221121 (Red Hat 12.2.1-7)
Copyright (C) 2022 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

```

_Importantly_, this approach of prefixing the original command call
works also in job scripts.


### Using SCLs in interactive mode

#### Using `scl enable` (traditional)

If you work interactively on one of the development nodes, you can
also launch a new shell (typically Bash) with one or more SCLs
enabled:

<!-- code-block label="gcc-toolset-version-2" -->
```sh
[alice@{{ site.devel.name }} ~]$ scl enable gcc-toolset-12 "$SHELL"
[alice@{{ site.devel.name }} ~]$ gcc --version
gcc (GCC) 12.2.1 20221121 (Red Hat 12.2.1-7)
Copyright (C) 2022 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

To "unload" an SCLs, just return to the previous shell by exiting new
SCL-enabled shell, i.e.

```sh
[alice@{{ site.devel.name }} ~]$ exit

[alice@{{ site.devel.name }} ~]$ 
```


#### Using `module load CBI scl-gcc-toolset` (recommended)

An alternative approach to using `scl enable` for activating an SCL,
is to `module load` to achieve the same, e.g.

<!-- code-block label="module-load-scl-gcc-toolset" -->
```sh
[alice@{{ site.devel.name }} ~]$ module load CBI scl-gcc-toolset/12
[alice@{{ site.devel.name }} ~]$ gcc --version
gcc (GCC) 12.2.1 20221121 (Red Hat 12.2.1-7)
Copyright (C) 2022 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

```

To go back to the built-in version of GCC, unload the module, i.e.

<!-- code-block label="module-unload-scl-gcc-toolset" -->
```sh
[alice@{{ site.devel.name }} ~]$ module unload CBI scl-gcc-toolset/12
[alice@{{ site.devel.name }} ~]$ gcc --version
gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-18)
Copyright (C) 2018 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

```


## See Also

* [Product Documentation for Red Hat Developer Toolset](https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/)


[core-software]: /hpc/software/core-software.html
