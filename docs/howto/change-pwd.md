# Wynton Crendentials

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

Only passwords adhering to the Unified UCSF Enterprise Password Standard are accepted.  Attempts to update to an insufficient password will produce an informative error message.  For details, see the [RBVI Kerberos Web Interface], which you can access using your Wynton credentials.


## Verify credentials

To test your Wynton credentials, try to [login to Wynton via SSH]({{ '/get-started/access-cluster.html' | relative_url }}).  Alteratively, verify it from your browser:

1. Go to [https://www.cgl.ucsf.edu/admin/kerbtest.py](https://www.cgl.ucsf.edu/admin/kerbtest.py) in your browser.  A popup panel titled 'Sign in https://www.cgl.ucsf.edu' is opened by the browser.

3. Enter your Wynton login credentials in the two fields 'Username' and 'Password' and click 'Sign in'.

4. If you entered correct credentials, you will get to a confirmation page saying so.  If you entered incorrect credentials, there will be no error message and the popup will appear again.


## Reset password

To reset your _Wynton_ password, contact [kerberos-help@cgl.ucsf.edu]([kerberos-help@cgl.ucsf.edu) via e-mail.

[RBVI Kerberos web interface]: https://www.cgl.ucsf.edu/admin/chpass.py
