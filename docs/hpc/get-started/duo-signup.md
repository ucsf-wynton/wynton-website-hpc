# Two-Factor Authentication for SSH

**Access to {{ site.cluster.name }} from outside of the UCSF network requires two-factor authentication (2FA).**   If you connecting via the UCSF campus network, 2FA is _not_ required.  Likewise, if you are on the UCSF VPN, you are already fully authenticated on the campus network and _no_ further 2FA is needed to access {{ site.cluster.name }}.  In all other cases, you will be prompted to authenticate through a Wynton-specific 2FA method when SSH:ing directly to the cluster.



## Requirements

Similarly to the UCSF VPN, {{ site.cluster.name }} requires two-factor authentication via the Duo 2FA system.  Duo supports authentication via:

 1. push confirmation in the [Duo Mobile App],

 2. a phone call, or
 
 3. SMS passcode.

Known issues:

 * It is not possible to register multiple authentication methods, e.g. multiple devices and phone numbers.

 * If you wish to change your 2FA method, phone number, or SMS number, you will need to contact the [{{ site.cluster.name }} support staff] to reset your existing 2FA registration or resend the registration link.
 
 * If you receive a message from Duo that you, "have been locked out due to excessive authentication failures," you will need to contact the [{{ site.cluster.name }} support staff] to have your Duo account re-enabled.

 * Support for hardware 2FA keys (e.g. YubiKey, Feitian, etc.) is limited and might not even work.  For example, when registering a hardware key, that will be your only option.  Also, if you have already registered your hardware 2FA key with UCSF (e.g. UCSF VPN), then that physical key can _not_ be used with the {{ site.cluster.nickname }} 2FA system.  This is also true if the hardware key supports two or more security keys (e.g. short press and long press on a YubiKey).


Got a new smart phone?  After installing the Duo Mobile App on the new device, you can transfer the Wynton 2FA credentials from your old phone to your new phone via 'Connect a new phone' in the Duo Mobile App's 'Settings' on both devices.



## Example: Authentication with a Duo Push

After having completed the 2FA registration (see below) for your account, you can access {{ site.cluster.name }} via SSH from outside the UCSF network.  A typical SSH login will then start by you authenticating yourself via 2FA as illustrated by:

```sh
{local}$ ssh alice@{{ site.login.hostname }}
alice@{{ site.login.hostname }} password:
Duo two-factor login for alice

Enter a passcode or select one of the following options:

 1. Duo Push to XXX-XXX-9999
 2. Phone call to XXX-XXX-9999
 3. SMS passcodes to XXX-XXX-9999

Passcode or option (1-3): 1
Success. Logging you in...
Remember connection authentication from 24.5.83.75 for 12 hours? [y/N] n

Last login: Tue Oct 13 11:56:19 2020 from 24.5.83.75
Welcome to the Wynton login nodes. [...]

[alice@{{ site.login.name }}]$ 
```

For examples on what it looks like when you authenticate via other options, see the examples below.


## Registration for 2FA on {{ site.cluster.name }}

In order to authenticate via 2FA, you will first have to register your Duo 2FA setup with {{ site.cluster.name }}.  Since they are different 2FA systems, you have to complete this registration regardless whether or not you have already registered Duo 2FA for the UCSF VPN.  Below are detailed instructions on how to register 2FA for {{ site.cluster.name }}.

_Comment_: If you are asked to 'Please contact your help or support desk' during the Duo 2FA registration, please contact the [{{ site.cluster.name }} support staff] (do _not_ contact the UCSF IT Service Desk).


<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
We recommend that you read through the below instructions before starting the registration. **You can only register once and you cannot reconfigure your 2FA setup afterwards**.  The only way to update the settings is to contact the {{ site.cluster.name }} support staff to reset your 2FA setup.
</div>


### Step 1: Obtain a Duo registration link

In order to register with Duo 2FA, you need to obtain a registration link (URL) to your personal registration page.  This is done by attempting to log into {{ site.cluster.nickname }} via SSH.

