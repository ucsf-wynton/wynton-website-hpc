# Software Collections (SCL)

> [Software Collections (SCL)](https://en.wikipedia.org/wiki/CentOS#Add-ons_releases) is a CentOS repository that provides a set of dynamic programming languages, database servers, and various related packages. Provided software versions are [...] more recent than their equivalent versions included in the base CentOS distribution [...]  Packages available from the SCL [...] can be optionally enabled per application by using supplied `scl` utility.


## Available SCLs and their Packages

To list all Software Collections installed on the _development nodes_, use:

<!-- code-block label="list" -->
```sh
[alice@{{ site.devel.name }} ~]$ scl --list
gcc-toolset-7
gcc-toolset-8
gcc-toolset-9
gcc-toolset-10
gcc-toolset-11
```

_Importantly_, the above SCLs are available only on the _development
nodes_.


To list all the packages that are part of one or more of these SCLs, use:

<!-- code-block label="list-one" -->
```sh
[alice@{{ site.devel.name }} ~]$ scl --list gcc-toolset-11
...
```


## Using SCLs

Ruby's interactive shell can be launched via the `irb` command.  However, because it is available as a core software, we need to access it via the Ruby SCL.  Here is an example how to check the version of the Ruby shell:

<!-- code-block label="ruby-ex-1" -->
```sh
[alice@{{ site.devel.name }} ~]$ scl enable gcc-toolset-10 "gcc --version"
...
```

_Importantly_, this approach of prefixing the original command call works also in job scripts.


If you work interactively on one of the development nodes, you can also launch a new shell (typically Bash) with one or more SCLs enabled:

<!-- code-block label="ruby-ex-2" -->
```sh
[alice@{{ site.devel.name }} ~]$ scl enable gcc-devtoolset-11 $SHELL
[alice@{{ site.devel.name }} ~]$ gcc --version
...
```

To "unload" an SCLs, just return to the previous shell by exiting new SCL-enabled shell, i.e.

```sh
[alice@{{ site.devel.name }} ~]$ exit

[alice@{{ site.devel.name }} ~]$ 
```


## Version details on the different SCLs

### Developer Toolset SCLs

The `gcc-toolset-NN` SCLs each include a specific version of the GNU Compiler Collection (GCC), which provides the `gcc` compiler among other tools.  Here are the `gcc` versions provided by these SCLs:

```sh
[alice@{{ site.devel.name }} ~]$ scl enable gcc-toolset-7 "gcc --version | head -1"
gcc (GCC) 7.3.1 20180303 (Red Hat 7.3.1-5)

[alice@{{ site.devel.name }} ~]$ scl enable gcc-toolset-8 "gcc --version | head -1"
gcc (GCC) 8.3.1 20190311 (Red Hat 8.3.1-3)

[alice@{{ site.devel.name }} ~]$ scl enable gcc-toolset-9 "gcc --version | head -1"
gcc (GCC) 9.3.1 20200408 (Red Hat 9.3.1-2)

[alice@{{ site.devel.name }} ~]$ scl enable gcc-toolset-10 "gcc --version | head -1"
gcc (GCC) 10.2.1 20210130 (Red Hat 10.2.1-11)

[alice@{{ site.devel.name }} ~]$ scl enable gcc-toolset-11 "gcc --version | head -1"
gcc (GCC) 11.2.1 20220127 (Red Hat 11.2.1-9)
```


## See Also

* [Product Documentation for Red Hat Software Collections](https://access.redhat.com/documentation/en-us/red_hat_software_collections/)
* [Product Documentation for Red Hat Developer Toolset](https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/)


[core-software]: /hpc/software/core-software.html
