---
context:
  - login
---

# Graphical User Interfaces (GUI)

The {{ site.cluster.name }} environment supports running a graphical user interface (GUI) on {{ site.cluster.name }} while viewing and interacting with it on your local computer.  More specifically, and in more technical terms, {{ site.cluster.name }} supports NX and X11 Forwarding protocols.


## X2Go (Remote Desktop)

<div class="alert alert-danger" role="alert" markdown="1">

**X2Go does not work for GPU development nodes**. The symptom is that
the session disconnects after successful authentication.  The
workaround is to use the [X11 Forwarding] technique
instead. /2022-04-26

</div>


### Requirements

Due to limitation in X2Go Client, it is _not_ possible to connect to {{ site.cluster.name }}  _when using SSH password_(\*).  Instead, in order to connect to {{ site.cluster.nickname }} using the X2Go Client, you have to have a working [SSH key pair] set up and configured the X2Go Client. 

If you are connecting to {{ site.cluster.nickname }} from off campus, you will also have to use Two Factor Authentication (2FA) for {{ site.cluster.nickname }}.  This is _not_ needed if you are connected via the UCSF VPN.


### Setup of the X2Go Client (once)

First, you will need to install the X2Go Client on your local computer.  For instructions on how to do this, see [Installing X2Go Client](https://wiki.x2go.org/doku.php/doc:installation:x2goclient). When you first run x2goclient:

 1. Use the menus to create a **New Session ...**
 2. Pick a **Session name**, e.g. `{{ site.cluster.name }}`
 3. Set the **Host** to a [development node]: <span class="non-phi">`dev1`, `dev2`, `dev3`, or ~~`gpudev1`~~</span><span class="phi">`pdev1`, `pdev2`, or ~~`pgpudev1`~~</span>
 4. Set the **Login** to _your_ {{ site.cluster.name }} username, e.g. `alice`
 5. In the **Use RSA/DSA key for ssh connection**, enter the path to the your private SSH Key.
 6. Select **Try auto login (via SSH Agent or default SSH key)**
 7. Check **Use Proxy server for SSH connection**
 8. Then in the **Proxy server** section:
    - Check **Same login as on X2Go Server**
    - Check **Same password as on X2Go Server**
    - Set **Host** to a {{ site.cluster.name }} [login node]: <span class="non-phi">`{{ site.login1.hostname }}` or `{{ site.login2.hostname }}`</span><span class="phi">`p{{ site.login1.hostname }}`</span>
    - In the **RSA/DSA key:** field enter the path to your private SSH Key.
    - Select **SSH Agent or default SSH key**
 9. In the **Session type** section, choose `MATE`


### Logging in

With the above setup, the following instructions opens a remote desktop window on your local computer:

1. Launch the X2Go Client on your local machine
2. Double click the session configured (above)
3. Dialog **Enter Passphrase to decrypt a key**: _Enter ssh key passphrase, if set, otherwise just <kbd>ENTER</kbd>_
4. If connecting from an off-campus location and not already authenticated:
   - Dialog **Choose DUO Authentication Method**: _Perform Duo Authentication as prompted_
   - Dialog **Remember connection authentication for 12 hours? [y/N]**: _Answer y_ (this is important, it does _not_ work if you choose 'no')
6. Dialog **MATE on dev2**: _Enter your {{ site.cluster.name }} password_ (this happens for unknown reasons to _some_ users, even when using SSH keys)
7. Dialog **Enter passphrase to decrypt a key**: _Enter ssh key passphrase, if set_
8. Dialog **Enter passphrase to decrypt a key**: _Enter ssh key passphrase, if set_ (yes, twice)
9. Wait! It will take a long time before the MATE window to appear, looks like an empty Linux desktop. Resize the window if you wish, and start up terminals, web browsers, etc. as you would do on your regular desktop.


<div class="alert alert-warning" role="alert" markdown="1">
If you get a dialog saying '**Error: Connection failed. bash: x2golistsessions: command not found**', then you have missed configuring a 'Proxy server' in Steps 7-8 of Section 'Setup of the X2Go Client (once)'.
</div>



## X11 Forwarding over SSH

You can also use X11 forwarding over the SSH connection used to connect to {{ site.cluster.name }}.

### Verify that you have a working X11 server (once)

Note that, to do this, you will need to be running an X server on your local machine.  You can check this by verifying that environment variable `DISPLAY` is set on your local computer, e.g.

```sh
{local}$ echo "DISPLAY='$DISPLAY'"
DISPLAY=':0'
```

If `DISPLAY` is empty, that is, you get:

```sh
{local}$ echo "DISPLAY='$DISPLAY'"
DISPLAY=''
```

then you don't have a local X server set up and the below will _not_ work.  If you are on macOS, we recommend installing open-source [XQuartz].


### Log into the cluster with X11 forwarding

To setup the X11 forwarding when connecting to the cluster, add option `-X`, or `-Y` on macOS, to your SSH call. For performance reasons, we will also add option `-C` to enable SSH compression.  By using compression, the responsiveness and latency in GUIs will be much smaller - our benchmarks show a 5-7 times improvement when connected via the UCSF VPN (~60 Mbps download and ~5 Mbps upload).  To login with X11 forwarding and compression enabled, do:

```sh
{local}$ ssh -X -C alice@{{ site.login.hostname }}
alice1@{{ site.login.hostname }}:s password: XXXXXXXXXXXXXXXXXXX
[alice@{{ site.login.name }} ~]$ echo "DISPLAY='$DISPLAY'"
DISPLAY='localhost:20.0'
[alice@{{ site.login.name }} ~]$ 
```

By checking that `DISPLAY` is set, we know that X11 forwarding is in place.  If `DISPLAY` is empty, then make sure you have specified `-X` (or `-Y`).

<div class="alert alert-warning" role="alert" markdown="1">
If you are on macOS, you need to use `ssh -Y ...` instead of `ssh -X ...`. This is because macOS does not trust remote X servers by default.
</div>


### Log into a development node with X11 forwarding

Now, since we should not run anything on the login nodes, the next step is to head over to one of the development nodes.  When doing so, we have remember to keep using X11 forward, that is, we need to use `-X` also here;

```sh
[alice@{{ site.login.name }} ~]$ ssh -X {{ site.devel.hostname }}
alice1@{{ site.devel.name }}:s password: XXXXXXXXXXXXXXXXXXX
[alice@{{ site.devel.name }} ~]$ echo "DISPLAY='$DISPLAY'"
DISPLAY='localhost:14.0'
[alice@{{ site.devel.name }} ~]$ 
```

_Comment:_ There is no need to use SSH compression in this second step.  If used, it might even have a negative effect on the X11 latency.

Now, we have an X11 forward setup that runs all the way back to our local computer.  This will allow us to open, for instance, an XTerm window that runs on {{ site.devel.hostname }} but can be interacted with on the local computer;

```sh
[alice@{{ site.devel.name }} ~]$ xterm
[ ... an XTerm window is opened up ... ]
```

If you get an error here, make sure that `DISPLAY` is set and non-empty.


_Tips:_ You can login into a development node in a single call by "jumping" (`-J`) via the login node, e.g.

```sh
{local}$ ssh -X -C -J alice@{{ site.login.hostname }} alice@{{ site.devel.hostname }}
[alice@{{ site.devel.name }} ~]$ 
```


[X11 Forwarding]: /hpc/howto/gui-x11fwd.html#x11-forwarding-over-ssh
[VirtualGL]: https://virtualgl.org
[XQuartz]: https://www.xquartz.org
[development node]: /hpc/about/specs.html#development-nodes
[login node]: /hpc/about/specs.html#login-nodes
[SSH key pair]: /hpc/howto/log-in-without-pwd.html
