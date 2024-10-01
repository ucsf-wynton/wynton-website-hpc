# Work with RStudio

R is available on {{ site.cluster.name }} via a [contributed environment module](/hpc/software/software-repositories.html).  It can be run interactively in the terminal via `R` on a development node, as explain on the how-to '[Work with R]' page.  To run R via the RStudio IDE, there are two options:

1. The **RStudio Server** via the web browser (recommended)

2. The **RStudio Desktop** over X11 Forwarding (deprecated as of April 2024)

Running desktop applications over X11 forwarding works, but depending on your network connection, you will experience more or less lag. For instance, you might see a small delay between a key is pressed and it is echoed at the R prompt. Similarly, plotted graphics might take some time to render. This is also true for the RStudio Desktop. Because of this, we recommend running a personal RStudio Server instance, because that is designed to run remotely.

Regardless which one you use, you will be running the same version of R as you would when running from the terminal and all your installed packages will be available in either.


## Alt 1. Personal RStudio Server

<div class="alert alert-warning" role="alert" markdown="1">

An RStudio Server session will time out after 120 minutes of no user input. This is to make sure there are forgotten, left-over processes running on the system. For R tasks running longer than this, the solution is to submit them via the scheduler.

</div>

You can run a personal RStudio Server instance, which you, and only you, can access via your local web browser.  Contrary to RStudio Desktop, this approach does not require X11 forwarding. Instead, it does require running _two_ separate SSH connections to the cluster: (i) one to launch RStudio Server, and (ii) one to connect to it.

### Step 1. Launch your own RStudio Server instance

Assuming you are already logged on to a development node, launch your personal RStudio Server instance as:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI rstudio-server-controller
[alice@{{ site.devel.name }} ~]$ rsc start
alice, your personal RStudio Server 2023.09.1-494 running R 4.3.2 is available on:

  <http://127.0.0.1:20612>

Importantly, if you are running from a remote machine without direct access
to {{ site.devel.name }}, you need to set up SSH port forwarding first, which you can do by
running:

  ssh -L 20612:{{ site.devel.name }}:20612 alice@{{ site.login.hostname }}

in a second terminal from your local computer.

Any R session started times out after being idle for 120 minutes.
WARNING: You now have 10 minutes, until 2023-11-15 17:06:50-08:00, to
connect and log in to the RStudio Server before everything times out.
Your one-time random password for RStudio Server is: y+IWo7rfl7Z7MRCPI3Z4
```

There are two things you should pay extra attention to here:

1. The one-time random password that was generated

2. The instructions how to log in to the cluster with SSH port forwarding

You will need both below.



### Step 2. Connect to your personal RStudio Server instance

On your local computer, log into the cluster in a second terminal
following the instruction above.  Make sure to use your own username
and make sure to use the port number (e.g. `20612`) that
was assigned to you.

```sh
{local}$ ssh -L 20612:{{ site.devel.hostname}}:20612 alice@{{ site.login.hostname }}
alice1@{{site.login.hostname }}:s password: XXXXXXXXXXXXXXXXXXX
[alice@{{site.login.name }} ~]$ 
```

### Step 3. Open RStudio Server in your local web browser

If you successfully completed the above two steps, and you made sure to use the correct port, then you should be able to open your personal RStudio Server in your local web browser by going to:

* <http://127.0.0.1:20612/> (note, your port is different)

You will be presented with a 'Sign in to RStudio' web page where you need to enter:

1. Your cluster username (e.g. `alice`)
2. The one-time random password displayed in Step 1 (e.g. `y+IWo7rfl7Z7MRCPI3Z4`)

After clicking 'Sign In', you should be redirected to the RStudio interface.


To terminate the RStudio Server, start by exiting R by typing `quit()` at the R prompt. Then press <kbd>Ctrl-C</kbd> in the terminal where you called `rsc start`.  Alternatively, run `rsc stop` in another terminal, e.g. the second one used in Step 2.



## Alt 2. RStudio Desktop over X11 Forwarding [DEPRECATED]

<div class="alert alert-warning" role="alert" markdown="1">

2024-08-30: Contrary to the above RStudio Server solution, the RStudio
Desktop client below is no longer maintained as of April 2024.  It
will eventually become defunct. The above RStudio Server approach
works equally well, and in more situations. Dropping the RStudio
Desktop lowers the maintenance burden for the CBI software maintainer.

</div>

<div class="alert alert-warning" role="alert" markdown="1">

It is _not_ possible to run RStudio Desktop via X2Go, because X2Go
does not support the modern graphical protocols that RStudio Desktop
requires. If you try, you will get an error from RStudio saying that
"GLX 1.3 or later is required."

</div>

To run the RStudio Desktop client, you must be logged via [SSH with X11 forwarding enabled]. Then load the `rstudio` (Desktop) module from the CBI stack and launch `rstudio`:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI rstudio
Lmod Warning:  [DEPRECATION WARNING] The CBI 'rstudio/2024.04.2-764'           
module is deprecated in favor of 'rstudio-server'; please use that module      
instead
While processing the following module(s):                                      
    Module fullname        Module Filename                                     
    ---------------        ---------------                                     
    rstudio/2024.04.2-764  /wynton/home/cbi/shared/modulefiles/CBI/rstudio/2024.
04.2-764.lua 

[alice@{{ site.devel.name }} ~]$ rstudio
TTY detected. Printing informational message about logging configuration.
Logging configuration loaded from '/etc/rstudio/logging.conf'. Logging to
'{{ site.user.home }}/.local/share/rstudio/log/rdesktop.log'.
```

