# Join the Cluster


{{ site.cluster.name }} is a large, shared high-performance compute (HPC) cluster underlying UCSF's Research Computing Capability. Funded and administered cooperatively by UCSF campus IT and key research groups, it is available to all UCSF researchers, and consists of different profiles suited to various biomedical and health science computing needs. Researchers can participate using the “co-op” model of resource contribution and sharing.


## Co-op model

The end goal is that the all UCSF researchers should have access to the cluster without charge.  Free accounts will be limited by the number of concurrent cores and will have lower priority on the job queue.  Participating co-op members that contribute to the cluster will get priority on the job queue and will be able to utilize a large number of concurrent cores (proportionate to the contribution).


## Who can join?

The {{ site.cluster.name }} HPC environment is available for _free_ to all UCSF researchers, which includes faculty and principal investigators (PIs) as well as research staff, students, and postdocs affiliated with a faculty or a PI.  If you don't fit into one of these categories, please don't hesitate to [contact us].

## Request access

To apply for an account on the Wynton HPC cluster, please fill out the following form:

<!--
<div class="alert alert-warning" role="alert" style="margin-top: 3ex;">
<strong>Sorry... Wynton HPC account requests are temporarily disabled for up to 24 hours (starting Tuesday Octobers 22, 2019 at noon).</strong> This is due to planned power upgrade in the Diller Building.
<br><span class="timestamp">October 22, 2019 @ 11:59 PDT</span>
</div>
-->

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Account are personal and login credentials must not be shared with others</strong>. If detected, access to the account will be automatically disabled.  It is still possible and easy for multiple users to share and collaborate on the same folders and scripts.  Don't hesitate to ask if you don't know how to do this - we're here to help.
</div>

