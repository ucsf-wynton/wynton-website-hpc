---
context:
  - login
---


<!-- markdownlint-disable-file MD034 -->

# {{ site.cluster.name }} Credentials


<div class="alert alert-warning" role="alert" markdown="1">
**Please wait 5-10 minutes before attempting to login with your new password.**  This is because it takes up to 10 minutes before your new password has propagated to all machines on the cluster.
</div>

<div class="alert alert-info" role="alert" markdown="1">
We **strongly recommend** using a **password vault** application or website like the UCSF-provided [Keeper Password Vault] to generate and store your passwords.
</div>


## Change non-expired password

As long as your password has not yet expired, you can change your password ~~either~~ via our web interface~~, or from the {{ site.cluster.name }} command line~~.  Only passwords adhering to the Unified [UCSF Enterprise Password Standard] are accepted.  Attempts to update to an insufficient password will produce an informative error message.



### Alt 1. From the web browser

You can change your password before it expires using the 'RBVI Kerberos Web Interface' site;

1. Go to <https://www.cgl.ucsf.edu/admin/chpass.py>

2. To access the page, enter your current {{ site.cluster.name }}
   'Username' and 'Password' (must not be expired) in the browser
   pop-up panel

3. Upon successful login, you will reach the 'Resource for
   Biocomputing, Visualization, and Informatics' page, which allows
   you to set a new password

4. Wait 10 minutes for your new password to propagate before using it



### Alt 2. From the {{ site.cluster.nickname }} command line

<div class="alert alert-danger" role="alert" style="margin-top: 3ex" markdown="1">
2023-11-13: Changing password via the command line is currently not working.
</div>

If you can log in to {{ site.cluster.name }}, then you can change your credentials by calling `passwd` from one of the _login_ nodes, e.g.

```sh
[alice@{{ site.login.name }} ~]$ passwd
Changing password for user alice.
Kerberos 5 Password: 
New password: 
Retype new password: 
passwd: all authentication tokens updated successfully.
[alice@{{ site.login.name }} ~]$ 
```
Wait 10 minutes for your new password to propagate before using it.



## Verify credentials

After waiting for 10 minutes for your new password to propagate, you can verify your {{ site.cluster.nickname }} username and password using either of the below alternatives.  If neither works for you, you might have to reset your password.  If so, see below for instructions.


### Alt 1. Verify from your local command line using SSH

To test your {{ site.cluster.nickname }} credentials, try to [login to {{ site.cluster.name }} via SSH](/hpc/get-started/access-cluster.html).  If you have SSH keys set up, you can force SSH to ignore those and only accept password entries by using:

```r
{local}$ ssh -o PreferredAuthentications=password alice@{{ site.login.hostname }}
```

by replacing `alice` with your username.



### Alt 2. Verify via online service

Alternatively, you can verify your credentials from your browser:

1. Go to <https://www.cgl.ucsf.edu/admin/kerbtest.py> in your browser.  A popup panel titled 'Sign in https<span>://www.cgl.ucsf.edu</span>' is opened by the browser.

2. Enter your {{ site.cluster.nickname }} login credentials in the two fields 'Username' and 'Password' and click 'Sign in'.

3. If you entered correct credentials, you will get to a confirmation page saying so.  If you entered incorrect credentials, there will be no error message and the popup will appear again.


## Reset expired password

If your _{{ site.cluster.nickname }}_ password has expired, please email [{{ site.cluster.email_password }}](mailto:{{ site.cluster.email_password }}) to have it reset.

<div class="alert alert-danger" role="alert" style="margin-top: 3ex" markdown="1">
**Account are personal and login credentials must not be shared with others**. If detected, access to the account will be automatically disabled.  It is still possible and easy for multiple users to share and collaborate on the same folders and scripts.  Don't hesitate to ask if you don't know how to do this - we're here to help.
</div>

[Keeper Password Vault]: https://it.ucsf.edu/service/keeper-password-vault
[RBVI Kerberos web interface]: https://www.cgl.ucsf.edu/admin/chpass.py
[UCSF Enterprise Password Standard]: https://wiki.library.ucsf.edu/pages/viewpage.action?spaceKey=ITSI&title=Unified+UCSF+Enterprise+Password+Standard
