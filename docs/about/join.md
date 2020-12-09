# Join the Cluster


{{ site.cluster.name }} is a large, shared high-performance compute (HPC) cluster underlying UCSF's Research Computing Capability. Funded and administered cooperatively by UCSF campus IT and key research groups, it is available to all UCSF researchers, and consists of different profiles suited to various biomedical and health science computing needs. Researchers can participate using the “co-op” model of resource contribution and sharing.


## Co-op model

The end goal is that the all UCSF researchers should have access to the cluster without charge.  Free accounts will be limited by the number of concurrent cores and will have lower priority on the job queue.  Participating co-op members that contribute to the cluster will get priority on the job queue and will be able to utilize a large number of concurrent cores (proportionate to the contribution).


## Who can join?

The {{ site.cluster.name }} environment is available for _free_ to all UCSF researchers, which includes faculty and principal investigators (PIs) as well as research staff, students, and postdocs affiliated with a faculty or a PI.  If you don't fit into one of these categories, please don't hesitate to [contact us].

## Request access

To apply for an account on the {{ site.cluster.name }} cluster, please fill out the following form:

<!--

<div class="alert alert-warning" role="alert" style="margin-top: 3ex;">
<strong>Sorry... {{ site.cluster.name }} account requests are temporarily disabled for up to 24 hours (starting Thursday September 24, 2020 at 07:00).</strong> This is due to web server upgrades.
<br><span class="timestamp">September 24, 2020 @ 07:00 PDT</span>
</div>

