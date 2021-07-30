<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
2019-11-13: <code>python3</code> is now available as core software on all development and compute nodes.  Because of this, below Python SCLs are deprecated and eventually removed.
</div>

# CentOS Software Collections (SCL)

> [Software Collections (SCL)](https://en.wikipedia.org/wiki/CentOS#Add-ons_releases) is a CentOS repository that provides a set of dynamic programming languages, database servers, and various related packages. Provided software versions are [...] more recent than their equivalent versions included in the base CentOS distribution [...]  Packages available from the SCL [...] can be optionally enabled per application by using supplied `scl` utility.


## Available SCLs and their Packages

To list all Software Collections installed on the _development nodes_, use:

<!-- code-block label="list" -->
```sh
[alice@{{ site.devel.name }} ~]$ scl --list
devtoolset-10
devtoolset-7
devtoolset-8
devtoolset-9
llvm-toolset-7
rh-python36
rh-ruby25
```

_Importantly_, only a subset of the above SCLs are available also on the _compute nodes_.


To list all the packages that are part of one or more of these SCLs, use:

<!-- code-block label="list-one" -->
```sh
[alice@{{ site.devel.name }} ~]$ scl --list rh-ruby25
rh-ruby25-rubygem-did_you_mean-1.2.0-9.el7.noarch
rh-ruby25-rubygem-bigdecimal-1.3.4-9.el7.x86_64
rh-ruby25-rubygem-rdoc-6.0.1.1-9.el7.noarch
rh-ruby25-2.5-2.el7.x86_64
rh-ruby25-rubygem-openssl-2.1.2-9.el7.x86_64
rh-ruby25-rubygems-2.7.6.3-9.el7.noarch
rh-ruby25-rubygem-psych-3.0.2-9.el7.x86_64
rh-ruby25-ruby-2.5.9-9.el7.x86_64
rh-ruby25-rubygem-io-console-0.4.6-9.el7.x86_64
rh-ruby25-rubygem-json-2.1.0-9.el7.x86_64
rh-ruby25-ruby-irb-2.5.9-9.el7.noarch
rh-ruby25-ruby-libs-2.5.9-9.el7.x86_64
rh-ruby25-runtime-2.5-2.el7.x86_64
```


## Using SCLs

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
2019-11-13: Below example uses Python SCLs, which are now deprecated, and is therefore outdated. The example will be updated as soon as possible.
</div>

The current [core-software] installation provides stable but not necessarily the most up-to-date versions of Python, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ python --version
Python 2.7.5

[alice@{{ site.devel.name }} ~]$ python3 --version
Python 3.4.9
```

To use a newer version of Python provided by one of the above SCLs, prefix the `python ...` command (quoted) with `scl enable <name>`, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ scl enable rh-python36 "python --version"
Python 3.6.3

[alice@{{ site.devel.name }} ~]$ scl enable rh-python36 "python3 --version"
Python 3.6.3
```

_Importantly_, this approach of prefixing the original command call works also in job scripts.


If you work interactively on one of the development nodes, you can also launch a new shell (typically Bash) with one or more SCLs enabled:

```sh
[alice@{{ site.devel.name }} ~]$ scl enable rh-python36 $SHELL

[alice@{{ site.devel.name }} ~]$ python --version
Python 3.6.3

[alice@{{ site.devel.name }} ~]$ python3 --version
Python 3.6.3
```

To "unload" these SCLs, just return to the previous shell by exiting new SCL-enabled shell, i.e.

```sh
[alice@{{ site.devel.name }} ~]$ exit

[alice@{{ site.devel.name }} ~]$ python --version
Python 2.7.5
```


## See Also

* [Product Documentation for Red Hat Software Collections](https://access.redhat.com/documentation/en-us/red_hat_software_collections/)
* [Product Documentation for Red Hat Developer Toolset](https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/)


[core-software]: {{ '/software/core-software.html' | relative_url }}
