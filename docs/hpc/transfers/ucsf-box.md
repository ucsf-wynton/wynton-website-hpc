---
context:
  - xfer
---

# Accessing UCSF Box

<div class="alert alert-danger" role="alert" style="margin-top: 3ex" markdown="1">
Although there is no hard quota in place on UCSF Box, the **storage is limited** and not really meant to store large data sets. There are reports that the UCSF Box maintainers have started to reach out to users who misuse it to store huge amounts of data. Please use it responsibly.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
**Below instructions work on _data transfer nodes_ only.** Attempts to use them on _development nodes_ will result in "Access failed: 401 Unauthorized" errors.
</div>

It is possible to access [UCSF Box](https://ucsf.app.box.com/) using FTP over a _secure_ SSL connection ([FTPS](https://en.wikipedia.org/wiki/FTPS)).  The below instructions works from the {{ site.cluster.name }} data-transfer nodes as well as your local computer.

It is also possible for UCSF Users to access [UCSF Box](https://ucsf.app.box.com/) via the [UCSF Wynton HPC Box Connector](https://app.globus.org/file-manager?destination_id=98d778c4-75a9-4d8d-8baa-68f71d6568c0). For details on how to utilize the UCSF Wynton HPC Box Connector see the [Globus File Transfers]( /hpc/transfers/globus.html ) page on our website.


## Prerequisites

In order to do access UCSF Box as describe below, you need to:

* Setup a **UCSF Box-specific password** in Box under [Account Settings -> Account](https://ucsf.app.box.com/account) as explained in <https://support.box.com/hc/en-us/articles/360043697414-Using-Box-with-FTP-or-FTPS>.


## Accessing UCSF Box over FTPS

With a **UCSF Box-specific password** (see above), you can use, for instance, the `lftp` or `curl` tools to access to your UCSF Box account.  Start by logging in to one of the data-transfer nodes, either directly from outside or via a login node, e.g.

```sh
[alice@{{ site.login.name }} ~]$ ssh {{ site.transfer.name }}
alice1@{{ site.transfer.name }}:s password: XXXXXXXXXXXXXXXXXXX
[alice@{{ site.transfer.name }} ~]$ 
```

Then, verify that your UCSF Box setup is correct by logging into the root of your UCSF Box folder using your **UCSF Box-specific password** (not your {{ site.cluster.name }} password):

```sh
[alice@{{ site.transfer.name }} ~]$ lftp --user {{ site.user.email }} ftps://ftp.box.com
Password: XXXXXXXX  <== UCSF Box password here!
lftp {{ site.user.email }}@ftp.box.com:~> ls
drwx------  1 owner group     0 Jun 12  2014 Grant_R01.pdf
drwx------  1 owner group     0 Sep 30  2016 Secure-{{ site.user.email }}
lftp {{ site.user.email }}@ftp.box.com:~> exit
[alice@{{ site.transfer.name }} ~]$ 
```

<div class="alert alert-danger" role="alert" style="margin-top: 3ex" markdown="1">
<span>🛑</span> **Never specify your password via a command-line argument! If you do, it will be visible to all other users via commands such as `ps` and `htop`.**
</div>


## Automatic authentication

When starting `lftp` as above, you need to manually enter your password, which can be tedious or even prevent automatic file transfers in batch scripts.  A solution to this is to set up the FTPS credentials in `~/.netrc`.  Here is what it could look like:
```sh
[alice@{{ site.transfer.name }} ~]$ cat ~/.netrc
machine ftp.box.com
        login {{ site.user.email }}
        password AliceSecretPwd2017
```

<div class="alert alert-danger" role="alert" style="margin-top: 3ex" markdown="1">
<span>🛑</span> **The `~/.netrc` file must be kept private, otherwise its content could be readable to other users.**
</div>

**Since the password is fully visible in plain text, make sure to keep this file private at all times**, otherwise users on the system can see all your credentials, i.e.

```sh
[alice@{{ site.transfer.name }} ~]$ chmod 600 ~/.netrc
[alice@{{ site.transfer.name }} ~]$ ls -l ~/.netrc
-rw------- 1 alice alice 72 Jul  3 15:10 {{ site.user.home }}/.netrc
```

To verify that the automatic authentication works, try to log in again. You should no longer be prompted for your password - instead `lftp` gets it automatically from `~/.netrc`.  For example:
```sh
[alice@{{ site.transfer.name }} ~]$ lftp --user {{ site.user.email }} ftps://ftp.box.com
lftp {{ site.user.email }}@ftp.box.com:~> ls
drwx------  1 owner group     0 Jun 12  2014 Grant_R01.pdf
drwx------  1 owner group     0 Sep 30  2016 Secure-{{ site.user.email }}
lftp {{ site.user.email }}@ftp.box.com:~> exit
$ 
```

Note that `curl` also recognizes `~/.netrc` credentials, e.g.
```sh
[alice@{{ site.transfer.name }} ~]$ curl --netrc -O ftps://ftp.box.com/Grant_R01.pdf
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 15.6M  100 15.6M    0     0  1561k      0  0:00:10  0:00:10 --:--:-- 3918k
[alice@{{ site.transfer.name }} ~]$ ls -la Grant_R01.pdf
-rw-r--r-- 1 alice cluster 16453180 Jul 10 21:13 Grant_R01.pdf
```

To upload a file, we can do:
 
```sh
[alice@{{ site.transfer.name }} ~]$ curl --netrc --upload-file notes.txt ftps://ftp.box.com/
```
