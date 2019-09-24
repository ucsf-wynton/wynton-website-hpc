<div class="alert alert-info" role="alert">
These instructions are primarily written for Linux, macOS, and Windows 10 users.  If you are on a pre-Windows 10, using the <a href="http://www.putty.org/">PuTTY</a> SSH client, the overall idea is similar.  Please consult the PuTTY user forums for further instructions.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Any shell session that has been idle for more than eight hours will timeout and exit automatically.
</div>


# Login

To access the {{ site.cluster.name }} cluster you need an account - any UCSF affiliate can get an [account]({{ '/about/join.html' | relative_url }}).  Anyone with a {{ site.cluster.name }} account, can access the cluster via _Secure Shell (SSH)_.


## Instructions

To log into the cluster, assuming your user name on {{ site.cluster.name }} is `alice` (case sensitive), do the following:

1. Open a terminal (called 'Terminal' on macOS and most Linux distributions, and 'Command Prompt' on Windows 10),

2. at the terminal prompt, type `ssh alice@{{ site.login.hostname }}` and press ENTER, and
3. when prompted, enter your {{ site.cluster.name }} password.


### Example

When logging in from your local computer, you should see something like:

```sh
{local}$ ssh alice@{{ site.login.hostname }}
alice@{{ site.login.hostname }}\'s password: XXXXXXXXXXXXXXXXXXX
{{ site.login.name }}.501> 
```


If you get `Permission denied, please try again.` when you enter your password, make sure you use the correct {{ site.cluster.name }} username (case sensitive) and the correct password.

<div class="alert alert-info" role="alert">
It is possible to set up password-less authentication via a public-private SSH key pair.  For details, see the how-to page <a href="{{ 'howto/log-in-without-pwd.html' | relative_url }}">Log in without Password</a>.
</div>


# What is available on the login node?

The login node is dedicated solely to very basic tasks such as copying and moving files on the shared file system, submitting jobs, and checking the status on existing jobs.  Note that most software tools are _not_ available on the login node, which means you can neither use it for prototyping scripts nor build software.  Instead, for such tasks, use a [development node], which is configured identically to the compute nodes.


# Logout

Like for all Unix-based system, to log out from {{ site.cluster.name }}, type `exit` or `logout` (standard Unix commands) and press ENTER.  For example,

```sh
[alice@{{ site.login.name }} ~]$ exit
Connection to {{ site.login.hostname }} closed.
{local}$
```

An alternative is to press Ctrl-D (sends "End-Of-File" [EOF]) at the command-line prompt.


[development node]: {{ '/get-started/development-prototyping.html' | relative_url }}
