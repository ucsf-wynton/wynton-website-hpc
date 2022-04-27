# Work with RStudio

R is available on {{ site.cluster.name }} via a [contributed environment module]({{ '/software/software-repositories.html' | relative_url }}).  It can be run interactively in the terminal via `R` on a development node, as explain on the how-to '[Work with R]' page.  To run R via the RStudio IDE, there are two options:

1. The **RStudio Server** via the web browser (recommended)

2. The **RStudio Desktop** over X11 Forwarding

Running desktop applications over X11 forwarding works, but depending on your network connection, you will experience more or less lag. For instance, you might see a small delay between a key is pressed and it is echoed at the R prompt. Similarly, plotted graphics might take some time to render. This is also true for the RStudio Desktop. Because of this, we recommend running a personal RStudio Server instance, because that is designed to run remotely.

Regardless which one you use, you will be running the same version of R as you would when running from the terminal and all your installed packages will be available in either.


## Personal RStudio Server

You can run a personal RStudio Server instance, which you, and only you, can access via your local web browser.  Contrary to RStudio Desktop, this approach does not require X11 forwarding. Instead, it does require running _two_ separate SSH connections to the cluster: (i) one to launch RStudio Server, and (ii) one to connect to it.

### Step 1. Launch your own RStudio Server instance

Assuming you are already logged on to a development node, launch your personal RStudio Server instance as:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI rstudio-server-controller
[alice@{{ site.devel.name }} ~]$ rsc start
Your one-time random password for RStudio Server is y+IWo7rfl7Z7MRCPI3Z4
alice, your personal RStudio Server is available on
<http://{{ site.devel.hostname }}:47454>. If you are running from a
remote machine without direct access to {{ site.devel.hostname }},
you can use SSH port forwarding to access the RStudio Server at
<http://127.0.0.1:8787> by running
'ssh -L 8787:{{ site.devel.hostname }}:47454 alice@{{ site.login.hostname }}'
in a second terminal.
Any R session started times out after being idle for 120 minutes.
WARNING: You now have 10 minutes, until 2022-04-04 12:11:27-07:00,
to connect and log in to the RStudio Server before everything
times out.
```

There are two things you should pay extra attention to here:

1. The one-time random password that was generated

2. The instructions how to log in to the cluster with SSH port forwarding

You will need both below.



### Step 2. Connect to your personal RStudio Server instance

On your local computer, log into the cluster in a second terminal
following the instruction above.  Make sure to use your own username
and make sure to use the port number (e.g. `47454`) that
was assigned to you.

```sh
{local}$ ssh -L 8787:{{ site.devel.hostname}}:47454 alice@{{ site.login.hostname }}
alice1@{{site.login.hostname }}:s password: XXXXXXXXXXXXXXXXXXX
[alice@{{site.login.name }} ~]$
```

### Step 3. Open RStudio Server in your local web browser

If you successfully completed the above two steps, and you made sure to use the correct port, then you should be able to open your personal RStudio Server in your local web browser by going to:

* <http://127.0.0.1:8787/>

You will be presented with a 'Sign in to RStudio' web page where you need to enter:

1. Your cluster username (e.g. `alice`)
2. The one-time random password displayed in Step 1 (e.g. `y+IWo7rfl7Z7MRCPI3Z4`)

After clicking 'Sign In', you should be redirected to the RStudio interface.


To terminate the RStudio Server, start by exiting R by typing `quit()` at the R prompt. Then press <kbd>Ctrl-C</kbd> in the terminal where you called `rsc start`.  Alternatively, run `rsc stop` in another terminal, e.g. the second one used in Step 2.


## Streamlining Authenticating to Personal RStudio Server

If you find it tedious to copy and paste the SSH port forwarding string and the
one-time password each time you start RStudio Server, there's some optional
setup you can do to skip the former and specifiy a password for the latter.

### One-Time Setup
1. Find the random port number generated from your UID by running `rsc start`.
   The port number is the number between 1024 and 65535 after wynton.ucsf.edu.
   In the example below, the port number is <kbd>39312</kbd>:
```
❱ rsc start
alice, your personal RStudio Server is available on
<http://pdev1.wynton.ucsf.edu:39312>. If you are running from a remote machine
without direct access to pdev1.wynton.ucsf.edu, you can use SSH port forwarding
to access the RStudio Server at <http://127.0.0.1:8787> by running 'ssh -L
8787:pdev1.wynton.ucsf.edu:39312 alice@plog1.wynton.ucsf.edu' in a second
terminal.
```
2. Log out of Wynton and set up SSH port forwarding in your SSH config
   (`~/.ssh/config`) on your local machine.  We'll set up a login node as a
   jumphost and specify the port you identified in step 1 on the line starting
   with `LocalForward` when connecting to the dev node:
```
Host wynton-login
    Hostname plog1.wynton.ucsf.edu      # Login node
    User alice                          # Your username
Host wynton
    Hostname pdev1                      # Dev node of choice
    User alice                          # Your username
    ProxyJump wynton-login              # Log in to the login node before connecting to dev node
    LocalForward 8787 127.0.0.1:39312   # Forward port 39312 on login node to local port 8787
```

### Authenticating
Now, whenever you want to start RStudio server, from your local machine run `ssh
wynton` to connect to the dev node and invoke the `rsc start` command exporting
the `RSC_PASSWORD` env variable with a non-random password:
```
env RSC_PASSWORD='correct.horse.battery.staple' rsc start --port=39312
```

You can navigate to `localhost:8787` in a browser on your local machine and use
your Wynton username and the password you specified (in this case,
`correct.horse.battery.staple`) to sign in to RStudio Server.  While you will
still see the prompt suggesting you run the jumphost command (`ssh -L 8787...`)
you don't need to do this, nor do you need to copy and paste a temporary
password!
```
❱ env RSC_PASSWORD='correct.horse.battery.staple' rsc start --port=39312
alice, your personal RStudio Server is available on
<http://pdev1.wynton.ucsf.edu:39312>. If you are running from a remote machine
without direct access to pdev1.wynton.ucsf.edu, you can use SSH port forwarding
to access the RStudio Server at <http://127.0.0.1:8787> by running 'ssh -L
8787:pdev1.wynton.ucsf.edu:39312 alice@plog1.wynton.ucsf.edu' in a second
terminal.

Any R session started times out after being idle for 120 minutes.
```

## RStudio Desktop over X11 Forwarding

<div class="alert alert-warning" role="alert" markdown="1">
It is _not_ possible to run RStudio Desktop via X2Go, because X2Go does not support the modern graphical protocols that RStudio Desktop requires.
</div>

To run the RStudio Desktop client, you must be logged via [SSH with X11 forwarding enabled]. Then load the `rstudio` (Desktop) module from the CBI stack and launch `rstudio`:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI rstudio
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


[CBI software stack]: {{ '/software/software-repositories.html' | relative_url }}
[Work with R]: {{ '/howto/r.html' | relative_url }}
[SSH with X11 forwarding enabled]: {{ '/howto/gui-x11fwd.html#x11-forwarding-over-ssh' | relative_url }}
