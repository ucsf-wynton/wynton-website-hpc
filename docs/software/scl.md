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

## Developer Toolset gcc versions

The `devtoolset` SCLs each include a specific version of gcc.  Those versions are:

 * devtoolset-7 -> gcc 7.3.1
 * devtoolset-8 -> gcc 8.3.1
 * devtoolset-9 -> gcc 9.3.1
 * devtoolset-10 -> gcc 10.2.1

## See Also

* [Product Documentation for Red Hat Software Collections](https://access.redhat.com/documentation/en-us/red_hat_software_collections/)
* [Product Documentation for Red Hat Developer Toolset](https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/)


[core-software]: {{ '/software/core-software.html' | relative_url }}
