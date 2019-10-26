# SGE and Shell EXIT Traps

Shell traps can be used to execute a sequence of shell commands upon certain conditions or signals.  For example, the 'EXIT' trap can be used to perform clean up tasks or similar when a shell script terminates even due to errors.  See `man trap` for details.

Below is an example script `trap_exit.sh` that outputs "EXIT trap called" to the standard error when it terminates:

```sh
#! /usr/bin/sh

trap '{ >&2 echo "EXIT trap called" ; }' EXIT

echo "Going to sleep ..."
sleep 60

# Exit script
{ >&2 echo "ERROR: boom! Exiting ..."; exit 1; }

echo "This line will never be reached"
```

If we call this script, we'll get after 60 seconds:
```r
$ ./trap_exit.sh
Going to sleep ...
ERROR: boom! Exiting ...
EXIT trap called

$ 
```

## Known limitations

The EXIT trap is also called when the processed is terminated by other means, e.g. using `kill`, e.g. `kill -TERM <PID>` or equivalently `kill -15 <PID>`.  However, the EXIT trap will _not_ be called when it is killed using `SIGKILL` (signal level 9) because such signals can _not_ be intercepted.


## Using EXIT traps with SGE jobs

Unfortunately, SGE uses [SIGKILL to terminate jobs](http://gridengine.org/pipermail/users/2014-January/007103.html) _by default_, which means that EXIT traps will not be called.  For example, if we submit `trap_exit.sh`:

```sh
$ qsub -cwd -j yes trap_exit.sh
Your job 8738186 ("trap_exit.sh") has been submitted
```
wait for the job to start, and then kill it:
```sh
$ qdel 8738186
alice has registered the job 8738186 for deletion
```
we see that the EXIT trap was _never_ called:
```sh
$ cat trap_exit.sh.o8738186
Going to sleep ...
```

Fortunately, there is way to fix this.  **Submit the job with `qsub` option `-notify`** (see `man qsub`).  This will cause SGE to first send a `SIGUSR2` signal to the job process, wait _60 seconds_, before it sends the ultimate `SIGKILL` signal.  **That first `SIGUSR2` signal will trigger the EXIT trap.**  For example, if we instead submit using:

```sh
$ qsub -cwd -j yes -notify trap_exit.sh
Your job 8738208 ("trap_exit.sh") has been submitted
```
wait for the job to start, and then kill it, we see that the EXIT trap was _indeed_ called:
```sh
$ cat trap_exit.sh.o8738208
Going to sleep ...
EXIT trap called
```

This will also work when SGE terminates a job process that consumes more resources or run longer than allowed.  For example, if we submit our script with a maximum run time of 10 seconds, it will be terminated too:

```sh
$ qsub -cwd -j yes -l h_rt=10 -notify trap_exit.sh
Your job 8738217 ("trap_exit.sh") has been submitted
```

From the output logs, we see:
```sh
$ cat trap_exit.sh.oe8738208
Going to sleep ...
EXIT trap called
```
