# Graphical User Interfaces (GUI)

The Wynton HPC environment supports running a graphical user interface (GUI) on Wynton HPC while viewing and interacting with it on your local computer.  More specifically, and in more technical terms, Wynton HPC supports X2Go and X11 Forwarding.

## X2Go

First, you will need to install the X2Go client on your local computer.  For instructions on how to do this, see [Installing X2Go Client](https://wiki.x2go.org/doku.php/doc:installation:x2goclient). When you first run x2goclient:

  *   Use the menus to create a **New Session**.
  *   Pick a **Session name**, like **Wynton**
  *   Set the **Host** to a [development node](https://ucsf-hpc.github.io/wynton/get-started/development-prototyping.html). Currently one of:
     *   qb3-dev1.wynton.ucsf.edu,
     *   qb3-dev2.wynton.ucsf.edu,
     *   qb3-dev3.wynton.ucsf.edu, or
     *   qb3-gpudev1.wynton.ucsf.edu
  *   Set the **Login** to your login name.
  *   Set **Use Proxy server for SSH connection**
  *   Then in the **Proxy server** section:
     *   Set **Same login as on X2Go Server**
     *   Set **Same password as on X2Go Server**
     *   Set **Host** to a login host. Currently one of:
        *   log1.wynton.ucsf.edu, or
        *   log2.wynton.ucsf.edu
  *   In the **Session type** section, choose **MATE**

Then to get a desktop on the development node, select the session, type in your password, and click **Ok**. After a little while, you will get a window that looks like an empty Linux desktop. Resize the window if you wish, and start up terminals, web browsers, etc. as you would on your regular desktop.


## X11 Forwarding over SSH

You can also use X11 Forwarding over the SSH connection used to connect to Wynton HPC.  Note that, to do this, you will need to be running an X server on your local machine.  To setup the X11 forwarding, just add option `-X` to your SSH call, e.g.

```r
{local}$ ssh -X alice@{{ site.login.hostname }}
alice1@{{ site.login.hostname }}:s password: XXXXXXXXXXXXXXXXXXX
[alice@{{ site.login.name }} ~]$ 
```

Now, since we should run anything on the login nodes, the next step is to head over to one of the development nodes.  When doing so, we have remember to keep using X11 Forward, that is, we need to use `-X` also here;

```sh
[alice@{{ site.login.name }} ~]$ ssh -X {{ site.devel.hostname }}
alice1@{{ site.devel.name }}:s password: XXXXXXXXXXXXXXXXXXX
[alice@{{ site.devel.name }} ~]$ 
```

Now, we have an X11 Forward setup that runs all the way back to our local computer.  This will allow us to open, for instance, an XTerm window that runs on {{ site.login.name }} but can be interacted with on the local computer;

```sh
[hb-test@qb3-dev3 ~]$ xterm
[ ... an XTerm window is opened up ... ]
```
