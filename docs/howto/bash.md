<!-- markdownlint-disable MD010 -->

# Work with Bash

## The Bash startup process

Unless you have explicitly requested to use a different shell than Bash, you will be running a Bash shell when you log onto any of {{ site.cluster.name }}'s machines.  You can confirm this by looking at the value of the `SHELL` environment variable;

<!-- code-block label="bash-SHELL" -->
```sh
[alice@{{ site.devel.name }} ~]$ echo "$SHELL"
/bin/bash
```

When a new Bash shell is launched, it will be configured according to setting in your personal `~/.bashrc` startup file.  On a fresh account, this file looks like:

<!-- code-block label="bash-bashrc-fresh" -->
```sh
[alice@{{ site.devel.name }} ~]$ cat /etc/skel/.bashrc
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
```

In Bash, code comments start with a `#` symbol, which means that anything following and include this symbol that is on the same line is completely ignored.  If we look at the above code, we see that almost all lines are comments.  The only thing that is not a comment is the following if-then statement:

```sh
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
```

This Bash statement (i) checks if the file `/etc/bashrc` exists, and (ii) if it does, then that file is also "sourced" by the `. /etc/bashrc` line.   The period in front is not a mistake; sometimes you see a period sometimes you see `source`, which works the same.

If we would look at the `/etc/bashrc` file, we would find a lot of things but lets not go into the details.  The only thing we need to know is that `. /etc/bashrc` will bring in all of the essential, central configuration that the system administrators have setup for us.

<div class="alert alert-danger" role="alert" style="margin-top: 3ex" markdown="1">
It is critical that your `~/.bashrc` sources the `/etc/bashrc` file. Do _not_ remove the if-then statement that sources that file!
</div>