You should see the RStudio Desktop interface appear after a few seconds.
If you get a blank window, which some macOS users have reported, retry with:

```sh
[alice@{{ site.devel.name }} ~]$ QMLSCENE_DEVICE=softwarecontext rstudio
```

To exit the RStudio Desktop, type `quit()` at the R prompt, or press <kbd>Ctrl-C</kbd> in the above terminal.


## Troubleshooting

### Stuck at "R is taking longer to start than usual"?

Some users report that they stuck when they try to log in to RStudio.
After they enter their username and password, and click 'Sign In',
they get to a page "R is taking longer to start than usual" with a
spinner that never ends.  The user is presented with three options
'Reload', 'Safe Mode', and 'Terminate R'.  Ideally, 'Safe Mode' or
'Terminate R' would solve the problem and let the user access the
RStudio GUI.  Unfortunately, for some users, none of these options
help.  Consecutive attempts to use `rsc stop` and `rsc start` fail for
same reasons.

As of 2023-12-04, it is not clear why and when this happens.  The
one workaround we have found is to wipe the user's RStudio setup.
For this, we recommend to use:

```sh
$ tar -cvf ~/rstudio-config.tar ~/.local/share/rstudio && rm -rf ~/.local/share/rstudio
```

This will create a local copy of your problematic RStudio setup in
file `~/rstudio-config.tar`, and, only then, remove the actually
settings.  The next time you call `rsc start`, you should start out
with a fresh RStudio setup, and the login issue should be gone.


### ERROR: Failed to check process PID 12345 on {{ site.dev1.hostname }} over SSH

If you get the following error when launching `rsc start`:

```sh
[alice@{{ site.dev2.name }} ~]$ rsc start
WARNING: Needs to SSH to {{ site.dev1.hostname }} to check whether process 2132343
is still alive [{{ site.user.home }}/.config/rsc/rserver.hostname:
21 bytes; 2024-09-28 15:56:13)]. If you don't have SSH key authentication set up,
you will be asked to enter your account password below. The current machine is
{{ site.dev2.hostname }}
ERROR: Failed to check process PID 2132343 on {{ site.dev1.hostname }} over SSH. 
Reason was: ssh: connect to host {{ site.dev1.hostname }} port 22: No route to host
```

the reason is that `rsc start` tries to protect against launching more
than one RStudio session at the same time on different machines. In
order to confirm that you already running another RStudio session on
another machine, it needs to access that machine via SSH, but if that
fails you get the above error.

To troubleshoot this, start by making sure you can SSH to {{
site.dev1.hostname }}. (1) If you can login manually, do that and call
`rsc stop` there. This should resolve the above problem.  (2) If you
cannot access the machine, it could be that you have exhausted your
CPU quota on that machine and it is very slow to respond. If you
suspect this is the case, see 'Running out of memory' below.  It could
also be that the machine is not working or down, which is rare, but it
happens. If it is down, it's most likely already discussed on our
[Slack forum] - please check there to confirm it is truly down.  In
the rare case that the machine is really down, try to call `rsc reset`
and the retry with `rsc start`.  If you still get the above error,
retry with `rsc reset --full`.



### Running out of memory

If you get an 'R Session Error' dialog saying:

> The previous R session was abnormally terminated due to an
> unexpected crash.
> 
> You may have lost workspace data as a result of this crash.
> 
> RStudio may not have restored the previously active project as a
> precaution. You may switch back to it using the Projects menu.
>
> [OK]

one reason is that you ran out of memory and R was terminated by the
operating system.  Note that each user is limited to 96 GiB of RAM on
the development node. Trying to use more than that, will cause the
operating system to kill the underlying R process. When this happens,
RStudio will likely keep running, but your R session was lost and
reset.


[Slack forum]: /hpc/support/
[CBI software stack]: /hpc/software/software-repositories.html
[Work with R]: /hpc/howto/r.html
[SSH with X11 forwarding enabled]: /hpc/howto/gui-x11fwd.html#x11-forwarding-over-ssh