-->

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Account are personal and login credentials must not be shared with others</strong>. If detected, access to the account will be automatically disabled.  It is still possible and easy for multiple users to share and collaborate on the same folders and scripts.  Don't hesitate to ask if you don't know how to do this - we're here to help.
</div>

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Please make sure you provide all the information applicable to you in this form to avoid any delays</strong>
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
  <input type="email" id="email_address" name="email_address" autocomplete="email" placeholder="Enter email" size="30" required><br>
  <small>(<em>External collaborators only:</em> Please provide your preferred email address)</small>
 </div>
 
 <div class="form-group">
  <fieldset >
   <legend style="border:0;font-size:14px;margin:0"><b>UCSF affiliation</b> <span style="color: red">*</span></legend>
   <input type="radio" id="affiliation_0" name="affiliation" value="Faculty" required>
   <label style="font-weight: normal" for="affiliation_0">Faculty</label><br>
   <input type="radio" id="affiliation_1" name="affiliation" value="Postdoc">
   <label style="font-weight: normal" for="affiliation_1">Postdoc</label><br>
   <input type="radio" id="affiliation_2" name="affiliation" value="Staff">
   <label style="font-weight: normal" for="affiliation_2">Staff</label><br>
   <input type="radio" id="affiliation_3" name="affiliation" value="Research_Assistant">
   <label style="font-weight: normal" for="affiliation_3">Research Assistant</label><br>
   <input type="radio" id="affiliation_4" name="affiliation" value="Student">
   <label style="font-weight: normal" for="affiliation_4">Student</label><br>
   <input type="radio" id="affiliation_5" name="affiliation" value="Other">
   <label style="font-weight: normal" for="affiliation_5">Other</label><br>
  </fieldset>
 </div>

 <div class="form-group">
  <label for="other_desc">If 'Other', please clarify </label><br>
  <input type="text" id="other_desc" name="other_desc" placeholder="Collaborating with, ..." size="30" minlength="2"><br>
 </div>
 
 <div class="form-group">
  <fieldset>
    <legend style="border:0;font-size:14px;margin:0"><b>If 'Student', please select appropriate option</b></legend>
    <input type="checkbox" id="student_desc_0" name="student_desc" value="Joined_PI_Lab">
    <label style="font-weight: normal" for="student_desc_0">Joined PI's Lab</label><br>
    <input type="checkbox" id="student_desc_1" name="student_desc" value="Rotation">
    <label style="font-weight: normal" for="student_desc_1">Rotation</label><br>
    <input type="checkbox" id="student_desc_2" name="student_desc" value="Course">
    <label style="font-weight: normal" for="student_desc_2">For Course</label><br>
    <input type="checkbox" id="student_desc_3" name="student_desc" value="Intern">
    <label style="font-weight: normal" for="student_desc_3">Intern</label><br>
  </fieldset>
 </div>
 
 <div class="form-group">  
  <label for="pi">UCSF Principal Investigator (PI)</label> <span style="color: red">*</span><br>
  <input type="text" id="pi" name="pi" size="30" placeholder="Name of your PI, or 'self'" minlength="2" required><br>
  <small>(<em>Provide PI's full name</em>)</small><br>
 </div>

 <div class="form-group">  
  <label for="dept_program">UCSF Department or Program</label> <span style="color: red">*</span><br>
  <input type="text" id="dept_program" name="dept_program" placeholder="e.g. 'Radiology' or 'BMI'" maxlength="30" size="30" required><br>
 </div>

 <div class="form-group">  
  <label for="ucsf_id">UCSF Employee/Student ID</label> <span style="color: red">*</span><br>
  <input type="text" id="ucsf_id" name="ucsf_id" placeholder="02xxxxxxx or 'none'" pattern="(\d{9}|none)" maxlength="9" size="15" required><br>
  <small>(<em>Nine digits: To find yours, go to <a href="https://myaccess.ucsf.edu/myid">https://myaccess.ucsf.edu/myid</a></em>)</small><br>
 </div>
 
 <div class="form-group">  
  <label for="username">Username</label> <span style="color: red">*</span><br>
  <input type="text" id="username" name="username" pattern="([a-z]{1}[a-z0-9]+)" placeholder="Username" minlength="2" size="15" required><br>
  <small>(<em>Username should be all lower case</em>)</small><br>
 </div>
 
 <div class="form-group">
  <label for="alt_username">Alternative username</label> <span style="color: red">*</span><br>
  <input type="text" id="alt_username" name="alt_username" pattern="([a-z]{1}[a-z0-9]+)" placeholder="Username" minlength="2" size="15" required><br>
  <small>(<em>This should be different from the one you provided above</em>)</small>
 </div>
 
 <div class="form-group">  
  <fieldset>
  <legend style="border:0;font-size:14px;margin:0"><b>Have you ever had an account on another UCSF compute environment? </b><span style="color: red">*</span></legend>
    <input type="checkbox" id="ucsf_compute_environments_0" name="ucsf_compute_environments" value="none">
    <label style="font-weight: normal" for="ucsf_compute_environments_0">No</label><br>
    <input type="checkbox" id="ucsf_compute_environments_1" name="ucsf_compute_environments" value="gladstone">
    <label style="font-weight: normal" for="ucsf_compute_environments_1"> Gladstone</label><br>
    <input type="checkbox" id="ucsf_compute_environments_2" name="ucsf_compute_environments" value="qb3">
    <label style="font-weight: normal" for="ucsf_compute_environments_2"> QB3 (now deprecated)</label><br>
    <input type="checkbox" id="ucsf_compute_environments_3" name="ucsf_compute_environments" value="radiology">
    <label style="font-weight: normal" for="ucsf_compute_environments_3"> Radiology</label><br>
    <input type="checkbox" id="ucsf_compute_environments_4" name="ucsf_compute_environments" value="sali">
    <label style="font-weight: normal" for="ucsf_compute_environments_4"> Sali Lab</label><br>
    <input type="checkbox" id="ucsf_compute_environments_5" name="ucsf_compute_environments" value="rbvi_sacs">
    <label style="font-weight: normal" for="ucsf_compute_environments_5"> RBVI/SACS</label><br>
  </fieldset>
 </div>
 
 <div class="form-group">  
  If <strong>yes</strong> to any of the above, please run command <code>id</code> on compute environment selected above and provide (UID, GID) for the main one:<br>
  <label for="uid">UID</label> <input type="text" id="uid" name="uid" pattern="(\d*|forgot)" placeholder="e.g. 21024 or 'forgot'" maxlength="6" size="14"> <small>(first integer reported by <code>id</code> on those systems)</small><br>
  <label for="gid">GID</label> <input type="text" id="gid" name="gid" pattern="(\d*|forgot)" placeholder="e.g. 1543 or 'forgot'" maxlength="6" size="14"> <small>(second integer reported by <code>id</code> on those system)</small><br>
 </div>

 <div class="form-group">  
  <label for="kerberos_username">Existing UCSF QB3/CGL Kerberos username?</label> <span style="color: red">*</span><br>
  <input type="text" id="kerberos_username" name="kerberos_username" pattern="([A-Za-z]{1}[A-Za-z0-9]+|none|forgot)" placeholder="Username, 'none', or 'forgot'" minlength="4" size="20" required><br>
 </div>
 
 <div class="form-group">  
  <label for="hpc_experience">Previous HPC cluster experience?</label><br>
  <input type="text" id="hpc_experience" name="hpc_experience" placeholder="e.g. Slurm, PBS, 'yes', 'no'" minlength="2" size="30">
  <small>(this will help us help you)</small>
  <br>
 </div>
 
 <div class="form-group">  
  <label for="comment">Additional comments</label><br>
  <textarea type="text" id="comment" name="comment" maxlength="512" rows="4" cols="50"></textarea><br>
 </div>

  <br>
  <button type="submit" onclick="save_form()" class="btn btn-primary">Request Account</button> &nbsp; <em>(An email confirmation will be sent)</em>
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
    names = ["given_name", "family_name", "email_address", "other_desc", "pi", "ucsf_id", "dept_program", "username", "alt_username", "kerberos_username", "uid", "gid", "hpc_experience", "comment"];
  
    for (var ii = 0; ii < names.length; ii++) {
      name = names[ii];
      value = sessionStorage.getItem(name);
      obj = document.getElementById(name);
      if (value !== null && obj !== null) obj.value = value;
    }
  
    // Checkboxes
    names = ["student_desc_0", "student_desc_1", "student_desc_2", "student_desc_3", "ucsf_compute_environments_0", "ucsf_compute_environments_1", "ucsf_compute_environments_2", "ucsf_compute_environments_3", "ucsf_compute_environments_4", "ucsf_compute_environments_5", "affiliation_0", "affiliation_1", "affiliation_2", "affiliation_3", "affiliation_4", "affiliation_5"];
  
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
    names = ["given_name", "family_name", "email_address", "other_desc", "pi", "ucsf_id", "dept_program", "username", "alt_username", "kerberos_username", "uid", "gid", "hpc_experience", "comment"];
  
    for (var ii = 0; ii < names.length; ii++) {
      name = names[ii];
      obj = document.getElementById(name);
      if (obj !== null) sessionStorage.setItem(name, obj.value);
    }
  
    // Checkboxes
    names =  ["student_desc_0", "student_desc_1", "student_desc_2", "student_desc_3", "ucsf_compute_environments_0", "ucsf_compute_environments_1", "ucsf_compute_environments_2", "ucsf_compute_environments_3", "ucsf_compute_environments_4", "ucsf_compute_environments_5", "affiliation_0", "affiliation_1", "affiliation_2", "affiliation_3", "affiliation_4", "affiliation_5"];
  
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