<form action="https://hub.wynton.ucsf.edu/cgi-bin/join" method="GET">
 <div class="form-group">
  <label for="given_name">First name</label> <span style="color: red">*</span><br>
  <input type="text" id="given_name" name="given_name" autocomplete="given-name" placeholder="Enter first name" minlength="2" required><br>
 </div>
 
 <div class="form-group">
  <label for="family_name">Last name</label> <span style="color: red">*</span><br>
  <input type="text" id="family_name" name="family_name" autocomplete="family-name" placeholder="Enter last name" minlength="2" required><br>
 </div>
 
 <div class="form-group">
  <label for="email_address">UCSF email address</label> <span style="color: red">*</span><br>
  <input type="email" id="email" name="email" autocomplete="email" placeholder="Enter email" size="30" required><br>
 </div>
 
 <div class="form-group">
  <label>UCSF affiliation</label> <span style="color: red">*</span><br>
  <fieldset>
   <input type="radio" id="affiliation_0" name="affiliation" value="faculty" required/> Faculty<br>
   <input type="radio" id="affiliation_1" name="affiliation" value="postdoc"/> Postdoc<br>
   <input type="radio" id="affiliation_2" name="affiliation" value="staff"/> Staff, research assistant, etc.<br>
   <input type="radio" id="affiliation_3" name="affiliation" value="student_lab"/> Student (part of a lab)<br>
   <input type="radio" id="affiliation_4" name="affiliation" value="student_rotating"/> Student (rotating student)<br>
   <input type="radio" id="affiliation_5" name="affiliation" value="student_misc"/> Student (miscellaneous)<br>
   <input type="radio" id="affiliation_6" name="affiliation" value="sysadm"/> Sysadm<br>
   <input type="radio" id="affiliation_7" name="affiliation" value="other"/> Other
   <input type="text" id="affiliation_other" name="affiliation_other" placeholder="Collaborating with, ..." minlength="2" size="30"><br>
  </fieldset>
 </div>

 <div class="form-group">  
  <label for="pi">UCSF Principal Investigator (PI)</label> <span style="color: red">*</span><br>
  <input type="text" id="pi" name="pi" size="30" placeholder="Name of your PI, or 'self'" minlength="2" required><br>
 </div>

 <div class="form-group">  
  <label for="ucsf_id">UCSF Department or Program</label> <span style="color: red">*</span><br>
  <input type="text" id="dept_program" name="dept_program" placeholder="e.g. 'Radiology' or 'BMI'" maxlength="30" size="30" required><br>
 </div>

 <div class="form-group">  
  <label for="ucsf_id">UCSF Employee/Student ID</label> <span style="color: red">*</span><br>
  <input type="text" id="ucsf_id" name="ucsf_id" placeholder="02xxxxxxx or 'none'" pattern="(\d{9}|none)" maxlength="9" size="15" required> <small>(nine digits; to find yours, go to <a href="https://myaccess.ucsf.edu/myid">https://myaccess.ucsf.edu/myid</a>)</small><br>
 </div>
 
 <div class="form-group">  
  <label for="username">Username</label> <span style="color: red">*</span><br>
  <input type="text" id="username" name="username" pattern="([A-Za-z]{1}[A-Za-z0-9]+)" placeholder="Username" minlength="2" size="15" required><br>
 </div>
 
 <div class="form-group">
  <label for="alt_username">Alternative username</label> <span style="color: red">*</span><br>
  <input type="text" id="alt_username" name="alt_username" pattern="([A-Za-z]{1}[A-Za-z0-9]+)" placeholder="Username" minlength="2" size="15" required><br>
 </div>
 
 <div class="form-group">  
  <label>Have you ever had an account on another UCSF compute environment?</label> <span style="color: red">*</span><br>
  <fieldset>
    <input type="checkbox" id="ucsf_compute_environments_0" name="ucsf_compute_environments" value="none"/> No<br>
    <input type="checkbox" id="ucsf_compute_environments_1" name="ucsf_compute_environments" value="gladstone"/> Gladstone<br>
    <input type="checkbox" id="ucsf_compute_environments_2" name="ucsf_compute_environments" value="qb3"/> QB3 (now deprecated)<br>
    <input type="checkbox" id="ucsf_compute_environments_3" name="ucsf_compute_environments" value="radiology"/> Radiology<br>
    <input type="checkbox" id="ucsf_compute_environments_4" name="ucsf_compute_environments" value="sali"/> Sali Lab<br>
    <input type="checkbox" id="ucsf_compute_environments_5" name="ucsf_compute_environments" value="tipcc"/> TIPCC (Cancer Center compute cluster)<br>
  </fieldset>
  Others: <input type="text" id="ucsf_compute_environments_other" name="ucsf_compute_environments_other" placeholder="Other environments, forgot, ..." minlength="2" size="30"><br>
 </div>
 
 <div class="form-group">  
  If <strong>yes</strong> to any of the above, please provide (UID, GID) for the main one:<br>
  <label>UID</label> <input type="text" id="uid" name="uid" pattern="(\d*|forgot)" placeholder="e.g. 21024 or 'forgot'" maxlength="6" size="14"> <small>(first integer reported by <code>id</code> on those systems)</small><br>
  <label>GID</label> <input type="text" id="gid" name="gid" pattern="(\d*|forgot)" placeholder="e.g. 1543 or 'forgot'" maxlength="6" size="14"> <small>(second integer reported by <code>id</code> on those system)</small><br>
 </div>

 <div class="form-group">  
  <label>Existing UCSF QB3/CGL Kerberos username?</label> <span style="color: red">*</span><br>
  <input type="text" id="kerberos_username" name="kerberos_username" pattern="([A-Za-z]{1}[A-Za-z0-9]+|none|forgot)" placeholder="Username, 'none', or 'forgot'" minlength="4" size="20" required><br>
 </div>
 
 <div class="form-group">  
  <label for="hpc_experience">Previous HPC cluster experience?</label><br>
  <input type="text" id="hpc_experience" name="hpc_experience" placeholder="e.g. Slurm, PBS, 'yes', 'no'" minlength="2" size="30">
  <small>(this will help us help you)</small>
  <br>
 </div>
 
 <div class="form-group">  
  <label>Additional comments</label><br>
  <textarea type="text" id="comment" name="comment" maxlength="512" rows="4" cols="50"></textarea><br>
 </div>

  <br>
  <button type="submit" onclick="save_form()" class="btn btn-primary">Request Account</button>
</form>


<script>
function load_form() {
  var names;
  var name;
  var value;
  var obj;
  
  // Repopulate form fields if already set in session
  if(typeof(Storage) !== "undefined") {
    // Text-based fields
    names = ["given_name", "family_name", "email", "affiliation", "affiliation_other", "pi", "ucsf_id", "dept_program", "username", "alt_username", "ucsf_compute_environments_other", "kerberos_username", "uid", "gid", "hpc_experience", "comment"];
  
    for (var ii = 0; ii < names.length; ii++) {
      name = names[ii];
      value = sessionStorage.getItem(name);
      obj = document.getElementById(name);
      if (value !== null && obj !== null) obj.value = value;
    }
  
    // Checkboxes
    names = ["ucsf_compute_environments_0", "ucsf_compute_environments_1", "ucsf_compute_environments_2", "ucsf_compute_environments_3", "ucsf_compute_environments_4", "ucsf_compute_environments_5", "affiliation_0", "affiliation_1", "affiliation_2", "affiliation_3", "affiliation_4", "affiliation_5", "affiliation_6", "affiliation_7"];
  
    for (var ii = 0; ii < names.length; ii++) {
      name = names[ii];
      value = sessionStorage.getItem(name);
      obj = document.getElementById(name);
      if (value !== null && obj !== null && value == "true") obj.checked = value;
    }
  }
}

function save_form() {
  var names;
  var name;
  var obj;
  
  // Remember form fields
  if(typeof(Storage) !== "undefined") {
    // Text-based fields
    names = ["given_name", "family_name", "email", "affiliation", "affiliation_other", "pi", "ucsf_id", "dept_program", "username", "alt_username", "ucsf_compute_environments_other", "kerberos_username", "uid", "gid", "hpc_experience", "comment"];
  
    for (var ii = 0; ii < names.length; ii++) {
      name = names[ii];
      obj = document.getElementById(name);
      if (obj !== null) sessionStorage.setItem(name, obj.value);
    }
  
    // Checkboxes
    names = ["ucsf_compute_environments_0", "ucsf_compute_environments_1", "ucsf_compute_environments_2", "ucsf_compute_environments_3", "ucsf_compute_environments_4", "ucsf_compute_environments_5", "affiliation_0", "affiliation_1", "affiliation_2", "affiliation_3", "affiliation_4", "affiliation_5", "affiliation_6", "affiliation_7"];
  
    for (var ii = 0; ii < names.length; ii++) {
      name = names[ii];
      obj = document.getElementById(name);
      if (obj !== null) sessionStorage.setItem(name, obj.checked);
    }
  }
}

window.onload = function() {
  load_form();
}
</script>

[contact us]: {{ '/about/contact.html' | relative_url }}
