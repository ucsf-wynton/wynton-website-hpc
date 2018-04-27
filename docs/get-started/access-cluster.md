<div class="alert alert-info" role="alert">
These instructions are primarily written for Linux and macOS users.  If you are on Windows using the <a href="http://www.putty.org/">PuTTY</a> SSH client, the overall idea is similar.  Please consult the PuTTY user forums for further instructions.
</div>


# Login

To access the Wynton cluster you need an account - any UCSF affiliate can get an [account]({{ '/about/join.html' | relative_url }}).  Anyone with a Wynton account, can access the cluster via _Secure Shell (SSH)_.  Since access is restricted to computers on the UCSF network, make sure you are first connected via the [UCSF VPN], if you are outside.


## Instructions

To log into the cluster, assuming your user name on Wynton is `alice` (case sensitive), do the following:

1. Open a terminal (called 'Terminal' on macOS and most Linux distributions),

2. at the terminal prompt, type `ssh alice@{{ site.login.hostname }}` and press ENTER, and
3. when prompted, enter your Wynton password.


### Example

When logging in from your local computer, you should see something like:

```sh
{local}$ ssh alice@{{ site.login.hostname }}
alice1@{{ site.login.ip }}\'s password: XXXXXXXXXXXXXXXXXXX
[alice@{{ site.login.name }} ~]$ 
```


If you get `Permission denied, please try again.` when you enter your password, make sure you use the correct Wynton username (case sensitive) and the correct password.

<div class="alert alert-info" role="alert">
It is possible to set up password-less authentication via a public-private SSH key pair.  For details, see the how-to page <a href="{{ 'howto/log-in-without-pwd.html' | relative_url }}">Log in without Password</a>.
</div>


# What is available on the login node?

The login node is dedicated solely to very basic tasks such as copying and moving files on the shared file system, submitting jobs, and checking the status on existing jobs.  Note that most software tools are _not_ available on the login node, which means you can neither use it for prototyping scripts nor build software.  Instead, for such tasks, use a [development node], which is configured identically to the compute nodes.


# Logout

Like for all Unix-based system, to log out from Wynton, type `exit` or `logout` (standard Unix commands) and press ENTER.  For example,

```sh
[alice@{{ site.login.name }} ~]$ exit
Connection to {{ site.login.hostname }} closed.
{local}$ 
```

An alternative is to press Ctrl-D (signals "QUIT") at the command-line prompt.


[UCSF VPN]: https://it.ucsf.edu/services/vpn
[development node]: {{ '/get-started/interactive-usage.html' | relative_url }}
