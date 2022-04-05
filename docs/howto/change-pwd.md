---
context:
  - login
---


<!-- markdownlint-disable-file MD034 -->

# {{ site.cluster.name }} Credentials

## Change password

<div class="alert alert-warning" role="alert">
<strong>Please wait 5-10 minutes before attempting to login with your new password.</strong>  This is because it takes up to 10 minutes before your new password has propagated to all machines on the cluster.
</div>

<div class="alert alert-warning" role="alert">
<strong>We strongly recommend using a password vault application like the UCSF campus provided "Keeper Password Vault" to store and keep track of your passwords.

[Keeper Password Vault](https://it.ucsf.edu/service/keeper-password-vault?check_logged_in=1)

</div>

You can change your password either via our web interface, or from the {{ site.cluster.name }} command line.  Only passwords adhering to the Unified [UCSF Enterprise Password Standard] are accepted.  Attempts to update to an insufficient password will produce an informative error message.



### From the web browser

You can change your password using the [RBVI Kerberos Web Interface].


### From the {{ site.cluster.nickname }} command line

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


## Verify credentials

To test your {{ site.cluster.nickname }} credentials, try to [login to {{ site.cluster.name }} via SSH]({{ '/get-started/access-cluster.html' | relative_url }}).  Alternatively, verify them from your browser:

1. Go to <https://www.cgl.ucsf.edu/admin/kerbtest.py> in your browser.  A popup panel titled 'Sign in https<span>://www.cgl.ucsf.edu</span>' is opened by the browser.

2. Enter your {{ site.cluster.nickname }} login credentials in the two fields 'Username' and 'Password' and click 'Sign in'.

3. If you entered correct credentials, you will get to a confirmation page saying so.  If you entered incorrect credentials, there will be no error message and the popup will appear again.


## Reset password

To reset your _{{ site.cluster.nickname }}_ password, contact the support staff at [{{ site.cluster.email_support }}](mailto:{{ site.cluster.email_support }}).

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Account are personal and login credentials must not be shared with others</strong>. If detected, access to the account will be automatically disabled.  It is still possible and easy for multiple users to share and collaborate on the same folders and scripts.  Don't hesitate to ask if you don't know how to do this - we're here to help.
</div>


[RBVI Kerberos web interface]: https://www.cgl.ucsf.edu/admin/chpass.py
[UCSF Enterprise Password Standard]: https://wiki.library.ucsf.edu/pages/viewpage.action?spaceKey=ITSI&title=Unified+UCSF+Enterprise+Password+Standard
