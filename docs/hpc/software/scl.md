# Software Collections (SCL)

> [Software Collections (SCL)](https://en.wikipedia.org/wiki/CentOS#Add-ons_releases) is a CentOS repository that provides a set of dynamic programming languages, database servers, and various related packages. Provided software versions are [...] more recent than their equivalent versions included in the base CentOS distribution [...]  Packages available from the SCL [...] can be optionally enabled per application by using supplied `scl` utility.


## Available SCLs and their Packages

To list all Software Collections installed on the _development nodes_, use:

<!-- code-block label="list" -->
```sh
[alice@{{ site.devel.name }} ~]$ scl --list
devtoolset-10
devtoolset-11
devtoolset-7
devtoolset-8
devtoolset-9
llvm-toolset-7
rh-python36
rh-python38
rh-ruby25
rh-ruby26
rh-ruby27
rh-ruby30
```

_Importantly_, only a subset of the above SCLs are available also on the _compute nodes_.


To list all the packages that are part of one or more of these SCLs, use:

<!-- code-block label="list-one" -->
```sh
[alice@{{ site.devel.name }} ~]$ scl --list rh-ruby25
rh-ruby25-rubygem-io-console-0.4.6-9.el7.x86_64
rh-ruby25-rubygem-json-2.1.0-9.el7.x86_64
rh-ruby25-rubygems-2.7.6.3-9.el7.noarch
rh-ruby25-runtime-2.5-2.el7.x86_64
rh-ruby25-rubygem-openssl-2.1.2-9.el7.x86_64
rh-ruby25-2.5-2.el7.x86_64
rh-ruby25-ruby-irb-2.5.9-9.el7.noarch
rh-ruby25-rubygem-did_you_mean-1.2.0-9.el7.noarch
rh-ruby25-rubygem-bigdecimal-1.3.4-9.el7.x86_64
rh-ruby25-ruby-2.5.9-9.el7.x86_64
rh-ruby25-ruby-libs-2.5.9-9.el7.x86_64
rh-ruby25-rubygem-psych-3.0.2-9.el7.x86_64
rh-ruby25-rubygem-rdoc-6.0.1.1-9.el7.noarch
```


## Using SCLs

Ruby's interactive shell can be launched via the `irb` command.  However, because it is available as a core software, we need to access it via the Ruby SCL.  Here is an example how to check the version of the Ruby shell:

<!-- code-block label="ruby-ex-1" -->
```sh
[alice@{{ site.devel.name }} ~]$ scl enable rh-ruby25 "irb --version"
irb 0.9.6(09/06/30)
```

_Importantly_, this approach of prefixing the original command call works also in job scripts.


If you work interactively on one of the development nodes, you can also launch a new shell (typically Bash) with one or more SCLs enabled:

<!-- code-block label="ruby-ex-2" -->
```sh
[alice@{{ site.devel.name }} ~]$ scl enable rh-ruby25 $SHELL
[alice@{{ site.devel.name }} ~]$ irb --version
irb 0.9.6(09/06/30)
```

To "unload" an SCLs, just return to the previous shell by exiting new SCL-enabled shell, i.e.

```sh
[alice@{{ site.devel.name }} ~]$ exit

[alice@{{ site.devel.name }} ~]$ 
```


## Version details on the different SCLs

### Developer Toolset SCLs

The `devtoolset-NN` SCLs each include a specific version of the GNU Compiler Collection (GCC), which provides the `gcc` compiler among other tools.  Here are the `gcc` versions provided by these SCLs:

```sh
[alice@{{ site.devel.name }} ~]$ scl enable devtoolset-7 "gcc --version | head -1"
gcc (GCC) 7.3.1 20180303 (Red Hat 7.3.1-5)

[alice@{{ site.devel.name }} ~]$ scl enable devtoolset-8 "gcc --version | head -1"
gcc (GCC) 8.3.1 20190311 (Red Hat 8.3.1-3)

[alice@{{ site.devel.name }} ~]$ scl enable devtoolset-9 "gcc --version | head -1"
gcc (GCC) 9.3.1 20200408 (Red Hat 9.3.1-2)

[alice@{{ site.devel.name }} ~]$ scl enable devtoolset-10 "gcc --version | head -1"
gcc (GCC) 10.2.1 20210130 (Red Hat 10.2.1-11)

[alice@{{ site.devel.name }} ~]$ scl enable devtoolset-11 "gcc --version | head -1"
gcc (GCC) 11.2.1 20220127 (Red Hat 11.2.1-9)
```


### Python SCLs

The `rh-pythonNN` SCLs each include a specific version of Python.  Here are the `python` versions provided by these SCLs:

```sh
[alice@{{ site.devel.name }} ~]$ scl enable rh-python36 "python --version"
Python 3.6.12

[alice@{{ site.devel.name }} ~]$ scl enable rh-python38 "python --version"
Python 3.8.13
```


### Ruby SCLs

The `rh-rubyNN` SCLs each include a specific version of Ruby.  Here are the `irb` versions provided by these SCLs:

```sh
[alice@{{ site.devel.name }} ~]$ scl enable rh-ruby25 "irb --version"
irb 0.9.6(09/06/30)

[alice@{{ site.devel.name }} ~]$ scl enable rh-ruby26 "irb --version"
irb 1.0.0 (2018-12-18)

[alice@{{ site.devel.name }} ~]$ scl enable rh-ruby27 "irb --version"
irb 1.2.6 (2020-09-14)

[alice@{{ site.devel.name }} ~]$ scl enable rh-ruby30 "irb --version"
irb 1.3.5 (2021-04-03)
```


## See Also

* [Product Documentation for Red Hat Software Collections](https://access.redhat.com/documentation/en-us/red_hat_software_collections/)
* [Product Documentation for Red Hat Developer Toolset](https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/)


[core-software]: /hpc/software/core-software.html
