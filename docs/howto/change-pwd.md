# Wynton Credentials

## Change password

To change your Wynton credentials, log into the cluster and call `kpasswd` from one of the _login_ nodes, e.g.

```sh
[alice@{{ site.login.name }} ~]$ kpasswd
Password for alice@CGL.UCSF.EDU: 
Enter new password: 
Enter it again: 
Password changed.
[alice@{{ site.login.name }} ~]$ 
```

Only passwords adhering to the Unified [UCSF Enterprise Password Standard] are accepted.  Attempts to update to an insufficient password will produce an informative error message.

Alternatively, you can change your password using the [RBVI Kerberos Web Interface].

<div class="alert alert-warning" role="alert">
Please note that it takes up to 10 minutes before your new password has propagated to all machines on the cluster.
</div>


## Verify credentials

To test your Wynton credentials, try to [login to Wynton via SSH]({{ '/get-started/access-cluster.html' | relative_url }}).  Alternatively, verify them from your browser:

1. Go to [https://www.cgl.ucsf.edu/admin/kerbtest.py](https://www.cgl.ucsf.edu/admin/kerbtest.py) in your browser.  A popup panel titled 'Sign in https://www.cgl.ucsf.edu' is opened by the browser.

3. Enter your Wynton login credentials in the two fields 'Username' and 'Password' and click 'Sign in'.

4. If you entered correct credentials, you will get to a confirmation page saying so.  If you entered incorrect credentials, there will be no error message and the popup will appear again.


## Reset password

To reset your _Wynton_ password, contact the admins at [wynton_admin@ucsf.edu]([wynton_admin@ucsf.edu).

[RBVI Kerberos web interface]: https://www.cgl.ucsf.edu/admin/chpass.py
[UCSF Enterprise Password Standard]: https://wiki.library.ucsf.edu/pages/viewpage.action?spaceKey=ITSI&title=Unified+UCSF+Enterprise+Password+Standard
