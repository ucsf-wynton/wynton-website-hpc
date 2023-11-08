# Core Software

A large number of common Linux software tools are available on the
cluster as part of the core setup.  Below follows a small excerpt of
what tools are available development nodes and compute nodes. The
login and data-transfer nodes have a much smaller selection of
software.

<dl>
<dt>File Editing</dt>
<dd>
emacs, nano, vim
</dd>

<dt>File Transferring</dt>
<dd>
ftp, lftp, scp, sftp, rsync<br>
curl, wget<br>
rclone<br>
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
node, npm<br>
perl<br>
python<br>
rustc (Rust)<br>
</dd>
  
<dt>System Utilities</dt>
<dd>
top<br>
screen, tmux<br>
</dd>

<dt>Linux Containers</dt>
<dd>
apptainer (formerly singularity)
</dd>
</dl>

<br>

_Note:_ These core tools will be updated without notice as the
operating system is updated on a regular basis.  Many of the
tools originate from the (stable) Rocky 8
repositories.  To see what software and system libraries that are
installed, run `dnf --cached-only list`.  Please note that, compared to
compute nodes, the development nodes have additional software
installed (typically named `-devel`) needed to build and compile from
source.


<style>
dt {
  margin-top: 1ex;
}
</style>  

[Software Repositories]: /hpc/software/software-repositories.html
