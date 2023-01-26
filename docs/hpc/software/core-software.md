# CentOS Core Software

A large number of common Linux software tools are available on the cluster (compute nodes and development nodes) as part of the core setup.  Below follows a small excerpt of what tools are available.
<!--
Additional software can be found in the [Software Repositories].
-->


<dl>
<dt>File Editing</dt>
<dd>
emacs, nano, vim
</dd>

<dt>File Transferring</dt>
<dd>
ftp, lftp, scp, sftp, rsync<br>
curl, wget<br>
dos2unix<br>
</dd>

<dt>File Compression and Archiving</dt>
<dd>
7z, bzip2, gzip, lz4, zip, xz<br>
ar, cpio, tar<br>
</dd>

<dt>Communication</dt>
<dd>
ssh, telnet
</dd>

<dt>Version Control</dt>
<dd>
git, svn
</dd>

<dt>Text, Documents, and Reports</dt>
<dd>
hunspell<br>
pandoc<br>
LaTeX, PDF and Postscript tools<br>
</dd>

<dt>Programming Languages, Compilers, and Tools</dt>
<dd>
make, cmake<br>
gcc / g++ (C, C++, and Fortran)<br>
java, javac<br>
lua<br>
perl<br>
python<br>
rustc (Rust)<br>
</dd>
  
<dt>System Utilities</dt>
<dd>
top
</dd>

<dt>Linux Containers</dt>
<dd>
apptainer (formerly singularity)
</dd>
</dl>

<br>
_Note:_ These core tools will be updated without notice as the operating system is updated on a regular basis via the CentOS package mangager [yum](https://en.wikipedia.org/wiki/Yum_(.rpm)).  Many of the tools originate from the (stable) CentOS 7 [Extras] and [EPEL] repositories.  To see what software and system libraries that are installed, run `yum list installed`.  Please note that, compared to compute nodes, the development nodes have additional software installed (typically named `-devel`) needed to build and compile from source.


<style>
dt {
  margin-top: 1ex;
}
</style>  

[Extras]: https://centos.pkgs.org/7/centos-extras-x86_64/
[EPEL]: https://centos.pkgs.org/7/epel-x86_64/
[Software Repositories]: /hpc/software/software-repositories.html
