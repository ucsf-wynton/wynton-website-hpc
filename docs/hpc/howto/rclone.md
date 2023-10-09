# Using rclone to mount `/wynton` filesystem

- install [MacFUSE](https://osxfuse.github.io/)
- install rclone from the [Downloads](https://rclone.org/downloads/) page
- set up a new "remote" with: `rclone config`
- set up a new ssh key
  - generate key with `ssh-keygen` command with​ a password/passphrase `~/.ssh % ssh-keygen -m PEM -f ~/.ssh/rclone_to_wynton`
  - 2 files should be generated, in this case named:
    - `rclone_to_wynton`
    - `rclone_to_wynton.pub`   
  - store the new key `rclone_to_wynton` in `~/.ssh/` on laptop/workstation
  - push the `.pub` file to wynton using: `$ ssh-copy-id -i ~/.ssh/rclone_to_wynton.pub alice@wynton.ucsf.edu`
    - note: replace `alice` with *your* Wynton username 

To create a new remote: run `rclone config`, in this example named `log1` and select `sftp` as the "Type of Storage":

```
name> log1
storage> sftp
host> log1.wynton.ucsf.edu
user> alice                         <-- enter *your* Wynton username
port> 22
key_file> ~/.ssh/rclone_to_wynton
Option key_file_pass.
The passphrase to decrypt the PEM-encoded private key file.
Only PEM encrypted key files (old OpenSSH format) are supported. Encrypted keys
in the new OpenSSH format can't be used.
Choose an alternative below. Press Enter for the default (n).
y) Yes, type in my own password
Enter the password:
password:
```

To mount `/wynton` you will need to be on the UCSF network or VPN, 
or have authenticated to Duo already that day and selected "Remember me for 12hrs" so rclone doesn't get prompted for the Duo password.

- in one terminal:

rclone mount by default runs in the foreground (there's a background option). But using the default in foreground, in one terminal window 
on laptop (log1 is the name of the "remote" in this example):

```
laptop ~ $ ./rclone mount log1:/ ./wynton
```

- in a separate terminal, now that Wynton's `/` directory is mounted:

```
$ ls -l wynton
drwxr-xr-x.   3 root root         1 Oct 22  2020 globus
drwxr-xr-x. 130 root root       130 Sep 20 14:05 group
drwxr-xr-x. 563 root root       561 Oct  5 17:22 home
drwxrwx---.   2 root root         0 Jul 23  2019 lost+found
drwxr-x---.   6 root wynton-phi   4 Aug 17  2022 protected
drwxrwxrwt. 105 root root       103 Oct  9 03:15 scratch
```

should now show the contents from the `/wynton` and look like a local directory on your laptop/workstation.

Depending what work you are doing you might want to just mount a directory from `/wynton/scratch/` or your home directory.

You should also then be able to run other rclone commands like `rclone lsd`, `rclone copy`, etc.
