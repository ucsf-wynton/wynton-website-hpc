# Join the Cluster


{{ site.cluster.name }} is a large, shared high-performance compute (HPC) cluster underlying UCSF's Research Computing Capability. Funded and administered cooperatively by UCSF campus IT and key research groups, it is available to all UCSF researchers, and consists of different profiles suited to various biomedical and health science computing needs. Researchers can participate using the “co-op” model of resource contribution and sharing.


## Co-op model

The end goal is that the all UCSF researchers should have access to the cluster without charge.  Free accounts will be limited by the number of concurrent cores and will have lower priority on the job queue.  Participating co-op members that contribute to the cluster will get priority on the job queue and will be able to utilize a large number of concurrent cores (proportionate to the contribution).


## Who can join?

The {{ site.cluster.name }} HPC environment is available for _free_ to all UCSF researchers, which includes faculty and principal investigators (PIs) as well as research staff, students, and postdocs affiliated with a faculty or a PI.  If you don't fit into one of these categories, please don't hesitate to [contact us].

## Request access

To apply for an account on the Wynton HPC cluster, please fill out the following form:

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Account are personal and login credentials must not be shared with others</strong>. If detected, access to the account will be automatically disabled.  It is still possible and easy for multiple users to share and collaborate on the same folders and scripts.  Don't hesitate to ask if you don't know how to do this - we're here to help.
</div>

<form action="https://hub.wynton.ucsf.edu/cgi-bin/form.R" method="GET">
 <div class="form-group">
  <label for="first_name">First name</label> <span style="color: red">*</span><br>
  <input type="text" id="first_name" name="first_name" placeholder="Enter first name" minlength="2" required><br>
 </div>
 
 <div class="form-group">
  <label for="last_name">Last name</label> <span style="color: red">*</span><br>
  <input type="text" id="last_name" name="last_name" placeholder="Enter last name" minlength="2" required><br>
 </div>
 
 <div class="form-group">
  <label for="email_address">UCSF email address</label> <span style="color: red">*</span><br>
  <input type="email" id="email_address" name="email_address" placeholder="Enter email" size="30" required><br>
 </div>
 
 <div class="form-group"> 
  <label for="affiliation">UCSF affiliation</label> <span style="color: red">*</span><br>
  <input type="text" id="affiliation" name="affiliation" placeholder="e.g. faculty, student, postdoc, etc." size="30" minlength="2" required><br>
 </div>
 
 <div class="form-group">  
  <label for="pi">UCSF Principal Investigator (PI)</label> <span style="color: red">*</span><br>
  <input type="text" id="pi" name="pi" size="30" placeholder="Name of your PI, or 'self'" minlength="2" required><br>
 </div>
 
 <div class="form-group">  
  <label>QB3/CGL Kerberos username</label> <span style="color: red">*</span><br>
  <input type="text" id="kerberos_username" name="kerberos_username" pattern="([A-Za-z]{1}[A-Za-z0-9]+|none)" placeholder="Username or 'none'" minlength="4" size="15"><br>
 </div>
 
 <div class="form-group">  
  <label for="ucsf_id">UCSF Employee/Student ID</label> <span style="color: red">*</span><br>
  <input type="text" id="ucsf_id" name="ucsf_id" placeholder="02xxxxxxx or 'none'" pattern="(\d{9}|none)" maxlength="9" size="15" required> <small>(nine digits; to find yours, go to <a href="https://myaccess.ucsf.edu/myid">https://myaccess.ucsf.edu/myid</a>)</small><br>
 </div>
 
 <div class="form-group">  
  <label for="username">Username</label> <span style="color: red">*</span><br>
  <input type="text" id="username" name="username" pattern="([A-Za-z]{1}[A-Za-z0-9]+|none)" placeholder="Username or 'none'" minlength="2" size="15" required><br>
 </div>
 
 <div class="form-group">
  <label for="alt_username">Alternative username</label> <span style="color: red">*</span><br>
  <input type="text" id="alt_username" name="alt_username" pattern="([A-Za-z]{1}[A-Za-z0-9]+|none)" placeholder="Username or 'none'" minlength="2" size="15" required><br>
 </div>
 
 <div class="form-group">  
  <label for="hpc_experience">Previous HPC cluster experience?</label><br>
  <input type="text" id="hpc_experience" name="hpc_experience" placeholder="e.g. Slurm, PBS, 'yes', 'no'" minlength="2" size="30">
  <small>(this will help us help you)</small>
  <br>
 </div>
 
 <div class="form-group">  
  <label>Have you ever had an account with UCSF QB3, Sali Lab, or MSG?</label> If yes,<br>
  <label>UID</label> <input type="text" name="uid" pattern="\d*" placeholder="e.g. 21024" maxlength="5" size="7"> <small>(first integer reported by <code>id</code>)</small><br>
  <label>GID</label> <input type="text" name="gid" pattern="\d*" placeholder="e.g. 1543" maxlength="5" size="7"> <small>(second integer reported by <code>id</code>)</small><br>
 </div>
 
  <br>
  <button type="submit" onclick="storedata()" class="btn btn-primary">Request Account</button>
</form>


<script>
window.onload = function() {
  if (sessionStorage.first_name) {
    document.getElementById("first_name").value = sessionStorage.first_name;
  }
  if (sessionStorage.last_name) {
    document.getElementById("last_name").value = sessionStorage.last_name;
  }
  if (sessionStorage.email_address) {
    document.getElementById("email_address").value = sessionStorage.email_address;
  }
  if (sessionStorage.affiliation) {
    document.getElementById("affiliation").value = sessionStorage.affiliation;
  }
  if (sessionStorage.pi) {
    document.getElementById("pi").value = sessionStorage.pi;
  }
  if (sessionStorage.kerberos_username) {
    document.getElementById("kerberos_username").value = sessionStorage.kerberos_username;
  }
  if (sessionStorage.ucsf_id) {
    document.getElementById("ucsf_id").value = sessionStorage.ucsf_id;
  }
  if (sessionStorage.username) {
    document.getElementById("username").value = sessionStorage.username;
  }
  if (sessionStorage.alt_username) {
    document.getElementById("alt_username").value = sessionStorage.alt_username;
  }
  if (sessionStorage.hpc_experience) {
    document.getElementById("hpc_experience").value = sessionStorage.hpc_experience;
  }
  if (sessionStorage.uid) {
    document.getElementById("uid").value = sessionStorage.uid;
  }
  if (sessionStorage.gid) {
    document.getElementById("gid").value = sessionStorage.gid;
  }
};

function storedata() {
  if(typeof(Storage) !== "undefined") {
    sessionStorage.first_name = document.getElementById("first_name").value;
    sessionStorage.last_name = document.getElementById("last_name").value;
    sessionStorage.email_address = document.getElementById("email_address").value;
    sessionStorage.affiliation = document.getElementById("affiliation").value;
    sessionStorage.pi = document.getElementById("pi").value;
    sessionStorage.kerberos_username = document.getElementById("kerberos_username").value;
    sessionStorage.ucsf_id = document.getElementById("ucsf_id").value;
    sessionStorage.username = document.getElementById("username").value;
    sessionStorage.alt_username = document.getElementById("alt_username").value;
    sessionStorage.hpc_experience = document.getElementById("hpc_experience").value;
    sessionStorage.uid = document.getElementById("uid").value;
    sessionStorage.gid = document.getElementById("gid").value;
  }
}
</script>

[contact us]: {{ '/about/contact.html' | relative_url }}
