# Duo MFA Signup and App Install Instructions for Logging on to {{ site.cluster.name }}

In order to log into {{ site.cluster.name }} from outside of the UCSF network (not on the VPN), you will need use Duo two factor authentication.
This is only required if you are on a network outside of UCSF (off-campus and not on the VPN).  If you are on campus
or using the campus VPN, Duo will not be required for {{ site.cluster.name }}.

Installing the Duo Mobile app to your mobile phone is the easiest method to use.

## Step 1

  - ssh to {{ site.login.hostname }} with your {{ site.cluster.nickname }} username
    - Answer `yes` to the question `Are you sure you want to continue connecting (yes/no/[fingerprint])?`
    - The connection will be closed. This is the expected behavior.

```sh
{local}$ ssh alice@{{ site.login.hostname }}

The authenticity of host {{ site.login.hostname }} (169.230.11.22) can not be established.
ECDSA key fingerprint is SHA256:DrCbFJouT3pRHoPO6rzGNJxX4OOIBuLy/ZdxjIQrx3M.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added {{ site.login.hostname }},169.230.11.22 (ECDSA) to the list of known hosts.
Connection closed by 169.230.11.22 port 22
```


## Step 2

  - Again, ssh to {{ site.login.hostname }} with your {{ site.cluster.nickname }} username
    - Enter your {{ site.cluster.nickname }} user password
    - You should then see a message saying to enroll at a particular Duo URL
  - this will followed by a 'Permission denied'. The connection will close. This is the expected behavior.
  - Copy the enrollment URL into your web browser and follow the link in your web browser

```sh
{local}$ ssh alice@{{ site.login.hostname }}
alice@{{ site.login.hostname }} password:
Please enroll at https://api-6747fbb1.duosecurity.com/portal?code=61c954f6d6124546&akey=DBPXF7JZIKINNMVHIHZK

Please enroll at https://api-6747fbb1.duosecurity.com/portal?code=61c954f6d6124546&akey=DBPXF7JZIKINNMVHIHZK

Please enroll at https://api-6747fbb1.duosecurity.com/portal?code=61c954f6d6124546&akey=DBPXF7JZIKINNMVHIHZK

alice@{{ site.login.hostname }}: Permission denied (publickey,gssapi-with-mic,keyboard-interactive).
```

## Step 3 : Start setup (Duo)

  - After copy & pasting the link from Step 2 and hitting Enter, your browser should go to a site on 'duosecurity.com'
    - The page will say 'Protect Your UCSF Account'
      - Click the green 'Start setup' button to proceed to the next page
    
## Step 4 : What type of device are you adding

  - The page will ask 'What type of device are you adding?'
    - Select the type of device you are using, 'Mobile phone' is recommended
      - Click the green 'Continue' button
      
## Step 5 : Enter your phone number

  - If you selected 'Mobile phone' for your device type, this page will ask you to 'Enter your phone number'
    - Enter your phone number in the box
    - A checkbox below the phone number will ask you to verify your number is correct
      - make sure the number is correct and check the box
    - Click the green 'Continue button'

## Step 6 : What type of phone

  - The page 'What type of phone is this number?' will ask you to select the type of phone
    - Select the phone that matches yours
    - Click the green 'Continue button'

## Step 7 : Install Duo Mobile

  - The page 'Install Duo Mobile' will instruct you to install the Duo Mobile app on your device
    - Note: The Duo app might already be installed
    - Click the green 'I have Duo Mobile installed' after you have verified that the Duo Mobile app is installed
    
## Step 8 : Activate Duo Mobile

  - Follow the instructions on the 'Activate Duo Mobile' page:
    - Open Duo Mobile
    - Tap the '+' button
    - Hold your phone's camera up to the the barcode to scan it with the Duo Mobile app
      - After scanning the barcode/QR code with the Duo app on your phone, a new entry should appear in the Duo app 'UCSF PharmChem'
  - Click the green 'Continue' button
    
## Step 9 : Finish Enrollment

  - The 'My settings & Devices' page should like your phone's phone number
    - Click the blue 'Finish Enrollment' button

## Step 10 : Log in using ssh

  - ssh to one of the externally facing {{ site.cluster.name }} nodes (such as log1, log2, dt1, dt2) with your {{ site.cluster.nickname }} username
    - Enter your {{ site.cluster.nickname }} user password
    - At the prompt, select the method to use Duo
    - Select 1. Duo Push
      - open the Duo Mobile app and click the green 'Accept' button to accept the Push
      
```sh
{local}$ ssh alice@{{ site.login.hostname }}
alice@{{ site.login.hostname }} password:
Duo two-factor login for user

Enter a passcode or select one of the following options:

 1. Duo Push to XXX-XXX-____
 2. Phone call to XXX-XXX-____
 3. SMS passcodes to XXX-XXX-_____

Passcode or option (1-3): 1
Success. Logging you in...
Remember connection authentication from 24.5.83.75 for 12 hours? [y/N] n
Last failed login: Wed Jun 24 13:34:11 PDT 2020 from 73.70.236.131 on ssh:notty
There were 10 failed login attempts since the last successful login.
[alice@{{ site.login.name }}]$
```
