<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Account are personal and login credentials must not be shared with others</strong>. If detected, access to the account will be automatically disabled.  It is still possible and easy for multiple users to share and collaborate on the same folders and scripts.  Don't hesitate to ask if you don't know how to do this - we're here to help.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Starting <span style="text-decoration: line-through">September 15, 2020</span> (postponed), <strong>access to {{ site.cluster.name }} from outside of the UCSF network requires two-factor authentication (2FA).</strong>
If you are on the UCSF VPN, you have already authenticated and no further 2FA is required.
In all other cases, you will be prompted to authenticate through a Wynton-specific 2FA method when SSH:ing directly to the cluster.  See <a href="{{ '/get-started/duo-signup.html' | relative_url }}">Two-Factor Authentication for SSH</a> for instructions.
</div>

# Login

To access the {{ site.cluster.name }} cluster you need an account - any UCSF affiliate can get an [account]({{ '/about/join.html' | relative_url }}).  Anyone with a {{ site.cluster.name }} account, can access the cluster via _Secure Shell (SSH)_.


## Prerequisites

The instructions below requires:

* An SSH client available on your local computer

* A {{ site.cluster.name }} account with valid authentication credentials

Users on Linux and macOS have an SSH client built-in, which is available from the terminal as `ssh`.  Users on Microsoft Windows 10 or newer also have a built-in SSH client, which is available from the command line as `ssh`.

_Microsoft Windows 8 or older:_ If you are on Windows 8 or older, you do _not_ have a built-in SSH client.  If so, we recommend to install the <a href="http://www.putty.org/">PuTTY</a> SSH client, which has slightly different command-line interface but it has full SSH support.  Please consult the PuTTY documentation and user forums for further instructions.
Another alternative, which some might find easier, is to connect to the cluster using the <a href="{{ 'howto/gui-x11fwd.html' | relative_url }}">X2Go</a> software.


## Instructions

To log into the cluster, assuming your user name on {{ site.cluster.name }} is `alice` (case sensitive), do the following:

1. Open a terminal (called 'Terminal' on macOS and most Linux distributions, and 'Command Prompt' on Windows 10),

2. at the terminal prompt, type `ssh alice@{{ site.login.hostname }}` and press <kbd>ENTER</kbd>, and
3. when prompted, enter your {{ site.cluster.name }} password.


### Example

When logging in from your local computer, you should see something like:

```sh
{local}$ ssh alice@{{ site.login.hostname }}
alice1@{{ site.login.hostname }}:s password: XXXXXXXXXXXXXXXXXXX
[alice@{{ site.login.name }} ~]$ 
```


If you get `Permission denied, please try again.` when you enter your password, make sure you use the correct {{ site.cluster.name }} username (case sensitive) and the correct password.

<div class="alert alert-info" role="alert">
It is possible to set up password-less authentication via a public-private SSH key pair.  For details, see the how-to page <a href="{{ 'howto/log-in-without-pwd.html' | relative_url }}">Log in without Password</a>.
</div>


# What is available on the login node?

The login node is dedicated solely to very basic tasks such as copying and moving files on the shared file system, submitting jobs, and checking the status on existing jobs.  Note that most software tools are _not_ available on the login node, which means you can neither use it for prototyping scripts nor build software.  Instead, for such tasks, use a [development node], which is configured identically to the compute nodes.


# Logout

Like for all Unix-based system, to log out from {{ site.cluster.name }}, type `exit` or `logout` (standard Unix commands) and press <kbd>ENTER</kbd>.  For example,

```sh
[alice@{{ site.login.name }} ~]$ exit
Connection to {{ site.login.hostname }} closed.
{local}$ 
```

An alternative is to press <kbd>Ctrl-D</kbd> (sends "End-Of-File" [EOF]) at the command-line prompt.

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Any shell session that has been idle for more than eight hours will timeout and exit automatically.
</div>


[development node]: {{ '/get-started/development-prototyping.html' | relative_url }}
