<div class="alert alert-info" role="alert">
These instructions are primarily written for Linux and macOS users.  If you are on Windows using the <a href="http://www.putty.org/">PuTTY</a> SSH client, the overall idea is similar.  Please consult the PuTTY user forums for further instructions.
</div>


# Login

The Wynton cluster can only be accessed from within the UCSF network via standard SSH.  If you are outside, make sure you are connected via the [UCSF VPN].


## Instructions

To log into the cluster, assuming your user name is `alice` (case sensitive), do the following:

1. open a terminal (called 'Terminal' on macOS and common Linux distributions), and
2. at the terminal prompt, type `ssh alice@{{ site.login.hostname }}` and press ENTER.
3. when prompted, enter your Wynton password.


## Example

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


[UCSF VPN]: https://it.ucsf.edu/services/vpn
