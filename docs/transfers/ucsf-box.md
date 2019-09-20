# Accessing UCSF Box

It is possible to access [UCSF Box](https://ucsf.app.box.com/) using FTP over a _secure_ SSL connection ([FTPS](https://en.wikipedia.org/wiki/FTPS)).

In order to do this, **you need to setup a UCSF Box-specific password** as 
explained in <https://ucsf.app.box.com/services/box_ftp_server>.  Afterward, you can use, for instance, the `lftp` client to verify access to your account;
```sh
{{ site.transfer.hostname }}$ lftp --user alice.aliceson@ucsf.edu ftps://ftp.box.com
Password: XXXXXXXX
lftp alice.aliceson@ucsf.edu@ftp.box.com:~> ls
drwx------  1 owner group     0 Jun 12  2014 Grant_R01.pdf
drwx------  1 owner group     0 Sep 30  2016 Secure-alice.aliceson@ucsf.edu
lftp alice.aliceson@ucsf.edu@ftp.box.com:~> exit
$ 
```

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Never specify your password via a command-line argument!  If you do, it will be visible to all other users via commands such as <code>ps</code> and <code>htop</code>.</strong>
</div>


## Automatic authentication

When starting `lftp` as above, you need to manually enter your password, which can be tedious or even prevent automatic file transfers in batch scripts.  A solution to this is to set up the FTP credentials in `~/.netrc`.  Here is what it could look like:
```
$ cat ~/.netrc
machine ftp.box.com
	login alice.aliceson@ucsf.edu
	password AliceSecretPwd2017
```

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong>The <code>~/.netrc</code> file must be kept private, otherwise its content could be readable to other users.</strong>
</div>

**Since the password is fully visible in plain text, make sure to keep this file private at all times**, otherwise users on the system can see all your credentials, i.e.
```sh
$ chmod 600 ~/.netrc
$ ls -l ~/.netrc 
-rw------- 1 alice alice 72 Jul  3 15:10 /home/alice/.netrc
```

To verify that the automatic authentication works, try to log in again. You should no longer be prompted for your password - instead `lftp` gets it automatically from `~/.netrc`.  For example:
```sh
$ lftp --user alice.aliceson@ucsf.edu ftps://ftp.box.com
lftp alice.aliceson@ucsf.edu@ftp.box.com:~> ls
drwx------  1 owner group     0 Jun 12  2014 Grant_R01.pdf
drwx------  1 owner group     0 Sep 30  2016 Secure-alice.aliceson@ucsf.edu
lftp alice.aliceson@ucsf.edu@ftp.box.com:~> exit
$ 
```

Note that `curl` also recognizes `~/.netrc` credentials, e.g.
```sh
$ curl --netrc -O ftps://ftp.box.com/Grant_R01.pdf
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 15.6M  100 15.6M    0     0  1561k      0  0:00:10  0:00:10 --:--:-- 3918k
$ ls -la Grant_R01.pdf
-rw-r--r-- 1 alice cluster 16453180 Jul 10 21:13 Grant_R01.pdf
```
