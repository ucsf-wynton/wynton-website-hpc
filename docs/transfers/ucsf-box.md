# Accessing UCSF Box

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
Although there is no hard quota in place on UCSF Box, the <strong>storage is limited</strong> and not really meant to store large data sets. There are reports that the UCSF Box maintainers have started to reach out to users who misuse it to store huge amounts of data. Please use it responsibly. /2020-01-27
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong>Below instructions work on <emph>data transfer nodes</emph> only.</strong> Attempts to use them on <emph>development nodes</emph> will result in "Access failed: 401 Unauthorized" errors.
</div>

It is possible to access [UCSF Box](https://ucsf.app.box.com/) using FTP over a _secure_ SSL connection ([FTPS](https://en.wikipedia.org/wiki/FTPS)).  The below instructions works from the {{ site.cluster.name }} data-transfer nodes as well as your local computer.


## Prerequisites

In order to do access UCSF Box as describe below, you need to:

* Setup a **UCSF Box-specific password** as explained in <https://ucsf.app.box.com/services/box_ftp_server>


## Accessing UCSF Box over FTPS

With a **UCSF Box-specific password** (see above), you can use, for instance, the `lftp` or `curl` tools to access to your UCSF Box account.  Start by logging in to one of the data-transfer nodes, either directly from outside or via a login node, e.g.

```sh
[alice@{{ site.login.name }} ~]$ ssh {{ site.transfer.name }}
alice1@{{ site.transfer.name }}:s password: XXXXXXXXXXXXXXXXXXX
[alice@{{ site.transfer.name }} ~]$ 
```

Then, verify that your UCSF Box setup is correct by logging into the root of your UCSF Box folder using your **UCSF Box-specific password** (not your {{ site.cluster.name }} password):

```sh
[alice@{{ site.transfer.name }} ~]$ lftp --user alice.aliceson@ucsf.edu ftps://ftp.box.com
Password: XXXXXXXX  <== UCSF Box password here!
lftp alice.aliceson@ucsf.edu@ftp.box.com:~> ls
drwx------  1 owner group     0 Jun 12  2014 Grant_R01.pdf
drwx------  1 owner group     0 Sep 30  2016 Secure-alice.aliceson@ucsf.edu
lftp alice.aliceson@ucsf.edu@ftp.box.com:~> exit
[alice@{{ site.transfer.name }} ~]$ 
```

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Never specify your password via a command-line argument!  If you do, it will be visible to all other users via commands such as <code>ps</code> and <code>htop</code>.</strong>
</div>


## Automatic authentication

When starting `lftp` as above, you need to manually enter your password, which can be tedious or even prevent automatic file transfers in batch scripts.  A solution to this is to set up the FTPS credentials in `~/.netrc`.  Here is what it could look like:
```sh
[alice@{{ site.transfer.name }} ~]$ cat ~/.netrc
machine ftp.box.com
        login alice.aliceson@ucsf.edu
        password AliceSecretPwd2017
```

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong>The <code>~/.netrc</code> file must be kept private, otherwise its content could be readable to other users.</strong>
</div>

**Since the password is fully visible in plain text, make sure to keep this file private at all times**, otherwise users on the system can see all your credentials, i.e.
```sh
[alice@{{ site.transfer.name }} ~]$ chmod 600 ~/.netrc
[alice@{{ site.transfer.name }} ~]$ ls -l ~/.netrc
-rw------- 1 alice alice 72 Jul  3 15:10 /home/alice/.netrc
```

To verify that the automatic authentication works, try to log in again. You should no longer be prompted for your password - instead `lftp` gets it automatically from `~/.netrc`.  For example:
```sh
[alice@{{ site.transfer.name }} ~]$ lftp --user alice.aliceson@ucsf.edu ftps://ftp.box.com
lftp alice.aliceson@ucsf.edu@ftp.box.com:~> ls
drwx------  1 owner group     0 Jun 12  2014 Grant_R01.pdf
drwx------  1 owner group     0 Sep 30  2016 Secure-alice.aliceson@ucsf.edu
lftp alice.aliceson@ucsf.edu@ftp.box.com:~> exit
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
