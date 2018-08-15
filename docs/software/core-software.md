# Core System Software

A large number of common Linux software tools are available on the cluster (compute nodes and interactive nodes) as part of the core setup.  Below follows a small excerpt of what tools are available.
<!--
Additional software can be found in the [Software Repositories].
-->


<dl>
<dt>Editors</dt>
<dd>
emacs(*), nano, vim
</dd>

<dt>File transfers</dt>
<dd>
scp, sftp, rsync<br>
curl, wget<br>
dos2unix<br>
</dd>

<dt>Communication</dt>
<dd>
ssh, telnet
</dd>

<dt>Version Control</dt>
<dd>
git, hg(*), svn
</dd>

<dt>Text, Documents, and Reports</dt>
<dd>
aspell(*), ispell(*), hunspell<br>
doxygen, pandoc<br>
LaTeX, PDF and Postscript tools<br>
</dd>

<dt>Programming Languages, Compilers, and Tools</dt>
<dd>
make, cmake(*)<br>
gcc / g++ (C, C++, and Fortran)<br>
java, javac<br>
lua<br>
perl<br>
python<br>
</dd>
  
<dt>System Utilities</dt>
<dd>
htop(*), top
</dd>

<dt>Linux Containers</dt>
<dd>
singularity
</dd>
</dl>

(*) These tools are yet to be installed.


<br>
_Note:_ The installed versions of the above core tools will change regularly as these tools are upgraded on a regular basis via the CentOS package mangager [yum](https://en.wikipedia.org/wiki/Yum_(.rpm)).


[Software Repositories]: {{ '/software/software-repositories.html' | relative_url }}

<style>
dt {
  margin-top: 1ex;
}
</style>  
