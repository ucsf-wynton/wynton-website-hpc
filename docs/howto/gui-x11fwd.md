# Graphical User Interfaces (GUI)

The Wynton HPC environment supports running a graphical user interface (GUI) on Wynton HPC while viewing and interacting with it on your local computer.  More specifically, and iIn more technical terms, Wynton HPC supports X11 Forwarding.


## X11 Forwarding over SSH

The simplest way of running a GUI is to use X11 Forwarding over the SSH connection used to connect to Wynton HPC.  To do this, just add option `-X` to your SSH call, e.g.

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
