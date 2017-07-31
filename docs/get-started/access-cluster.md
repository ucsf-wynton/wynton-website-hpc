<div class="alert alert-info" role="alert">
These instructions are primarily written for Linux and macOS users.  If you are on Windows using the <a href="http://www.putty.org/">PuTTY</a> SSH client, the overall idea is similar.  Please consult the PuTTY user forums for further instructions.
</div>


# Login

The Wynton cluster can be accessed via standard SSH protocols.  Since access is restricted to computers on the UCSF network, make sure you are first connected via the [UCSF VPN], if you are outside.


## Instructions

To log into the cluster, assuming your user name is `alice` (case sensitive), do the following:

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
It is possible to set up password-less authenatication via an public-private SSH key pair.  For details, see the how-to page <a href="{{ 'howto/log-in-without-pwd.html' | relative_url }}">Log in without Password</a>.
</div>


# Logout

Like for all Unix-based system, to log out from Wynton, type `exit` or `logout` (standard Unix commands) and press ENTER.  For example,

```sh
[alice@{{ site.login.name }} ~]$ exit
Connection to {{ site.login.hostname }} closed.
{local}$ 
```


[UCSF VPN]: https://it.ucsf.edu/services/vpn
