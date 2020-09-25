# Log in without Password

These instructions explains how to set up your local computer such that you can log into the compute cluster, or copy files to and from the cluster, without having to enter your password each time.


## Instruction

In summary, the steps are:

1. On your local computer: Generate private-public key pair
2. On the cluster: Add public key
3. On your local computer: Verify password-free access
4. On your local computer: Edit `~/.ssh/config` for setting default SSH options per remote host/server

Expected time: < 10 minutes.

<div class="alert alert-info" role="alert">
These instructions are primarily written for Linux, macOS, and Windows 10 users.  If you are on a pre-Windows 10, using the <a href="http://www.putty.org/">PuTTY</a> SSH client, the overall idea is similar.  Please consult the PuTTY user forums for further instructions.
</div>


### Step 1: Generate private-public SSH key pair (on local machine)

_On your local machine_, open a terminal.  If missing, create a private `~/.ssh/` folder:
```sh
{local}$ mkdir ~/.ssh
{local}$ chmod u=rwx,go= ~/.ssh
{local}$ stat --format=%A ~/.ssh
drwx------
```
_Explanation:_ The above `chmod` settings specify that you as a user (`u`) have read (`r`) and write (`w`) permissions for this directory.  In addition, you have executable (`x`) permission, which also means you can set it as your working directory.  Continuing, the settings also specify that other users in your group (`g`) as well as all other (`o`) users on the system have no access at all (empty permission).  The `stat` output, which confirms this, consists of four parts: `d` tells us it is a directory, `rw-` specifies the permission for the user (`u`), and the following `---` and `---` specifies the permissions for the group (`g`), and all others (`o`), respectively.


Next, we will generate a private-public SSH key pair (stored in two files) that is unique for accessing the cluster:
```sh
{local}$ cd ~/.ssh   ## <== IMPORTANT
{local}$ ssh-keygen -f laptop_to_wynton
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in laptop_to_wynton
Your public key has been saved in laptop_to_wynton.pub.
he key fingerprint is:
SHA256:2MpJL+I6rQbfhvLZAyC6fa6Y40yZhwG+FYOiHCQ94Fw alice@my_laptop
The key\'s randomart image is:
+---[RSA 2048]----+
|o+ E             |
|= =              |
|o= +             |
|O . o  o         |
|+= .  o S        |
|o O  o +         |
| @ *. = .        |
|*oB+*. .         |
|+B*O+.           |
+----[SHA256]-----+
```
<div class="alert alert-info" role="alert">
If you specify a passphrase, your local operating system will ask for the passphrase <em>the first time</em> you try to log in to the cluster.  All other login attempts will be passphrase (and password) free (until you reboot the machine).  This should work out of the box on macOS and most Linux distributions - on Windows you need to set up your SSH agent manually (or use an empty passphrase).  If you choose to use an empty passphrase, make sure that your machine is safe and uses a highly secure local login password.
</div>

<div class="alert alert-danger" role="alert">
The public key you can safely share with the world, but <strong>treat your <em>private key</em> as a password; anyone who has access to it will have access to your account if it does not have a passphrase!</strong>
</div>


## Step 2: Add the public SSH key (on cluster)

Next, we will set up the cluster to recognize your public SSH key.  Assuming your cluster user name is `alice` in the cluster, the goal is to append the content of the _public_ key file to `~/.ssh/authorized_keys` on the cluster.  There are two ways this can be done.

**Alternative 1**: If you have the `ssh-copy-id` tool installed on your local computer, then use:

```sh
{local}$ ssh-copy-id -i ~/.ssh/laptop_to_wynton.pub alice@{{ site.login.hostname }}
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/alice/.ssh/laptop_to_wynton.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
alice@{{ site.login.hostname }}:s password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'alice@{{ site.login.hostname }}'"
and check to make sure that only the key(s) you wanted were added.

{local}$
```

Done.



**Alternative 2**: If you don't have `ssh-copy-id`, you will have to copy the _public_ key file over to the cluster, log in, append it to the target file, and validate file permissions.  Assuming you already have a `~/.ssh` folder on the cluster, first copy the public key file to `~/.ssh` on the cluster:
```sh
{local}$ scp ~/.ssh/laptop_to_wynton.pub alice@{{ site.login.hostname }}:.ssh/
laptop_to_wynton.pub           100%  390     0.4KB/s   00:00
```

Then, log into the cluster (still using a password) and _append_ the public key to `~/.ssh/authorized_keys`:
```sh
{local}$ ssh -o PreferredAuthentications=password alice@{{ site.login.hostname }}
alice1@{{ site.login.ip }}\'s password: XXXXXXXXXXXXXXXXXXX
[alice@{{ site.login.name }} ~]$ cd .ssh
[alice@{{ site.login.name }} .ssh]$ cat laptop_to_wynton.pub >> authorized_keys
```
Finally, make sure that `~/.ssh/authorized_keys` is only accessible to you (otherwise that file will be completely ignored);
```sh
[alice@{{ site.login.name }} .ssh]$ chmod u=rw,go= ~/.ssh/authorized_keys
[alice@{{ site.login.name }} .ssh]$ stat --format=%A ~/.ssh/authorized_keys
-rw-------
```
Lastly, log out from the cluster:
```sh
[alice@{{ site.login.name }} .ssh]$ exit
{local}$ 
```

Done.


## Step 3: Test

You should now be able to log into the cluster from your local computer without having to enter the cluster password.  Try the following:
```sh
{local}$ ssh -o PreferredAuthentications=publickey -o IdentitiesOnly=yes -i ~/.ssh/laptop_to_wynton alice@{{ site.login.hostname }}
[alice@{{ site.login.name }} ~]$ 
```
You will be asked to enter your _passphrase_, if you chose one above.

If you get
```sh
Permission denied (publickey,gssapi-keyex,gssapi-with-mic,password).
```
then make sure you use the correct user name and that the file permissions on `~/.ssh` are correct on your local machine (see Step 1).  If it still does not work, check the `~/.ssh` permissions on the cluster (analogously to Step 1).

The reason why we use `-o PreferredAuthentications=publickey -o IdentitiesOnly=yes` in the above test, is so that we can make sure no alternative login mechanisms than our SSH keypair are in play.  After having validated the above, these options can be dropped and you can now use:
```sh
{local}$ ssh -i ~/.ssh/laptop_to_wynton alice@{{ site.login.hostname }}
[alice@{{ site.login.name }} ~]$ 
```


## Step 4: Avoid having to specify SSH option `-i` (on local machine)

It is rather tedious having to specify what private key file to use (`-i ~/.ssh/laptop_to_wynton`) each time you use SSH.  As a last step, we will set the default options for `alice@{{ site.login.hostname }}`.  On your local machine, add the following entry to `~/.ssh/config` (if you don't have the file, create it):
```lang-none
Host {{ site.login.hostname }}
  User alice
  IdentityFile ~/.ssh/laptop_to_wynton
```

With all of the above, you should now be able to log in to the cluster using:
```sh
{local}$ ssh {{ site.login.hostname }}
[alice@{{ site.login.name }} ~]$ 
```

[UCSF VPN]: https://it.ucsf.edu/services/vpn
