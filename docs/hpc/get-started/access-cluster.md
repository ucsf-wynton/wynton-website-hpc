---
title: Wynton HPC Login & Logout
context:
  - login
---

<div class="alert alert-danger" role="alert" style="margin-top: 3ex" markdown="1">
**Account are personal and login credentials must not be shared with others**. If detected, access to the account will be automatically disabled.  It is still possible and easy for multiple users to share and collaborate on the same folders and scripts.  Don't hesitate to ask if you don't know how to do this - we're here to help.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
**Access to {{ site.cluster.name }} from outside of the UCSF network requires two-factor authentication (2FA).**
If you are on the UCSF VPN, you have already authenticated and no further 2FA is required.
In all other cases, you will be prompted to authenticate through a Wynton-specific 2FA method when SSH:ing directly to the cluster.  See [Two-Factor Authentication for SSH](/hpc/get-started/duo-signup.html) for instructions.
</div>

<!-- markdownlint-disable-file MD025 -->

# Login

To access the {{ site.cluster.name }} cluster you need an account - any UCSF affiliate can get an [account](/hpc/about/join.html).  Anyone with a {{ site.cluster.name }} account, can access the cluster via _Secure Shell (SSH)_.


## Prerequisites

The instructions below requires that you:

* have an SSH client available on your local computer

* have a {{ site.cluster.name }} account _(not the same as your UCSF
  account)_

* know your {{ site.cluster.name }} username _(not the same as your
  UCSF password)_

* know your {{ site.cluster.name }} password _(not the same as your
  UCSF password)_

* know whether you have a PHI or non-PHI {{ site.cluster.name }}
  account _(you only have a PHI account if you requested it)_

Users on Linux, macOS, and MS Windows have an SSH client built-in, which is available from the terminal as `ssh`. We will use that one in all our examples. You can also use other SSH clients if you prefer, include [PuTTY] on MS Windows. If you choose to use another SSH client, consult that program's documentation for further instructions. Another alternative, which some might find easier, is to connect to the cluster using the [X2Go] software.


<div class="alert alert-warning" role="alert" style="margin-top: 3ex; font-size: 150%;" markdown="1">
  
  **Problem logging in?**  It might be that you have a PHI account,
  but you try to log into a non-PHI login node.  Set the following
  switch to tailor the instructions on the website to PHI users:
  
  <div style="padding: 0.1ex">
    <span style="font-size: 200%; vertical-align: middle; padding-right: 1ex;">👉</span>
    <span style="vertical-align: middle">
      Non-PHI <label class="switch" title="View site as a Non-PHI or PHI user">
        <input type="checkbox" id="toggle-phi-2">
        <span class="slider round"></span>
      </label> PHI
    </span>
  </div>
</div>


## Instructions

<div class="alert alert-info" role="alert" markdown="1">
**If this is the first time you access {{ site.cluster.name }} and you are outside of the UCSF network, we recommend that you first log onto the UCSF VPN before continuing below.**  This avoids having to deal with {{ site.cluster.nickname }}'s two-factor authentication that is otherwise required when accessing the cluster from outside of the UCSF.  Note that this advice is just to get you started.  In the long run, you do not want to be on the very bandwidth-limited UCSF VPN if you are transferring large amounts of files to and from Wynton to your local machine.
</div>

To log into the cluster, assuming your user name on {{ site.cluster.name }} is `alice` (case sensitive), do the following:

1. For first-timers outside of the UCSF network, log onto the UCSF VPN,

2. open a terminal ('Terminal' on macOS and most Linux distributions, and 'Windows Console' [old] or 'Windows Terminal' [modern] on MS Windows),

3. at the terminal prompt, type `ssh alice@{{ site.login.hostname }}` and press <kbd>ENTER</kbd>, and

4. when prompted, enter your {{ site.cluster.name }} password.


### Example

When logging in from your local computer, you should see something like:

```sh
{local}$ ssh alice@{{ site.login.hostname }}
alice@{{ site.login.hostname }}:s password: 
[alice@{{ site.login.name }} ~]$ 
```

Note, when typing your password, there will be _no_ visual feedback at
all, but the system will still receive what you type, so just press
<kbd>ENTER</kbd> afterward.

If you get `Permission denied, please try again.` when you enter your password, make sure you use the correct {{ site.cluster.name }} username (case sensitive) and the correct password.

<div class="alert alert-info" role="alert" markdown="1">
It is possible to set up password-less authentication via a public-private SSH key pair.  For details, see the how-to page [Log in without Password].
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

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
Any shell session that has been idle for more than eight hours will timeout and exit automatically.
</div>

<script type="application/javascript">
  function getIP(json) {
    document.write("Your public IP address is ", json.ip);
  }
</script>
<script type="application/javascript" src="https://ipinfo.io/?format=jsonp&callback=getIP"></script>


[PuTTY]: https://www.putty.org/
[development node]: /hpc/get-started/development-prototyping.html
[X2Go]: /hpc/howto/gui-x11fwd.html
[Log in without Password]: /hpc/howto/log-in-without-pwd.html
