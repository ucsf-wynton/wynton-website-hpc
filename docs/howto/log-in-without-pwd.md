{% assign login_name = "wynton" %}
{% assign login_node = "wynton.ucsf.edu" %}
{% assign login_ip = "169.230.nnn.nnn" %}

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
These instructions are primarily written for Linux and macOS users.  If you are on Windows using the <a href="http://www.putty.org/">PuTTY</a> SSH client, the overall idea is similar but the setup is different.  Please consult the PuTTY user forums for further instructions.
</div>


### Step 1: Generate private-public SSH key pair (on local machine)

_On your local machine_, open a terminal.  If missing, create a private `~/.ssh/` folder:
```sh
{local}$ mkdir ~/.ssh
{local}$ chmod u=rwx,go= ~/.ssh
{local}$ stat --format=%A ~/.ssh
drwx------
```
_Explanation:_ The above `chmod` settings specify that you as a user (`u`) have read (`r`) and write (`w`) permissions for this directory.  In addition, you have executable (`x`) permission, which also means you can set it as your working directory.  Continuing, the settings also specify that other users in your group (`g`) as well as all other (`o`) users on the system have no access at all (empty permission).  The `stat` output consists of four parts: `d` tells us it is a directory, `rw-` specifies the permission for the user (`u`), and the following `---` and `---` specifies the permissions for the group (`g`), and all others (`o`), respectively.


Next, we will generate a private-public SSH key pair (stored in two files) that is unique for accessing the cluster:
```sh
{local}$ cd ~/.ssh   ## <== IMPORTANT
{local}$ ssh-keygen -f laptop_to_tipcc_20170720
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in laptop_to_tipcc_20170720
Your public key has been saved in laptop_to_tipcc_20170720.pub.
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
If you specify a passphrase, your local operating system will ask for the passphrase <em>the first time</em> you try to log in to the cluster.  All other login attempts will be passphrase (and password) free (until you reboot the machine).  This should work out of the box on macOS and most Linux distributions - on Windows you need to set up your SSH agent manually (or use an empty passphrase).  If you choose to use an empty passphrase, make sure that your machine is safe and use a highly secure local login password.
</div>

<div class="alert alert-danger" role="alert">
The public key you can safely share with the world, but <strong>treat your <em>private key</em> as a password; anyone who has access to it will have access to your account if it does not have a passphrase!</strong>
</div>


## Step 2: Add the public SSH key (on cluster)

Next, we will set up the cluster to recognize your public SSH key.  For this we will have to log in to the cluster, which requires that your machine is connected to the UCSF network, e.g. via the [USCF VPN].

First, assuming your cluster user name is `alice`, copy the public key file to `~/.ssh` on the cluster:
```sh
{local}$ scp ~/.ssh/laptop_to_tipcc_20170720.pub alice@{{ login_node }}:.ssh/
laptop_to_tipcc_20170720.pub           100%  390     0.4KB/s   00:00
```

Second, log into the cluster (still using a password):
```sh
{local}$ ssh -o PreferredAuthentications=password alice@{{ login_node }}
alice1@{{ login_ip }}\'s password: XXXXXXXXXXXXXXXXXXX
[alice@{{ login_name }} ~]$ cd .ssh
[alice@{{ login_name }} .ssh]$ cat laptop_to_tipcc_20170720.pub >> authorized_keys
[alice@{{ login_name }} .ssh]$ exit
{local}$ 
```


## Step 3: Test

You should now be able to log into the cluster from your local computer without having to enter the cluster password.  Try the following:
```sh
{local}$ ssh -o PreferredAuthentications=publickey -o IdentitiesOnly=yes -i ~/.ssh/laptop_to_tipcc_20170720 alice@{{ login_node }}
[alice@{{ login_name }} ~]$ 
```
You will be asked to enter your _passphrase_, if you chose one above.

If you get
```sh
Permission denied (publickey,gssapi-keyex,gssapi-with-mic,password).
```
then make sure you use the correct user name and that the file permissions on `~/.ssh` are correct both on your local machine (see Step 1).  If it still does not work, check the `~/.ssh` permissions on the cluster (analogously to Step 1).

The reason why we use `-o PreferredAuthentications=publickey -o IdentitiesOnly=yes` in the above test, is so that we can make sure no alternative login mechanisms than our SSH keypair are in play.  After having validated the above, you can now use:
```sh
{local}$ ssh -i ~/.ssh/laptop_to_tipcc_20170720 alice@{{ login_node }}
[alice@{{ login_name }} ~]$ 
```


## Step 4: Avoid having to specify SSH option `-i` (on local machine)

It is rather tedious having to specify what private key file to use (`-i ~/.ssh/laptop_to_tipcc_20170720`) each time you use SSH.  As a last step, we will set the default options for `alice@{{ login_node }}`.  On your local machine, add the following entry to `~/.ssh/config` (if you don't have the file, create it):
```
Host {{ login_node }}
  User alice
  IdentityFile ~/.ssh/laptop_to_tipcc_20170720
```

With all of the above, you should now be able to log in to the cluster using:
```sh
{local}$ ssh {{ login_node }}
[alice@{{ login_name }} ~]$ 
```

[USCF VPN]: https://it.ucsf.edu/services/vpn