If this is the first time you access {{ site.cluster.name }} via SSH, then you will have to do two SSH logins - the first login is just a "trigger" and the second login one will display the registration URL.  If you have priorly logged into to {{ site.cluster.name }}, then you can skip to the second SSH-login instructions below.

1. SSH to {{ site.login.hostname }} using your {{ site.cluster.nickname }} username
   - If you are asked the question `Are you sure you want to continue connecting (yes/no/[fingerprint])?`, then answer `yes`
   - Enter your {{ site.cluster.nickname }} password
   - The connection will be closed automatically. This is expected

2. Again, SSH to {{ site.login.hostname }} using your {{ site.cluster.nickname }} username
   - Enter your {{ site.cluster.nickname }} password
   - After entering you password, you should then see **a message saying to enroll at a particular Duo URL**
   - This will followed by a 'Permission denied'. The connection will close. This is expected

3. Go to the enrollment page by copying the URL into your web browser


Here is what the above steps will look like:

```sh
{local}$ ssh alice@{{ site.login.hostname }}
The authenticity of host {{ site.login.hostname }} ({{ site.login.ip }}) can not be established.
ECDSA key fingerprint is SHA256:DrCbFJouT3pRHoPO6rzGNJxX4OOIBuLy/ZdxjIQrx3M.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added {{ site.login.hostname }},{{ site.login.ip }} (ECDSA) to the list of known hosts.
Connection closed by {{ site.login.ip }} port 22

{local}$ ssh alice@{{ site.login.hostname }}
alice@{{ site.login.hostname }} password:
Please enroll at https://api-6747fbb1.duosecurity.com/portal?code=61c954f6d6124546&akey=DBPXF7JZIKINNMVHIHZK

Please enroll at https://api-6747fbb1.duosecurity.com/portal?code=61c954f6d6124546&akey=DBPXF7JZIKINNMVHIHZK

Please enroll at https://api-6747fbb1.duosecurity.com/portal?code=61c954f6d6124546&akey=DBPXF7JZIKINNMVHIHZK

alice@{{ site.login.hostname }}: Permission denied (publickey,gssapi-with-mic,keyboard-interactive).
```


### Step 2: Registration of your Duo 2FA

After copying & pasting the registration link into your web browser, should end up on a page titled 'Protect Your UCSF Account' on 'duosecurity.com':

1. For security, verify that you are on the 'duosecurity.com' webpage

2. Click the 'Start setup' button to begin the Duo 2FA registration

    
#### Step 2a: What type of device are you adding

The first registration page will ask 'What type of device are you adding?':

> * Mobile phone [recommended]
> * Tablet (iPad, Nexus 7, etc.)
> * Landline
> * Security Key (YubiKey, Feitian, etc.)
> * Touch ID

1. Select the type of device you are using;
   - 'Mobile phone' is recommended. It allows you do authenticate with the Duo Mobile App, SMS, and phone calls
   - We do _not_ recommend using 'Security Key' because then you will not be able to use the 'Mobile phone' options.  Also, if you have already registered your 'Security Key' for the UCSF VPN, it will _not_ work with the {{ site.cluster.name }} 2FA.
   
2. Click the 'Continue' button


#### Step 2b: Enter your phone number

If you selected 'Mobile phone' for your device type, the next page will ask you to 'Enter your phone number':

1. Enter your phone number in the box
2. A checkbox below the phone number will ask you to verify your number is correct
3. Make sure the number is correct and check the box
4. Click the 'Continue' button


#### Step 2c: Enter the type of phone of you have

The next page 'What type of phone is this number?' will ask you to select the type of phone:

> * iPhone
> * Android
> * Windows Phone
> * Other (and cell phones)

1. Select the type of phone you have

2. Click the 'Continue' button


#### Step 2d: Install the Duo Mobile App

The next page 'Install Duo Mobile' will instruct you to install the Duo Mobile app on your device:

