# Graphical User Interfaces (GUI)

The {{ site.cluster.name }} environment supports running a graphical user interface (GUI) on {{ site.cluster.name }} while viewing and interacting with it on your local computer.  More specifically, and in more technical terms, {{ site.cluster.name }} supports X2Go and X11 Forwarding.

## X2Go

First, you will need to install the X2Go Client on your local computer.  For instructions on how to do this, see [Installing X2Go Client](https://wiki.x2go.org/doku.php/doc:installation:x2goclient). When you first run x2goclient:

 1. Use the menus to create a **New Session ...**
 2. Pick a **Session name**, e.g. `{{ site.cluster.name }}`
 3. Set the **Host** to a [development node]. Currently one of: `dev1`, `dev2`, `dev3`, or `gpudev1`
 4. Set the **Login** to _your_ {{ site.cluster.name }} username, e.g. `alice`
 5. Check **Use Proxy server for SSH connection**
 6. Then in the **Proxy server** section:
    - Check **Same login as on X2Go Server**
    - Check **Same password as on X2Go Server**
    - Set **Host** to a {{ site.cluster.name }} [login node]. Currently one of: `{{ site.login1.hostname }}` or `{{ site.login2.hostname }}`
 7. In the **Session type** section, choose `MATE`

Then to get a desktop on the development node, select the session, type in your password, and click **Ok**. After a little while, you will get a window that looks like an empty Linux desktop. Resize the window if you wish, and start up terminals, web browsers, etc. as you would on your regular desktop.

### 3D Graphics with X2Go (in alpha testing)

The X2Go client provides basic support for 3D applications with a software implementation of an ancient version of OpenGL.  On the GPU development nodes (*i.e.*, `gpudev1`), [VirtualGL](https://virtualgl.org/) is installed so you can use hardware accelerated 3D graphics.  All you need to do is:

 1. Opt-in by sending email to [{{ site.cluster.email_admin }}](mailto:{{ site.cluster.email_admin }}?subject=vglusers) with the subject `vglusers`
 2. Wait for confirmation that you have added to the `vglusers` group
 3. Use the `vglrun` program to run your program on a development node, either
    - by starting the application from a terminal (example below), or
    - by using a Wynton desktop shortcut, after editing it in your Wynton `~/Desktop` to have `vglrun` inserted before the program name on the **Exec=** line

For example:

```sh
[alice@{{ site.devel.name }} ~]$ vglrun your-program
```

You have to opt-in because there is a slight security risk.  See <https://virtualgl-users.narkive.com/KHab71sF/security-issues-for-virtualgl> case (2) for details.  Case (1) does not apply because all of the development nodes are headless.


## X11 Forwarding over SSH

You can also use X11 forwarding over the SSH connection used to connect to {{ site.cluster.name }}.  Note that, to do this, you will need to be running an X server on your local machine.  To setup the X11 forwarding, just add option `-X` to your SSH call, e.g.

```sh
{local}$ ssh -X alice@{{ site.login.hostname }}
alice1@{{ site.login.hostname }}:s password: XXXXXXXXXXXXXXXXXXX
[alice@{{ site.login.name }} ~]$ 
```

Now, since we should run anything on the login nodes, the next step is to head over to one of the development nodes.  When doing so, we have remember to keep using X11 forward, that is, we need to use `-X` also here;

```sh
[alice@{{ site.login.name }} ~]$ ssh -X {{ site.devel.hostname }}
alice1@{{ site.devel.name }}:s password: XXXXXXXXXXXXXXXXXXX
[alice@{{ site.devel.name }} ~]$ 
```

Now, we have an X11 forward setup that runs all the way back to our local computer.  This will allow us to open, for instance, an XTerm window that runs on {{ site.devel.hostname }} but can be interacted with on the local computer;

```sh
[alice@{{ site.devel.name }} ~]$ xterm
[ ... an XTerm window is opened up ... ]
```


[development node]: {{ '/about/specs.html' | relative_url }}#development-nodes
[login node]: {{ '/about/specs.html' | relative_url }}#login-nodes