1. If you don't already have the Duo Mobile App installed on your smart phone, please install it
2. Verify that you can open the Duo Mobile App
3. Click the 'I have Duo Mobile installed' button

    
#### Step 2e: Activate Duo Mobile

Follow the instructions on the 'Activate Duo Mobile' page:

1. Open the Duo Mobile App on your smart phone
2. Tap the '+' button
3. Hold your phone's camera up to scan the barcode presented in your computer's web browser
4. After scanning the barcode with the app on your phone, an entry titled 'UCSF PharmChem' should appear in the app
5. Click the 'Continue' button

_Comment_: If you have problems scanning the barcode, there is also an option to receive a on-time activation link via email.


#### Step 2f: Finish enrollment

1. Verify that the 'My settings & Devices' lists your phone number
2. Use the default 'When I log in' method
3. Click the 'Finish Enrollment' button

_Note_: It does not matter which default 'When I log in' method you choose, you will still be prompted which one to use via the SSH login as with the default 'Ask me to choose an authentication method' option.

This concludes the Duo 2FA registration. You can now close the web browser.



### Step 3: Verify that log in via SSH works

After having completed the above 2FA registration, you should be able to access {{ site.cluster.name }} via SSH.  As illustrated below, verify that this works by SSH:ing to a {{ site.cluster.name }} login or data-transfer node using your {{ site.cluster.nickname }} username and:

1. Enter your {{ site.cluster.nickname }} password
2. At the prompt, select a 2FA method, e.g. 'Duo Push'
3. Open the Duo Mobile App and click the 'Accept' button
4. The SSH session

```sh
{local}$ ssh alice@{{ site.login.hostname }}
alice@{{ site.login.hostname }} password:
Duo two-factor login for alice

Enter a passcode or select one of the following options:

 1. Duo Push to XXX-XXX-9999
 2. Phone call to XXX-XXX-9999
 3. SMS passcodes to XXX-XXX-9999

Passcode or option (1-3): 1
Success. Logging you in...
Remember connection authentication from 24.5.83.75 for 12 hours? [y/N] n
Last failed login: Wed Oct 14 13:34:11 PDT 2020 from 73.70.236.131 on ssh:notty
There was 2 failed login attempts since the last successful login.

Welcome to the Wynton login nodes. [...]

[alice@{{ site.login.name }}]$ 
```


## Examples of other authentication methods

### Example: Authentication via a phone call

If you choose to authenticate via a phone call, below is what you will see.  The phone call will be made momentarily to your registered phone number.  Please listen to the prompt and follow the instructions.  If you did not request a Duo 2FA phone call, hang up.

```sh
{local}$ ssh alice@{{ site.login.hostname }}
alice@log2.wynton.ucsf.edu password:
Duo two-factor login for alice

Enter a passcode or select one of the following options:

 1. Duo Push to XXX-XXX-9999
 2. Phone call to XXX-XXX-9999
 3. SMS passcodes to XXX-XXX-9999

Passcode or option (1-3): 2
Success. Logging you in...
```



### Example: Authentication via an SMS passcode

If you choose to authenticate via an SMS passcode, below is what you will see.  The passcode to be entered is sent momentarily to your registered mobile number as an SMS.

```sh
{local}$ ssh alice@{{ site.login.hostname }}
alice@log2.wynton.ucsf.edu password:
Duo two-factor login for alice

Enter a passcode or select one of the following options:

 1. Duo Push to XXX-XXX-9999
 2. Phone call to XXX-XXX-9999
 3. SMS passcodes to XXX-XXX-9999

Passcode or option (1-3): 3

Enter a passcode or select one of the following options:

 1. Duo Push to XXX-XXX-9999
 2. Phone call to XXX-XXX-9999
 3. SMS passcodes to XXX-XXX-9999 (next code starts with: 1)

Passcode or option (1-3): 1443743
Success. Logging you in...
```

[Duo Mobile App]: https://duo.com/product/multi-factor-authentication-mfa/duo-mobile-app
[{{ site.cluster.name }} support staff]: /hpc/support/index.html
