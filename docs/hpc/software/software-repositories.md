<!--
WARNING: Do _not_ update this file; it is automatically generated from software-respository.md.rsp.
-->

<!-- Disable several check that otherwise the Lua module code triggers -->
<!-- markdownlint-disable-file MD010 -->
<!-- markdownlint-disable-file MD012 -->
<!-- markdownlint-disable-file MD022 -->
<!-- markdownlint-disable-file MD023 -->
<!-- markdownlint-disable-file MD049 -->





# Software Repositories

In addition to the [core software] tools that are available by default, additional software is available via _environment modules_.  For example, although MATLAB is installed on the system, it is not available by default. Instead, we need to "load" its module first, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ module load matlab
[alice@{{ site.devel.name }} ~]$ module list

Currently Loaded Modules:
  1) matlab/2021a
```
Then we can launch MATLAB using:
```sh
[alice@{{ site.devel.name }} ~]$ matlab -nosplash -nodesktop
```

To see what other "built-in" modules are available, use:

```sh
[alice@{{ site.devel.name }} ~]$ module avail
```


In additional a set of built-in environment modules, there are also modules for software tools that are installed and maintained by other users or research groups.  To access these, we first need to load the corresponding "Software Repository" module.  For example, to get access to the repository and the software shared by the UCSF Computation Biology and Informatics core (CBI), make sure to load ("enable") the repository first, e.g.

```sh
module load CBI
```

Then use `module avail` to list what modules and versions are available (or see below).  Next, to actually get access to one or more of the shared software modules, use `module load <name>` or `module load <name>/<version>`.  Here are a few examples:
```sh
module load bowtie2
module load bowtie2/2.4.2
module load r
```

It is possible to (i) enable a software repository and (ii) load a set of software tools in one call, e.g.
```sh
module load CBI r bwa bowtie2/2.4.2
```


Below are 3 software repositories, each providing a set of software tools.

<ul class="nav nav-pills">
<li class="active"><a data-toggle="pill" href="#button_repository_built-in"><span style="font-weight: bold;">built-in</span>&nbsp;(6)</a></li>
<li><a data-toggle="pill" href="#button_repository_cbi"><span style="font-weight: bold;">CBI</span>&nbsp;(96)</a></li>
<li><a data-toggle="pill" href="#button_repository_sali"><span style="font-weight: bold;">Sali</span>&nbsp;(95)</a></li>
</ul>

<div class="tab-content" style="margin-top: 1ex;">
<div id="button_repository_built-in" class="tab-pane fadein active">

<h2 id="repository_built-in">Module Software Repository: built-in (6)</h2>

Maintained by: {{ site.cluster.nickname }} Systems Administrators, <a href="{{ '/about/contact.html' | relative_url }}">{{ site.cluster.name }}</a><br>
Enable repository: <em>this software repository is always enabled</em><br>

<h3 id="module_built-in_amber" class="module-name">amber</h3>
<dl>
  <dd class="module-details">
Versions: <span class="module-version">20, <em>22</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Amber: Tools for Molecular Simulations&quot;
setenv        AMBERHOME       /usr/local/amber22
prepend-path  PATH            /usr/local/amber22/bin
prepend-path  LD_LIBRARY_PATH /usr/local/amber22/lib
prepend-path  PERL5LIB        /usr/local/amber22/lib/perl
prepend-path  PYTHONPATH      /usr/local/amber22/lib/python3.6/site-packages
setenv        QUICK_BASIS     /usr/local/amber22/AmberTools/src/quick/basis
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_built-in_cuda" class="module-name">cuda</h3>
<dl>
  <dd class="module-details">
Versions: <span class="module-version">7.5, 8.0, 9.1, 9.2, 10.1, 11.0, 11.3, 11.4, 11.5, 11.8, <em>12.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;NVIDIA CUDA Toolkit libraries&quot;
prepend-path  PATH               /usr/local/cuda-12.2.2/bin
prepend-path  LD_LIBRARY_PATH    /usr/local/cuda-12.2.2/lib64
setenv        CUDA_LIB_PATH      /usr/local/cuda-12.2.2/lib64
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_built-in_julia" class="module-name">julia</h3>
<dl>
  <dd class="module-details">
Versions: <span class="module-version">0.6.4, <em>1.6.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Julia programming language&quot;
prepend-path  PATH      /usr/local/julia-1.6.0/bin
prepend-path  MANPATH   /usr/local/julia-1.6.0/share/man
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_built-in_matlab" class="module-name">matlab</h3>
<dl>
  <dd class="module-details">
Versions: <span class="module-version">2018b, 2019a, 2019b, 2020a, 2020b, 2021a, 2021b, 2022a, 2022b, 2023a, <em>2023b</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Language for technical computing&quot;
prepend-path  PATH                /usr/local/matlab/R2023b/bin
setenv        MLM_LICENSE_FILE    27000@matl1.wynton.ucsf.edu:27000@matl2.wynton.ucsf.edu
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_built-in_matlab-runtime" class="module-name">matlab-runtime</h3>
<dl>
  <dd class="module-details">
Versions: <span class="module-version">2018b, 2019a, 2019b, 2020a, 2020b, 2021a, 2021b, 2022a, 2022b, 2023a, <em>2023b</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;MATLAB Runtime for making use of MATLAB Compiler applications&quot;
prepend-path  LD_LIBRARY_PATH     /usr/local/matlab/R2023b/runtime/glnxa64:/usr/local/matlab/R2023b/bin/glnxa64:/usr/local/matlab/R2023b/sys/os/glnxa64:/usr/local/matlab/R2023b/extern/bin/glnxa64
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_built-in_openjdk" class="module-name">openjdk</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">openjdk: Open Java Development Kit</strong><br>
<span class="module-description">OpenJDK is a free and open-source implementation of the Java Platform, Standard Edition. It is the result of an effort Sun Microsystems began in 2006.</span><br>
Example: <span class="module-example"><code>java -version</code> and <code>javac -version</code> (SDK only).</span><br>
Note: <span class="module-note">This module loads the Software Development Kit (SDK) version, if available, otherwise the Run-Time Environment (JRE).</span><br>
URL: <span class="module-url"><a href="https://openjdk.java.net/">https://openjdk.java.net/</a>, <a href="https://openjdk.java.net/projects/jdk/">https://openjdk.java.net/projects/jdk/</a> (changelog), <a href="https://github.com/openjdk/jdk">https://github.com/openjdk/jdk</a> (source code)</span><br>
Versions: <span class="module-version">1.8.0, 11, <em>17</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help(&quot;openjdk: Open Java Development Kit&quot;)

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, java&quot;)
whatis(&quot;URL: https://openjdk.java.net/, https://openjdk.java.net/projects/jdk/ (changelog), https://github.com/openjdk/jdk (source code)&quot;)
whatis([[
Description: OpenJDK is a free and open-source implementation of the Java Platform, Standard Edition. It is the result of an effort Sun Microsystems began in 2006.
Examples: `java -version` and `javac -version` (SDK only).
Note: This module loads the Software Development Kit (SDK) version, if available, otherwise the Run-Time Environment (JRE).
]])

local root = &quot;/usr/lib/jvm&quot;

-- Use SDK, if available, otherwise JRE
local home = pathJoin(root, &quot;java&quot; .. &quot;-&quot; .. version)
if not isDir(home) then -- isDir() supports symlinked folders
    home = pathJoin(root, &quot;jre&quot; .. &quot;-&quot; .. version)
end

-- Assert that OpenJDK version still exists, because
-- it happens at times that older versions are removed
if not isDir(home) then
  LmodError(&quot;INTERNAL ERROR: Module &quot; .. name .. &quot;/&quot; .. version .. &quot; is broken, because folder &quot; .. home .. &quot; does not exist on host &quot; .. os.getenv(&quot;HOSTNAME&quot;) .. &quot;. Please report this to the sysadms.&quot;)
end

setenv(&quot;JAVA_HOME&quot;, home)
prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
prepend_path(&quot;CPATH&quot;, pathJoin(home, &quot;include&quot;))
</code></pre>

</details>
  </dd>
</dl>
</div> 

<div id="button_repository_cbi" class="tab-pane fade">

<h2 id="repository_cbi">Module Software Repository: CBI (96)</h2>

Maintained by: Henrik Bengtsson, <a href="https://cbi.ucsf.edu">Computational Biology and Informatics</a><br>
Enable repository: <code>module load CBI</code><br>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Please note that this software stack is maintained and contributed by a research group on a voluntary basis. It is <em>not</em> maintained by the {{ site.cluster.name }} admins. Please reach out to the corresponding maintainer for bug reports, feedback, or questions.
</div>

<h3 id="module_cbi_apache-ant" class="module-name">apache-ant</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Apache Ant: A Java Library and Command-Line Tool to Build Software</strong><br>
<span class="module-description">Apache Ant is a Java library and command-line tool that help building software.</span><br>
Example: <span class="module-example"><code>ant -h</code></span><br>
URL: <span class="module-url"><a href="https://ant.apache.org/bindownload.cgi">https://ant.apache.org/bindownload.cgi</a>, <a href="https://ant.apache.org/antnews.html">https://ant.apache.org/antnews.html</a> (changelog)</span><br>
Versions: <span class="module-version"><em>1.10.12</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Apache Ant: A Java Library and Command-Line Tool to Build Software
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming&quot;)
whatis(&quot;URL: https://ant.apache.org/bindownload.cgi, https://ant.apache.org/antnews.html (changelog)&quot;)
whatis([[
Description: Apache Ant is a Java library and command-line tool that help building software.
Examples: `ant -h`
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))


</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_asciigenome" class="module-name">asciigenome</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">ASCIIGenome: Text Only Genome Viewer</strong><br>
<span class="module-description">ASCIIGenome is a genome browser based on command line interface and designed for running from console terminals. Since ASCIIGenome does not require a graphical interface it is particularly useful for quickly visualizing genomic data on remote servers while offering flexibility similar to popular GUI viewers like IGV.</span><br>
Example: <span class="module-example"><code>ASCIIGenome --help</code>, and <code>ASCIIGenome bigWigExample.bw</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/dariober/ASCIIGenome">https://github.com/dariober/ASCIIGenome</a>, <a href="https://github.com/dariober/ASCIIGenome/blob/master/CHANGELOG.md">https://github.com/dariober/ASCIIGenome/blob/master/CHANGELOG.md</a> (changelog), <a href="https://asciigenome.readthedocs.io/en/latest/">https://asciigenome.readthedocs.io/en/latest/</a> (documentation)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>1.18.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
ASCIIGenome: Text Only Genome Viewer
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, viewer, cli, tui&quot;)
whatis(&quot;URL: https://github.com/dariober/ASCIIGenome, https://github.com/dariober/ASCIIGenome/blob/master/CHANGELOG.md (changelog), https://asciigenome.readthedocs.io/en/latest/ (documentation)&quot;)
whatis([[
Description: ASCIIGenome is a genome browser based on command line interface and designed for running from console terminals. Since ASCIIGenome does not require a graphical interface it is particularly useful for quickly visualizing genomic data on remote servers while offering flexibility similar to popular GUI viewers like IGV.
Examples: `ASCIIGenome --help`, and `ASCIIGenome bigWigExample.bw`.
Warning: Only the most recent version of this software will be kept.
]])
-- too long for small screens: `ASCIIGenome http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/supporting/functional_annotation/filtered/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5.20130502.sites.annotation.vcf.gz`

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, &quot;ASCIIGenome&quot; .. &quot;-&quot; .. version)
prepend_path(&quot;PATH&quot;, home)


</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bamutil" class="module-name">bamutil</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">bamUtil: Programs for Working on SAM/BAM Files</strong><br>
<span class="module-description">bamUtil is a repository that contains several programs that perform operations on SAM/BAM files. All of these programs are built into a single executable, <code>bam</code>.</span><br>
Example: <span class="module-example"><code>bam help</code>.</span><br>
URL: <span class="module-url"><a href="https://genome.sph.umich.edu/wiki/BamUtil">https://genome.sph.umich.edu/wiki/BamUtil</a>, <a href="https://github.com/statgen/bamUtil">https://github.com/statgen/bamUtil</a></span><br>
Versions: <span class="module-version"><em>1.0.14</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
bamUtil: Programs for Working on SAM/BAM Files
]])

local name = &quot;bamUtil&quot;
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: version control&quot;)
whatis(&quot;URL: https://genome.sph.umich.edu/wiki/BamUtil, https://github.com/statgen/bamUtil&quot;)
whatis(&quot;Description: bamUtil is a repository that contains several programs that perform operations on SAM/BAM files. All of these programs are built into a single executable, `bam`. Example: `bam help`.&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bat" class="module-name">bat</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">bat: A cat(1) Clone with Syntax Highlighting and Git Integration</strong><br>
<span class="module-description">A cat(1) clone with syntax highlighting and Git integration.</span><br>
Example: <span class="module-example"><code>bat README.md</code>, <code>bat scripts/*.sh</code>, and <code>bat src/*.c</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/sharkdp/bat">https://github.com/sharkdp/bat</a>, <a href="https://github.com/sharkdp/bat/blob/master/CHANGELOG.md">https://github.com/sharkdp/bat/blob/master/CHANGELOG.md</a> (changelog)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>0.24.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
bat: A cat(1) Clone with Syntax Highlighting and Git Integration
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, file viewer, cli, tui&quot;)
whatis(&quot;URL: https://github.com/sharkdp/bat, https://github.com/sharkdp/bat/blob/master/CHANGELOG.md (changelog)&quot;)
whatis([[
Description: A cat(1) clone with syntax highlighting and Git integration.
Examples: `bat README.md`, `bat scripts/*.sh`, and `bat src/*.c`.
Warning: Only the most recent version of this software will be kept.
]])

-- Local variables
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;, &quot;man1&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bats-assert" class="module-name">bats-assert</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">bats-assert: Assertion Library for Bats (Bash Automated Testing System)</strong><br>
<span class="module-description">This is a helper library providing common assertions for Bats.</span><br>
Example: <span class="module-example">In Bats <code>setup()</code> function: <code>load &quot;${BATS_SUPPORT_HOME}/load.bash&quot;</code> and <code>load &quot;${BATS_ASSERT_HOME}/load.bash&quot;</code></span><br>
URL: <span class="module-url"><a href="https://github.com/bats-core/bats-assert">https://github.com/bats-core/bats-assert</a>, <a href="https://github.com/bats-core/bats-assert/releases">https://github.com/bats-core/bats-assert/releases</a> (changelog), <a href="https://bats-core.readthedocs.io/en/stable/faq.html?highlight=assert#how-can-i-use-helper-libraries-like-bats-assert">https://bats-core.readthedocs.io/en/stable/faq.html?highlight=assert#how-can-i-use-helper-libraries-like-bats-assert</a> (documentation)</span><br>
Versions: <span class="module-version"><em>2.1.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
bats-assert: Assertion Library for Bats (Bash Automated Testing System)
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: bash, shell, testing&quot;)
whatis(&quot;URL: https://github.com/bats-core/bats-assert, https://github.com/bats-core/bats-assert/releases (changelog), https://bats-core.readthedocs.io/en/stable/faq.html?highlight=assert#how-can-i-use-helper-libraries-like-bats-assert (documentation)&quot;)
whatis([[
Description: This is a helper library providing common assertions for Bats.
Examples: In Bats `setup()` function: `load &quot;${BATS_SUPPORT_HOME}/load.bash&quot;` and `load &quot;${BATS_ASSERT_HOME}/load.bash&quot;`
]])

depends_on(&quot;bats-support&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;BATS_ASSERT_HOME&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bats-core" class="module-name">bats-core</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">bats: Bash Automated Testing System</strong><br>
<span class="module-description">Bats is a TAP-compliant testing framework for Bash. It provides a simple way to verify that the UNIX programs you write behave as expected.</span><br>
Example: <span class="module-example"><code>bats --version</code>, <code>bats --help</code>, <code>man bats</code>, <code>man 7 bats</code>, and <code>bats tests/</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/bats-core/bats-core">https://github.com/bats-core/bats-core</a>, <a href="https://github.com/bats-core/bats-core/blob/master/docs/CHANGELOG.md">https://github.com/bats-core/bats-core/blob/master/docs/CHANGELOG.md</a> (changelog), <a href="https://bats-core.readthedocs.io/en/stable/">https://bats-core.readthedocs.io/en/stable/</a> (documentation)</span><br>
Versions: <span class="module-version">1.10.0, <em>1.11.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
bats: Bash Automated Testing System
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: bash, shell, testing&quot;)
whatis(&quot;URL: https://github.com/bats-core/bats-core, https://github.com/bats-core/bats-core/blob/master/docs/CHANGELOG.md (changelog), https://bats-core.readthedocs.io/en/stable/ (documentation)&quot;)
whatis([[
Description: Bats is a TAP-compliant testing framework for Bash. It provides a simple way to verify that the UNIX programs you write behave as expected.
Examples: `bats --version`, `bats --help`, `man bats`, `man 7 bats`, and `bats tests/`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bats-file" class="module-name">bats-file</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">bats-file: File-System Assertion Library for Bats (Bash Automated Testing System)</strong><br>
<span class="module-description">This is a helper library providing common filesystem related assertions and helpers foor Bats.</span><br>
Example: <span class="module-example">In Bats <code>setup()</code> function: <code>load &quot;${BATS_SUPPORT_HOME}/load.bash&quot;</code> and <code>load &quot;${BATS_FILE_HOME}/load.bash&quot;</code></span><br>
URL: <span class="module-url"><a href="https://github.com/bats-core/bats-file">https://github.com/bats-core/bats-file</a>, <a href="https://github.com/bats-core/bats-file/releases">https://github.com/bats-core/bats-file/releases</a> (changelog), <a href="https://bats-core.readthedocs.io/en/stable/faq.html?highlight=assert#how-can-i-use-helper-libraries-like-bats-file">https://bats-core.readthedocs.io/en/stable/faq.html?highlight=assert#how-can-i-use-helper-libraries-like-bats-file</a> (documentation)</span><br>
Versions: <span class="module-version"><em>0.4.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
bats-file: File-System Assertion Library for Bats (Bash Automated Testing System)
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: bash, shell, testing&quot;)
whatis(&quot;URL: https://github.com/bats-core/bats-file, https://github.com/bats-core/bats-file/releases (changelog), https://bats-core.readthedocs.io/en/stable/faq.html?highlight=assert#how-can-i-use-helper-libraries-like-bats-file (documentation)&quot;)
whatis([[
Description: This is a helper library providing common filesystem related assertions and helpers foor Bats.
Examples: In Bats `setup()` function: `load &quot;${BATS_SUPPORT_HOME}/load.bash&quot;` and `load &quot;${BATS_FILE_HOME}/load.bash&quot;`
]])

depends_on(&quot;bats-support&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;BATS_FILE_HOME&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bats-support" class="module-name">bats-support</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">bats-support: Supporting Library for Bats (Bash Automated Testing System)</strong><br>
<span class="module-description">This is a supporting library providing common functions to test helper libraries written for Bats.</span><br>
Example: <span class="module-example">In Bats <code>setup()</code> function: <code>load &quot;${BATS_SUPPORT_HOME}/load.bash&quot;</code></span><br>
URL: <span class="module-url"><a href="https://github.com/bats-core/bats-support">https://github.com/bats-core/bats-support</a>, <a href="https://github.com/bats-core/bats-support/releases">https://github.com/bats-core/bats-support/releases</a> (changelog), <a href="https://bats-core.readthedocs.io/en/stable/faq.html?highlight=assert#how-can-i-use-helper-libraries-like-bats-assert">https://bats-core.readthedocs.io/en/stable/faq.html?highlight=assert#how-can-i-use-helper-libraries-like-bats-assert</a> (documentation)</span><br>
Versions: <span class="module-version"><em>0.3.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
bats-support: Supporting Library for Bats (Bash Automated Testing System)
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: bash, shell, testing&quot;)
whatis(&quot;URL: https://github.com/bats-core/bats-support, https://github.com/bats-core/bats-support/releases (changelog), https://bats-core.readthedocs.io/en/stable/faq.html?highlight=assert#how-can-i-use-helper-libraries-like-bats-assert (documentation)&quot;)
whatis([[
Description: This is a supporting library providing common functions to test helper libraries written for Bats.
Examples: In Bats `setup()` function: `load &quot;${BATS_SUPPORT_HOME}/load.bash&quot;`
]])

depends_on(&quot;bats-core&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;BATS_SUPPORT_HOME&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bcftools" class="module-name">bcftools</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">BCFtools: Utilities for Variant Calling and Manipulating VCFs and BCFs</strong><br>
<span class="module-description">BCFtools is a set of utilities that manipulate variant calls in the Variant Call Format (VCF) and its binary counterpart BCF. All commands work transparently with both VCFs and BCFs, both uncompressed and BGZF-compressed.</span><br>
Example: <span class="module-example"><code>bcftools --version</code></span><br>
URL: <span class="module-url"><a href="https://www.htslib.org/">https://www.htslib.org/</a>, <a href="https://github.com/samtools/bcftools/blob/develop/NEWS">https://github.com/samtools/bcftools/blob/develop/NEWS</a> (changelog), <a href="https://github.com/samtools/bcftools">https://github.com/samtools/bcftools</a> (source code)</span><br>
Versions: <span class="module-version">1.9, 1.10, 1.10.2, 1.11, 1.13, 1.14, 1.15, 1.15.1, 1.16, 1.17, 1.18, 1.19, <em>1.20</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
BCFtools: Utilities for Variant Calling and Manipulating VCFs and BCFs
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://www.htslib.org/, https://github.com/samtools/bcftools/blob/develop/NEWS (changelog), https://github.com/samtools/bcftools (source code)&quot;)
whatis([[
Description: BCFtools is a set of utilities that manipulate variant calls in the Variant Call Format (VCF) and its binary counterpart BCF. All commands work transparently with both VCFs and BCFs, both uncompressed and BGZF-compressed.
Examples: `bcftools --version`
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
pushenv(&quot;BCFTOOLS_PLUGINS&quot;, pathJoin(home, &quot;libexec&quot;, name))


-- Warn about bug https://github.com/samtools/htslib/issues/1236
if (mode() == &quot;load&quot; and version == &quot;1.11&quot;) then
  LmodMessage(&quot;MODULE WARNING: &quot; .. name .. &quot; &quot; .. version .. &quot; has a bug that results in valid but incorrect CIGAR strings. Because of this, it is recommended to use an older or a newer version instead. For details, see https://github.com/samtools/htslib/issues/1236&quot;)
end
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bcl2fastq" class="module-name">bcl2fastq</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">bcl2fastq: Illumina Conversion Software</strong><br>
<span class="module-description">bcl2fastq Conversion Software both demultiplexes data and converts BCL files generated by Illumina sequencing systems to standard FASTQ file formats for downstream analysis.</span><br>
Example: <span class="module-example"><code>bcl2fastq --version</code></span><br>
URL: <span class="module-url"><a href="https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software.html">https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software.html</a>, <a href="https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software/downloads.html">https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software/downloads.html</a> (changelog)</span><br>
Versions: <span class="module-version"><em>2.20.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
bcl2fastq: Illumina Conversion Software
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, Illumina&quot;)
whatis(&quot;URL: https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software.html, https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software/downloads.html (changelog)&quot;)
whatis([[
Description: bcl2fastq Conversion Software both demultiplexes data and converts BCL files generated by Illumina sequencing systems to standard FASTQ file formats for downstream analysis.
Examples: `bcl2fastq --version`
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bedops" class="module-name">bedops</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">BEDOPS: The Fast, Highly Scalable and Easily-Parallelizable Genome Analysis Toolkit</strong><br>
<span class="module-description">BEDOPS is an open-source command-line toolkit that performs highly efficient and scalable Boolean and other set operations, statistical calculations, archiving, conversion and other management of genomic data of arbitrary scale. Tasks can be easily split by chromosome for distributing whole-genome analyses across a computational cluster.</span><br>
Example: <span class="module-example"><code>bedops --version</code></span><br>
URL: <span class="module-url"><a href="https://bedops.readthedocs.io/">https://bedops.readthedocs.io/</a>, <a href="https://bedops.readthedocs.io/en/latest/content/revision-history.html">https://bedops.readthedocs.io/en/latest/content/revision-history.html</a> (changelog), <a href="https://github.com/bedops/bedops">https://github.com/bedops/bedops</a> (source code)</span><br>
Versions: <span class="module-version">2.4.36, 2.4.37, 2.4.38, 2.4.39, 2.4.40, <em>2.4.41</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
BEDOPS: The Fast, Highly Scalable and Easily-Parallelizable Genome Analysis Toolkit
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: &quot;)
whatis(&quot;URL: https://bedops.readthedocs.io/, https://bedops.readthedocs.io/en/latest/content/revision-history.html (changelog), https://github.com/bedops/bedops (source code)&quot;)
whatis([[
Description: BEDOPS is an open-source command-line toolkit that performs highly efficient and scalable Boolean and other set operations, statistical calculations, archiving, conversion and other management of genomic data of arbitrary scale. Tasks can be easily split by chromosome for distributing whole-genome analyses across a computational cluster.
Examples: `bedops --version`
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bedtools2" class="module-name">bedtools2</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">bedtools2: The Swiss Army Knife for Genome Arithmetic</strong><br>
<span class="module-description">Collectively, the bedtools utilities are a swiss-army knife of tools for a wide-range of genomics analysis tasks. The most widely-used tools enable genome arithmetic: that is, set theory on the genome. For example, bedtools allows one to intersect, merge, count, complement, and shuffle genomic intervals from multiple files in widely-used genomic file formats such as BAM, BED, GFF/GTF, VCF.</span><br>
Example: <span class="module-example"><code>bedtools --version</code> and <code>ls $BEDTOOLS2_HOME/genomes/</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/arq5x/bedtools2/">https://github.com/arq5x/bedtools2/</a>, <a href="https://bedtools.readthedocs.io/en/latest/content/history.html">https://bedtools.readthedocs.io/en/latest/content/history.html</a> (changelog), <a href="https://bedtools.readthedocs.org">https://bedtools.readthedocs.org</a> (documentation), <a href="https://code.google.com/archive/p/bedtools/downloads">https://code.google.com/archive/p/bedtools/downloads</a> (legacy)</span><br>
Versions: <span class="module-version">2.26.0, 2.28.0, 2.29.1, 2.29.2, 2.30.0, <em>2.31.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
bedtools2: The Swiss Army Knife for Genome Arithmetic
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://github.com/arq5x/bedtools2/, https://bedtools.readthedocs.io/en/latest/content/history.html (changelog), https://bedtools.readthedocs.org (documentation), https://code.google.com/archive/p/bedtools/downloads (legacy)&quot;)
whatis([[
Description: Collectively, the bedtools utilities are a swiss-army knife of tools for a wide-range of genomics analysis tasks. The most widely-used tools enable genome arithmetic: that is, set theory on the genome. For example, bedtools allows one to intersect, merge, count, complement, and shuffle genomic intervals from multiple files in widely-used genomic file formats such as BAM, BED, GFF/GTF, VCF.
Examples: `bedtools --version` and `ls $BEDTOOLS2_HOME/genomes/`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

-- custom; helps find $BEDTOOLS2_HOME/genomes
pushenv(&quot;BEDTOOLS2_HOME&quot;, home)






</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_blast" class="module-name">blast</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">BLAST+: Basic Local Alignment Search Tool</strong><br>
<span class="module-description">BLAST finds regions of similarity between biological sequences. The program compares nucleotide or protein sequences to sequence databases and calculates the statistical significance.</span><br>
Example: <span class="module-example"><code>blastx -version</code></span><br>
URL: <span class="module-url"><a href="https://blast.ncbi.nlm.nih.gov/Blast.cgi">https://blast.ncbi.nlm.nih.gov/Blast.cgi</a>, <a href="https://www.ncbi.nlm.nih.gov/books/NBK131777/">https://www.ncbi.nlm.nih.gov/books/NBK131777/</a> (changelog)</span><br>
Versions: <span class="module-version">2.9.0, 2.10.1, 2.11.0, 2.12.0, 2.13.0, 2.14.0, 2.14.1, 2.15.0, <em>2.16.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
BLAST+: Basic Local Alignment Search Tool
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, scripting&quot;)
whatis(&quot;URL: https://blast.ncbi.nlm.nih.gov/Blast.cgi, https://www.ncbi.nlm.nih.gov/books/NBK131777/ (changelog)&quot;)
whatis([[
Description: BLAST finds regions of similarity between biological sequences. The program compares nucleotide or protein sequences to sequence databases and calculates the statistical significance.
Examples: `blastx -version`
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)
prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_blat" class="module-name">blat</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">BLAT: Fast Sequence Search Command Line Tool</strong><br>
<span class="module-description">BLAT - client and server combined into a single program, first building the index, then using the index, and then exiting.</span><br>
Example: <span class="module-example"><code>blat</code></span><br>
URL: <span class="module-url"><a href="https://genome.ucsc.edu/goldenPath/help/blatSpec.html">https://genome.ucsc.edu/goldenPath/help/blatSpec.html</a> (documentation), <a href="https://genome.ucsc.edu/FAQ/FAQblat.html">https://genome.ucsc.edu/FAQ/FAQblat.html</a> (faq), <a href="https://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/">https://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/</a> (download), <a href="https://github.com/ucscGenomeBrowser/kent/tree/master/src/blat">https://github.com/ucscGenomeBrowser/kent/tree/master/src/blat</a> (source code)</span><br>
Versions: <span class="module-version">36x4, 37x1, <em>39x1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
BLAT: Fast Sequence Search Command Line Tool
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, alignment&quot;)
whatis(&quot;URL: https://genome.ucsc.edu/goldenPath/help/blatSpec.html (documentation), https://genome.ucsc.edu/FAQ/FAQblat.html (faq), https://hgdownload.cse.ucsc.edu/admin/exe/linux.x86_64/blat/ (download), https://github.com/ucscGenomeBrowser/kent/tree/master/src/blat (source code)&quot;)
whatis([[
Description: BLAT - client and server combined into a single program, first building the index, then using the index, and then exiting.
Examples: `blat`
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)
prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bowtie" class="module-name">bowtie</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Bowtie: A Fast and Sensitive Gapped Read Aligner</strong><br>
<span class="module-description">Bowtie is an ultrafast, memory-efficient short read aligner.</span><br>
Example: <span class="module-example"><code>bowtie --version</code> and <code>ls $BOWTIE_HOME/{genomes,indexes}</code></span><br>
Note: <span class="module-note">This is Bowtie v1 - <em>not v2</em>.</span><br>
URL: <span class="module-url"><a href="https://bowtie-bio.sourceforge.net/index.shtml">https://bowtie-bio.sourceforge.net/index.shtml</a>, <a href="https://bowtie-bio.sourceforge.net/index.shtml">https://bowtie-bio.sourceforge.net/index.shtml</a> (changelog), <a href="https://github.com/BenLangmead/bowtie">https://github.com/BenLangmead/bowtie</a> (source code)</span><br>
Versions: <span class="module-version">1.2.3, 1.3.0, <em>1.3.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Bowtie: A Fast and Sensitive Gapped Read Aligner
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://bowtie-bio.sourceforge.net/index.shtml, https://bowtie-bio.sourceforge.net/index.shtml (changelog), https://github.com/BenLangmead/bowtie (source code)&quot;)
whatis([[
Description: Bowtie is an ultrafast, memory-efficient short read aligner.
Examples: `bowtie --version` and `ls $BOWTIE_HOME/{genomes,indexes}`
Note: This is Bowtie v1 - _not v2_.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)
prepend_path(&quot;PATH&quot;, home)
pushenv(&quot;BOWTIE_HOME&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bowtie2" class="module-name">bowtie2</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Bowtie 2: A Fast and Sensitive Gapped Read Aligner</strong><br>
<span class="module-description">Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences.</span><br>
Example: <span class="module-example"><code>bowtie2 --version</code></span><br>
URL: <span class="module-url"><a href="https://bowtie-bio.sourceforge.net/bowtie2/index.shtml">https://bowtie-bio.sourceforge.net/bowtie2/index.shtml</a>, <a href="https://bowtie-bio.sourceforge.net/bowtie2/index.shtml">https://bowtie-bio.sourceforge.net/bowtie2/index.shtml</a> (changelog), <a href="https://github.com/BenLangmead/bowtie2">https://github.com/BenLangmead/bowtie2</a> (source code)</span><br>
Versions: <span class="module-version">2.3.5, 2.3.5.1, 2.4.1, 2.4.2, 2.4.4, 2.4.5, 2.5.0, 2.5.1, 2.5.2, <em>2.5.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Bowtie 2: A Fast and Sensitive Gapped Read Aligner
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://bowtie-bio.sourceforge.net/bowtie2/index.shtml, https://bowtie-bio.sourceforge.net/bowtie2/index.shtml (changelog), https://github.com/BenLangmead/bowtie2 (source code)&quot;)
whatis([[
Description: Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences.
Examples: `bowtie2 --version`
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_bwa" class="module-name">bwa</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">BWA: Burrows-Wheeler Aligner</strong><br>
<span class="module-description">Burrows-Wheeler Aligner (BWA) is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome.</span><br>
Example: <span class="module-example"><code>bwa</code>.</span><br>
URL: <span class="module-url"><a href="http://bio-bwa.sourceforge.net/">http://bio-bwa.sourceforge.net/</a>, <a href="https://github.com/lh3/bwa/blob/master/NEWS.md">https://github.com/lh3/bwa/blob/master/NEWS.md</a> (changelog), <a href="https://github.com/lh3/bwa">https://github.com/lh3/bwa</a> (source code)</span><br>
Versions: <span class="module-version">0.7.12, 0.7.17, <em>0.7.18</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
BWA: Burrows-Wheeler Aligner
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: http://bio-bwa.sourceforge.net/, https://github.com/lh3/bwa/blob/master/NEWS.md (changelog), https://github.com/lh3/bwa (source code)&quot;)
whatis([[
Description: Burrows-Wheeler Aligner (BWA) is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome.
Examples: `bwa`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;man&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_byobu" class="module-name">byobu</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">byobu: Elegant Enhancement of the Otherwise Functional, Plain, Practical GNU Screen</strong><br>
<span class="module-description">Byobu is an elegant enhancement of the otherwise functional, plain, practical GNU Screen. Byobu includes an enhanced profile, configuration utilities, and system status notifications for the GNU screen window manager as well as the Tmux terminal multiplexer.</span><br>
Example: <span class="module-example"><code>byobu --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.byobu.org/">https://www.byobu.org/</a>, <a href="https://bazaar.launchpad.net/~kirkland/byobu/trunk/view/head:/debian/changelog">https://bazaar.launchpad.net/~kirkland/byobu/trunk/view/head:/debian/changelog</a> (changelog), <a href="https://github.com/dustinkirkland/byobu">https://github.com/dustinkirkland/byobu</a> (source code)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>5.133</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
byobu: Elegant Enhancement of the Otherwise Functional, Plain, Practical GNU Screen
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: terminal, SSH&quot;)
whatis(&quot;URL: https://www.byobu.org/, https://bazaar.launchpad.net/~kirkland/byobu/trunk/view/head:/debian/changelog (changelog), https://github.com/dustinkirkland/byobu (source code)&quot;)
whatis([[
Description: Byobu is an elegant enhancement of the otherwise functional, plain, practical GNU Screen. Byobu includes an enhanced profile, configuration utilities, and system status notifications for the GNU screen window manager as well as the Tmux terminal multiplexer.
Examples: `byobu --version`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;,  pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;,  pathJoin(home, &quot;share&quot;, &quot;man&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_cellranger" class="module-name">cellranger</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Cell Ranger: 10x Genomics Pipeline for Single-Cell Data Analysis</strong><br>
<span class="module-description">Cell Ranger is a set of analysis pipelines that process Chromium Single Cell 3' RNA-seq output to align reads, generate gene-cell matrices and perform clustering and gene expression analysis.</span><br>
Example: <span class="module-example"><code>cellranger --help</code> and <code>cellranger --version</code>.</span><br>
URL: <span class="module-url"><a href="https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/what-is-cell-ranger">https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/what-is-cell-ranger</a>, <a href="https://www.10xgenomics.com/support/software/cell-ranger/latest/release-notes/cr-release-notes">https://www.10xgenomics.com/support/software/cell-ranger/latest/release-notes/cr-release-notes</a> (changelog), <a href="https://github.com/10XGenomics/cellranger">https://github.com/10XGenomics/cellranger</a> (source code)</span><br>
Warning: <span class="module-warning">To prevent a single Cell Ranger process from hijacking all CPU and RAM by default, this module sets environment variable <code>MROFLAGS='--localcores=1 --localmem=8 --limit-loadavg'</code> making those the default.</span><br>
Versions: <span class="module-version">2.1.0, 3.0.2, 3.1.0, 4.0.0, 5.0.1, 6.1.1, 6.1.2, 7.0.0, 7.0.1, 7.1.0, 7.2.0, 8.0.0, <em>8.0.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Cell Ranger: 10x Genomics Pipeline for Single-Cell Data Analysis
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, 10x genomics&quot;)
whatis(&quot;URL: https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/what-is-cell-ranger, https://www.10xgenomics.com/support/software/cell-ranger/latest/release-notes/cr-release-notes (changelog), https://github.com/10XGenomics/cellranger (source code)&quot;)
whatis([[
Description: Cell Ranger is a set of analysis pipelines that process Chromium Single Cell 3' RNA-seq output to align reads, generate gene-cell matrices and perform clustering and gene expression analysis.
Examples: `cellranger --help` and `cellranger --version`.
Warning: To prevent a single Cell Ranger process from hijacking all CPU and RAM by default, this module sets environment variable `MROFLAGS='--localcores=1 --localmem=8 --limit-loadavg'` making those the default.
]])

load(&quot;bcl2fastq&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)

-- Make CellRanger run on a single core with little memory by default
-- This prevents a single Cell Ranger process from hijacking all
-- available CPU and memory resources.
-- REFERENCES:
-- * https://martian-lang.org/advanced-features/#job-management
pushenv(&quot;MROFLAGS&quot;, &quot;--localcores=1 --localmem=8 --limit-loadavg&quot;)

-- Assert that the current machine supports x86-64 v2 or greater
setenv(&quot;X86_64_LEVEL_ASSERT&quot;, &quot;2&quot;)
try_load(&quot;x86-64-level&quot;)
setenv(&quot;X86_64_LEVEL_ASSERT&quot;, &quot;&quot;)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_chafa" class="module-name">chafa</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">chafa: Chafa (Character Art Facsimile) Terminal Graphics and Character Art Generator</strong><br>
<span class="module-description">Chafa is a command-line utility that converts image data, including animated GIFs, into graphics formats or ANSI/Unicode character art suitable for display in a terminal.</span><br>
Example: <span class="module-example"><code>chafa image.png</code>, <code>chafa --version</code> and <code>chafa --help</code>.</span><br>
URL: <span class="module-url"><a href="https://hpjansson.org/chafa/">https://hpjansson.org/chafa/</a>, <a href="https://github.com/hpjansson/chafa/blob/master/NEWS">https://github.com/hpjansson/chafa/blob/master/NEWS</a> (changelog) <a href="https://github.com/hpjansson/chafa/releases">https://github.com/hpjansson/chafa/releases</a> (releases), <a href="https://github.com/hpjansson/chafa">https://github.com/hpjansson/chafa</a> (source code)</span><br>
Versions: <span class="module-version"><em>1.14.1-1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
chafa: Chafa (Character Art Facsimile) Terminal Graphics and Character Art Generator
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: cli, shell&quot;)
whatis(&quot;URL: https://hpjansson.org/chafa/, https://github.com/hpjansson/chafa/blob/master/NEWS (changelog) https://github.com/hpjansson/chafa/releases (releases), https://github.com/hpjansson/chafa (source code)&quot;)
whatis([[
Description: Chafa is a command-line utility that converts image data, including animated GIFs, into graphics formats or ANSI/Unicode character art suitable for display in a terminal.
Examples: `chafa image.png`, `chafa --version` and `chafa --help`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_cmake" class="module-name">cmake</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">CMake: Open-source, Cross-platform Family of Tools Designed to Build, Test and Package Software</strong><br>
<span class="module-description">CMake is cross-platform free and open-source software for managing the build process of software using a compiler-independent method. It supports directory hierarchies and applications that depend on multiple libraries.</span><br>
Example: <span class="module-example"><code>cmake --version</code>.</span><br>
URL: <span class="module-url"><a href="https://cmake.org/">https://cmake.org/</a>, <a href="https://cmake.org/cmake/help/latest/release/index.html">https://cmake.org/cmake/help/latest/release/index.html</a> (changelog) <a href="https://github.com/Kitware/CMake/releases">https://github.com/Kitware/CMake/releases</a> (download)</span><br>
Versions: <span class="module-version"><em>3.29.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
CMake: Open-source, Cross-platform Family of Tools Designed to Build, Test and Package Software
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: development, make&quot;)
whatis(&quot;URL: https://cmake.org/, https://cmake.org/cmake/help/latest/release/index.html (changelog) https://github.com/Kitware/CMake/releases (download)&quot;)
whatis([[
Description: CMake is cross-platform free and open-source software for managing the build process of software using a compiler-independent method. It supports directory hierarchies and applications that depend on multiple libraries.
Examples: `cmake --version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;,  pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;,  pathJoin(home, &quot;man&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_conda-stage" class="module-name">conda-stage</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">conda-stage: Stage Conda Environment on Local Disk</strong><br>
<span class="module-description">The 'conda-stage' tool stages a Conda environment to local disk. Working with a Conda environment on local disk can greatly improve the performance as local disk is often much faster than a global, network-based file system, including multi-tenant parallel file systems such as BeeGFS and Lustre often found in high-performance compute (HPC) environments.</span><br>
Example: <span class="module-example"><code>conda-stage --auto-stage=enable</code>, and <code>conda-stage --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/HenrikBengtsson/conda-stage">https://github.com/HenrikBengtsson/conda-stage</a>, <a href="https://github.com/HenrikBengtsson/conda-stage/blob/develop/NEWS.md">https://github.com/HenrikBengtsson/conda-stage/blob/develop/NEWS.md</a> (changelog), <a href="https://github.com/HenrikBengtsson/conda-stage/tags">https://github.com/HenrikBengtsson/conda-stage/tags</a> (releases)</span><br>
Warning: <span class="module-warning">This is work under construction. Your milage may vary! /HB 2022-04-13</span><br>
Versions: <span class="module-version"><em>0.7.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
conda-stage: Stage Conda Environment on Local Disk
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: cli, shell&quot;)
whatis(&quot;URL: https://github.com/HenrikBengtsson/conda-stage, https://github.com/HenrikBengtsson/conda-stage/blob/develop/NEWS.md (changelog), https://github.com/HenrikBengtsson/conda-stage/tags (releases)&quot;)
whatis([[
Description: The 'conda-stage' tool stages a Conda environment to local disk. Working with a Conda environment on local disk can greatly improve the performance as local disk is often much faster than a global, network-based file system, including multi-tenant parallel file systems such as BeeGFS and Lustre often found in high-performance compute (HPC) environments.
Examples: `conda-stage --auto-stage=enable`, and `conda-stage --help`.
Warning: This is work under construction. Your milage may vary! /HB 2022-04-13
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)

-- WORKAROUND: For some reasons, this is required in order for
-- the 'root' part to be included in the 'home' path below in
-- *some* cases. For example, if we do 'conda activate base',
-- 'conda deactivate', and then 'module load conda-stage' we
-- would, for unknown reasons, end up with an empty 'root'.
-- The below seems to force the correct value of 'root'.
-- /HB 2022-09-22
if not isDir(root) then
  LmodError(&quot;Environment variable 'SOFTWARE_ROOT_CBI' does not specify an existing folder: &quot; .. os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;))
end

local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

pushenv(&quot;CONDA_STAGE_PROLOGUE&quot;, &quot;module load CBI &quot; .. name)

local script = pathJoin(home, &quot;bin&quot;, &quot;conda-stage.&quot; .. myShellType())
if not isFile(script) then
  LmodError(&quot;The &quot; .. name .. &quot; module is not supported for your shell (&quot; .. myShellType() .. &quot;; SHELL=&quot; .. os.getenv(&quot;SHELL&quot;) .. &quot;). No such file: &quot; .. script)
end

-- Create conda-stage() function, which will overwrite itself after the
-- first invocation
local body = 'source &quot;' .. script .. '&quot;; '
body = body .. 'conda-stage &quot;$@&quot;'
set_shell_function(&quot;conda-stage&quot;, body, '')
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_control-freec" class="module-name">control-freec</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Control FREEC: Control-FREE Copy Number and Genotype Caller</strong><br>
<span class="module-description">Prediction of copy numbers and allelic content using deep-sequencing data.</span><br>
Example: <span class="module-example"><code>freec</code></span><br>
URL: <span class="module-url"><a href="http://boevalab.com/FREEC/">http://boevalab.com/FREEC/</a>, <a href="https://github.com/BoevaLab/FREEC/releases">https://github.com/BoevaLab/FREEC/releases</a> (changelog), <a href="https://github.com/BoevaLab/FREEC/">https://github.com/BoevaLab/FREEC/</a> (source code)</span><br>
Versions: <span class="module-version">11.5, <em>11.6</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Control FREEC: Control-FREE Copy Number and Genotype Caller
]])

local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: &quot;)
whatis(&quot;URL: http://boevalab.com/FREEC/, https://github.com/BoevaLab/FREEC/releases (changelog), https://github.com/BoevaLab/FREEC/ (source code)&quot;)
whatis([[
Description: Prediction of copy numbers and allelic content using deep-sequencing data.
Examples: `freec`
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local name = &quot;FREEC&quot;
local home = pathJoin(root, name .. &quot;-&quot; .. version)
prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))


</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_cufflinks" class="module-name">cufflinks</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Cufflinks: Transcriptome Assembly and Differential Expression Analysis for RNA-Seq</strong><br>
<span class="module-description">Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples. It accepts aligned RNA-Seq reads and assembles the alignments into a parsimonious set of transcripts. Cufflinks then estimates the relative abundances of these transcripts based on how many reads support each one, taking into account biases in library preparation protocols.</span><br>
Example: <span class="module-example"><code>cufflinks</code></span><br>
URL: <span class="module-url"><a href="http://cole-trapnell-lab.github.io/cufflinks/">http://cole-trapnell-lab.github.io/cufflinks/</a>, <a href="https://github.com/cole-trapnell-lab/cufflinks">https://github.com/cole-trapnell-lab/cufflinks</a> (source code)</span><br>
Versions: <span class="module-version"><em>2.2.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Cufflinks: Transcriptome Assembly and Differential Expression Analysis for RNA-Seq
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: http://cole-trapnell-lab.github.io/cufflinks/, https://github.com/cole-trapnell-lab/cufflinks (source code)&quot;)
whatis([[
Description: Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples. It accepts aligned RNA-Seq reads and assembles the alignments into a parsimonious set of transcripts. Cufflinks then estimates the relative abundances of these transcripts based on how many reads support each one, taking into account biases in library preparation protocols.
Examples: `cufflinks`
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_cutadapt" class="module-name">cutadapt</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Cutadapt: Remove Adapter Sequences from Sequencing Reads</strong><br>
<span class="module-description">Cutadapt finds and removes adapter sequences, primers, poly-A tails and other types of unwanted sequence from your high-throughput sequencing reads.</span><br>
Example: <span class="module-example"><code>cutadapt --version</code> and <code>cutadapt --help</code>.</span><br>
URL: <span class="module-url"><a href="https://cutadapt.readthedocs.io/en/stable/">https://cutadapt.readthedocs.io/en/stable/</a>, <a href="https://github.com/marcelm/cutadapt/blob/main/CHANGES.rst">https://github.com/marcelm/cutadapt/blob/main/CHANGES.rst</a> (changelog), <a href="https://github.com/marcelm/cutadapt">https://github.com/marcelm/cutadapt</a> (source code)</span><br>
Requirement: <span class="module-requirement">CentOS 7.</span><br>
Versions: <span class="module-version">3.7, <em>4.9</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Cutadapt: Remove Adapter Sequences from Sequencing Reads 
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, genome&quot;)
whatis(&quot;URL: https://cutadapt.readthedocs.io/en/stable/, https://github.com/marcelm/cutadapt/blob/main/CHANGES.rst (changelog), https://github.com/marcelm/cutadapt (source code)&quot;)
whatis([[
Description: Cutadapt finds and removes adapter sequences, primers, poly-A tails and other types of unwanted sequence from your high-throughput sequencing reads.
Requirements: CentOS 7.
Examples: `cutadapt --version` and `cutadapt --help`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
-- Specific to the Linux distribution?
if string.match(myFileName(), &quot;/_&quot; .. os.getenv(&quot;CBI_LINUX&quot;) .. &quot;/&quot;) then
  root = pathJoin(root, &quot;_&quot; .. os.getenv(&quot;CBI_LINUX&quot;))
end

-- if os.getenv(&quot;CBI_LINUX&quot;) ~= &quot;centos7&quot; then
--   LmodError(&quot;The '&quot; .. name .. &quot;' module is not yet supported on &quot; .. os.getenv(&quot;CBI_LINUX&quot;) .. &quot;. See https://github.com/HenrikBengtsson/CBI-software/issues/102 for updates on this problem.&quot;)
-- end

local home = pathJoin(root, name .. &quot;-&quot; .. version)
prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))




</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_easycatfs" class="module-name">easycatfs</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">easycatfs: Easy Read-Only Mounting of Slow Folders onto a Local Drive</strong><br>
<span class="module-description">This is Linux command-line tool for mounting one or more folders on a network file system on a local disk such that the local-disk folders mirrors everything (read-only) on the network folder. This will result in (i) faster repeated access to files, and (ii) decreased load on the network file system. This is particularly beneficial when working on high-performance compute (HPC) clusters used by hundreds and thousands of processes and users simultaneously.</span><br>
Example: <span class="module-example"><code>easycatfs --help</code> and <code>easycatfs mount /shared/data</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/HenrikBengtsson/easycatfs">https://github.com/HenrikBengtsson/easycatfs</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>0.1.5</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
easycatfs: Easy Read-Only Mounting of Slow Folders onto a Local Drive
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, files, hpc&quot;)
whatis(&quot;URL: https://github.com/HenrikBengtsson/easycatfs&quot;)
whatis([[
Description: This is Linux command-line tool for mounting one or more folders on a network file system on a local disk such that the local-disk folders mirrors everything (read-only) on the network folder. This will result in (i) faster repeated access to files, and (ii) decreased load on the network file system. This is particularly beneficial when working on high-performance compute (HPC) clusters used by hundreds and thousands of processes and users simultaneously.
Examples: `easycatfs --help` and `easycatfs mount /shared/data`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_emacs" class="module-name">emacs</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">GNU Emacs: An Extensible, Customizable, Free/Libre Text Editor</strong><br>
<span class="module-description">At its core is an interpreter for Emacs Lisp, a dialect of the Lisp programming language with extensions to support text editing.</span><br>
Example: <span class="module-example"><code>emacs --version</code> and <code>emacs -nw</code>.</span><br>
URL: <span class="module-url"><a href="https://www.gnu.org/software/emacs/">https://www.gnu.org/software/emacs/</a>, <a href="https://www.gnu.org/savannah-checkouts/gnu/emacs/emacs.html#Releases">https://www.gnu.org/savannah-checkouts/gnu/emacs/emacs.html#Releases</a> (changelog)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">29.3, <em>29.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
GNU Emacs: An Extensible, Customizable, Free/Libre Text Editor
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: editor, text, cli, tui&quot;)
whatis(&quot;URL: https://www.gnu.org/software/emacs/, https://www.gnu.org/savannah-checkouts/gnu/emacs/emacs.html#Releases (changelog)&quot;)
whatis([[
Description: At its core is an interpreter for Emacs Lisp, a dialect of the Lisp programming language with extensions to support text editing.
Examples: `emacs --version` and `emacs -nw`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)

-- Specific to the Linux distribution?
if string.match(myFileName(), &quot;/_&quot; .. os.getenv(&quot;CBI_LINUX&quot;) .. &quot;/&quot;) then
  root = pathJoin(root, &quot;_&quot; .. os.getenv(&quot;CBI_LINUX&quot;))
end

local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_expect" class="module-name">expect</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">expect: Programmed Dialogue with Interactive Programs</strong><br>
<span class="module-description">Expect is a tool for automating interactive applications such as telnet, ftp, passwd, fsck, rlogin, tip, etc. Expect really makes this stuff trivial. Expect is also useful for testing these same applications.</span><br>
Example: <span class="module-example"><code>expect -version</code>, and <code>man expect</code>.</span><br>
URL: <span class="module-url"><a href="https://core.tcl-lang.org/expect/index">https://core.tcl-lang.org/expect/index</a>, <a href="https://core.tcl-lang.org/expect/file?name=ChangeLog&amp;ci=tip">https://core.tcl-lang.org/expect/file?name=ChangeLog&amp;ci=tip</a> (changelog), <a href="https://core.tcl-lang.org/expect/dir?ci=tip">https://core.tcl-lang.org/expect/dir?ci=tip</a> (source code), <a href="https://sourceforge.net/projects/expect/files/Expect/">https://sourceforge.net/projects/expect/files/Expect/</a> (download)</span><br>
Versions: <span class="module-version"><em>5.45.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
expect: Programmed Dialogue with Interactive Programs
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: scripting, programming&quot;)
whatis(&quot;URL: https://core.tcl-lang.org/expect/index, https://core.tcl-lang.org/expect/file?name=ChangeLog&amp;ci=tip (changelog), https://core.tcl-lang.org/expect/dir?ci=tip (source code), https://sourceforge.net/projects/expect/files/Expect/ (download)&quot;)
whatis([[
Description: Expect is a tool for automating interactive applications such as telnet, ftp, passwd, fsck, rlogin, tip, etc. Expect really makes this stuff trivial. Expect is also useful for testing these same applications.
Examples: `expect -version`, and `man expect`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)

-- Specific to the Linux distribution?
if string.match(myFileName(), &quot;/_&quot; .. os.getenv(&quot;CBI_LINUX&quot;) .. &quot;/&quot;) then
  root = pathJoin(root, &quot;_&quot; .. os.getenv(&quot;CBI_LINUX&quot;))
end

local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;libs&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_fastqc" class="module-name">fastqc</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">FastQC: A Quality Control Analysis Tool for High Throughput Sequencing Data</strong><br>
<span class="module-description">FastQC is a program designed to spot potential problems in high throughput sequencing datasets. It runs a set of analyses on one or more raw sequence files in fastq or bam format and produces a report which summarises the results.</span><br>
Example: <span class="module-example"><code>fastqc --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.bioinformatics.babraham.ac.uk/projects/fastqc/">https://www.bioinformatics.babraham.ac.uk/projects/fastqc/</a>, <a href="https://raw.githubusercontent.com/s-andrews/FastQC/master/RELEASE_NOTES.txt">https://raw.githubusercontent.com/s-andrews/FastQC/master/RELEASE_NOTES.txt</a> (changelog), <a href="https://github.com/s-andrews/FastQC/">https://github.com/s-andrews/FastQC/</a> (source code)</span><br>
Versions: <span class="module-version">0.11.8, 0.11.9, <em>0.12.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
FastQC: A Quality Control Analysis Tool for High Throughput Sequencing Data
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, qc&quot;)
whatis(&quot;URL: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/, https://raw.githubusercontent.com/s-andrews/FastQC/master/RELEASE_NOTES.txt (changelog), https://github.com/s-andrews/FastQC/ (source code)&quot;)
whatis([[
Description: FastQC is a program designed to spot potential problems in high throughput sequencing datasets. It runs a set of analyses on one or more raw sequence files in fastq or bam format and produces a report which summarises the results.
Examples: `fastqc --version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, &quot;FastQC&quot; .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_fclones" class="module-name">fclones</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">fclones: Efficient Duplicate File Finder</strong><br>
<span class="module-description">'fclones' is a command line utility that identifies groups of identical files and gets rid of the file copies you no longer need. It comes with plenty of configuration options for controlling the search scope and offers many ways of removing duplicates.</span><br>
Example: <span class="module-example"><code>fclones --version</code>, <code>fclones --help</code>, <code>fclones group . --threads main:1</code>, and <code>fclones group . --depth 1 --threads main:1</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/pkolaczk/fclones">https://github.com/pkolaczk/fclones</a>, <a href="https://github.com/pkolaczk/fclones/releases">https://github.com/pkolaczk/fclones/releases</a> (releases), <a href="https://docs.rs/fclones/latest/fclones/">https://docs.rs/fclones/latest/fclones/</a> (Rust API documentation)</span><br>
Versions: <span class="module-version"><em>0.34.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
fclones: Efficient Duplicate File Finder
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, cli, files&quot;)
whatis(&quot;URL: https://github.com/pkolaczk/fclones, https://github.com/pkolaczk/fclones/releases (releases), https://docs.rs/fclones/latest/fclones/ (Rust API documentation)&quot;)
whatis([[
Description: 'fclones' is a command line utility that identifies groups of identical files and gets rid of the file copies you no longer need. It comes with plenty of configuration options for controlling the search scope and offers many ways of removing duplicates.
Examples: `fclones --version`, `fclones --help`, `fclones group . --threads main:1`, and `fclones group . --depth 1 --threads main:1`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_fzf" class="module-name">fzf</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">fzf: A Command-Line Fuzzy Finder</strong><br>
<span class="module-description">fzf is a general-purpose command-line fuzzy finder. It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.</span><br>
Example: <span class="module-example"><code>fzf --version</code> and <code>emacs &quot;$(fzf)&quot;</code>.</span><br>
Note: <span class="module-note">To install tab completions and key bindinds to your shell, call <code>$FZF_HOME/install</code>. To uninstall, use <code>$FZF_HOME/uninstall</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/junegunn/fzf">https://github.com/junegunn/fzf</a>, <a href="https://github.com/junegunn/fzf/wiki">https://github.com/junegunn/fzf/wiki</a> (documentation), <a href="https://github.com/junegunn/fzf/blob/master/CHANGELOG.md">https://github.com/junegunn/fzf/blob/master/CHANGELOG.md</a> (changelog), <a href="https://github.com/junegunn/fzf/releases">https://github.com/junegunn/fzf/releases</a> (download)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">0.53.0, <em>0.54.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
fzf: A Command-Line Fuzzy Finder
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: , cli, tui, shell&quot;)
whatis(&quot;URL: https://github.com/junegunn/fzf, https://github.com/junegunn/fzf/wiki (documentation), https://github.com/junegunn/fzf/blob/master/CHANGELOG.md (changelog), https://github.com/junegunn/fzf/releases (download)&quot;)
whatis([[
Description: fzf is a general-purpose command-line fuzzy finder. It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.
Examples: `fzf --version` and `emacs &quot;$(fzf)&quot;`. Note: To install tab completions and key bindinds to your shell, call `$FZF_HOME/install`. To uninstall, use `$FZF_HOME/uninstall`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;man&quot;))

-- Custom
pushenv(&quot;FZF_HOME&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_gatk" class="module-name">gatk</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Genome Analysis Toolkit (GATK): Variant Discovery in High-Throughput Sequencing Data</strong><br>
<span class="module-description">Developed in the Data Sciences Platform at the Broad Institute, the toolkit offers a wide variety of tools with a primary focus on variant discovery and genotyping. Its powerful processing engine and high-performance computing features make it capable of taking on projects of any size.</span><br>
Example: <span class="module-example"><code>gatk --help</code> and <code>gatk --list</code>.</span><br>
URL: <span class="module-url"><a href="https://gatk.broadinstitute.org/hc/en-us">https://gatk.broadinstitute.org/hc/en-us</a>, <a href="https://github.com/broadinstitute/gatk">https://github.com/broadinstitute/gatk</a> (source code), <a href="https://github.com/broadinstitute/gatk/releases">https://github.com/broadinstitute/gatk/releases</a> (changelog), <a href="https://github.com/broadgsa/gatk">https://github.com/broadgsa/gatk</a> (legacy), <a href="https://console.cloud.google.com/storage/browser/gatk-software/package-archive">https://console.cloud.google.com/storage/browser/gatk-software/package-archive</a> (legacy), <a href="ftp://ftp.broadinstitute.org/pub/gsa/GenomeAnalysisTK/">ftp://ftp.broadinstitute.org/pub/gsa/GenomeAnalysisTK/</a> (legacy)</span><br>
Requirement: <span class="module-requirement">Modern GATK versions require Java (&gt;= 17).</span><br>
Versions: <span class="module-version">4.1.0.0, 4.1.2.0, 4.1.3.0, 4.1.4.0, 4.1.6.0, 4.1.7.0, 4.1.9.0, 4.2.2.0, 4.2.4.1, 4.2.5.0, 4.2.6.0, 4.2.6.1, 4.3.0.0, 4.4.0.0, 4.5.0.0, <em>4.6.0.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Genome Analysis Toolkit (GATK): Variant Discovery in High-Throughput Sequencing Data
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, genome&quot;)
whatis(&quot;URL: https://gatk.broadinstitute.org/hc/en-us, https://github.com/broadinstitute/gatk (source code), https://github.com/broadinstitute/gatk/releases (changelog), https://github.com/broadgsa/gatk (legacy), https://console.cloud.google.com/storage/browser/gatk-software/package-archive (legacy), ftp://ftp.broadinstitute.org/pub/gsa/GenomeAnalysisTK/ (legacy)&quot;)
whatis([[
Description: Developed in the Data Sciences Platform at the Broad Institute, the toolkit offers a wide variety of tools with a primary focus on variant discovery and genotyping. Its powerful processing engine and high-performance computing features make it capable of taking on projects of any size.
Requirements: Modern GATK versions require Java (&gt;= 17).
Examples: `gatk --help` and `gatk --list`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

local version_x = string.gsub(version, &quot;[.].*&quot;, &quot;&quot;)
if version_x == &quot;1&quot; then
  -- GATK v1.* requires Java (&lt;= 1.7)
  local cluster = os.getenv(&quot;CLUSTER&quot;) or &quot;&quot;
  if (cluster == &quot;tipcc&quot;) then
    load(&quot;jdk/1.7.0&quot;)
  else
    depends_on(&quot;openjdk/1.6.0&quot;)
  end
  pushenv(&quot;GATK_HOME&quot;, home)
elseif version_x == &quot;4&quot; then
  if mode() == &quot;load&quot; then
    local success=false

    -- try all possible openjdk/(&gt;= 17) versions
    for version = 17,30 do
      module=&quot;openjdk/&quot; .. version
      if isAvail(module) then
        load(module)
        success=true
        break
      end
    end
    
    -- try oraclejdk/(&gt;= 17) versions
    if not success then
      for version = 17,30 do
        module=&quot;oraclejdk/&quot; .. version
        if isAvail(module) then
          load(module)
          success=true
          break
        end
      end
    end
    
    if not success then
      LmodError(name .. &quot; requires openjdk/17 or newer, but that is not available on &quot; .. os.getenv(&quot;CBI_LINUX&quot;) .. &quot; machine &quot; .. os.getenv(&quot;HOSTNAME&quot;))
    end
  end
  prepend_path(&quot;PATH&quot;, home)
else
  prepend_path(&quot;PATH&quot;, home)
end

-- Tweak Java for the current environment
depends_on(&quot;java-tweaks&quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_gcta" class="module-name">gcta</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">GCTA: Genome-wide Complex Trait Analysis</strong><br>
<span class="module-description">A tool for Genome-wide Complex Trait Analysis (GCTA).</span><br>
Example: <span class="module-example"><code>gcta64</code>.</span><br>
URL: <span class="module-url"><a href="https://yanglab.westlake.edu.cn/software/gcta/#Overview">https://yanglab.westlake.edu.cn/software/gcta/#Overview</a>, <a href="https://cnsgenomics.com/software/gcta/">https://cnsgenomics.com/software/gcta/</a>, <a href="https://github.com/jianyangqt/gcta">https://github.com/jianyangqt/gcta</a> (source code)</span><br>
Versions: <span class="module-version">1.26.0, 1.92.3beta3, 1.92.4beta, 1.93.2beta, <em>1.94.0beta</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
GCTA: Genome-wide Complex Trait Analysis
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: genome&quot;)
whatis(&quot;URL: https://yanglab.westlake.edu.cn/software/gcta/#Overview, https://cnsgenomics.com/software/gcta/, https://github.com/jianyangqt/gcta (source code)&quot;)
whatis([[
Description: A tool for Genome-wide Complex Trait Analysis (GCTA).
Examples: `gcta64`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_geos" class="module-name">geos</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">GEOS: Geometry Engine, Open Source</strong><br>
<span class="module-description">GEOS (Geometry Engine - Open Source) is a C++ port of the JTS Topology Suite (JTS). It aims to contain the complete functionality of JTS in C++. This includes all the OpenGIS Simple Features for SQL spatial predicate functions and spatial operators, as well as specific JTS enhanced functions. GEOS provides spatial functionality to many other projects and products.</span><br>
Example: <span class="module-example"><code>geos-config --version</code>.</span><br>
URL: <span class="module-url"><a href="https://libgeos.org/">https://libgeos.org/</a>, <a href="https://libgeos.org/usage/download/">https://libgeos.org/usage/download/</a> (changelog), <a href="https://github.com/libgeos/geos/issues">https://github.com/libgeos/geos/issues</a> (bug reports)</span><br>
Versions: <span class="module-version">3.5.2, 3.7.3, 3.8.1, 3.9.1, 3.9.3, <em>3.9.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
GEOS: Geometry Engine, Open Source
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: statistics, spatial&quot;)
whatis(&quot;URL: https://libgeos.org/, https://libgeos.org/usage/download/ (changelog), https://github.com/libgeos/geos/issues (bug reports)&quot;)
whatis([[
Description: GEOS (Geometry Engine - Open Source) is a C++ port of the JTS Topology Suite (JTS). It aims to contain the complete functionality of JTS in C++. This includes all the OpenGIS Simple Features for SQL spatial predicate functions and spatial operators, as well as specific JTS enhanced functions. GEOS provides spatial functionality to many other projects and products.
Examples: `geos-config --version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

-- execution
prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
-- linking
prepend_path(&quot;LD_RUN_PATH&quot;, pathJoin(home, &quot;lib&quot;))
-- building
prepend_path(&quot;CPATH&quot;,  pathJoin(home, &quot;include&quot;))
prepend_path(&quot;CFLAGS&quot;, &quot;-I&quot; .. pathJoin(home, &quot;include&quot;), &quot; &quot;)
prepend_path(&quot;LDFLAGS&quot;, &quot;-L&quot; .. pathJoin(home, &quot;lib&quot;), &quot; &quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_git-extras" class="module-name">git-extras</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">git-extras: Little Git Extras</strong><br>
<span class="module-description">GIT utilities -- repo summary, repl, changelog population, author commit percentages and more.</span><br>
Example: <span class="module-example"><code>git extras --version</code> and <code>git extras --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/tj/git-extras">https://github.com/tj/git-extras</a>, <a href="https://github.com/tj/git-extras/releases">https://github.com/tj/git-extras/releases</a> (releases), <a href="https://github.com/tj/git-extras/blob/main/History.md">https://github.com/tj/git-extras/blob/main/History.md</a> (changelog)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>7.2.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
git-extras: Little Git Extras
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: version control&quot;)
whatis(&quot;URL: https://github.com/tj/git-extras, https://github.com/tj/git-extras/releases (releases), https://github.com/tj/git-extras/blob/main/History.md (changelog)&quot;)
whatis(
[[Description: GIT utilities -- repo summary, repl, changelog population, author commit percentages and more.
Examples: `git extras --version` and `git extras --help`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_git-flow" class="module-name">git-flow</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">git-flow: Git Extension Git Flow (AVH Edition)</strong><br>
<span class="module-description">A collection of Git extensions to provide high-level repository operations for Vincent Driessen's branching model.</span><br>
Example: <span class="module-example"><code>git flow</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/petervanderdoes/gitflow-avh">https://github.com/petervanderdoes/gitflow-avh</a>, <a href="https://github.com/petervanderdoes/gitflow-avh/blob/develop/CHANGELOG.md">https://github.com/petervanderdoes/gitflow-avh/blob/develop/CHANGELOG.md</a> (changelog)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>1.12.3</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
git-flow: Git Extension Git Flow (AVH Edition)
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: version control&quot;)
whatis(&quot;URL: https://github.com/petervanderdoes/gitflow-avh, https://github.com/petervanderdoes/gitflow-avh/blob/develop/CHANGELOG.md (changelog)&quot;)
whatis(
[[Description: A collection of Git extensions to provide high-level repository operations for Vincent Driessen's branching model.
Examples: `git flow`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_github-cli" class="module-name">github-cli</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">github-cli: GitHub's Official Command Line Tool</strong><br>
<span class="module-description"><code>gh</code> is GitHub on the command line. It brings pull requests, issues, and other GitHub concepts to the terminal next to where you are already working with <code>git</code> and your code.</span><br>
Example: <span class="module-example"><code>gh --version</code>, <code>gh --help</code>, and <code>gh auth login</code>.</span><br>
URL: <span class="module-url"><a href="https://cli.github.com/">https://cli.github.com/</a>, <a href="https://cli.github.com/manual/">https://cli.github.com/manual/</a> (documentation), <a href="https://github.com/cli/cli/releases">https://github.com/cli/cli/releases</a> (changelog), <a href="https://github.com/cli/cli/">https://github.com/cli/cli/</a> (source code)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">2.52.0, <em>2.53.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
github-cli: GitHub's Official Command Line Tool 
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, file viewer, cli, tui&quot;)
whatis(&quot;URL: https://cli.github.com/, https://cli.github.com/manual/ (documentation), https://github.com/cli/cli/releases (changelog), https://github.com/cli/cli/ (source code)&quot;)
whatis([[
Description: `gh` is GitHub on the command line. It brings pull requests, issues, and other GitHub concepts to the terminal next to where you are already working with `git` and your code.
Examples: `gh --version`, `gh --help`, and `gh auth login`.
Warning: Only the most recent version of this software will be kept.
]])

-- Local variables
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;, &quot;man1&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_glow" class="module-name">glow</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">glow: Render Markdown on the CLI, with Pizzazz!</strong><br>
<span class="module-description">Glow is a terminal based markdown reader designed from the ground up to bring out the beauty—and power—of the CLI.  Use it to discover markdown files, read documentation directly on the command line and stash markdown files to your own private collection so you can read them anywhere. Glow will find local markdown files in subdirectories or a local Git repository.</span><br>
Example: <span class="module-example"><code>glow README.md</code>, <code>glow --pager README.md</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/charmbracelet/glow">https://github.com/charmbracelet/glow</a>, <a href="https://github.com/charmbracelet/glow/releases">https://github.com/charmbracelet/glow/releases</a> (changelog)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>1.5.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
glow: Render Markdown on the CLI, with Pizzazz!
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, file viewer, pager, markdown, cli, tui&quot;)
whatis(&quot;URL: https://github.com/charmbracelet/glow, https://github.com/charmbracelet/glow/releases (changelog)&quot;)
whatis([[
Description: Glow is a terminal based markdown reader designed from the ground up to bring out the beauty—and power—of the CLI.  Use it to discover markdown files, read documentation directly on the command line and stash markdown files to your own private collection so you can read them anywhere. Glow will find local markdown files in subdirectories or a local Git repository.
Examples: `glow README.md`, `glow --pager README.md`.
Warning: Only the most recent version of this software will be kept.
]])

-- Local variables
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_go" class="module-name">go</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">go: The Go Programming Language</strong><br>
<span class="module-description">Build simple, secure, scalable systems with Go.</span><br>
Example: <span class="module-example"><code>go version</code> and <code>go help</code>.</span><br>
URL: <span class="module-url"><a href="https://go.dev/">https://go.dev/</a>, <a href="https://go.dev/doc/devel/release">https://go.dev/doc/devel/release</a> (changelog), <a href="https://go.dev/dl/">https://go.dev/dl/</a> (releases), <a href="https://github.com/golang">https://github.com/golang</a> (source code)</span><br>
Versions: <span class="module-version"><em>1.22.5</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
go: The Go Programming Language
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: cli, shell&quot;)
whatis(&quot;URL: https://go.dev/, https://go.dev/doc/devel/release (changelog), https://go.dev/dl/ (releases), https://github.com/golang (source code)&quot;)
whatis([[
Description: Build simple, secure, scalable systems with Go.
Examples: `go version` and `go help`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

setenv(&quot;GOROOT&quot;, home)
prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_gping" class="module-name">gping</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">gping: Ping, but with a Graph</strong><br>
<span class="module-description">gping comes with the following super-powers: (i) graph the ping time for multiple hosts, (ii) graph the execution time for commands via the <code>--cmd</code> flag, and (iii) custom colours.</span><br>
Example: <span class="module-example"><code>gping --version</code>, <code>gping --help</code>, <code>gping 8.8.8.8 9.9.9.9</code>, and <code>gping --cmd &quot;curl -o /dev/null https://www.github.com&quot; &quot;wget -O /dev/null https://github.com&quot;</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/orf/gping">https://github.com/orf/gping</a>, <a href="https://github.com/orf/gping/releases">https://github.com/orf/gping/releases</a> (changelog), <a href="https://github.com/orf/gping">https://github.com/orf/gping</a> (source code)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>1.16.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
gping: Ping, but with a Graph
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: terminal, cli, utility&quot;)
whatis(&quot;URL: https://github.com/orf/gping, https://github.com/orf/gping/releases (changelog), https://github.com/orf/gping (source code)&quot;)
whatis([[
Description: gping comes with the following super-powers: (i) graph the ping time for multiple hosts, (ii) graph the execution time for commands via the `--cmd` flag, and (iii) custom colours.
Examples: `gping --version`, `gping --help`, `gping 8.8.8.8 9.9.9.9`, and `gping --cmd &quot;curl -o /dev/null https://www.github.com&quot; &quot;wget -O /dev/null https://github.com&quot;`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;,  home)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_gsl" class="module-name">gsl</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">GSL: Gnu Scientific Library</strong><br>
<span class="module-description">The GNU Scientific Library (GSL) is a numerical library for C and C++ programmers. It is free software under the GNU General Public License. The library provides a wide range of mathematical routines such as random number generators, special functions and least-squares fitting. There are over 1000 functions in total with an extensive test suite.</span><br>
Example: <span class="module-example"><code>gsl-config --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.gnu.org/software/gsl/">https://www.gnu.org/software/gsl/</a>, <a href="https://git.savannah.gnu.org/cgit/gsl.git/tree/NEWS">https://git.savannah.gnu.org/cgit/gsl.git/tree/NEWS</a> (changelog), <a href="https://git.savannah.gnu.org/cgit/gsl.git/">https://git.savannah.gnu.org/cgit/gsl.git/</a> (source code)</span><br>
Versions: <span class="module-version">2.6, <em>2.7</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
GSL: Gnu Scientific Library
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: library&quot;)
whatis(&quot;URL: https://www.gnu.org/software/gsl/, https://git.savannah.gnu.org/cgit/gsl.git/tree/NEWS (changelog), https://git.savannah.gnu.org/cgit/gsl.git/ (source code)&quot;)
whatis([[
Description: The GNU Scientific Library (GSL) is a numerical library for C and C++ programmers. It is free software under the GNU General Public License. The library provides a wide range of mathematical routines such as random number generators, special functions and least-squares fitting. There are over 1000 functions in total with an extensive test suite.
Examples: `gsl-config --version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
prepend_path(&quot;PKG_CONFIG_PATH&quot;, pathJoin(home, &quot;lib&quot;, &quot;pkgconfig&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_hdf5" class="module-name">hdf5</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">hdf5: A General Purpose Library and File Format for Storing Scientific Data</strong><br>
<span class="module-description">Hierarchical Data Format (HDF) is a set of file formats (HDF4, HDF5) designed to store and organize large amounts of data. The HDF5 format is designed to address some of the limitations of the HDF4 library, and to address current and anticipated requirements of modern systems and applications.</span><br>
Example: <span class="module-example"><code>h5stat --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.hdfgroup.org/downloads/hdf5/">https://www.hdfgroup.org/downloads/hdf5/</a>, <a href="https://portal.hdfgroup.org/display/support/Downloads">https://portal.hdfgroup.org/display/support/Downloads</a> (changelog), <a href="https://www.hdfgroup.org/downloads/hdf5/source-code/">https://www.hdfgroup.org/downloads/hdf5/source-code/</a> (source code)</span><br>
Versions: <span class="module-version">1.10.6, 1.12.0, 1.12.1, <em>1.12.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
hdf5: A General Purpose Library and File Format for Storing Scientific Data
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: library&quot;)
whatis(&quot;URL: https://www.hdfgroup.org/downloads/hdf5/, https://portal.hdfgroup.org/display/support/Downloads (changelog), https://www.hdfgroup.org/downloads/hdf5/source-code/ (source code)&quot;)
whatis([[
Description: Hierarchical Data Format (HDF) is a set of file formats (HDF4, HDF5) designed to store and organize large amounts of data. The HDF5 format is designed to address some of the limitations of the HDF4 library, and to address current and anticipated requirements of modern systems and applications.
Examples: `h5stat --version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
-- prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))

prepend_path(&quot;CPATH&quot;,  pathJoin(home, &quot;include&quot;))
-- prepend_path(&quot;CFLAGS&quot;, &quot;-I&quot; .. pathJoin(home, &quot;include&quot;), &quot; &quot;)
-- prepend_path(&quot;LDFLAGS&quot;, &quot;-L&quot; .. pathJoin(home, &quot;lib&quot;), &quot; &quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_hisat2" class="module-name">hisat2</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">HISAT2: Graph-based Alignment of Next Generation Sequencing Reads to a Population of Genomes</strong><br>
<span class="module-description">HISAT2 is a fast and sensitive alignment program for mapping next-generation sequencing reads (both DNA and RNA) to a population of human genomes (as well as to a single reference genome). Based on an extension of BWT for graphs [Sirén et al. 2014], we designed and implemented a graph FM index (GFM), an original approach and its first implementation to the best of our knowledge. In addition to using one global GFM index that represents a population of human genomes, HISAT2 uses a large set of small GFM indexes that collectively cover the whole genome (each index representing a genomic region of 56 Kbp, with 55,000 indexes needed to cover the human population). These small indexes (called local indexes), combined with several alignment strategies, enable rapid and accurate alignment of sequencing reads. This new indexing scheme is called a Hierarchical Graph FM index (HGFM).</span><br>
Example: <span class="module-example"><code>hisat2 --version</code> and <code>hisat2 --help</code>.</span><br>
URL: <span class="module-url"><a href="https://daehwankimlab.github.io/hisat2/">https://daehwankimlab.github.io/hisat2/</a>, <a href="https://github.com/DaehwanKimLab/hisat2/releases">https://github.com/DaehwanKimLab/hisat2/releases</a> (changelog), <a href="https://github.com/DaehwanKimLab/hisat2/">https://github.com/DaehwanKimLab/hisat2/</a> (source code)</span><br>
Versions: <span class="module-version">2.1.0, <em>2.2.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
HISAT2: Graph-based Alignment of Next Generation Sequencing Reads to a Population of Genomes
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: Programming, Statistics&quot;)
whatis(&quot;URL: https://daehwankimlab.github.io/hisat2/, https://github.com/DaehwanKimLab/hisat2/releases (changelog), https://github.com/DaehwanKimLab/hisat2/ (source code)&quot;)
whatis([[
Description: HISAT2 is a fast and sensitive alignment program for mapping next-generation sequencing reads (both DNA and RNA) to a population of human genomes (as well as to a single reference genome). Based on an extension of BWT for graphs [Sirén et al. 2014], we designed and implemented a graph FM index (GFM), an original approach and its first implementation to the best of our knowledge. In addition to using one global GFM index that represents a population of human genomes, HISAT2 uses a large set of small GFM indexes that collectively cover the whole genome (each index representing a genomic region of 56 Kbp, with 55,000 indexes needed to cover the human population). These small indexes (called local indexes), combined with several alignment strategies, enable rapid and accurate alignment of sequencing reads. This new indexing scheme is called a Hierarchical Graph FM index (HGFM).
Examples: `hisat2 --version` and `hisat2 --help`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_htop" class="module-name">htop</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">htop: An Interactive Process Viewer for Unix</strong><br>
<span class="module-description"><code>htop</code> is an interactive process viewer for Unix systems. It is a text-mode application (for console or X terminals) and requires ncurses.</span><br>
Example: <span class="module-example"><code>htop</code>.</span><br>
URL: <span class="module-url"><a href="https://htop.dev">https://htop.dev</a>, <a href="https://github.com/htop-dev/htop/blob/main/ChangeLog">https://github.com/htop-dev/htop/blob/main/ChangeLog</a> (changelog), <a href="https://github.com/htop-dev/htop">https://github.com/htop-dev/htop</a> (source code)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>3.3.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
htop: An Interactive Process Viewer for Unix
]])

local name = myModuleName()
local version = myModuleVersion()
version = string.gsub(version, &quot;^[.]&quot;, &quot;&quot;) -- for hidden modules
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: system, utility, cli, tui&quot;)
whatis(&quot;URL: https://htop.dev, https://github.com/htop-dev/htop/blob/main/ChangeLog (changelog), https://github.com/htop-dev/htop (source code)&quot;)
whatis([[
Description: `htop` is an interactive process viewer for Unix systems. It is a text-mode application (for console or X terminals) and requires ncurses.
Examples: `htop`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)

-- Specific to the Linux distribution?
if string.match(myFileName(), &quot;/_&quot; .. os.getenv(&quot;CBI_LINUX&quot;) .. &quot;/&quot;) then
  root = pathJoin(root, &quot;_&quot; .. os.getenv(&quot;CBI_LINUX&quot;))
end

local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_htslib" class="module-name">htslib</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">HTSlib: C Library for High-Throughput Sequencing Data Formats</strong><br>
<span class="module-description">HTSlib is an implementation of a unified C library for accessing common file formats, such as SAM, CRAM and VCF, used for high-throughput sequencing data, and is the core library used by samtools and bcftools. HTSlib also provides the bgzip, htsfile, and tabix utilities.</span><br>
Example: <span class="module-example"><code>bgzip --version</code>, <code>htsfile --version</code>, and <code>tabix --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.htslib.org/">https://www.htslib.org/</a>, <a href="https://github.com/samtools/htslib/blob/develop/NEWS">https://github.com/samtools/htslib/blob/develop/NEWS</a> (changelog), <a href="https://github.com/samtools/htslib">https://github.com/samtools/htslib</a> (source code)</span><br>
Versions: <span class="module-version">1.9, 1.10.2, 1.11, 1.13, 1.14, 1.15, 1.15.1, 1.16, 1.17, 1.18, 1.19, 1.19.1, <em>1.20</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
HTSlib: C Library for High-Throughput Sequencing Data Formats
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, programming&quot;)
whatis(&quot;URL: https://www.htslib.org/, https://github.com/samtools/htslib/blob/develop/NEWS (changelog), https://github.com/samtools/htslib (source code)&quot;)
whatis([[
Description: HTSlib is an implementation of a unified C library for accessing common file formats, such as SAM, CRAM and VCF, used for high-throughput sequencing data, and is the core library used by samtools and bcftools. HTSlib also provides the bgzip, htsfile, and tabix utilities.
Examples: `bgzip --version`, `htsfile --version`, and `tabix --version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
prepend_path(&quot;PKG_CONFIG_PATH&quot;, pathJoin(home, &quot;lib&quot;, &quot;pkgconfig&quot;))


-- Warn about bug https://github.com/samtools/htslib/issues/1236
if (mode() == &quot;load&quot; and version == &quot;1.11&quot;) then
  LmodMessage(&quot;MODULE WARNING: &quot; .. name .. &quot; &quot; .. version .. &quot; has a bug that results in valid but incorrect CIGAR strings. Because of this, it is recommended to use an older or a newer version instead. For details, see https://github.com/samtools/htslib/issues/1236&quot;)
end
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_htstools" class="module-name">htstools</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">htstools: Tools to Process BAM Files for Downstream Copy-Number Analysis</strong><br>
<span class="module-description">Contains three tools (dnafrags, ppflag-fixer, snp-pileup) written by Alex Studer to process bam files for downstream copy number analysis.</span><br>
Example: <span class="module-example"><code>snp-pileup --help</code>, <code>dnafrags --help</code>, <code>ppflag-fixer --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/mskcc/htstools">https://github.com/mskcc/htstools</a>, <a href="https://github.com/mskcc/htstools/releases">https://github.com/mskcc/htstools/releases</a> (changelog)</span><br>
Versions: <span class="module-version"><em>0.1.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
htstools: Tools to Process BAM Files for Downstream Copy-Number Analysis
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://github.com/mskcc/htstools, https://github.com/mskcc/htstools/releases (changelog)&quot;)
whatis([[
Description: Contains three tools (dnafrags, ppflag-fixer, snp-pileup) written by Alex Studer to process bam files for downstream copy number analysis.
Examples: `snp-pileup --help`, `dnafrags --help`, `ppflag-fixer --help`.
]])

depends_on(&quot;htslib&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_igv" class="module-name">igv</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">IGV: The Integrative Genomics Viewer</strong><br>
<span class="module-description">The Integrative Genomics Viewer (IGV) is a high-performance visualization tool for interactive exploration of large, integrated genomic datasets. It supports a wide variety of data types, including array-based and next-generation sequence data, and genomic annotations.</span><br>
Example: <span class="module-example"><code>igv --help</code>, <code>igv --version</code>, and <code>igv</code>.</span><br>
URL: <span class="module-url"><a href="https://software.broadinstitute.org/software/igv/">https://software.broadinstitute.org/software/igv/</a>, <a href="https://github.com/igvteam/igv/tags">https://github.com/igvteam/igv/tags</a> (changelog), <a href="https://github.com/igvteam/igv/">https://github.com/igvteam/igv/</a> (source code)</span><br>
Warning: <span class="module-warning">IGV (&gt;= 2.7.0) requires Java 17. Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">2.16.2, 2.17.0, 2.17.1, 2.17.3, <em>2.17.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
IGV: The Integrative Genomics Viewer
]])

-- local name = myModuleName()
local name = &quot;IGV&quot;
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://software.broadinstitute.org/software/igv/, https://github.com/igvteam/igv/tags (changelog), https://github.com/igvteam/igv/ (source code)&quot;)
whatis([[
Description: The Integrative Genomics Viewer (IGV) is a high-performance visualization tool for interactive exploration of large, integrated genomic datasets. It supports a wide variety of data types, including array-based and next-generation sequence data, and genomic annotations.
Examples: `igv --help`, `igv --version`, and `igv`.
Warning: IGV (&gt;= 2.7.0) requires Java 17. Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)
prepend_path(&quot;PATH&quot;, home)

-- Parse version x.y.z into x and y
version_x=string.gsub(version, &quot;[.].*$&quot;, &quot;&quot;)
version_xy=string.gsub(version, version_x .. &quot;[.]&quot;, &quot;&quot;)
version_y=string.gsub(version_xy, &quot;[.].*$&quot;, &quot;&quot;)
version_x=tonumber(version_x)
version_y=tonumber(version_y)

-- Identify required Java version
local min_java_version=8
if (version_x &gt;= 2) then
  if (version_y &gt;= 17) then
    min_java_version=17
  elseif (version_y &gt;= 2.5) then
    min_java_version=11
  end
end


local java_check = 'ver=$(java -version 2&gt;&amp;1 | grep -F &quot;version&quot; | sed -E &quot;s/(.* version |\\&quot;)//g&quot;); &gt;&amp;2 echo &quot;Java version: ${ver} [IGV ' .. version .. ' requires Java ' .. min_java_version .. ' or newer]&quot;; ver_x=$(sed -E &quot;s/^1[.]//&quot; &lt;&lt;&lt; &quot;${ver}&quot; | sed &quot;s/[.].*//&quot;); if [[ ${ver_x} -lt ' .. min_java_version .. ' ]]; then &gt;&amp;2 echo &quot;ERROR: Java ${ver_x} detected, but IGV requires Java ' .. min_java_version .. ' or newer: $(java -version 2&gt;&amp;1 | grep -F &quot;version&quot;)&quot;; return 1; fi;'

local bash = java_check .. ' ' .. home .. '/igv.sh &quot;$@&quot;'
local csh  = home .. '/igv.sh $*'
set_shell_function(&quot;igv&quot;, bash, csh)

-- Tweak Java for the current environment
depends_on(&quot;java-tweaks&quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_igvtools" class="module-name">igvtools</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">IGVTools: Tools for Pre-processing HT-Seq Data Files</strong><br>
<span class="module-description">The igvtools utility provides a set of tools for pre-processing data files.</span><br>
Example: <span class="module-example"><code>igvtools help</code>.</span><br>
Note: <span class="module-note"><code>igvtools</code> moved to IGV as of IGV (&gt;= 2.5.0).</span><br>
URL: <span class="module-url"><a href="https://software.broadinstitute.org/software/igv/igvtools">https://software.broadinstitute.org/software/igv/igvtools</a>, <a href="https://software.broadinstitute.org/software/igv/2.12.x#LatestVersion">https://software.broadinstitute.org/software/igv/2.12.x#LatestVersion</a> (changelog), <a href="https://github.com/igvteam/igv/">https://github.com/igvteam/igv/</a> (source code)</span><br>
Versions: <span class="module-version"><em>2.4.19</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
IGVTools: Tools for Pre-processing HT-Seq Data Files
]])

-- local name = myModuleName()
local name = &quot;IGVTools&quot;
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://software.broadinstitute.org/software/igv/igvtools, https://software.broadinstitute.org/software/igv/2.12.x#LatestVersion (changelog), https://github.com/igvteam/igv/ (source code)&quot;)
whatis([[
Description: The igvtools utility provides a set of tools for pre-processing data files.
Examples: `igvtools help`.
Note: `igvtools` moved to IGV as of IGV (&gt;= 2.5.0).
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_jags" class="module-name">jags</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">JAGS: Just Another Gibbs Sampler</strong><br>
<span class="module-description">JAGS is Just Another Gibbs Sampler.  It is a program for analysis of Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation not wholly unlike BUGS.</span><br>
Example: <span class="module-example"><code>jags</code> and <code>man jags</code>.</span><br>
URL: <span class="module-url"><a href="http://mcmc-jags.sourceforge.net/">http://mcmc-jags.sourceforge.net/</a>, <a href="https://sourceforge.net/p/mcmc-jags/code-0/ci/default/tree/NEWS">https://sourceforge.net/p/mcmc-jags/code-0/ci/default/tree/NEWS</a> (changelog), <a href="https://sourceforge.net/projects/mcmc-jags/">https://sourceforge.net/projects/mcmc-jags/</a> (source code)</span><br>
Versions: <span class="module-version">4.3.1, <em>4.3.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
JAGS: Just Another Gibbs Sampler
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: statistics&quot;)
whatis(&quot;URL: http://mcmc-jags.sourceforge.net/, https://sourceforge.net/p/mcmc-jags/code-0/ci/default/tree/NEWS (changelog), https://sourceforge.net/projects/mcmc-jags/ (source code)&quot;)
whatis([[
Description: JAGS is Just Another Gibbs Sampler.  It is a program for analysis of Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation not wholly unlike BUGS.
Examples: `jags` and `man jags`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)

-- Specific to the Linux distribution?
if string.match(myFileName(), &quot;/_&quot; .. os.getenv(&quot;CBI_LINUX&quot;) .. &quot;/&quot;) then
  root = pathJoin(root, &quot;_&quot; .. os.getenv(&quot;CBI_LINUX&quot;))
end

local home = pathJoin(root, &quot;JAGS&quot; .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
prepend_path(&quot;PKG_CONFIG_PATH&quot;, pathJoin(home, &quot;lib&quot;, &quot;pkgconfig&quot;))

-- AD HOC:
-- R package 'rjags' uses 'JAGS_LIBDIR' and 'JAGS_INCLUDEDIR' (INSTALL)
-- Comment: Appears not to be needed /HB 2020-03-09
-- pushenv(&quot;JAGS_INCLUDEDIR&quot;, pathJoin(home, &quot;include&quot;))
-- pushenv(&quot;JAGS_LIBDIR&quot;, pathJoin(home, &quot;lib&quot;))

-- R package 'runjags' uses 'JAGS_LIB' and 'JAGS_INCLUDE' (README)
-- Comment: Email maintainer about diff to 'rjags' /HB 2020-03-09
-- pushenv(&quot;JAGS_INCLUDE&quot;, pathJoin(home, &quot;include&quot;)) -- Not needed /HB 2020-03-09
pushenv(&quot;JAGS_LIB&quot;, pathJoin(home, &quot;lib&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_jq" class="module-name">jq</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">jq: Command-line JSON Processor</strong><br>
<span class="module-description">jq is a lightweight and flexible command-line JSON processor.</span><br>
Example: <span class="module-example"><code>jq --help</code>, <code>jq --version</code>, <code>cat in.json | jq .</code>, and <code>man jq</code></span><br>
URL: <span class="module-url"><a href="https://github.com/jqlang/jq">https://github.com/jqlang/jq</a>, <a href="https://github.com/jqlang/jq/blob/master/NEWS.md">https://github.com/jqlang/jq/blob/master/NEWS.md</a> (changelog), <a href="https://jqlang.github.io/jq">https://jqlang.github.io/jq</a> (documentation)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>1.7.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
jq: Command-line JSON Processor 
]])

local name = myModuleName()
local version = myModuleVersion()
version = string.gsub(version, &quot;^[.]&quot;, &quot;&quot;) -- for hidden modules
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, cli&quot;)
whatis(&quot;URL: https://github.com/jqlang/jq, https://github.com/jqlang/jq/blob/master/NEWS.md (changelog), https://jqlang.github.io/jq (documentation)&quot;)
whatis([[
Description: jq is a lightweight and flexible command-line JSON processor.
Examples: `jq --help`, `jq --version`, `cat in.json | jq .`, and `man jq`
Warning: Only the most recent version of this software will be kept.
]])

-- Local variables
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

-- Run time
prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))

-- Compile time
prepend_path(&quot;CPATH&quot;, pathJoin(home, &quot;include&quot;))
prepend_path(&quot;LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
prepend_path(&quot;PKG_CONFIG_PATH&quot;, pathJoin(home, &quot;lib&quot;, &quot;pkgconfig&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_kallisto" class="module-name">kallisto</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">kallisto: Near-optimal RNA-Seq Quantification</strong><br>
<span class="module-description">kallisto is a program for quantifying abundances of transcripts from RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads. It is based on the novel idea of pseudoalignment for rapidly determining the compatibility of reads with targets, without the need for alignment.</span><br>
Example: <span class="module-example"><code>kallisto version</code></span><br>
URL: <span class="module-url"><a href="https://pachterlab.github.io/kallisto/about.html">https://pachterlab.github.io/kallisto/about.html</a>, <a href="https://github.com/pachterlab/kallisto/releases">https://github.com/pachterlab/kallisto/releases</a> (changelog), <a href="https://github.com/pachterlab/kallisto">https://github.com/pachterlab/kallisto</a> (source code)</span><br>
Versions: <span class="module-version">0.45.0, 0.45.1, 0.46.0, 0.46.1, 0.46.2, 0.50.0, <em>0.50.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
kallisto: Near-optimal RNA-Seq Quantification
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://pachterlab.github.io/kallisto/about.html, https://github.com/pachterlab/kallisto/releases (changelog), https://github.com/pachterlab/kallisto (source code)&quot;)
whatis([[
Description: kallisto is a program for quantifying abundances of transcripts from RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads. It is based on the novel idea of pseudoalignment for rapidly determining the compatibility of reads with targets, without the need for alignment.
Examples: `kallisto version`
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_markdown-link-check" class="module-name">markdown-link-check</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">markdown-link-check: Checks Links in Markdown Files</strong><br>
<span class="module-description">Checks all of the hyperlinks in a markdown text to determine if they are alive or dead.</span><br>
Example: <span class="module-example"><code>markdown-link-check --version</code>, <code>markdown-link-check --help</code>, <code>markdown-link-check -- *.md</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/tcort/markdown-link-check">https://github.com/tcort/markdown-link-check</a>, <a href="https://github.com/tcort/markdown-link-check/releases">https://github.com/tcort/markdown-link-check/releases</a> (releases)</span><br>
Versions: <span class="module-version"><em>3.12.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
markdown-link-check: Checks Links in Markdown Files
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: cli, utility&quot;)
whatis(&quot;URL: https://github.com/tcort/markdown-link-check, https://github.com/tcort/markdown-link-check/releases (releases)&quot;)
whatis([[
Description: Checks all of the hyperlinks in a markdown text to determine if they are alive or dead.
Examples: `markdown-link-check --version`, `markdown-link-check --help`, `markdown-link-check -- *.md`.
]]
)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;node_modules&quot;, &quot;.bin&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_markdownlint-cli" class="module-name">markdownlint-cli</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">markdownlint-cli: MarkdownLint Command Line Interface</strong><br>
<span class="module-description">Examples: <code>markdownlint --version</code>, <code>markdownlint --help</code>, <code>markdownlint -- *.md</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/igorshubovych/markdownlint-cli">https://github.com/igorshubovych/markdownlint-cli</a> (documentation), <a href="https://github.com/igorshubovych/markdownlint-cli/releases/">https://github.com/igorshubovych/markdownlint-cli/releases/</a> (releases), <a href="https://github.com/igorshubovych/markdownlint-cli">https://github.com/igorshubovych/markdownlint-cli</a> (source code)</span><br>
Versions: <span class="module-version">0.39.0, <em>0.41.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
markdownlint-cli: MarkdownLint Command Line Interface 
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: cli, utility&quot;)
whatis(&quot;URL: https://github.com/igorshubovych/markdownlint-cli (documentation), https://github.com/igorshubovych/markdownlint-cli/releases/ (releases), https://github.com/igorshubovych/markdownlint-cli (source code)&quot;)
whatis([[
Description: 
Examples: `markdownlint --version`, `markdownlint --help`, `markdownlint -- *.md`.
]]
)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;node_modules&quot;, &quot;.bin&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_mc" class="module-name">mc</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">mc: Midnight Commander</strong><br>
<span class="module-description">GNU Midnight Commander is a visual file manager. It's a feature rich full-screen text mode application that allows you to copy, move and delete files and whole directory trees, search for files and run commands in the subshell. Internal viewer and editor are included.</span><br>
Example: <span class="module-example"><code>mc</code> and <code>mc --version</code>.</span><br>
URL: <span class="module-url"><a href="https://midnight-commander.org/">https://midnight-commander.org/</a>, <a href="https://github.com/MidnightCommander/mc/blob/master/doc/NEWS">https://github.com/MidnightCommander/mc/blob/master/doc/NEWS</a> (changelog), <a href="https://github.com/MidnightCommander/mc">https://github.com/MidnightCommander/mc</a> (source code), <a href="https://github.com/MidnightCommander/mc/tags">https://github.com/MidnightCommander/mc/tags</a> (download)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>4.8.31</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
mc: Midnight Commander
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, files, cli, tui&quot;)
whatis(&quot;URL: https://midnight-commander.org/, https://github.com/MidnightCommander/mc/blob/master/doc/NEWS (changelog), https://github.com/MidnightCommander/mc (source code), https://github.com/MidnightCommander/mc/tags (download)&quot;)
whatis([[
Description: GNU Midnight Commander is a visual file manager. It's a feature rich full-screen text mode application that allows you to copy, move and delete files and whole directory trees, search for files and run commands in the subshell. Internal viewer and editor are included.
Examples: `mc` and `mc --version`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_miniconda3-py39" class="module-name">miniconda3-py39</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">[DEFUNCT] Miniconda: A Free Minimal Installer for Conda</strong><br>
Versions: <span class="module-version"><em>4.12.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
[DEFUNCT] Miniconda: A Free Minimal Installer for Conda
]])

local name = myModuleName()
local version = myModuleVersion()
version = string.gsub(version, &quot;^[.]&quot;, &quot;&quot;) -- for hidden modules
local new = &quot;miniconda3/&quot; .. version .. &quot;-py39&quot;

whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: deprecated, defunct&quot;)
whatis([[
Warning: This module is defunct and has been superseeded by module 'miniconda3'. Please use that module instead.
]])

depends_on(new)
LmodError(&quot;[DEFUNCT ERROR] The CBI '&quot; .. name .. &quot;/&quot; .. version .. &quot;' module has been renamed to '&quot; .. new .. &quot;'; please use that module instead&quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_miniconda3" class="module-name">miniconda3</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Miniconda: A Free Minimal Installer for Conda</strong><br>
<span class="module-description">Miniconda is a free minimal installer for conda. It is a small, bootstrap version of Anaconda that includes only conda, Python, the packages they depend on, and a small number of other useful packages, including pip, zlib and a few others.</span><br>
Example: <span class="module-example"><code>conda --version</code>, <code>conda create --name=myenv</code>, <code>conda env list</code>, <code>conda activate myenv</code>, <code>conda info</code>, and <code>conda deactive</code>.</span><br>
URL: <span class="module-url"><a href="https://docs.conda.io/en/latest/">https://docs.conda.io/en/latest/</a>, <a href="https://docs.conda.io/en/latest/miniconda.html">https://docs.conda.io/en/latest/miniconda.html</a> (documentation), <a href="https://docs.conda.io/en/latest/miniconda.html#latest-miniconda-installer-links">https://docs.conda.io/en/latest/miniconda.html#latest-miniconda-installer-links</a> (releases), <a href="https://github.com/conda/conda/blob/master/CHANGELOG.md">https://github.com/conda/conda/blob/master/CHANGELOG.md</a> (changelog), <a href="https://github.com/conda/conda">https://github.com/conda/conda</a> (source code)</span><br>
Warning: <span class="module-warning">For now, this module works only in Bash. Also, do <em>not</em> do <code>conda init</code>. If you do this by mistake, please undo by <code>conda init --reverse</code>.</span><br>
Versions: <span class="module-version">4.12.0-py39, 22.11.1-1-py310, 23.3.1-0-py39, 23.5.2-0-py39, 23.5.2-0-py310, 23.5.2-0-py311, 23.11.0-2-py311, 24.1.2-0-py312, 24.3.0-0-py312, <em>24.5.0-0-py312</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Miniconda: A Free Minimal Installer for Conda
]])

local warning = &quot;Use at your own peril! Software tools installed via Conda are known to cause conflicts with other software on the system, including core software provided by the operating system as well as other software from the CBI stack. For example, do not install R packages running R from the CBI stack, while conda is activated.&quot;

local name = myModuleName()
local version = myModuleVersion()
version = string.gsub(version, &quot;^[.]&quot;, &quot;&quot;) -- for hidden modules
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: files, utility&quot;)
whatis(&quot;URL: https://docs.conda.io/en/latest/, https://docs.conda.io/en/latest/miniconda.html (documentation), https://docs.conda.io/en/latest/miniconda.html#latest-miniconda-installer-links (releases), https://github.com/conda/conda/blob/master/CHANGELOG.md (changelog), https://github.com/conda/conda (source code)&quot;)
whatis([[
Description: Miniconda is a free minimal installer for conda. It is a small, bootstrap version of Anaconda that includes only conda, Python, the packages they depend on, and a small number of other useful packages, including pip, zlib and a few others.
Examples: `conda --version`, `conda create --name=myenv`, `conda env list`, `conda activate myenv`, `conda info`, and `conda deactive`.
Warning: For now, this module works only in Bash. Also, do _not_ do `conda init`. If you do this by mistake, please undo by `conda init --reverse`.
]])


local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
prepend_path(&quot;PKG_CONFIG_PATH&quot;, pathJoin(home, &quot;lib&quot;, &quot;pkgconfig&quot;))

-- Miniconda (&gt;= 23.11.0) [2023-11-30]:
-- Prevent conda from add shortcuts to user's Desktop.
pushenv(&quot;CONDA_SHORTCUTS&quot;, &quot;false&quot;)

if mode() == &quot;load&quot; then
  -- ASSERT: Make sure there is no other active conda environment
  if os.getenv(&quot;CONDA_EXE&quot;) then
    LmodError(&quot;Cannot load &quot; .. name .. &quot; module, because another conda installation is already enabled (detected environment variable CONDA_EXE='&quot; .. os.getenv(&quot;CONDA_EXE&quot;) .. &quot;'). Have you installed conda on your own? If so, run 'conda config --set auto_activate_base false' and then log out and log back in again.  If that is not sufficient, please run 'conda init --reverse' and log out and back in again.&quot;)
  end

  pushenv(&quot;CONDA_EXE&quot;, pathJoin(home, &quot;bin&quot;, &quot;conda&quot;))
  pushenv(&quot;CONDA_PYTHON_EXE&quot;, pathJoin(home, &quot;bin&quot;, &quot;python&quot;))
  pushenv(&quot;_CE_M&quot;, &quot;&quot;)
  pushenv(&quot;_CE_CONDA&quot;, &quot;&quot;)
elseif mode() == &quot;unload&quot; then
  pushenv(&quot;CONDA_EXE&quot;, &quot;false&quot;)
  pushenv(&quot;CONDA_PYTHON_EXE&quot;, &quot;false&quot;)
  pushenv(&quot;_CE_M&quot;, &quot;false&quot;)
  pushenv(&quot;_CE_CONDA&quot;, &quot;false&quot;)
end

-- Don't edit! Created using: 
-- /usr/share/lmod/lmod/libexec/sh_to_modulefile /wynton/home/cbi/shared/software/CBI/miniconda3-24.5.0-0-py312/etc/profile.d/conda.sh
pushenv(&quot;CONDA_EXE&quot;,&quot;/wynton/home/cbi/shared/software/CBI/miniconda3-24.5.0-0-py312/bin/conda&quot;)
pushenv(&quot;CONDA_PYTHON_EXE&quot;,&quot;/wynton/home/cbi/shared/software/CBI/miniconda3-24.5.0-0-py312/bin/python&quot;)
pushenv(&quot;CONDA_SHLVL&quot;,&quot;0&quot;)
prepend_path(&quot;PATH&quot;,&quot;/wynton/home/cbi/shared/software/CBI/miniconda3-24.5.0-0-py312/condabin&quot;)
pushenv(&quot;_CE_CONDA&quot;,&quot;&quot;)
pushenv(&quot;_CE_M&quot;,&quot;&quot;)
set_shell_function(&quot;__conda_activate&quot;,&quot; \
    if [ -n \&quot;${CONDA_PS1_BACKUP:+x}\&quot; ]; then\
        PS1=\&quot;$CONDA_PS1_BACKUP\&quot;;\
        \\unset CONDA_PS1_BACKUP;\
    fi;\
    \\local ask_conda;\
    ask_conda=\&quot;$(PS1=\&quot;${PS1:-}\&quot; __conda_exe shell.posix \&quot;$@\&quot;)\&quot; || \\return;\
    \\eval \&quot;$ask_conda\&quot;;\
    __conda_hashr\
&quot;,&quot;&quot;)
set_shell_function(&quot;__conda_exe&quot;,&quot; \
    ( \&quot;$CONDA_EXE\&quot; $_CE_M $_CE_CONDA \&quot;$@\&quot; )\
&quot;,&quot;&quot;)
set_shell_function(&quot;__conda_hashr&quot;,&quot; \
    if [ -n \&quot;${ZSH_VERSION:+x}\&quot; ]; then\
        \\rehash;\
    else\
        if [ -n \&quot;${POSH_VERSION:+x}\&quot; ]; then\
            :;\
        else\
            \\hash -r;\
        fi;\
    fi\
&quot;,&quot;&quot;)
set_shell_function(&quot;__conda_reactivate&quot;,&quot; \
    \\local ask_conda;\
    ask_conda=\&quot;$(PS1=\&quot;${PS1:-}\&quot; __conda_exe shell.posix reactivate)\&quot; || \\return;\
    \\eval \&quot;$ask_conda\&quot;;\
    __conda_hashr\
&quot;,&quot;&quot;)
set_shell_function(&quot;conda&quot;,&quot; \
    \\local cmd=\&quot;${1-__missing__}\&quot;;\
    case \&quot;$cmd\&quot; in \
        activate | deactivate)\
            __conda_activate \&quot;$@\&quot;\
        ;;\
        install | update | upgrade | remove | uninstall)\
            __conda_exe \&quot;$@\&quot; || \\return;\
            __conda_reactivate\
        ;;\
        *)\
            __conda_exe \&quot;$@\&quot;\
        ;;\
    esac\
&quot;,&quot;&quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_mutect" class="module-name">mutect</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">muTect: Identification of Somatic Point Mutations in Next Generation Sequencing Data of Cancer Genomes</strong><br>
<span class="module-description">MuTect is a method developed at the Broad Institute for the reliable and accurate identification of somatic point mutations in next generation sequencing data of cancer genomes.</span><br>
Example: <span class="module-example"><code>mutect</code>, which is short for <code>java -Xmx2g -jar &quot;$MUTECT_JAR&quot;</code>.</span><br>
URL: <span class="module-url"><a href="https://software.broadinstitute.org/cancer/cga/mutect">https://software.broadinstitute.org/cancer/cga/mutect</a>, <a href="https://github.com/broadinstitute/mutect">https://github.com/broadinstitute/mutect</a> (source code)</span><br>
Requirement: <span class="module-requirement">MuTect (&lt;= 1.1) requires Java v1.7 and will not work with any other Java versions.</span><br>
Versions: <span class="module-version">1.1.1, 1.1.4, <em>1.1.5</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
muTect: Identification of Somatic Point Mutations in Next Generation Sequencing Data of Cancer Genomes
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, genome&quot;)
whatis(&quot;URL: https://software.broadinstitute.org/cancer/cga/mutect, https://github.com/broadinstitute/mutect (source code)&quot;)
whatis([[
Description: MuTect is a method developed at the Broad Institute for the reliable and accurate identification of somatic point mutations in next generation sequencing data of cancer genomes.
Examples: `mutect`, which is short for `java -Xmx2g -jar &quot;$MUTECT_JAR&quot;`.
Requirements: MuTect (&lt;= 1.1) requires Java v1.7 and will not work with any other Java versions.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

if (version == &quot;1.0.27783&quot;) then
  -- muTect 1.0.27783 requires Java (&lt;= 1.7)
  local cluster = os.getenv(&quot;CLUSTER&quot;)
  if (cluster == &quot;tipcc&quot;) then
    load(&quot;jdk/1.7.0&quot;)
  else
--    depends_on(&quot;openjdk/1.6.0&quot;)
  end
end

-- Validate proper Java version for older versions of MuTect
if string.match(version, &quot;^1[.][01]&quot;) then
  local bfr = capture(&quot;java -version 2&gt;&amp;1&quot;)
  for line in string.gmatch(bfr, &quot;[^\n]+&quot;) do
    if string.match(line, &quot;version&quot;) then
      if not string.match(line, &quot;1[.]7&quot;) then
        LmodWarning(myModuleFullName() .. &quot; requires Java v1.7, but you are running &quot; .. line)
      end
    end
  end
end


name = &quot;muTect&quot;
pushenv(&quot;MUTECT_HOME&quot;, home)
local jarfile = name .. &quot;-&quot; .. version .. &quot;.jar&quot;
pushenv(&quot;MUTECT_JAR&quot;, pathJoin(home, jarfile))

local bash = 'java -Xmx2g -jar &quot;$MUTECT_HOME/' .. jarfile .. '&quot; &quot;$@&quot;'
local csh  = 'java -Xmx2g -jar &quot;$MUTECT_HOME/' .. jarfile .. '&quot; $*'
set_shell_function(&quot;mutect&quot;, bash, csh)

-- Tweak Java for the current environment
depends_on(&quot;java-tweaks&quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_ncdu" class="module-name">ncdu</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">ncdu: NCurses Disk Usage</strong><br>
<span class="module-description">Ncdu is a disk usage analyzer with an ncurses interface. It is designed to find space hogs on a remote server where you don’t have an entire graphical setup available, but it is a useful tool even on regular desktop systems. Ncdu aims to be fast, simple and easy to use, and should be able to run in any minimal POSIX-like environment with ncurses installed.</span><br>
Example: <span class="module-example"><code>ncdu --version</code>, <code>ncdu --help</code>, and <code>ncdu</code>. For large cleanup tasks, call <code>ncdu --one-file-system -o ncdu.cache</code> once to scan all files, and then use <code>ncdu --enable-delete -f ncdu.cache</code> to clean them out.</span><br>
URL: <span class="module-url"><a href="https://dev.yorhel.nl/ncdu">https://dev.yorhel.nl/ncdu</a>, <a href="https://dev.yorhel.nl/ncdu/man2">https://dev.yorhel.nl/ncdu/man2</a> (documentation), <a href="https://dev.yorhel.nl/ncdu/changes2">https://dev.yorhel.nl/ncdu/changes2</a> (changelog), <a href="https://code.blicky.net/yorhel/ncdu/">https://code.blicky.net/yorhel/ncdu/</a> (source code)</span><br>
Versions: <span class="module-version"><em>2.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
ncdu: NCurses Disk Usage
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, cli, files&quot;)
whatis(&quot;URL: https://dev.yorhel.nl/ncdu, https://dev.yorhel.nl/ncdu/man2 (documentation), https://dev.yorhel.nl/ncdu/changes2 (changelog), https://code.blicky.net/yorhel/ncdu/ (source code)&quot;)
whatis([[
Description: Ncdu is a disk usage analyzer with an ncurses interface. It is designed to find space hogs on a remote server where you don’t have an entire graphical setup available, but it is a useful tool even on regular desktop systems. Ncdu aims to be fast, simple and easy to use, and should be able to run in any minimal POSIX-like environment with ncurses installed.
Examples: `ncdu --version`, `ncdu --help`, and `ncdu`. For large cleanup tasks, call `ncdu --one-file-system -o ncdu.cache` once to scan all files, and then use `ncdu --enable-delete -f ncdu.cache` to clean them out.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_pandoc" class="module-name">pandoc</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Pandoc: A Universal Document Converter</strong><br>
<span class="module-description">Pandoc is a Haskell library and software tool for converting from one markup format to another, and a command-line tool that uses this library.</span><br>
Example: <span class="module-example"><code>pandoc --version</code>.</span><br>
URL: <span class="module-url"><a href="https://pandoc.org/">https://pandoc.org/</a>, <a href="https://github.com/jgm/pandoc/blob/master/changelog.md">https://github.com/jgm/pandoc/blob/master/changelog.md</a> (changelog), <a href="https://github.com/jgm/pandoc">https://github.com/jgm/pandoc</a> (source code)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">3.1.13, <em>3.2.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Pandoc: A Universal Document Converter
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: cli, shell&quot;)
whatis(&quot;URL: https://pandoc.org/, https://github.com/jgm/pandoc/blob/master/changelog.md (changelog), https://github.com/jgm/pandoc (source code)&quot;)
whatis([[
Description: Pandoc is a Haskell library and software tool for converting from one markup format to another, and a command-line tool that uses this library.
Examples: `pandoc --version`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_pdfcrop" class="module-name">pdfcrop</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">PDFCrop: Crop and Rescale PDFs</strong><br>
<span class="module-description">PDFCrop crops the white margins of PDF pages and rescales them to fit a standard size sheet of paper. It makes printed pages much easier to read. PDFCrop is particularly useful for resizing journal articles and converting between letter-size and A4 paper.</span><br>
Example: <span class="module-example"><code>pdfcrop --help</code> and <code>pdfcrop A4 input.pdf</code>.</span><br>
URL: <span class="module-url"><a href="https://www.ctan.org/tex-archive/support/pdfcrop">https://www.ctan.org/tex-archive/support/pdfcrop</a>, <a href="https://github.com/ho-tex/pdfcrop">https://github.com/ho-tex/pdfcrop</a> (source code), <a href="https://github.com/ho-tex/pdfcrop/tags/">https://github.com/ho-tex/pdfcrop/tags/</a> (changelog)</span><br>
Versions: <span class="module-version">0.4b, <em>1.42</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
PDFCrop: Crop and Rescale PDFs
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, tool&quot;)
whatis(&quot;URL: https://www.ctan.org/tex-archive/support/pdfcrop, https://github.com/ho-tex/pdfcrop (source code), https://github.com/ho-tex/pdfcrop/tags/ (changelog)&quot;)
whatis([[
Description: PDFCrop crops the white margins of PDF pages and rescales them to fit a standard size sheet of paper. It makes printed pages much easier to read. PDFCrop is particularly useful for resizing journal articles and converting between letter-size and A4 paper.
Examples: `pdfcrop --help` and `pdfcrop A4 input.pdf`.
]])

-- Local variables
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_picard" class="module-name">picard</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">Picard: Command-line tools for Manipulating High-throughput Sequencing Data and Formats</strong><br>
<span class="module-description">Picard is a set of command line tools for manipulating high-throughput sequencing (HTS) data and formats such as SAM/BAM/CRAM and VCF.</span><br>
Example: <span class="module-example"><code>PicardCommandLine -h</code>, which is short for <code>java -jar &quot;$PICARD_HOME/picard.jar&quot; -h</code>.</span><br>
URL: <span class="module-url"><a href="https://broadinstitute.github.io/picard/">https://broadinstitute.github.io/picard/</a>, <a href="https://github.com/broadinstitute/picard/releases">https://github.com/broadinstitute/picard/releases</a> (changelog), <a href="https://github.com/broadinstitute/picard">https://github.com/broadinstitute/picard</a> (source code)</span><br>
Warning: <span class="module-warning">The old <code>picard</code> alias is deprecated. Use function <code>PicardCommandLine</code> instead. Picard 3 requires Java 17, Picard 2 requires Java 1.8.</span><br>
Versions: <span class="module-version">2.21.1, 2.21.4, 2.22.2, 2.23.1, 2.24.0, 2.26.2, 2.26.10, 2.27.1, 2.27.4, 2.27.5, <em>3.1.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
Picard: Command-Line Tools for Manipulating High-throughput Sequencing Data and Formats
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://broadinstitute.github.io/picard/, https://github.com/broadinstitute/picard/releases (changelog), https://github.com/broadinstitute/picard (source code)&quot;)
whatis([[
Description: Picard is a set of command line tools for manipulating high-throughput sequencing (HTS) data and formats such as SAM/BAM/CRAM and VCF.
Examples: `PicardCommandLine -h`, which is short for `java -jar &quot;$PICARD_HOME/picard.jar&quot; -h`.
Warning: The old `picard` alias is deprecated. Use function `PicardCommandLine` instead. Picard 3 requires Java 17, Picard 2 requires Java 1.8.
]])

local version_x = string.gsub(version, &quot;[.].*&quot;, &quot;&quot;)
if (version_x == &quot;1&quot;) then
  -- Pindel 1.64 requires Java (&lt;= 1.6)
  depends_on(&quot;openjdk/1.6.0&quot;)
elseif (version_x == &quot;2&quot;) then
  -- As of version 2.0.1 (Nov. 2015) Picard requires Java 1.8 (jdk8u66)
  depends_on(&quot;openjdk/1.8.0&quot;)
elseif (version_x == &quot;3&quot;) then
  -- As of version 3.0.0 (Feb. 2023) Picard requires Java 17
  depends_on(&quot;openjdk/17&quot;)
end

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)
pushenv(&quot;PICARD_HOME&quot;, home)

-- Functions
local bash = 'java -jar &quot;$PICARD_HOME/picard.jar&quot; &quot;$@&quot;'
local csh  = 'java -jar &quot;$PICARD_HOME/picard.jar&quot; $*'
set_shell_function(&quot;PicardCommandLine&quot;, bash, csh)

-- Aliases (deprecated)
set_alias(&quot;picard&quot;, &quot;java -jar \&quot;$PICARD_HOME/picard.jar\&quot;&quot;)

-- Tweak Java for the current environment
depends_on(&quot;java-tweaks&quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_pindel" class="module-name">pindel</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">pindel: Detection of Indels and Structural Variations</strong><br>
<span class="module-description">Pindel can detect breakpoints of large deletions, medium sized insertions, inversions, tandem duplications and other structural variants at single-based resolution from next-gen sequence data. It uses a pattern growth approach to identify the breakpoints of these variants from paired-end short reads.</span><br>
Example: <span class="module-example"><code>pindel</code> and <code>pindel --help</code>.</span><br>
URL: <span class="module-url"><a href="https://www.sanger.ac.uk/science/tools/pindel">https://www.sanger.ac.uk/science/tools/pindel</a>, <a href="https://github.com/genome/pindel/tags">https://github.com/genome/pindel/tags</a> (changelog), <a href="https://github.com/genome/pindel">https://github.com/genome/pindel</a> (source code)</span><br>
Versions: <span class="module-version"><em>0.2.5b8</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
pindel: Detection of Indels and Structural Variations
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://www.sanger.ac.uk/science/tools/pindel, https://github.com/genome/pindel/tags (changelog), https://github.com/genome/pindel (source code)&quot;)
whatis([[
Description: Pindel can detect breakpoints of large deletions, medium sized insertions, inversions, tandem duplications and other structural variants at single-based resolution from next-gen sequence data. It uses a pattern growth approach to identify the breakpoints of these variants from paired-end short reads.
Examples: `pindel` and `pindel --help`.
]])

if (version == &quot;0.2.4t&quot;) then
  load(&quot;samtools/0.1.18&quot;)
else
  load(&quot;htslib&quot;)
end

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_plink" class="module-name">plink</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">PLINK: Whole Genome Association Analysis Toolset</strong><br>
<span class="module-description">PLINK is a free, open-source whole genome association analysis toolset, designed to perform a range of basic, large-scale analyses in a computationally efficient manner. The focus of PLINK is purely on analysis of genotype/phenotype data, so there is no support for steps prior to this (e.g. study design and planning, generating genotype or CNV calls from raw data).</span><br>
Example: <span class="module-example"><code>plink --help</code> and <code>plink --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.cog-genomics.org/plink/">https://www.cog-genomics.org/plink/</a></span><br>
Versions: <span class="module-version">1.07, 1.90b6.10, 1.90b6.16, 1.90b6.18, 1.90b6.21, 1.90b6.24, 1.90b6.25, <em>1.90b6.26</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
PLINK: Whole Genome Association Analysis Toolset
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: genomics&quot;)
whatis(&quot;URL: https://www.cog-genomics.org/plink/&quot;)
whatis([[
Description: PLINK is a free, open-source whole genome association analysis toolset, designed to perform a range of basic, large-scale analyses in a computationally efficient manner. The focus of PLINK is purely on analysis of genotype/phenotype data, so there is no support for steps prior to this (e.g. study design and planning, generating genotype or CNV calls from raw data).
Examples: `plink --help` and `plink --version`.
]])

-- Local variables
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_plink2" class="module-name">plink2</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">PLINK2: Whole Genome Association Analysis Toolset</strong><br>
<span class="module-description">PLINK is a free, open-source whole genome association analysis toolset, designed to perform a range of basic, large-scale analyses in a computationally efficient manner. The focus of PLINK is purely on analysis of genotype/phenotype data, so there is no support for steps prior to this (e.g. study design and planning, generating genotype or CNV calls from raw data).</span><br>
Example: <span class="module-example"><code>plink2 --help</code> and <code>plink2 --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.cog-genomics.org/plink/2.0/">https://www.cog-genomics.org/plink/2.0/</a>, <a href="https://www.cog-genomics.org/plink/2.0/#recent">https://www.cog-genomics.org/plink/2.0/#recent</a> (changelog), <a href="https://github.com/chrchang/plink-ng">https://github.com/chrchang/plink-ng</a> (source code)</span><br>
Versions: <span class="module-version">2.00a2LM, <em>2.00a3LM</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
PLINK2: Whole Genome Association Analysis Toolset
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: genomics&quot;)
whatis(&quot;URL: https://www.cog-genomics.org/plink/2.0/, https://www.cog-genomics.org/plink/2.0/#recent (changelog), https://github.com/chrchang/plink-ng (source code)&quot;)
whatis([[
Description: PLINK is a free, open-source whole genome association analysis toolset, designed to perform a range of basic, large-scale analyses in a computationally efficient manner. The focus of PLINK is purely on analysis of genotype/phenotype data, so there is no support for steps prior to this (e.g. study design and planning, generating genotype or CNV calls from raw data).
Examples: `plink2 --help` and `plink2 --version`.
]])

-- Local variables
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_port4me" class="module-name">port4me</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">port4me:  Get the Same, Personal, Free TCP Port over and over</strong><br>
<span class="module-description">'port4me' attempts, with high probability, to provide the user with the same, free port each time, even when used on different days.</span><br>
Example: <span class="module-example"><code>port4me --help</code>, <code>port4me</code>, <code>port4me --tool=jupyter</code>).</span><br>
URL: <span class="module-url"><a href="https://github.com/HenrikBengtsson/port4me">https://github.com/HenrikBengtsson/port4me</a>, <a href="https://github.com/HenrikBengtsson/port4me/blob/develop/NEWS.md">https://github.com/HenrikBengtsson/port4me/blob/develop/NEWS.md</a> (changelog)</span><br>
Warning: <span class="module-warning">This tool is under development.</span><br>
Versions: <span class="module-version"><em>0.7.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
port4me:  Get the Same, Personal, Free TCP Port over and over
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, cli&quot;)
whatis(&quot;URL: https://github.com/HenrikBengtsson/port4me, https://github.com/HenrikBengtsson/port4me/blob/develop/NEWS.md (changelog)&quot;)
whatis([[
Description: 'port4me' attempts, with high probability, to provide the user with the same, free port each time, even when used on different days.
Examples: `port4me --help`, `port4me`, `port4me --tool=jupyter`).
Warning: This tool is under development.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_proj" class="module-name">proj</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">PROJ: PROJ Coordinate Transformation Software Library</strong><br>
<span class="module-description">PROJ is a generic coordinate transformation software that transforms geospatial coordinates from one coordinate reference system (CRS) to another. This includes cartographic projections as well as geodetic transformations. PROJ includes command line applications for easy conversion of coordinates from text files or directly from user input. In addition to the command line utilities PROJ also exposes an application programming interface, or API in short. The API lets developers use the functionality of PROJ in their own software without having to implement similar functionality themselves.</span><br>
Example: <span class="module-example"><code>geod</code>, <code>proj</code> and <code>man proj</code>.</span><br>
URL: <span class="module-url"><a href="https://proj.org/">https://proj.org/</a></span><br>
Versions: <span class="module-version"><em>4.9.3</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
PROJ: PROJ Coordinate Transformation Software Library
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: statistics, spatial&quot;)
whatis(&quot;URL: https://proj.org/&quot;)
whatis(&quot;Description: PROJ is a generic coordinate transformation software that transforms geospatial coordinates from one coordinate reference system (CRS) to another. This includes cartographic projections as well as geodetic transformations. PROJ includes command line applications for easy conversion of coordinates from text files or directly from user input. In addition to the command line utilities PROJ also exposes an application programming interface, or API in short. The API lets developers use the functionality of PROJ in their own software without having to implement similar functionality themselves. Example: `geod`, `proj` and `man proj`.&quot;)

if (version &gt;= &quot;7.2.0&quot;) then
  depends_on(&quot;sqlite&quot;)
end

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
prepend_path(&quot;PKG_CONFIG_PATH&quot;, pathJoin(home, &quot;lib&quot;, &quot;pkgconfig&quot;))


-- From 'make install':
-- If you ever happen to want to link against installed libraries
-- in a given directory, LIBDIR, you must either use libtool, and
-- specify the full pathname of the library, or use the '-LLIBDIR'
-- flag during linking and do at least one of the following:
--    - add LIBDIR to the 'LD_LIBRARY_PATH' environment variable
--      during execution
--    - add LIBDIR to the 'LD_RUN_PATH' environment variable
--      during linking
--    - use the '-Wl,-rpath -Wl,LIBDIR' linker flag
--    - have your system administrator add LIBDIR to '/etc/ld.so.conf'
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_qtop" class="module-name">qtop</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">qtop: Monitor the State of Queueing Systems, Along with Related Information Relevant on HPC &amp; Grid Clusters</strong><br>
<span class="module-description"><code>qtop</code> (pronounced queue-top) is a tool written in order to monitor the state of Queueing Systems, along with related information relevant on HPC &amp; grid clusters. At present it supports PBS, SGE &amp; OAR families. Please help to increase that list in the Python version of the tool, qtop.py!</span><br>
Example: <span class="module-example"><code>qtop</code>, <code>qtop --help</code>, <code>qtop --version</code>, and <code>qtop -FGW</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/qtop/qtop">https://github.com/qtop/qtop</a>, <a href="https://github.com/qtop/qtop/blob/master/CHANGELOG.rst">https://github.com/qtop/qtop/blob/master/CHANGELOG.rst</a> (changelog)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>0.9.20161222</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
qtop: Monitor the State of Queueing Systems, Along with Related Information Relevant on HPC &amp; Grid Clusters
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: system, utility, cli, tui&quot;)
whatis(&quot;URL: https://github.com/qtop/qtop, https://github.com/qtop/qtop/blob/master/CHANGELOG.rst (changelog)&quot;)
whatis([[
Description: `qtop` (pronounced queue-top) is a tool written in order to monitor the state of Queueing Systems, along with related information relevant on HPC &amp; grid clusters. At present it supports PBS, SGE &amp; OAR families. Please help to increase that list in the Python version of the tool, qtop.py!
Examples: `qtop`, `qtop --help`, `qtop --version`, and `qtop -FGW`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
append_path(&quot;PYTHONPATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_quarto" class="module-name">quarto</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">quarto-cli: Open-Source Scientific and Technical Publishing System Built on Pandoc</strong><br>
<span class="module-description">Quarto is an open-source scientific and technical publishing system built on Pandoc; (i) Create dynamic content with Python, R, Julia, and Observable, (ii) Author documents as plain text markdown or Jupyter notebooks, (iii) Publish high-quality articles, reports, presentations, websites, blogs, and books in HTML, PDF, MS Word, ePub, and more, (iv) Author with scientific markdown, including equations, citations, crossrefs, figure panels, callouts, advanced layout, and more.</span><br>
Example: <span class="module-example"><code>quarto --version</code> and <code>quarto --help</code>.</span><br>
URL: <span class="module-url"><a href="https://quarto.org/">https://quarto.org/</a>, <a href="https://quarto.org/docs/guide/">https://quarto.org/docs/guide/</a> (documentation), <a href="https://github.com/quarto-dev/quarto-cli/releases">https://github.com/quarto-dev/quarto-cli/releases</a> (changelog), <a href="https://github.com/quarto-dev/quarto-cli/">https://github.com/quarto-dev/quarto-cli/</a> (source code)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">1.4.557, <em>1.5.55</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
quarto-cli: Open-Source Scientific and Technical Publishing System Built on Pandoc
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: markdown&quot;)
whatis(&quot;URL: https://quarto.org/, https://quarto.org/docs/guide/ (documentation), https://github.com/quarto-dev/quarto-cli/releases (changelog), https://github.com/quarto-dev/quarto-cli/ (source code)&quot;)
whatis([[
Description: Quarto is an open-source scientific and technical publishing system built on Pandoc; (i) Create dynamic content with Python, R, Julia, and Observable, (ii) Author documents as plain text markdown or Jupyter notebooks, (iii) Publish high-quality articles, reports, presentations, websites, blogs, and books in HTML, PDF, MS Word, ePub, and more, (iv) Author with scientific markdown, including equations, citations, crossrefs, figure panels, callouts, advanced layout, and more.
Examples: `quarto --version` and `quarto --help`.
Warning: Only the most recent version of this software will be kept.
]])

depends_on(&quot;pandoc&quot;)

-- Local variables
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_r" class="module-name">r</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">R: The R Programming Language</strong><br>
<span class="module-description">The R programming language.</span><br>
Example: <span class="module-example"><code>R</code>, <code>R --version</code>, and <code>Rscript --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.r-project.org/">https://www.r-project.org/</a>, <a href="https://cran.r-project.org/doc/manuals/r-release/NEWS.html">https://cran.r-project.org/doc/manuals/r-release/NEWS.html</a> (changelog)</span><br>
Versions: <span class="module-version">3.0.0, 3.0.3, 3.1.0, 3.1.3, 3.2.0, 3.2.5, 3.3.0, 3.3.3, 3.4.0, 3.4.4, 3.5.0, 3.5.3, 3.6.0, 3.6.3, 4.0.0, 4.0.5, 4.1.0, 4.1.3, 4.2.0-gcc10, 4.2.3-gcc10, 4.3.0-gcc10, 4.3.1-gcc10, 4.3.2-gcc10, 4.3.3-gcc10, 4.4.0-gcc13, <em>4.4.1-gcc13</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
R: The R Programming Language
]])

local name = myModuleName()
local version = &quot;4.3.1-gcc10&quot;
version = string.gsub(version, &quot;^[.]&quot;, &quot;&quot;) -- for hidden modules
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: Programming, Statistics&quot;)
whatis(&quot;URL: https://www.r-project.org/, https://cran.r-project.org/doc/manuals/r-release/NEWS.html (changelog)&quot;)
whatis([[
Description: The R programming language.
Examples: `R`, `R --version`, and `Rscript --version`.
]])

has_devtoolset = function(version)
  local path = pathJoin(&quot;/opt&quot;, &quot;rh&quot;, &quot;devtoolset-&quot; .. version)
  return(isDir(path))
end

has_gcc_toolset = function(version)
  local path = pathJoin(&quot;/opt&quot;, &quot;rh&quot;, &quot;gcc-toolset-&quot; .. version)
  return(isDir(path))
end

local name = &quot;R&quot;
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)

-- Specific to the Linux distribution?
if string.match(myFileName(), &quot;/_&quot; .. os.getenv(&quot;CBI_LINUX&quot;) .. &quot;/&quot;) then
  root = pathJoin(root, &quot;_&quot; .. os.getenv(&quot;CBI_LINUX&quot;))
end

local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

local path = pathJoin(home, &quot;lib&quot;)
if not isDir(path) then
  path = pathJoin(home, &quot;lib64&quot;)
end
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(path, &quot;R&quot;, &quot;lib&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))

local v = version
v = string.gsub(v, &quot;-.*&quot;, &quot;&quot;)

-- WORKAROUND: R 3.6.0 is not compatible with BeeGFS
if v == &quot;3.6.0&quot; then
  pushenv(&quot;R_INSTALL_STAGED&quot;, &quot;false&quot;)
else
  pushenv(&quot;R_INSTALL_STAGED&quot;, &quot;true&quot;)
end

local r_libs_user
if os.getenv(&quot;CBI_LINUX&quot;) == &quot;centos7&quot; then
  r_libs_user=&quot;~/R/%p-library/%v-CBI&quot;
else
  r_libs_user=&quot;~/R/&quot; .. os.getenv(&quot;CBI_LINUX&quot;) .. &quot;-&quot; .. &quot;%p-library/%v-CBI&quot;
end

if (v &gt;= &quot;4.1.0&quot;) then
  local gv = string.gsub(version, v, &quot;&quot;)
  gv = string.gsub(gv, &quot;-alpha&quot;, &quot;&quot;)
  gv = string.gsub(gv, &quot;-beta&quot;, &quot;&quot;)
  gv = string.gsub(gv, &quot;-rc&quot;, &quot;&quot;)
  gv = string.gsub(gv, &quot;-gcc&quot;, &quot;&quot;)
  if (gv ~= &quot;&quot;) then                                                                                           
    gv = tonumber(gv)
    if (gv &gt; 4) then
      r_libs_user = r_libs_user .. &quot;-gcc&quot; .. gv
      if has_devtoolset(gv) then
        depends_on(&quot;scl-devtoolset/&quot; .. gv)
      elseif has_gcc_toolset(gv) then
        depends_on(&quot;scl-gcc-toolset/&quot; .. gv)
      end
    end
  end
end

-- Avoid R CMD build warning on &quot;invalid uid value replaced by that for user 'nobody'&quot;
-- https://stackoverflow.com/questions/30599326
pushenv(&quot;R_BUILD_TAR&quot;, &quot;tar&quot;)

-- In-house env var for R repositories mirrored locally
local r_repos_root = os.getenv(&quot;CBI_SHARED_ROOT&quot;)
if (r_repos_root) then
  LmodMessage(&quot;r_repos_root=&quot; .. r_repos_root)
  r_repos_root = pathJoin(r_repos_root, &quot;mirrors&quot;, &quot;r-mirrors&quot;)
  pushenv(&quot;R_REPOS_ROOT&quot;, r_repos_root)
  pushenv(&quot;R_REPOS_CRAN&quot;, &quot;file://&quot; .. pathJoin(r_repos_root, &quot;cran&quot;))
  pushenv(&quot;R_LOCAL_CRAN&quot;, &quot;file://&quot; .. pathJoin(r_repos_root, &quot;cran&quot;))
end

-- R packages built from native code and installed using R from EPEL is *not*
-- always compatible with ditto installed using R from the CBI software stack.
-- Because of this, we will use R_LIBS_USER specific to the CBI stack.
-- However, since some users has already installed to the built-in R_LIBS_USER
-- we will not change this for such users.  The heuristic is to check if the
-- built-in R_LIBS_USER folder already exists. If not, then it's safe to use
-- one specific to the CBI stack.
pushenv(&quot;R_LIBS_USER&quot;, r_libs_user)

-- The R package 'renv' (https://cran.r-project.org/package=renv) is used to create
-- folder-specific R package library folder that help with reproducibility and long-term
-- stability.  By setting RENV_PATHS_PREFIX_AUTO=TRUE, these folders are also specific
-- for the current Linux distribution, which avoids problems occurring when updating
-- from, say, CentOS 7 to Rocky 8.  This is likely to become the default behavior in
-- 'renv' (https://github.com/rstudio/renv/issues/1211)
pushenv(&quot;RENV_PATHS_PREFIX_AUTO&quot;, &quot;TRUE&quot;)

-- WORKAROUND: utils::download.file(), which is for instance used by install.packages()
-- have a built-in timeout at 60 seconds.  This might be too short for some larger
-- Bioconductor annotation packages, e.g.
--  * 'SNPlocs.Hsapiens.dbSNP150.GRCh38' (2.10 GB)
--  * 'MafDb.gnomAD.r2.1.GRCh38' (6.04 GB) =&gt; 6 GB/10 min = 600 MB/min = 10 MB/s = 80 Mb/s
-- Use 20 minutes timeout instead of 1 minute, i.e. enought with 40 Mb/s for a 6 GB file
pushenv(&quot;R_DEFAULT_INTERNET_TIMEOUT&quot;, &quot;1200&quot;)

-- WORKAROUND: gert 1.1.0 (2021-01-25) installs toward a static libgit2 that
-- gives 'Illegal instruction' on some hosts (with older CPUs?)
-- See https://github.com/r-lib/gert/issues/117
pushenv(&quot;USE_SYSTEM_LIBGIT2&quot;, &quot;true&quot;)

-- WORKAROUND: Package udunits2 does not install out of the box and requires
-- manually specifying 'configure.args' during install unless we set the
-- following environment variable
local path = &quot;/usr/include/udunits2&quot;
if (isDir(path)) then
  pushenv(&quot;UDUNITS2_INCLUDE&quot;, path)
end

-- WORKAROUND: nloptr 2.0.0 requires CMake (&gt;= 3.15)
-- See https://github.com/astamm/nloptr/issues/104#issuecomment-1111498876
pushenv(&quot;CMAKE_BIN&quot;, &quot;cmake3&quot;)



-- Assert that there is no active Conda environment
assert_no_conda_environment = function()  
  local conda_env = os.getenv(&quot;CONDA_DEFAULT_ENV&quot;)
  if conda_env ~= nil then
    local action = os.getenv(&quot;CBI_ON_CONDA&quot;) or &quot;warning&quot;
    local msg = &quot;Using the &quot; .. &quot;'&quot; .. myModuleName() .. &quot;'&quot; .. &quot; module when a Conda environment is active risks resulting in hard-to-troubleshoot errors due to library conflicts. Make sure to deactivate the currently active Conda &quot; .. &quot;'&quot; .. conda_env .. &quot;'&quot; .. &quot; environment before loading this module, e.g. 'conda deactivate'.&quot;
    if action == &quot;error&quot; then
      LmodError(msg)
    elseif action == &quot;warning&quot; then
      LmodWarning(msg)
    end
  end
end


-- Protect against a conflicting Conda stack
if (mode() == &quot;load&quot;) then
  assert_no_conda_environment()
end
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_r-siteconfig" class="module-name">r-siteconfig</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">R Site Configuration: Tweaks to R for the Current Compute Environment</strong><br>
<span class="module-description">Sets R options and environment variables customized for the current compute environment. Notably, it configures R to install packages from local CRAN and Bioconductor mirrors without the need for internet access.</span><br>
Example: <span class="module-example">In R, <code>install.packages(\&quot;ggplot2\&quot;)</code>.</span><br>
Versions: <span class="module-version"><em>0.3</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
R Site Configuration: Tweaks to R for the Current Compute Environment
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: R, configuration&quot;)
whatis([[
Description: Sets R options and environment variables customized for the current compute environment. Notably, it configures R to install packages from local CRAN and Bioconductor mirrors without the need for internet access.
Examples: In R, `install.packages(\&quot;ggplot2\&quot;)`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

-- Set site-wide (sic!) Renviron and Rprofile files
pushenv(&quot;R_ENVIRON&quot;, pathJoin(home, &quot;Renviron.site&quot;))
pushenv(&quot;R_PROFILE&quot;, pathJoin(home, &quot;Rprofile.site&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_rclone" class="module-name">rclone</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">rclone: Rsync for Cloud Storage and More</strong><br>
<span class="module-description">Rclone is a command line program to sync files and directories to and from a large number of end points on the local file system, or remote file systems, and in the cloud.</span><br>
Example: <span class="module-example"><code>rclone --version</code>, <code>rclone --help</code>, <code>rclone config</code>, and <code>man rclone</code>.</span><br>
URL: <span class="module-url"><a href="https://rclone.org/">https://rclone.org/</a>, <a href="https://rclone.org/changelog/">https://rclone.org/changelog/</a> (changelog), <a href="https://github.com/rclone/rclone">https://github.com/rclone/rclone</a> (source code)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">1.66.0, <em>1.67.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help(&quot;rclone: Rsync for Cloud Storage and More&quot;)

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: files, transfers&quot;)
whatis(&quot;URL: https://rclone.org/, https://rclone.org/changelog/ (changelog), https://github.com/rclone/rclone (source code)&quot;)
whatis([[
Description: Rclone is a command line program to sync files and directories to and from a large number of end points on the local file system, or remote file systems, and in the cloud.
Examples: `rclone --version`, `rclone --help`, `rclone config`, and `man rclone`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_redis" class="module-name">redis</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">redis: Remote Dictionary Server</strong><br>
<span class="module-description">Redis is an in-memory database that persists on disk. The data model is key-value, but many different kind of values are supported: Strings, Lists, Sets, Sorted Sets, Hashes, Streams, HyperLogLogs, Bitmaps.</span><br>
Example: <span class="module-example"><code>redis-cli --version</code>, <code>redis-cli --help</code>, <code>redis-server --version</code>, and <code>redis-server --help</code>.</span><br>
URL: <span class="module-url"><a href="https://redis.io/">https://redis.io/</a>, <a href="https://redis.io/docs/">https://redis.io/docs/</a> (docs), <a href="https://github.com/redis/redis/releases">https://github.com/redis/redis/releases</a> (changelog), <a href="https://github.com/redis/redis">https://github.com/redis/redis</a> (source code)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">7.0.12, 7.0.13, 7.2.1, 7.2.2, 7.2.3, <em>7.2.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
redis: Remote Dictionary Server
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: database&quot;)
whatis(&quot;URL: https://redis.io/, https://redis.io/docs/ (docs), https://github.com/redis/redis/releases (changelog), https://github.com/redis/redis (source code)&quot;)
whatis([[
Description: Redis is an in-memory database that persists on disk. The data model is key-value, but many different kind of values are supported: Strings, Lists, Sets, Sorted Sets, Hashes, Streams, HyperLogLogs, Bitmaps.
Examples: `redis-cli --version`, `redis-cli --help`, `redis-server --version`, and `redis-server --help`.
Warning: Only the most recent version of this software will be kept.
]])

-- Local variables
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_restic" class="module-name">restic</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">restic: Fast, Secure, Efficient Backup Program</strong><br>
<span class="module-description">restic is a backup program that is fast, efficient and secure. It supports the three major operating systems (Linux, macOS, Windows) and a few smaller ones (FreeBSD, OpenBSD).</span><br>
Example: <span class="module-example"><code>restic --help</code> and <code>restic version</code>.</span><br>
URL: <span class="module-url"><a href="https://restic.net">https://restic.net</a>, <a href="https://restic.readthedocs.io/en/latest/">https://restic.readthedocs.io/en/latest/</a> (documentation), <a href="https://github.com/restic/restic/releases">https://github.com/restic/restic/releases</a> (change log), <a href="https://github.com/restic/restic">https://github.com/restic/restic</a> (source code)</span><br>
Versions: <span class="module-version">0.16.4, <em>0.16.5</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
restic: Fast, Secure, Efficient Backup Program
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: cli, backup, files&quot;)
whatis(&quot;URL: https://restic.net, https://restic.readthedocs.io/en/latest/ (documentation), https://github.com/restic/restic/releases (change log), https://github.com/restic/restic (source code)&quot;)
whatis([[
Description: restic is a backup program that is fast, efficient and secure. It supports the three major operating systems (Linux, macOS, Windows) and a few smaller ones (FreeBSD, OpenBSD).
Examples: `restic --help` and `restic version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_ripgrep" class="module-name">ripgrep</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">ripgrep: Recursively Searches Directories for a Regex Pattern</strong><br>
<span class="module-description">ripgrep is a line-oriented search tool that recursively searches your current directory for a regex pattern. By default, ripgrep will respect your .gitignore and automatically skip hidden files/directories and binary files. ripgrep is similar to other popular search tools like The Silver Searcher, ack and grep.</span><br>
Example: <span class="module-example"><code>rg --version</code> and <code>rg -i 'lorem ipsum'</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/BurntSushi/ripgrep">https://github.com/BurntSushi/ripgrep</a>, <a href="https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md">https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md</a> (changelog)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>14.1.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
ripgrep: Recursively Searches Directories for a Regex Pattern
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utility, files, search&quot;)
whatis(&quot;URL: https://github.com/BurntSushi/ripgrep, https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md (changelog)&quot;)
whatis([[
Description: ripgrep is a line-oriented search tool that recursively searches your current directory for a regex pattern. By default, ripgrep will respect your .gitignore and automatically skip hidden files/directories and binary files. ripgrep is similar to other popular search tools like The Silver Searcher, ack and grep.
Examples: `rg --version` and `rg -i 'lorem ipsum'`.
Warning: Only the most recent version of this software will be kept.
]])

-- Local variables
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_rstudio" class="module-name">rstudio</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">rstudio: RStudio Desktop</strong><br>
<span class="module-description">The RStudio Desktop is an integrated development environment (IDE) for R, a programming language for statistical computing and graphics.</span><br>
Example: <span class="module-example"><code>rstudio</code>.  If you get a blank window, retry with <code>QMLSCENE_DEVICE=softwarecontext rstudio</code>.</span><br>
URL: <span class="module-url"><a href="https://posit.co/products/open-source/rstudio/#rstudio-desktop">https://posit.co/products/open-source/rstudio/#rstudio-desktop</a>, <a href="https://www.rstudio.com/products/rstudio/release-notes/">https://www.rstudio.com/products/rstudio/release-notes/</a> (changelog), <a href="https://github.com/rstudio/rstudio/">https://github.com/rstudio/rstudio/</a> (source code)</span><br>
Warning: <span class="module-warning">This software works only on the development nodes. It requires an SSH connection with X11 Forwarding enabled. It does <em>not</em> work with X2Go (gives error &quot;GLX 1.3 or later is required&quot;). For best performance, use SSH compression when using X11 Forwarding, i.e. <code>ssh -X -C ...</code>.</span><br>
Versions: <span class="module-version">1.4.1103, 1.4.1717, 2021.09.0+351, 2021.09.1-372, 2021.09.2-382, 2022.02.1-461, 2022.07.2-576, 2022.12.0-353, <em>2023.06.1-524</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
RStudio Desktop: The RStudio Desktop IDE for R
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, R, GUI&quot;)
whatis(&quot;URL: https://posit.co/products/open-source/rstudio/#rstudio-desktop, https://www.rstudio.com/products/rstudio/release-notes/ (changelog), https://github.com/rstudio/rstudio/ (source code)&quot;)
whatis([[
Description: The RStudio Desktop is an integrated development environment (IDE) for R, a programming language for statistical computing and graphics.
Examples: `rstudio`.  If you get a blank window, retry with `QMLSCENE_DEVICE=softwarecontext rstudio`.
Warning: This software works only on the development nodes. It requires an SSH connection with X11 Forwarding enabled. It does _not_ work with X2Go (gives error \&quot;GLX 1.3 or later is required\&quot;). For best performance, use SSH compression when using X11 Forwarding, i.e. `ssh -X -C ...`.
]])

depends_on(&quot;r&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_rstudio-server" class="module-name">rstudio-server</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">RStudio Server: The RStudio Server</strong><br>
<span class="module-description">The RStudio Server is an integrated development environment (IDE) for R that can be used from the web browser.</span><br>
Example: <span class="module-example"><code>rserver</code>.</span><br>
URL: <span class="module-url"><a href="https://posit.co/products/open-source/rstudio/#rstudio-server">https://posit.co/products/open-source/rstudio/#rstudio-server</a>, <a href="https://www.rstudio.com/products/rstudio/release-notes/">https://www.rstudio.com/products/rstudio/release-notes/</a> (changelog), <a href="https://github.com/rstudio/rstudio/">https://github.com/rstudio/rstudio/</a> (source code)</span><br>
Versions: <span class="module-version">2021.09.2-382, 2022.02.4-500, 2022.12.0-353, 2023.03.0-386, 2023.06.1-524, 2023.06.2-561, 2023.09.0-463, 2023.09.1-494, 2023.12.0-369, 2023.12.1-402, 2024.04.0-735, <em>2024.04.2-764</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
RStudio Server: The RStudio Server
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, R, GUI&quot;)
whatis(&quot;URL: https://posit.co/products/open-source/rstudio/#rstudio-server, https://www.rstudio.com/products/rstudio/release-notes/ (changelog), https://github.com/rstudio/rstudio/ (source code)&quot;)
whatis([[
Description: The RStudio Server is an integrated development environment (IDE) for R that can be used from the web browser.
Examples: `rserver`.
]])

depends_on(&quot;r&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_rstudio-server-controller" class="module-name">rstudio-server-controller</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">RSC: An RStudio Server Controller</strong><br>
<span class="module-description">The RStudio Server Controller (RSC) is a tool for launching a personal instance of the RStudio Server on a Linux machine, which then can be access via the web browser, either directly or via SSH tunneling.</span><br>
Example: <span class="module-example"><code>rsc --help</code>, <code>rsc start</code>, and <code>rsc stop</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/UCSF-CBI/rstudio-server-controller">https://github.com/UCSF-CBI/rstudio-server-controller</a>, <a href="https://github.com/UCSF-CBI/rstudio-server-controller/blob/main/NEWS.md">https://github.com/UCSF-CBI/rstudio-server-controller/blob/main/NEWS.md</a> (changelog)</span><br>
Versions: <span class="module-version">0.16.0, <em>0.16.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
RSC: An RStudio Server Controller
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, R, RStudio Server, GUI&quot;)
whatis(&quot;URL: https://github.com/UCSF-CBI/rstudio-server-controller, https://github.com/UCSF-CBI/rstudio-server-controller/blob/main/NEWS.md (changelog)&quot;)
whatis([[
Description: The RStudio Server Controller (RSC) is a tool for launching a personal instance of the RStudio Server on a Linux machine, which then can be access via the web browser, either directly or via SSH tunneling.
Examples: `rsc --help`, `rsc start`, and `rsc stop`.
]])

depends_on(&quot;r&quot;)
depends_on(&quot;rstudio-server&quot;)

local home = os.getenv(&quot;HOME&quot;)

-- System-specific settings
if isDir(&quot;/wynton&quot;) then
  -- Update default to: rsc start --auth=auth-via-env --random-password
  pushenv(&quot;RSC_AUTH&quot;, &quot;auth-via-env&quot;)
  pushenv(&quot;RSC_PASSWORD&quot;, &quot;random&quot;)
  if home and string.find(home, &quot;/protected/&quot;) then
    pushenv(&quot;RSC_SSH_LOGIN_HOSTNAME&quot;, &quot;plog1.wynton.ucsf.edu&quot;)
  else
    pushenv(&quot;RSC_SSH_LOGIN_HOSTNAME&quot;, &quot;log1.wynton.ucsf.edu&quot;)
  end
elseif isDir(&quot;/c4&quot;) then
    pushenv(&quot;RSC_SSH_LOGIN_HOSTNAME&quot;, &quot;c4-log1.ucsf.edu&quot;)
else
  try_load(&quot;expect&quot;)
end

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))


-- Temporary workaround for https://github.com/UCSF-CBI/rstudio-server-controller/issues/91 /2023-12-15
setenv(&quot;PORT4ME_PORT_COMMAND&quot;, &quot;netstat&quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_salmon" class="module-name">salmon</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">salmon: Salmon Provides Fast and Bias-Aware Quantification of Transcript Expression</strong><br>
<span class="module-description">Highly-accurate &amp; wicked fast transcript-level quantification from RNA-seq reads using selective alignment.</span><br>
Example: <span class="module-example"><code>salmon --version</code>.</span><br>
URL: <span class="module-url"><a href="https://combine-lab.github.io/salmon/">https://combine-lab.github.io/salmon/</a>, <a href="https://github.com/COMBINE-lab/salmon/releases">https://github.com/COMBINE-lab/salmon/releases</a> (changelog), <a href="https://github.com/COMBINE-lab/salmon">https://github.com/COMBINE-lab/salmon</a> (source code)</span><br>
Versions: <span class="module-version">1.3.0, 1.4.0, 1.5.2, 1.6.0, 1.8.0, 1.9.0, <em>1.10.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
salmon: Salmon Provides Fast and Bias-Aware Quantification of Transcript Expression
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://combine-lab.github.io/salmon/, https://github.com/COMBINE-lab/salmon/releases (changelog), https://github.com/COMBINE-lab/salmon (source code)&quot;)
whatis([[
Description: Highly-accurate &amp; wicked fast transcript-level quantification from RNA-seq reads using selective alignment.
Examples: `salmon --version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_samtools" class="module-name">samtools</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">SAMtools: Tools (written in C using htslib) for Manipulating Next-Generation Sequencing Data</strong><br>
<span class="module-description">SAMtools is a suite of programs for interacting with high-throughput sequencing data.</span><br>
Example: <span class="module-example"><code>samtools --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.htslib.org/">https://www.htslib.org/</a>, <a href="https://github.com/samtools/samtools/blob/develop/NEWS.md">https://github.com/samtools/samtools/blob/develop/NEWS.md</a> (changelog), <a href="https://github.com/samtools/samtools">https://github.com/samtools/samtools</a> (source code)</span><br>
Versions: <span class="module-version">1.9, 1.10, 1.11, 1.13, 1.14, 1.15, 1.15.1, 1.16, 1.16.1, 1.17, 1.18, 1.19, 1.19.2, <em>1.20</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
SAMtools: Tools (written in C using htslib) for Manipulating Next-Generation Sequencing Data
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://www.htslib.org/, https://github.com/samtools/samtools/blob/develop/NEWS.md (changelog), https://github.com/samtools/samtools (source code)&quot;)
whatis([[
Description: SAMtools is a suite of programs for interacting with high-throughput sequencing data.
Examples: `samtools --version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)

local home = pathJoin(root, name .. &quot;-&quot; .. version)

local version_x = string.gsub(version, &quot;[.].*&quot;, &quot;&quot;)
if (version_x == &quot;0&quot;) then
  prepend_path(&quot;PATH&quot;, home)
  prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bcftools&quot;))
  prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;misc&quot;))
else
  prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
end
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))

-- Warn about bug https://github.com/samtools/htslib/issues/1236
if (mode() == &quot;load&quot; and version == &quot;1.11&quot;) then
  LmodMessage(&quot;MODULE WARNING: &quot; .. name .. &quot; &quot; .. version .. &quot; has a bug that results in valid but incorrect CIGAR strings. Because of this, it is recommended to use an older or a newer version instead. For details, see https://github.com/samtools/htslib/issues/1236&quot;)
end
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_scl-gcc-toolset" class="module-name">scl-gcc-toolset</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">SCL GCC Toolset: GNU Compiler Collection, GNU Debugger, etc.</strong><br>
<span class="module-description">These Developer Toolset provides modern versions of the GNU Compiler Collection, GNU Debugger, and other development, debugging, and performance monitoring tools. Loading these modules enables the corresponding RedHat Software Collection (SCL) <code>gcc-toolset-&lt;version&gt;</code> in the current environment.  This is an alternative to calling <code>source scl_source enable gcc-toolset-&lt;version&gt;</code>, which is an approach that is not officially supported by RedHat.</span><br>
Example: <span class="module-example"><code>gcc --version</code>.</span><br>
URL: <span class="module-url"><a href="https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/developing_c_and_cpp_applications_in_rhel_8/additional-toolsets-for-development_developing-applications#gcc-toolset_assembly_additional-toolsets-for-development">https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/developing_c_and_cpp_applications_in_rhel_8/additional-toolsets-for-development_developing-applications#gcc-toolset_assembly_additional-toolsets-for-development</a>, <a href="https://gcc.gnu.org/develop.html#timeline">https://gcc.gnu.org/develop.html#timeline</a> (GCC release schedule)</span><br>
Warning: <span class="module-warning">Older versions may be removed in the future.</span><br>
Requirement: <span class="module-requirement">Rocky 8.</span><br>
Versions: <span class="module-version">9, 10, 11, 12, <em>13</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
SCL GCC Toolset: GNU Compiler Collection, GNU Debugger, etc.
]])

local name = myModuleName()
local version = myModuleVersion()
local scl_name = &quot;gcc-toolset&quot; .. &quot;-&quot; .. version

whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, gcc&quot;)
whatis(&quot;URL: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/developing_c_and_cpp_applications_in_rhel_8/additional-toolsets-for-development_developing-applications#gcc-toolset_assembly_additional-toolsets-for-development, https://gcc.gnu.org/develop.html#timeline (GCC release schedule)&quot;)
whatis([[
Description: These Developer Toolset provides modern versions of the GNU Compiler Collection, GNU Debugger, and other development, debugging, and performance monitoring tools. Loading these modules enables the corresponding RedHat Software Collection (SCL) `gcc-toolset-&lt;version&gt;` in the current environment.  This is an alternative to calling `source scl_source enable gcc-toolset-&lt;version&gt;`, which is an approach that is not officially supported by RedHat.
Examples: `gcc --version`.  Warning: Older versions may be removed in the future.
Requirement: Rocky 8.
]])

-- This module is only available on Rocky 8
if os.getenv(&quot;CBI_LINUX&quot;) ~= &quot;rocky8&quot; then
  LmodError(&quot;Module '&quot; .. myModuleFullName() .. &quot;' is only available on Rocky 8 machines, but not on host '&quot; .. os.getenv(&quot;HOSTNAME&quot;) .. &quot;', which runs '&quot; .. os.getenv(&quot;CBI_LINUX&quot;) .. &quot;'&quot;)
end


local home = pathJoin(&quot;/opt&quot;, &quot;rh&quot;, scl_name)

if not isDir(home) then
  LmodError(&quot;Module '&quot; .. myModuleFullName() .. &quot;' is not supported because this host '&quot; .. os.getenv(&quot;HOSTNAME&quot;) .. &quot;' does not have path '&quot; .. home .. &quot;'&quot;)
end


-- Don't edit! Created using: 
-- /usr/share/lmod/lmod/libexec/sh_to_modulefile /opt/rh/gcc-toolset-13/enable
setenv(&quot;INFOPATH&quot;,&quot;/opt/rh/gcc-toolset-13/root/usr/share/info&quot;)
prepend_path(&quot;LD_LIBRARY_PATH&quot;,&quot;/opt/rh/gcc-toolset-13/root/usr/lib64&quot;)
prepend_path(&quot;MANPATH&quot;,&quot;/opt/rh/gcc-toolset-13/root/usr/share/man&quot;)
prepend_path(&quot;PATH&quot;,&quot;/opt/rh/gcc-toolset-13/root/usr/bin&quot;)
setenv(&quot;PCP_DIR&quot;,&quot;/opt/rh/gcc-toolset-13/root&quot;)
setenv(&quot;PKG_CONFIG_PATH&quot;,&quot;/opt/rh/gcc-toolset-13/root/usr/lib64/pkgconfig&quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_shellcheck" class="module-name">shellcheck</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">ShellCheck: A Shell Script Static Analysis Tool</strong><br>
<span class="module-description">ShellCheck finds bugs in your shell scripts.</span><br>
Example: <span class="module-example"><code>shellcheck --version</code> and <code>shellcheck -x ~/.bashrc</code>.</span><br>
URL: <span class="module-url"><a href="https://www.shellcheck.net/">https://www.shellcheck.net/</a>, <a href="https://github.com/koalaman/shellcheck/blob/master/CHANGELOG.md">https://github.com/koalaman/shellcheck/blob/master/CHANGELOG.md</a> (changelog), <a href="https://github.com/koalaman/shellcheck/">https://github.com/koalaman/shellcheck/</a> (source code)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>0.10.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
ShellCheck: A Shell Script Static Analysis Tool
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, shell, sh, bash, dash, ksh&quot;)
whatis(&quot;URL: https://www.shellcheck.net/, https://github.com/koalaman/shellcheck/blob/master/CHANGELOG.md (changelog), https://github.com/koalaman/shellcheck/ (source code)&quot;)
whatis([[
Description: ShellCheck finds bugs in your shell scripts.
Examples: `shellcheck --version` and `shellcheck -x ~/.bashrc`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_shellcheck-repl" class="module-name">shellcheck-repl</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">ShellCheck REPL: Validation of Shell Commands Before Evaluation</strong><br>
<span class="module-description">ShellCheck is a great tool for validating your Unix shell scripts. It will parse the scripts and warn about mistakes, errors, and potential problems. This tool - shellcheck-repl - brings ShellCheck validation to the Bash read-eval-print loop (REPL), i.e. the Bash prompt. Getting this type of validation and feedback at the prompt lowers the risk of damaging mistakes and will help you become a better Bash user and developer.</span><br>
Example: <span class="module-example">Try <code>echo $HOME</code> before and after loading this module. To deactive, unload module, or start a new shell.</span><br>
URL: <span class="module-url"><a href="https://github.com/HenrikBengtsson/shellcheck-repl">https://github.com/HenrikBengtsson/shellcheck-repl</a>, <a href="https://github.com/HenrikBengtsson/shellcheck-repl/blob/master/README.md">https://github.com/HenrikBengtsson/shellcheck-repl/blob/master/README.md</a> (documentation), <a href="https://github.com/HenrikBengtsson/shellcheck-repl/blob/master/NEWS.md">https://github.com/HenrikBengtsson/shellcheck-repl/blob/master/NEWS.md</a> (changelog)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>0.4.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
ShellCheck REPL: Validation of Shell Commands Before Evaluation 
]])

local name = myModuleName()
local version = myModuleVersion()
version = string.gsub(version, &quot;^[.]&quot;, &quot;&quot;)

whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: programming, shell, bash&quot;)
whatis(&quot;URL: https://github.com/HenrikBengtsson/shellcheck-repl, https://github.com/HenrikBengtsson/shellcheck-repl/blob/master/README.md (documentation), https://github.com/HenrikBengtsson/shellcheck-repl/blob/master/NEWS.md (changelog)&quot;)
whatis([[
Description: ShellCheck is a great tool for validating your Unix shell scripts. It will parse the scripts and warn about mistakes, errors, and potential problems. This tool - shellcheck-repl - brings ShellCheck validation to the Bash read-eval-print loop (REPL), i.e. the Bash prompt. Getting this type of validation and feedback at the prompt lowers the risk of damaging mistakes and will help you become a better Bash user and developer.
Examples: Try `echo $HOME` before and after loading this module. To deactive, unload module, or start a new shell.
Warning: Only the most recent version of this software will be kept.
]])

depends_on(&quot;shellcheck&quot;)

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)
local shell = os.getenv(&quot;SHELL&quot;)
local script = pathJoin(home, &quot;shellcheck-repl.bash&quot;)

-- Enable on load
execute{cmd = &quot;source &quot; .. script, modeA = {&quot;load&quot;}}

-- Disable on unload
execute{cmd = &quot;sc_repl_disable&quot;, modeA = {&quot;unload&quot;}}
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_snpeff" class="module-name">snpeff</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">SnpEff: Genetic Variant Annotation and Effect Prediction Toolbox</strong><br>
<span class="module-description">SnpEff is a variant annotation and effect prediction tool. It annotates and predicts the effects of variants on genes (such as amino acid changes).</span><br>
Example: <span class="module-example"><code>snpEff -help</code> and <code>SnpSift -help</code>, which are short for <code>java -jar $SNPEFF_HOME/snpEff/snpEff.jar -help</code> and <code>java -jar $SNPEFF_HOME/snpEff/SnpSift.jar -help</code>.  In SnpEff (&lt; 5.0), there is also <code>ClinEff -help</code>, which is short for <code>java -jar $SNPEFF_HOME/ClinEff/ClinEff.jar -help</code>.</span><br>
URL: <span class="module-url"><a href="https://pcingola.github.io/SnpEff/">https://pcingola.github.io/SnpEff/</a>, <a href="https://github.com/pcingola/SnpEff/tags">https://github.com/pcingola/SnpEff/tags</a> (changelog), <a href="https://github.com/pcingola/SnpEff">https://github.com/pcingola/SnpEff</a> (source code)</span><br>
Warning: <span class="module-warning">SnpEff (&gt;= 5.1) requires Java (&gt;= 12).</span><br>
Versions: <span class="module-version">4.3t, 5.0c, 5.0e, 5.1e, 5.1, 5.2a, <em>5.2c</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
SnpEff: Genetic Variant Annotation and Effect Prediction Toolbox
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: high-throughput sequencing&quot;)
whatis(&quot;URL: https://pcingola.github.io/SnpEff/, https://github.com/pcingola/SnpEff/tags (changelog), https://github.com/pcingola/SnpEff (source code)&quot;)
whatis([[
Description: SnpEff is a variant annotation and effect prediction tool. It annotates and predicts the effects of variants on genes (such as amino acid changes).
Examples: `snpEff -help` and `SnpSift -help`, which are short for `java -jar $SNPEFF_HOME/snpEff/snpEff.jar -help` and `java -jar $SNPEFF_HOME/snpEff/SnpSift.jar -help`.  In SnpEff (&lt; 5.0), there is also `ClinEff -help`, which is short for `java -jar $SNPEFF_HOME/ClinEff/ClinEff.jar -help`.
Warning: SnpEff (&gt;= 5.1) requires Java (&gt;= 12).
]])

local name = &quot;snpEff&quot;
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

if (version &lt; &quot;5.1&quot;) then
  try_load(&quot;openjdk/11&quot;)
elseif (version &gt;= &quot;5.1&quot;) then
  try_load(&quot;openjdk/17&quot;)
end

pushenv(&quot;SNPEFF_HOME&quot;, home)

local jarfile = pathJoin(home, &quot;snpEff&quot;, &quot;snpEff.jar&quot;)
pushenv(&quot;SNPEFF&quot;, jarfile)
local bash = 'java -jar &quot;$SNPEFF_HOME/snpEff/snpEff.jar&quot; &quot;$@&quot;'
local csh  = 'java -jar &quot;$SNPEFF_HOME/snpEff/snpEff.jar&quot; $*'
set_shell_function(&quot;snpEff&quot;, bash, csh)

local jarfile = pathJoin(home, &quot;snpEff&quot;, &quot;SnpSift.jar&quot;)
pushenv(&quot;SNPSIFT&quot;, jarfile)
local bash = 'java -jar &quot;$SNPEFF_HOME/snpEff/SnpSift.jar&quot; &quot;$@&quot;'
local csh  = 'java -jar &quot;$SNPEFF_HOME/snpEff/SnpSift.jar&quot; $*'
set_shell_function(&quot;SnpSift&quot;, bash, csh)

local jarfile = pathJoin(home, &quot;clinEff&quot;, &quot;ClinEff.jar&quot;)
if isFile(jarfile) then
  pushenv(&quot;CLINEFF&quot;, jarfile)
  local bash = 'java -jar &quot;$SNPEFF_HOME/ClinEff/ClinEff.jar&quot; &quot;$@&quot;'
  local csh  = 'java -jar &quot;$SNPEFF_HOME/ClinEff/ClinEff.jar&quot; $*'
  set_shell_function(&quot;ClinEff&quot;, bash, csh)
end

-- Tweak Java for the current environment
depends_on(&quot;java-tweaks&quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_sqlite" class="module-name">sqlite</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">sqlite: SQLite Database Engine &amp; Library</strong><br>
<span class="module-description">SQLite is a relational database management system (RDBMS) contained in a C library. In contrast to many other database management systems, SQLite is not a client–server database engine. Rather, it is embedded into the end program.</span><br>
Example: <span class="module-example"><code>sqlite3 --version</code>.</span><br>
URL: <span class="module-url"><a href="https://sqlite.org/">https://sqlite.org/</a>, <a href="https://sqlite.org/docs.html">https://sqlite.org/docs.html</a> (docs), <a href="https://github.com/sqlite/sqlite/tags">https://github.com/sqlite/sqlite/tags</a> (changelog), <a href="https://github.com/sqlite/sqlite">https://github.com/sqlite/sqlite</a> (source code)</span><br>
Versions: <span class="module-version">3.43.0, 3.43.2, <em>3.45.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
sqlite: SQLite Database Engine &amp; Library
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: database, utilize&quot;)
whatis(&quot;URL: https://sqlite.org/, https://sqlite.org/docs.html (docs), https://github.com/sqlite/sqlite/tags (changelog), https://github.com/sqlite/sqlite (source code)&quot;)
whatis([[
Description: SQLite is a relational database management system (RDBMS) contained in a C library. In contrast to many other database management systems, SQLite is not a client–server database engine. Rather, it is embedded into the end program.
Example: `sqlite3 --version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)

-- Specific to the Linux distribution?
if string.match(myFileName(), &quot;/_&quot; .. os.getenv(&quot;CBI_LINUX&quot;) .. &quot;/&quot;) then
  root = pathJoin(root, &quot;_&quot; .. os.getenv(&quot;CBI_LINUX&quot;))
end

local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
prepend_path(&quot;LD_LIBRARY_PATH&quot;, pathJoin(home, &quot;lib&quot;))
prepend_path(&quot;PKG_CONFIG_PATH&quot;, pathJoin(home, &quot;lib&quot;, &quot;pkgconfig&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_sratoolkit" class="module-name">sratoolkit</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">SRA Toolkit: Tools and Libraries for Using Data in the INSDC Sequence Read Archives</strong><br>
<span class="module-description">The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives.</span><br>
Example: <span class="module-example"><code>fastq-dump --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/ncbi/sra-tools/wiki">https://github.com/ncbi/sra-tools/wiki</a> (documentation), <a href="https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc">https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc</a> (documentation), <a href="https://github.com/ncbi/sra-tools/blob/master/CHANGES.md">https://github.com/ncbi/sra-tools/blob/master/CHANGES.md</a> (changelog), <a href="https://github.com/ncbi/sra-tools">https://github.com/ncbi/sra-tools</a> (source code)</span><br>
Warning: <span class="module-warning">To work around a bug where <code>fasterq-dump</code> crashes the local machine, it has been tweaked such that it uses <code>$TMPDIR</code> rather than <code>$PWD</code> as the default temporary folder and it will only use two threads instead of six by default.</span><br>
Versions: <span class="module-version">2.10.0, 2.10.4, 2.10.5, 2.10.7, 2.10.8, 2.10.9, 2.11.0, 2.11.1, 2.11.2, 2.11.3, 3.0.0, 3.0.1, 3.0.2, 3.0.5, 3.0.6, 3.0.7, 3.1.0, <em>3.1.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
SRA Toolkit: Tools and Libraries for Using Data in the INSDC Sequence Read Archives
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://github.com/ncbi/sra-tools/wiki (documentation), https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc (documentation), https://github.com/ncbi/sra-tools/blob/master/CHANGES.md (changelog), https://github.com/ncbi/sra-tools (source code)&quot;)
whatis([[
Description: The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives.
Examples: `fastq-dump --help`.
Warning: To work around a bug where `fasterq-dump` crashes the local machine, it has been tweaked such that it uses `$TMPDIR` rather than `$PWD` as the default temporary folder and it will only use two threads instead of six by default.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)
prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))

-- WORKAROUND: fasterq-dump crashes machines!
-- Not sure exactly why, but one hypothesis is that the file system is
-- being hit too hard.  The workaround forces 'fasterq-dump' to use
-- 'TMPDIR' for temporary files rather than the current directory [2]
-- [1] https://github.com/ncbi/sra-tools/issues/463#issuecomment-824321890
-- [2] https://github.com/ncbi/sra-tools/issues/161#issuecomment-808294889
-- In-house tests with sratoolkit 2.11.0 shows that it's *not* sufficient
-- to control TMPDIR but also the number of parallel threads [Harry Putnam,
-- 2021-08-20].  Ideally, we would limit it to a single thread, but the
-- tool will ignore '--threads 1' and use the default six threads. [3]
-- [3] https://github.com/ncbi/sra-tools/issues/494
-- In sratoolkit (&gt;= 2.11.2) it might be that we no longer need to use
-- '--threads 2' [4]. As soon as we have verified that in a safe
-- environment, we'll drop it
-- [4] https://github.com/ncbi/sra-tools/issues/463#issuecomment-942410725

-- Workaround only works in shells that support function, i.e. not in csh and tcsh
if myShellType() == &quot;sh&quot; then
  set_shell_function(&quot;fasterq-dump&quot;, 'command fasterq-dump --threads 2 --temp &quot;$(mktemp -d)&quot; &quot;$@&quot;', '')
end

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_star" class="module-name">star</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">STAR: Spliced Transcripts Alignment to a Reference</strong><br>
<span class="module-description">STAR (Spliced Transcripts Alignment to a Reference) is a fast NGS read aligner for RNA-seq data.</span><br>
Example: <span class="module-example"><code>STAR --help</code> and <code>STAR --version</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/alexdobin/STAR">https://github.com/alexdobin/STAR</a>, <a href="https://github.com/alexdobin/STAR/blob/master/CHANGES.md">https://github.com/alexdobin/STAR/blob/master/CHANGES.md</a> (changelog)</span><br>
Versions: <span class="module-version">2.7.0e, 2.7.0f, 2.7.1a, 2.7.2b, 2.7.3a, 2.7.5a, 2.7.5c, 2.7.7a, 2.7.9a, 2.7.10a, 2.7.10b, 2.7.11a, <em>2.7.11b</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help(&quot;STAR: Spliced Transcripts Alignment to a Reference&quot;)

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://github.com/alexdobin/STAR, https://github.com/alexdobin/STAR/blob/master/CHANGES.md (changelog)&quot;)
whatis([[
Description: STAR (Spliced Transcripts Alignment to a Reference) is a fast NGS read aligner for RNA-seq data.
Examples: `STAR --help` and `STAR --version`.
]])

local name = &quot;STAR&quot;
local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_tmux" class="module-name">tmux</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">tmux: A Terminal Multiplexer</strong><br>
<span class="module-description">tmux is a terminal multiplexer. It lets you switch easily between several programs in one terminal, detach them (they keep running in the background) and reattach them to a different terminal. And do a lot more.</span><br>
Example: <span class="module-example"><code>tmux</code> and <code>man tmux</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/tmux/tmux/wiki">https://github.com/tmux/tmux/wiki</a>, <a href="https://github.com/tmux/tmux/blob/master/CHANGES">https://github.com/tmux/tmux/blob/master/CHANGES</a> (changelog), <a href="https://github.com/tmux/tmux">https://github.com/tmux/tmux</a> (source code)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>2.8</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
tmux: A Terminal Multiplexer
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: screen, tmux&quot;)
whatis(&quot;URL: https://github.com/tmux/tmux/wiki, https://github.com/tmux/tmux/blob/master/CHANGES (changelog), https://github.com/tmux/tmux (source code)&quot;)
whatis([[
Description: tmux is a terminal multiplexer. It lets you switch easily between several programs in one terminal, detach them (they keep running in the background) and reattach them to a different terminal. And do a lot more.
Examples: `tmux` and `man tmux`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_tophat" class="module-name">tophat</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">TopHat: A Spliced Read Mapper for RNA-Seq</strong><br>
<span class="module-description">TopHat is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput short read aligner Bowtie, and then analyzes the mapping results to identify splice junctions between exons.</span><br>
Example: <span class="module-example"><code>tophat --version</code>.</span><br>
URL: <span class="module-url"><a href="https://ccb.jhu.edu/software/tophat/index.shtml">https://ccb.jhu.edu/software/tophat/index.shtml</a>, <a href="https://ccb.jhu.edu/software/tophat/index.shtml">https://ccb.jhu.edu/software/tophat/index.shtml</a> (changelog), <a href="https://github.com/infphilo/tophat">https://github.com/infphilo/tophat</a> (source code)</span><br>
Versions: <span class="module-version"><em>2.1.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
TopHat: A Spliced Read Mapper for RNA-Seq
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: Programming, Statistics&quot;)
whatis(&quot;URL: https://ccb.jhu.edu/software/tophat/index.shtml, https://ccb.jhu.edu/software/tophat/index.shtml (changelog), https://github.com/infphilo/tophat (source code)&quot;)
whatis([[
Description: TopHat is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput short read aligner Bowtie, and then analyzes the mapping results to identify splice junctions between exons.
Examples: `tophat --version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, home)

</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_tree" class="module-name">tree</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">tree: List Content of Directories in a Tree-like Format</strong><br>
<span class="module-description">Tree is a recursive directory listing command that produces a depth indented listing of files, which is colorized ala dircolors if the <code>LS_COLORS</code> environment variable is set and output is to tty.</span><br>
Example: <span class="module-example"><code>tree --help</code>.</span><br>
URL: <span class="module-url"><a href="https://mama.indstate.edu/users/ice/tree/">https://mama.indstate.edu/users/ice/tree/</a>, <a href="https://mama.indstate.edu/users/ice/tree/changes.html">https://mama.indstate.edu/users/ice/tree/changes.html</a> (changelog)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>2.1.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
tree: List Content of Directories in a Tree-like Format
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: files, utility, cli&quot;)
whatis(&quot;URL: https://mama.indstate.edu/users/ice/tree/, https://mama.indstate.edu/users/ice/tree/changes.html (changelog)&quot;)
whatis([[
Description: Tree is a recursive directory listing command that produces a depth indented listing of files, which is colorized ala dircolors if the `LS_COLORS` environment variable is set and output is to tty.
Examples: `tree --help`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;man&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_trimgalore" class="module-name">trimgalore</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">TrimGalore: Taking Appropriate QC Measures for RRBS-Type or Other -Seq Applications with Trim Galore!</strong><br>
<span class="module-description">A wrapper around Cutadapt and FastQC to consistently apply adapter and quality trimming to FastQ files, with extra functionality for RRBS data.</span><br>
Example: <span class="module-example"><code>trim_galore --version</code>, <code>trim_galore --help</code>, and <code>more &quot;$TRIMGALORE_HOME/Docs/Trim_Galore_User_Guide.md&quot;</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/FelixKrueger/TrimGalore">https://github.com/FelixKrueger/TrimGalore</a>, <a href="https://github.com/FelixKrueger/TrimGalore/blob/master/CHANGELOG.md">https://github.com/FelixKrueger/TrimGalore/blob/master/CHANGELOG.md</a> (changelog)</span><br>
Versions: <span class="module-version">0.6.7, <em>0.6.10</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
TrimGalore: Taking Appropriate QC Measures for RRBS-Type or Other -Seq Applications with Trim Galore!
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing, genome&quot;)
whatis(&quot;URL: https://github.com/FelixKrueger/TrimGalore, https://github.com/FelixKrueger/TrimGalore/blob/master/CHANGELOG.md (changelog)&quot;)
whatis([[
Description: A wrapper around Cutadapt and FastQC to consistently apply adapter and quality trimming to FastQ files, with extra functionality for RRBS data.
Examples: `trim_galore --version`, `trim_galore --help`, and `more &quot;$TRIMGALORE_HOME/Docs/Trim_Galore_User_Guide.md&quot;`.
]])

depends_on(&quot;cutadapt&quot;)
depends_on(&quot;fastqc&quot;)

name = &quot;TrimGalore&quot;

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)
prepend_path(&quot;PATH&quot;, home)
pushenv(&quot;TRIMGALORE_HOME&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_varscan" class="module-name">varscan</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">VarScan: Variant Detection in Massively Parallel Sequencing Data</strong><br>
<span class="module-description">VarScan is a platform-independent mutation caller for targeted, exome, and whole-genome resequencing data generated on Illumina, SOLiD, Life/PGM, Roche/454, and similar instruments.</span><br>
Example: <span class="module-example"><code>varscan</code>, which is short for <code>java -jar $VARSCAN_HOME/VarScan.jar</code>.</span><br>
URL: <span class="module-url"><a href="https://dkoboldt.github.io/varscan/">https://dkoboldt.github.io/varscan/</a>, <a href="https://github.com/dkoboldt/varscan/releases">https://github.com/dkoboldt/varscan/releases</a> (changelog), <a href="https://github.com/dkoboldt/varscan">https://github.com/dkoboldt/varscan</a> (source code)</span><br>
Versions: <span class="module-version">2.4.2, <em>2.4.6</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
VarScan: Variant Detection in Massively Parallel Sequencing Data
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: high-throughput sequencing&quot;)
whatis(&quot;URL: https://dkoboldt.github.io/varscan/, https://github.com/dkoboldt/varscan/releases (changelog), https://github.com/dkoboldt/varscan (source code)&quot;)
whatis([[
Description: VarScan is a platform-independent mutation caller for targeted, exome, and whole-genome resequencing data generated on Illumina, SOLiD, Life/PGM, Roche/454, and similar instruments.
Examples: `varscan`, which is short for `java -jar $VARSCAN_HOME/VarScan.jar`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
name = &quot;VarScan&quot;
local home = pathJoin(root, name .. &quot;-&quot; .. version)
pushenv(&quot;VARSCAN_HOME&quot;, home)

local bash = 'java -jar &quot;$VARSCAN_HOME/VarScan.jar&quot; &quot;$@&quot;'
local csh  = 'java -jar &quot;$VARSCAN_HOME/VarScan.jar&quot; $*'
set_shell_function(&quot;varscan&quot;, bash, csh)

-- Tweak Java for the current environment
depends_on(&quot;java-tweaks&quot;)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_vcf-validator" class="module-name">vcf-validator</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">vcf-validator: Validation Suite for Variant Call Format (VCF) Files</strong><br>
<span class="module-description">Validator for the Variant Call Format (VCF) implemented using C++11. It includes all the checks from the vcftools suite, and some more that involve lexical, syntactic and semantic analysis of the VCF input.</span><br>
Example: <span class="module-example"><code>vcf_validator --help</code>, <code>vcf-debugulator --help</code>, and <code>vcf-assembly-checker --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/EBIvariation/vcf-validator">https://github.com/EBIvariation/vcf-validator</a>, <a href="https://github.com/EBIvariation/vcf-validator/releases">https://github.com/EBIvariation/vcf-validator/releases</a> (changelog)</span><br>
Versions: <span class="module-version">0.9.2, 0.9.3, 0.9.4, 0.9.5, 0.9.6, <em>0.9.7</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
vcf-validator: Validation Suite for Variant Call Format (VCF) Files
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://github.com/EBIvariation/vcf-validator, https://github.com/EBIvariation/vcf-validator/releases (changelog)&quot;)
whatis([[
Description: Validator for the Variant Call Format (VCF) implemented using C++11. It includes all the checks from the vcftools suite, and some more that involve lexical, syntactic and semantic analysis of the VCF input.
Examples: `vcf_validator --help`, `vcf-debugulator --help`, and `vcf-assembly-checker --help`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)
prepend_path(&quot;PATH&quot;, home)
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_vcftools" class="module-name">vcftools</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">VCFtools: Tools Written in Perl and C++ for Working with VCF Files</strong><br>
<span class="module-description">VCFtools is a program package designed for working with VCF files, such as those generated by the 1000 Genomes Project. The aim of VCFtools is to provide easily accessible methods for working with complex genetic variation data in the form of VCF files.</span><br>
Example: <span class="module-example"><code>vcftools --version</code>.</span><br>
URL: <span class="module-url"><a href="https://vcftools.github.io/">https://vcftools.github.io/</a>, <a href="https://github.com/vcftools/vcftools/releases">https://github.com/vcftools/vcftools/releases</a> (changelog), <a href="https://github.com/vcftools/vcftools">https://github.com/vcftools/vcftools</a> (source code)</span><br>
Versions: <span class="module-version"><em>0.1.16</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
VCFtools: Tools Written in Perl and C++ for Working with VCF Files
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: sequencing&quot;)
whatis(&quot;URL: https://vcftools.github.io/, https://github.com/vcftools/vcftools/releases (changelog), https://github.com/vcftools/vcftools (source code)&quot;)
whatis([[
Description: VCFtools is a program package designed for working with VCF files, such as those generated by the 1000 Genomes Project. The aim of VCFtools is to provide easily accessible methods for working with complex genetic variation data in the form of VCF files.
Examples: `vcftools --version`.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))
pushenv(&quot;PERL5LIB&quot;, pathJoin(home, &quot;share&quot;, &quot;perl5&quot;))


</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_wynton-tools" class="module-name">wynton-tools</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">wynton-tools: UCSF Wynton HPC Tools</strong><br>
<span class="module-description">The UCSF Wynton HPC Tools is a set of command-line tools that queries different aspects of the UCSF Wynton HPC environment.  These tools may be useful for systems administrators as well as end-users.</span><br>
Example: <span class="module-example"><code>wynton --help</code>, <code>trash --help</code>, and <code>x86-64-level --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/ucsf-wynton/wynton-tools">https://github.com/ucsf-wynton/wynton-tools</a>, <a href="https://github.com/ucsf-wynton/wynton-tools/blob/master/NEWS.md">https://github.com/ucsf-wynton/wynton-tools/blob/master/NEWS.md</a> (changelog)</span><br>
Warning: <span class="module-warning">This is work in development, which means that these tools may change, or even be removed, at anytime without notice.</span><br>
Versions: <span class="module-version"><em>0.2.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
wynton-tools: UCSF Wynton HPC Tools
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: utilities&quot;)
whatis(&quot;URL: https://github.com/ucsf-wynton/wynton-tools, https://github.com/ucsf-wynton/wynton-tools/blob/master/NEWS.md (changelog)&quot;)
whatis([[
Description: The UCSF Wynton HPC Tools is a set of command-line tools that queries different aspects of the UCSF Wynton HPC environment.  These tools may be useful for systems administrators as well as end-users.
Warning: This is work in development, which means that these tools may change, or even be removed, at anytime without notice.
Examples: `wynton --help`, `trash --help`, and `x86-64-level --help`.
]])

if not isDir(&quot;/wynton&quot;) then
  LmodMessage(&quot;NOTE: The '&quot; .. name .. &quot;' module is designed for the UCSF Wynton HPC environment; not all tools may work on your system&quot;)
end

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_x86-64-level" class="module-name">x86-64-level</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">x86-64-level: Get the x86-64 Microarchitecture Level on the Current Machine</strong><br>
<span class="module-description">x86-64 is a 64-bit version of the x86 CPU instruction set supported by AMD and Intel CPUs among others. Since the first generations of CPUs, more low-level CPU features have been added over the years. The x86-64 CPU features can be grouped into four CPU microarchitecture levels: x86-64 v1, x86-64 v2, x86-64 v3, and x86-64 v4. This tool checks which CPU level the current machine supports.</span><br>
Example: <span class="module-example"><code>x86-64-level</code> and <code>x86-64-level --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/HenrikBengtsson/x86-64-level/">https://github.com/HenrikBengtsson/x86-64-level/</a>, <a href="https://github.com/HenrikBengtsson/x86-64-level/blob/develop/NEWS.md">https://github.com/HenrikBengtsson/x86-64-level/blob/develop/NEWS.md</a> (changelog)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>0.2.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
x86-64-level: Get the x86-64 Microarchitecture Level on the Current Machine
]])

local name = myModuleName()
local version = myModuleVersion()
version = string.gsub(version, &quot;^[.]&quot;, &quot;&quot;)

whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: tools, shell, bash&quot;)
whatis(&quot;URL: https://github.com/HenrikBengtsson/x86-64-level/, https://github.com/HenrikBengtsson/x86-64-level/blob/develop/NEWS.md (changelog)&quot;)
whatis([[
Description: x86-64 is a 64-bit version of the x86 CPU instruction set supported by AMD and Intel CPUs among others. Since the first generations of CPUs, more low-level CPU features have been added over the years. The x86-64 CPU features can be grouped into four CPU microarchitecture levels: x86-64 v1, x86-64 v2, x86-64 v3, and x86-64 v4. This tool checks which CPU level the current machine supports.
Examples: `x86-64-level` and `x86-64-level --help`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)
prepend_path(&quot;PATH&quot;, home)

-- Assert x86-64-level on load?
if (mode() == &quot;load&quot;) then
  local level = os.getenv(&quot;X86_64_LEVEL_ASSERT&quot;)
  if level ~= nul and level ~= &quot;&quot; then
    local error = capture(&quot;x86-64-level --assert=&quot; .. level .. &quot; 2&gt;&amp;1&quot;)
    if error ~= &quot;&quot; then
      LmodError(error)
    end
  end
end
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_cbi_yq" class="module-name">yq</h3>
<dl>
  <dd class="module-details">
<strong class="module-help">yq: Lightweight and Portable Command-Line YAML, JSON and XML Processor.</strong><br>
<span class="module-description"><code>yq</code> is a lightweight and portable command-line YAML, JSON and XML processor. <code>yq</code> uses <code>jq</code> like syntax, but works with YAML files as well as JSON, XML, properties, CSV, and TSV.</span><br>
Example: <span class="module-example"><code>yq --version</code>, <code>yq --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/mikefarah/yq">https://github.com/mikefarah/yq</a>, <a href="https://github.com/mikefarah/yq/releases">https://github.com/mikefarah/yq/releases</a> (changelog), <a href="https://github.com/mikefarah/yq">https://github.com/mikefarah/yq</a> (source code)</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">4.43.1, <em>4.44.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">help([[
yq: Lightweight and Portable Command-Line YAML, JSON and XML Processor.
]])

local name = myModuleName()
local version = myModuleVersion()
whatis(&quot;Version: &quot; .. version)
whatis(&quot;Keywords: terminal, cli, utility&quot;)
whatis(&quot;URL: https://github.com/mikefarah/yq, https://github.com/mikefarah/yq/releases (changelog), https://github.com/mikefarah/yq (source code)&quot;)
whatis([[
Description: `yq` is a lightweight and portable command-line YAML, JSON and XML processor. `yq` uses `jq` like syntax, but works with YAML files as well as JSON, XML, properties, CSV, and TSV.
Examples: `yq --version`, `yq --help`.
Warning: Only the most recent version of this software will be kept.
]])

local root = os.getenv(&quot;SOFTWARE_ROOT_CBI&quot;)
local home = pathJoin(root, name .. &quot;-&quot; .. version)

prepend_path(&quot;PATH&quot;, pathJoin(home, &quot;bin&quot;))
prepend_path(&quot;MANPATH&quot;, pathJoin(home, &quot;share&quot;, &quot;man&quot;))

</code></pre>

</details>
  </dd>
</dl>
</div> 

<div id="button_repository_sali" class="tab-pane fade">

<h2 id="repository_sali">Module Software Repository: Sali (95)</h2>

Maintained by: Ben Webb, <a href="https://salilab.org/">Sali Lab Software Repository</a><br>
Enable repository: <code>module load Sali</code><br>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Please note that this software stack is maintained and contributed by a research group on a voluntary basis. It is <em>not</em> maintained by the {{ site.cluster.name }} admins. Please reach out to the corresponding maintainer for bug reports, feedback, or questions.
</div>

<h3 id="module_sali_allosmod" class="module-name">allosmod</h3>
<dl>
  <dd class="module-details">
<span class="module-description">AllosMod utility library</span><br>
URL: <span class="module-url"><a href="https://github.com/salilab/allosmod-lib/">https://github.com/salilab/allosmod-lib/</a></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: AllosMod utility library&quot;
module-whatis &quot;URL: https://github.com/salilab/allosmod-lib/&quot;
module load modeller
module load dssp
module load profit
set topdir /salilab/diva1/programs/x86_64linux/allosmod
prepend-path  PATH            ${topdir}/bin
prepend-path  PYTHONPATH      ${topdir}/python
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_amber" class="module-name">amber</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Amber11, for 64-bit</span><br>
URL: <span class="module-url"><a href="http://ambermd.org/">http://ambermd.org/</a></span><br>
Versions: <span class="module-version"><em>11</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Amber11, for 64-bit&quot;
module-whatis &quot;URL: http://ambermd.org/&quot;

if [ module-info mode load ] {
  if { ! [file exists /wynton/group ] } {
    puts stderr &quot;Sorry, this module only works on the Wynton cluster (or other machine that has /wynton/group mounted)&quot;
    break
  }

  if { ! [file exists /wynton/group/sali/AMBER ] } {
    puts stderr &quot;Sorry, this module is only available to members of the Sali lab.&quot;
    break
  }
}
setenv        AMBERHOME       /wynton/group/sali/AMBER/amber11/
prepend-path  PATH            /wynton/group/sali/AMBER/amber11/bin
prepend-path  LD_LIBRARY_PATH /wynton/group/sali/AMBER/amber11/deplib
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_anaconda" class="module-name">anaconda</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Anaconda Python distribution</span><br>
URL: <span class="module-url"><a href="https://www.anaconda.com/">https://www.anaconda.com/</a></span><br>
Versions: <span class="module-version">py39-2022.05, py310-2023.03, py311-2023.09, <em>py311-2024.02</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Anaconda Python distribution&quot;
module-whatis &quot;URL: https://www.anaconda.com/&quot;
conflict conda-forge
prepend-path  PATH       /salilab/diva1/home/anaconda/py311-2024.02/bin/
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_blast" class="module-name">blast</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Basic Local Alignment Search Tool</span><br>
URL: <span class="module-url"><a href="https://blast.ncbi.nlm.nih.gov">https://blast.ncbi.nlm.nih.gov</a></span><br>
Versions: <span class="module-version"><em>2.2.26</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Basic Local Alignment Search Tool&quot;
module-whatis &quot;URL: https://blast.ncbi.nlm.nih.gov&quot;
prepend-path  PATH            /salilab/diva1/programs/x86_64linux/blast-2.2.26/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_blast-" class="module-name">blast+</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Basic Local Alignment Search Tool</span><br>
URL: <span class="module-url"><a href="https://blast.ncbi.nlm.nih.gov/">https://blast.ncbi.nlm.nih.gov/</a></span><br>
Versions: <span class="module-version">2.2.25, 2.2.28, <em>2.12.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Basic Local Alignment Search Tool&quot;
module-whatis &quot;URL: https://blast.ncbi.nlm.nih.gov/&quot;
prepend-path  PATH   /salilab/diva1/programs/x86_64linux/ncbi-blast-2.12.0+/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_boost" class="module-name">boost</h3>
<dl>
  <dd class="module-details">
<span class="module-description">The free peer-reviewed portable C++ source libraries</span><br>
URL: <span class="module-url"><a href="https://www.boost.org/">https://www.boost.org/</a></span><br>
Versions: <span class="module-version"><em>1.73.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: The free peer-reviewed portable C++ source libraries&quot;
module-whatis &quot;URL: https://www.boost.org/&quot;
prepend-path LD_LIBRARY_PATH    /salilab/diva1/programs/x86_64linux/boost-1.73.0/lib64
prepend-path CMAKE_INCLUDE_PATH /salilab/diva1/programs/x86_64linux/boost-1.73.0/include
prepend-path CMAKE_LIBRARY_PATH /salilab/diva1/programs/x86_64linux/boost-1.73.0/lib64
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_cereal" class="module-name">cereal</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A header-only C++11 serialization library</span><br>
URL: <span class="module-url"><a href="http://uscilab.github.io/cereal/">http://uscilab.github.io/cereal/</a></span><br>
Versions: <span class="module-version"><em>1.3.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A header-only C++11 serialization library&quot;
module-whatis &quot;URL: http://uscilab.github.io/cereal/&quot;
prepend-path CMAKE_INCLUDE_PATH /salilab/diva1/programs/x86_64linux/cereal-1.3.2/include
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_cgal" class="module-name">cgal</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Computational Geometry Algorithms Library</span><br>
URL: <span class="module-url"><a href="https://www.cgal.org/">https://www.cgal.org/</a></span><br>
Versions: <span class="module-version">4.12.1, <em>5.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Computational Geometry Algorithms Library&quot;
module-whatis &quot;URL: https://www.cgal.org/&quot;
if { [file exists /etc/centos-release] || [file exists /etc/rocky-release] || [file exists /etc/almalinux-release] } {
  module load boost/1.73.0
  setenv CGAL_DIR /salilab/diva1/programs/x86_64linux/cgal-5.1/share/cmake/CGAL
} else {
  set curMod [module-info name]
  puts stderr &quot;'$curMod' does not work on Fedora - ask a sysadmin to install the RPM package instead&quot;
  break
}
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_colabfold" class="module-name">colabfold</h3>
<dl>
  <dd class="module-details">
<span class="module-description">AlphaFold2 using MMseqs2</span><br>
URL: <span class="module-url"><a href="https://github.com/sokrypton/ColabFold">https://github.com/sokrypton/ColabFold</a></span><br>
Versions: <span class="module-version"><em>20230808.git79d8c6e</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: AlphaFold2 using MMseqs2&quot;
module-whatis &quot;URL: https://github.com/sokrypton/ColabFold&quot;
module-whatis &quot;Examples: for example usage on Wynton, see https://www.rbvi.ucsf.edu/chimerax/data/wynton-colabfold-feb2024/colabfold_wynton.html&quot;
prepend-path  PATH            /salilab/diva1/programs/x86_64linux/colabfold-20230808.git79d8c6e/localcolabfold/colabfold-conda/bin/
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_concavity" class="module-name">concavity</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Ligand binding site prediction from protein sequence and structure</span><br>
URL: <span class="module-url"><a href="https://compbio.cs.princeton.edu/concavity/">https://compbio.cs.princeton.edu/concavity/</a></span><br>
Versions: <span class="module-version"><em>0.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Ligand binding site prediction from protein sequence and structure&quot;
module-whatis &quot;URL: https://compbio.cs.princeton.edu/concavity/&quot;
module load sali-libraries
prepend-path PATH            /salilab/diva1/programs/x86_64linux/concavity-0.1/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_conda-forge" class="module-name">conda-forge</h3>
<dl>
  <dd class="module-details">
<span class="module-description">conda-forge Python distribution</span><br>
URL: <span class="module-url"><a href="https://conda-forge.org/">https://conda-forge.org/</a></span><br>
Versions: <span class="module-version">py310-23.1.0, py310-23.11.0, <em>py310-24.3.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: conda-forge Python distribution&quot;
module-whatis &quot;URL: https://conda-forge.org/&quot;
conflict anaconda
prepend-path  PATH       /salilab/diva1/home/anaconda/mambaforge/py310-24.3.0/bin/
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_cryptosite" class="module-name">cryptosite</h3>
<dl>
  <dd class="module-details">
<span class="module-description">CryptoSite utility library</span><br>
URL: <span class="module-url"><a href="https://github.com/salilab/cryptosite/">https://github.com/salilab/cryptosite/</a></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: CryptoSite utility library&quot;
module-whatis &quot;URL: https://github.com/salilab/cryptosite/&quot;
module load modeller
module load muscle
module load dssp
module load fpocket
module load concavity
module load patch_dock
module load imp
module load blast+
module load usearch
module load python3/scikit/0.21.3
module load python3/biopython
set topdir /salilab/diva1/programs/linux/cryptosite
prepend-path  PATH            ${topdir}/bin
prepend-path  PYTHONPATH      ${topdir}/python
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_cuda" class="module-name">cuda</h3>
<dl>
  <dd class="module-details">
Versions: <span class="module-version">6.0.37, 7.5.18, 8.0.61, 9.0.176, 10.0.130, 11.5.0, <em>12.4.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;NVIDIA CUDA Toolkit libraries, plus cuDNN (v9)&quot;
if ![file exists /usr/bin/g++] {
  module load gcc
}
prepend-path  PATH               /salilab/diva1/programs/x86_64linux/cuda-12.4.0/lib64/cuda/bin
prepend-path  LD_LIBRARY_PATH    /salilab/diva1/programs/x86_64linux/cuda-12.4.0/lib64/cuda/lib64
prepend-path  PKG_CONFIG_PATH    /salilab/diva1/programs/x86_64linux/cuda-12.4.0/lib64/cuda/pkgconfig
setenv        CUDA_LIB_PATH      /salilab/diva1/programs/x86_64linux/cuda-12.4.0/lib64/cuda/lib64
setenv        CUDA_BIN_PATH      /salilab/diva1/programs/x86_64linux/cuda-12.4.0/lib64/cuda/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_cython" class="module-name">Cython</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A language for writing Python extension modules</span><br>
URL: <span class="module-url"><a href="https://cython.org/">https://cython.org/</a></span><br>
Versions: <span class="module-version">0.29.36, <em>3.0.5</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A language for writing Python extension modules&quot;
module-whatis &quot;URL: https://cython.org/&quot;
prepend-path PATH            /salilab/diva1/programs/x86_64linux/Cython-py27-3.0.5/bin
prepend-path PYTHONPATH      /salilab/diva1/programs/x86_64linux/Cython-py27-3.0.5/lib64/python2.7/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_doxygen" class="module-name">doxygen</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A documentation system for C/C++</span><br>
URL: <span class="module-url"><a href="http://www.doxygen.org/index.html">http://www.doxygen.org/index.html</a></span><br>
Versions: <span class="module-version">1.8.6, <em>1.8.15</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A documentation system for C/C++&quot;
module-whatis &quot;URL: http://www.doxygen.org/index.html&quot;
prepend-path  PATH            /salilab/diva1/programs/x86_64linux/doxygen-1.8.15/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_dssp" class="module-name">dssp</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Secondary structure assignment</span><br>
URL: <span class="module-url"><a href="https://swift.cmbi.umcn.nl/gv/dssp/">https://swift.cmbi.umcn.nl/gv/dssp/</a></span><br>
Versions: <span class="module-version">2.0.4, <em>2.2.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Secondary structure assignment&quot;
module-whatis &quot;URL: https://swift.cmbi.umcn.nl/gv/dssp/&quot;
module load sali-libraries
prepend-path  PATH            /salilab/diva1/programs/x86_64linux/dssp-2.2.1/bin
prepend-path  MANPATH         /salilab/diva1/programs/x86_64linux/dssp-2.2.1/man
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_eigen" class="module-name">eigen</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A lightweight C++ template library for vector and matrix math</span><br>
URL: <span class="module-url"><a href="http://eigen.tuxfamily.org">http://eigen.tuxfamily.org</a></span><br>
Versions: <span class="module-version"><em>3.3.5</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A lightweight C++ template library for vector and matrix math&quot;
module-whatis &quot;URL: http://eigen.tuxfamily.org&quot;
prepend-path CMAKE_INCLUDE_PATH /salilab/diva1/programs/x86_64linux/eigen-3.3.5/include
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_featuresketch" class="module-name">featuresketch</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Ursula's featuresketch script; run feature_sketch.sh then feature_sketch.py</span><br>
Versions: <span class="module-version"><em>3.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Ursula's featuresketch script; run feature_sketch.sh then feature_sketch.py&quot;
prepend-path  PATH  /salilab/diva1/programs/x86_64linux/featuresketch-3.0/programs/feature_sketch
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_fpocket" class="module-name">fpocket</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Protein pocket (cavity) detection algorithm</span><br>
URL: <span class="module-url"><a href="https://github.com/Discngine/fpocket">https://github.com/Discngine/fpocket</a></span><br>
Versions: <span class="module-version"><em>2.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Protein pocket (cavity) detection algorithm&quot;
module-whatis &quot;URL: https://github.com/Discngine/fpocket&quot;
prepend-path PATH            /salilab/diva1/programs/x86_64linux/fpocket-2.0/bin
prepend-path MANPATH         /salilab/diva1/programs/x86_64linux/fpocket-2.0/man
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_gcc" class="module-name">gcc</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Various compilers (C, C++, Objective-C, Java, ...)</span><br>
URL: <span class="module-url"><a href="https://gcc.gnu.org/">https://gcc.gnu.org/</a></span><br>
Versions: <span class="module-version">5.1.1, 6.4.1, 7.3.1, <em>10.2.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Various compilers (C, C++, Objective-C, Java, ...)&quot;
module-whatis &quot;URL: https://gcc.gnu.org/&quot;
prepend-path  PATH            /salilab/diva1/programs/x86_64linux/gcc-10.2.1/bin
prepend-path  LD_LIBRARY_PATH /salilab/diva1/programs/x86_64linux/gcc-10.2.1/lib64
if { [file exists /etc/centos-release] || [file exists /etc/rocky-release] || [file exists /etc/almalinux-release] } {
  prepend-path  LD_LIBRARY_PATH /salilab/diva1/programs/x86_64linux/gcc-10.2.1/lib64/centos
}

if [ module-info mode load ] {
  if { [file exists /etc/centos-release] || [file exists /etc/rocky-release] || [file exists /etc/almalinux-release] } {
    puts stderr &quot;!! On Wynton, it is recommended to use Software Collections instead to &quot;
    puts stderr &quot;   get new versions of the C++ compiler; see &quot;
    puts stderr &quot;   https://wynton.ucsf.edu/hpc/software/scl.html&quot;
  }
}
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_ghostscript" class="module-name">ghostscript</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A PostScript interpreter and renderer</span><br>
URL: <span class="module-url"><a href="https://www.ghostscript.com/">https://www.ghostscript.com/</a></span><br>
Versions: <span class="module-version"><em>8.70</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A PostScript interpreter and renderer&quot;
module-whatis &quot;URL: https://www.ghostscript.com/&quot;
module load sali-libraries
prepend-path  PATH            /salilab/diva1/programs/x86_64linux/ghostscript-8.70/bin
prepend-path  LD_LIBRARY_PATH /salilab/diva1/programs/x86_64linux/ghostscript-8.70/lib64
prepend-path  GS_FONTPATH     /salilab/diva1/programs/x86_64linux/ghostscript-8.70/share/fonts/default/Type1
prepend-path  GS_FONTPATH     /salilab/diva1/programs/x86_64linux/ghostscript-8.70/share/fonts/default/ghostscript
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_gnuplot" class="module-name">gnuplot</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A program for plotting mathematical expressions and data</span><br>
URL: <span class="module-url"><a href="http://www.gnuplot.info/">http://www.gnuplot.info/</a></span><br>
Versions: <span class="module-version">5.0.5, <em>5.4.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A program for plotting mathematical expressions and data&quot;
module-whatis &quot;URL: http://www.gnuplot.info/&quot;
prepend-path  GNUPLOT_FONTPATH /salilab/diva1/programs/linux/fonts
prepend-path  PATH            /salilab/diva1/programs/x86_64linux/gnuplot-5.4.2/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_hdf5" class="module-name">hdf5</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A general purpose library and file format for storing scientific data</span><br>
URL: <span class="module-url"><a href="https://support.hdfgroup.org/HDF5/">https://support.hdfgroup.org/HDF5/</a></span><br>
Versions: <span class="module-version">1.8.14, 1.8.17, 1.10.1, 1.10.5, 1.10.6, <em>1.10.7</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A general purpose library and file format for storing scientific data&quot;
module-whatis &quot;URL: https://support.hdfgroup.org/HDF5/&quot;
prepend-path PATH               /salilab/diva1/programs/x86_64linux/hdf5-1.10.7/bin
prepend-path LD_LIBRARY_PATH    /salilab/diva1/programs/x86_64linux/hdf5-1.10.7/lib
prepend-path CMAKE_INCLUDE_PATH /salilab/diva1/programs/x86_64linux/hdf5-1.10.7/include
prepend-path CMAKE_LIBRARY_PATH /salilab/diva1/programs/x86_64linux/hdf5-1.10.7/lib
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_ifort" class="module-name">ifort</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Intel Fortran compiler</span><br>
URL: <span class="module-url"><a href="http://software.intel.com/content/www/us/en/develop/tools/oneapi/components/fortran-compiler.html">http://software.intel.com/content/www/us/en/develop/tools/oneapi/components/fortran-compiler.html</a></span><br>
Versions: <span class="module-version"><em>10.1.022</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Intel Fortran compiler&quot;
module-whatis &quot;URL: http://software.intel.com/content/www/us/en/develop/tools/oneapi/components/fortran-compiler.html&quot;
prepend-path  PATH            /salilab/diva1/programs/x86_64linux/ifort-10.1.022/opt/intel/fce/10.1.022/bin
prepend-path  LD_LIBRARY_PATH /salilab/diva1/programs/x86_64linux/ifort-10.1.022/opt/intel/fce/10.1.022/lib
prepend-path  MANPATH         /salilab/diva1/programs/x86_64linux/ifort-10.1.022/usr/share/man
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_imagemagick" class="module-name">ImageMagick</h3>
<dl>
  <dd class="module-details">
<span class="module-description">An X application for displaying and manipulating images</span><br>
URL: <span class="module-url"><a href="https://imagemagick.org/">https://imagemagick.org/</a></span><br>
Versions: <span class="module-version"><em>6.8.8.10</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: An X application for displaying and manipulating images&quot;
module-whatis &quot;URL: https://imagemagick.org/&quot;
module load sali-libraries
module load ghostscript
prepend-path  PATH            /salilab/diva1/programs/x86_64linux/ImageMagick-6.8.8.10/bin
prepend-path  LD_LIBRARY_PATH /salilab/diva1/programs/x86_64linux/ImageMagick-6.8.8.10/lib64
prepend-path  PERL5LIB        /salilab/diva1/programs/x86_64linux/ImageMagick-6.8.8.10/lib64/perl5
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_imp" class="module-name">imp</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Integrative Modeling Platform (version 2.21.0, with only usage checks turned on)</span><br>
URL: <span class="module-url"><a href="https://integrativemodeling.org/">https://integrativemodeling.org/</a></span><br>
Versions: <span class="module-version">last_ok_build, nightly, 2.7.0, 2.8.0, 2.9.0, 2.10.0, 2.10.1, 2.11.0, 2.11.1, 2.12.0, 2.13.0, 2.14.0, 2.15.0, 2.16.0, 2.17.0, 2.18.0, 2.19.0, 2.20.0, 2.20.1, 2.20.2, <em>2.21.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Integrative Modeling Platform (version 2.21.0, with only usage checks turned on)&quot;
module-whatis &quot;URL: https://integrativemodeling.org/&quot;
module load boost/1.73.0 libtau/1.0.1 opencv/4.3.0 sali-libraries
set topdir &quot;/salilab/diva1/home/imp/main&quot;
set subdir [file readlink &quot;${topdir}/2.21.0&quot;]
if {[file pathtype ${subdir}] == &quot;relative&quot;} {
  set subdir &quot;${topdir}/${subdir}&quot;
} 
prepend-path  PATH            ${subdir}/bin/release8
prepend-path  LD_LIBRARY_PATH ${subdir}/lib/release8
prepend-path  PYTHONPATH      ${subdir}/lib/release8
setenv        IMP_DIR         ${subdir}/lib/release8/cmake/IMP
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_imp-fast" class="module-name">imp-fast</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Integrative Modeling Platform (version 2.21.0, fast build)</span><br>
URL: <span class="module-url"><a href="https://integrativemodeling.org/">https://integrativemodeling.org/</a></span><br>
Versions: <span class="module-version">last_ok_build, nightly, 2.7.0, 2.8.0, 2.9.0, 2.10.0, 2.10.1, 2.11.0, 2.11.1, 2.12.0, 2.13.0, 2.14.0, 2.15.0, 2.16.0, 2.17.0, 2.18.0, 2.19.0, 2.20.0, 2.20.1, 2.20.2, <em>2.21.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Integrative Modeling Platform (version 2.21.0, fast build)&quot;
module-whatis &quot;URL: https://integrativemodeling.org/&quot;
module load boost/1.73.0 libtau/1.0.1 opencv/4.3.0 sali-libraries
set topdir &quot;/salilab/diva1/home/imp/main&quot;
set subdir [file readlink &quot;${topdir}/2.21.0&quot;]
if {[file pathtype ${subdir}] == &quot;relative&quot;} {
  set subdir &quot;${topdir}/${subdir}&quot;
} 
prepend-path  PATH            ${subdir}/bin/fast8
prepend-path  LD_LIBRARY_PATH ${subdir}/lib/fast8
prepend-path  PYTHONPATH      ${subdir}/lib/fast8
setenv        IMP_DIR         ${subdir}/lib/fast8/cmake/IMP
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_itcell" class="module-name">itcell</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Integrative T-cell epitope prediction</span><br>
URL: <span class="module-url"><a href="https://github.com/salilab/itcell-lib">https://github.com/salilab/itcell-lib</a></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Integrative T-cell epitope prediction&quot;
module-whatis &quot;URL: https://github.com/salilab/itcell-lib&quot;
module load imp scwrl
set topdir /salilab/diva1/programs/x86_64linux/itcell-lib
prepend-path  PATH            ${topdir}/scripts
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_libtau" class="module-name">libtau</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Code from the SAMBA group at TAU</span><br>
URL: <span class="module-url"><a href="https://integrativemodeling.org/libTAU.html">https://integrativemodeling.org/libTAU.html</a></span><br>
Versions: <span class="module-version"><em>1.0.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Code from the SAMBA group at TAU&quot;
module-whatis &quot;URL: https://integrativemodeling.org/libTAU.html&quot;
prepend-path LD_LIBRARY_PATH    /salilab/diva1/programs/x86_64linux/libtau-py27-1.0.1/lib64
prepend-path CMAKE_INCLUDE_PATH /salilab/diva1/programs/x86_64linux/libtau-py27-1.0.1/include
prepend-path CMAKE_LIBRARY_PATH /salilab/diva1/programs/x86_64linux/libtau-py27-1.0.1/lib64
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_main" class="module-name">main</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Dusan Turk's MAIN program</span><br>
URL: <span class="module-url"><a href="https://stef.ijs.si/">https://stef.ijs.si/</a></span><br>
Versions: <span class="module-version"><em>2013</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0
module-whatis &quot;Description: Dusan Turk's MAIN program&quot;
module-whatis &quot;URL: https://stef.ijs.si/&quot;
set MAIN /salilab/diva1/programs/x86_64linux/MAIN/
setenv MAIN ${MAIN}

setenv MAIN_CMDS &quot;${MAIN}cmds/&quot;
setenv MAIN_CMDS_NEW &quot;${MAIN}cmds_new/&quot;
setenv MAIN_UTILS &quot;${MAIN}utils/&quot;
setenv MAIN_SYMM &quot;${MAIN}symm/&quot;
setenv MAIN_DOC &quot;${MAIN}doc/&quot;
setenv MAIN_COM &quot;${MAIN}doc/com/&quot;
setenv MAIN_MENU &quot;${MAIN}doc/menu/&quot;
setenv MAIN_CONF &quot;${MAIN}config/&quot;
setenv MAIN_R3D_FONT &quot;${MAIN}crke/&quot;

prepend-path PATH &quot;${MAIN}:${MAIN}prog:${MAIN}config&quot;

set-alias mainps &quot;${MAIN}mainps_2013.exe_LINUX_G95-64&quot; 
set-alias psmain &quot;${MAIN}mainps_2013.exe_LINUX_G95-64&quot;
set-alias new &quot;${MAIN}new.exe_LINUX_G95-64&quot;
set-alias new_gf &quot;${MAIN}new.exe_LINUX_GFORT&quot;
set-alias l95 &quot;make -f ${MAIN}source/makefile.LINUX_G95-64&quot;
set-alias lgf &quot;make -f ${MAIN}source/.make_new_LINUX_GFORT&quot;

set-alias sou &quot;cd ${MAIN}source&quot;
set-alias tes &quot;cd ${MAIN}test&quot;
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_matlab" class="module-name">matlab</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Language for technical computing</span><br>
URL: <span class="module-url"><a href="https://www.mathworks.com/products/matlab.html">https://www.mathworks.com/products/matlab.html</a></span><br>
Versions: <span class="module-version"><em>9.5.0.944444</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Language for technical computing&quot;
module-whatis &quot;URL: https://www.mathworks.com/products/matlab.html&quot;
prepend-path  PATH               /salilab/diva1/programs/x86_64linux/matlab-r2018b/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_mist" class="module-name">mist</h3>
<dl>
  <dd class="module-details">
<span class="module-description">MiST - Mass spectrometry interaction STatistics</span><br>
URL: <span class="module-url"><a href="https://github.com/salilab/mist/">https://github.com/salilab/mist/</a></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: MiST - Mass spectrometry interaction STatistics&quot;
module-whatis &quot;URL: https://github.com/salilab/mist/&quot;
module load python3/scikit
set topdir /salilab/diva1/programs/linux/mist
prepend-path  PATH            ${topdir}/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_modeller" class="module-name">modeller</h3>
<dl>
  <dd class="module-details">
<span class="module-description">MODELLER comparative modeling</span><br>
URL: <span class="module-url"><a href="https://salilab.org/modeller/">https://salilab.org/modeller/</a></span><br>
Versions: <span class="module-version">9.10, 9.11, 9.12, 9.13, 9.14, 9.15, 9.16, 9.17, 9.18, 9.19, 9.20, 9.21, 9.22, 9.23, 9.24, 9.25, 10.0, 10.1, 10.2, 10.3, 10.4, 10.5, <em>SVN</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: MODELLER comparative modeling&quot;
module-whatis &quot;URL: https://salilab.org/modeller/&quot;
set topdir /salilab/diva1/home/modeller/SVN
prepend-path  PATH            ${topdir}/bin
prepend-path  LD_LIBRARY_PATH ${topdir}/lib/x86_64-intel8
prepend-path  PYTHONPATH      ${topdir}/lib/x86_64-intel8
prepend-path  PYTHONPATH      ${topdir}/modlib
prepend-path  PKG_CONFIG_PATH ${topdir}/lib/x86_64-intel8/pkgconfig
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_modpipe" class="module-name">modpipe</h3>
<dl>
  <dd class="module-details">
<span class="module-description">ModPipe (sets $MODPIPE; only works on the cluster)</span><br>
URL: <span class="module-url"><a href="https://salilab.org/modpipe/">https://salilab.org/modpipe/</a></span><br>
Versions: <span class="module-version">2.0.1, 2.0.2, 2.1.0, 2.1.1, 2.1.2, 2.1.3, 2.2.0, <em>2.3.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0
module-whatis &quot;Description: ModPipe (sets \$MODPIPE; only works on the cluster)&quot;
module-whatis &quot;URL: https://salilab.org/modpipe/&quot;
if [file exists /wynton/home] {
  setenv			MODPIPE	/wynton/home/sali/ModPipe/2.3.0
} else {
  puts stderr &quot;Sorry, this module only works on the cluster (or other machine that has /wynton/home mounted)&quot;
  break
}
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_muscle" class="module-name">muscle</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Multiple alignment program for protein sequences</span><br>
URL: <span class="module-url"><a href="http://www.drive5.com/muscle/">http://www.drive5.com/muscle/</a></span><br>
Versions: <span class="module-version"><em>3.8.31</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Multiple alignment program for protein sequences&quot;
module-whatis &quot;URL: http://www.drive5.com/muscle/&quot;
prepend-path PATH            /salilab/diva1/programs/x86_64linux/muscle-3.8.31/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_ninja" class="module-name">ninja</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A small build system with a focus on speed</span><br>
URL: <span class="module-url"><a href="https://ninja-build.org/">https://ninja-build.org/</a></span><br>
Versions: <span class="module-version">1.6.0, <em>1.8.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A small build system with a focus on speed&quot;
module-whatis &quot;URL: https://ninja-build.org/&quot;
prepend-path  PATH            /salilab/diva1/programs/x86_64linux/ninja-1.8.2/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_opencv" class="module-name">opencv</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Collection of algorithms for computer vision</span><br>
URL: <span class="module-url"><a href="https://opencv.org/">https://opencv.org/</a></span><br>
Versions: <span class="module-version">3.4.3, <em>4.3.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Collection of algorithms for computer vision&quot;
module-whatis &quot;URL: https://opencv.org/&quot;
module load hdf5/1.10.7
prepend-path PATH               /salilab/diva1/programs/x86_64linux/opencv-4.3.0/bin
prepend-path LD_LIBRARY_PATH    /salilab/diva1/programs/x86_64linux/opencv-4.3.0/lib64
prepend-path CMAKE_INCLUDE_PATH /salilab/diva1/programs/x86_64linux/opencv-4.3.0/include/opencv4
prepend-path CMAKE_LIBRARY_PATH /salilab/diva1/programs/x86_64linux/opencv-4.3.0/lib64
prepend-path PYTHONPATH         /salilab/diva1/programs/x86_64linux/opencv-4.3.0/lib/python3.6/site-packages
if { [file exists /etc/centos-release] || [file exists /etc/rocky-release] || [file exists /etc/almalinux-release]} {
  prepend-path LD_LIBRARY_PATH    /salilab/diva1/programs/x86_64linux/opencv-4.3.0/lib64/rhel
}
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_openeye" class="module-name">openeye</h3>
<dl>
  <dd class="module-details">
<span class="module-description">OpenEye products (work on any 64-bit node)</span><br>
URL: <span class="module-url"><a href="https://www.eyesopen.com/">https://www.eyesopen.com/</a></span><br>
Versions: <span class="module-version"><em>2012</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0
module-whatis &quot;Description: OpenEye products (work on any 64-bit node)&quot;
module-whatis &quot;URL: https://www.eyesopen.com/&quot;
if [file exists /wynton/group] {

  if [ module-info mode load ] {
    if { ! [file exists /wynton/group/sali/openeye ] } {
      puts stderr &quot;Sorry, this module is only available to members of the Sali lab.&quot;
      break
    }
  }

  prepend-path		PATH		/wynton/group/sali/openeye/bin
  prepend-path		PYTHONPATH	/wynton/group/sali/openeye/wrappers/v2012.Oct.1/python
  setenv			OE_LICENSE	/wynton/group/sali/openeye/oe_license.txt
} else {
  puts stderr &quot;Sorry, this module only works on the Wynton cluster (or other machine that has /wynton/group mounted)&quot;
  break
}
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_patch_dock" class="module-name">patch_dock</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Molecular Docking Based on Shape Complementarity Principles</span><br>
URL: <span class="module-url"><a href="https://bioinfo3d.cs.tau.ac.il/PatchDock/">https://bioinfo3d.cs.tau.ac.il/PatchDock/</a></span><br>
Versions: <span class="module-version"><em>1.3</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Molecular Docking Based on Shape Complementarity Principles&quot;
module-whatis &quot;URL: https://bioinfo3d.cs.tau.ac.il/PatchDock/&quot;
prepend-path PATH            /salilab/diva1/programs/x86_64linux/patch_dock-1.3/bin/cdr
prepend-path PATH            /salilab/diva1/programs/x86_64linux/patch_dock-1.3/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_pcss" class="module-name">pcss</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Peptide Classification using Sequence and Structure</span><br>
URL: <span class="module-url"><a href="https://github.com/salilab/pcss">https://github.com/salilab/pcss</a></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Peptide Classification using Sequence and Structure&quot;
module-whatis &quot;URL: https://github.com/salilab/pcss&quot;
if [file exists /wynton/home/sali] {
  module load svm_light
  set topdir /wynton/home/sali/peptide
  prepend-path  PATH      ${topdir}/bin
  prepend-path  PERL5LIB  ${topdir}/lib
} else {
  puts stderr &quot;Sorry, this module only works on the cluster (or other machine that has /wynton/home/sali mounted)&quot;
  break
}
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_phenix" class="module-name">phenix</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Python-based Hierarchical ENvironment for Integrated Xtallography</span><br>
URL: <span class="module-url"><a href="https://www.phenix-online.org/">https://www.phenix-online.org/</a></span><br>
Versions: <span class="module-version">1.10.1.2155, 1.18.2.3874, <em>1.19.1.4122</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Python-based Hierarchical ENvironment for Integrated Xtallography&quot;
module-whatis &quot;URL: https://www.phenix-online.org/&quot;
prepend-path  PATH            /salilab/diva1/programs/x86_64linux/phenix-1.19.1.4122/phenix-1.19.1-4122/build/bin
setenv        PHENIX          /salilab/diva1/programs/x86_64linux/phenix-1.19.1.4122/phenix-1.19.1-4122
setenv        PHENIX_VERSION  1.19.1-4122
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_profit" class="module-name">profit</h3>
<dl>
  <dd class="module-details">
<span class="module-description">ProFit, a protein least squares fitting program</span><br>
URL: <span class="module-url"><a href="http://www.bioinf.org.uk/software/profit/">http://www.bioinf.org.uk/software/profit/</a></span><br>
Versions: <span class="module-version"><em>3.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: ProFit, a protein least squares fitting program&quot;
module-whatis &quot;URL: http://www.bioinf.org.uk/software/profit/&quot;
prepend-path  PATH           /salilab/diva1/programs/x86_64linux/profit-3.1
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_psipred" class="module-name">psipred</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Accurate protein secondary structure prediction</span><br>
URL: <span class="module-url"><a href="http://bioinf.cs.ucl.ac.uk/psipred/">http://bioinf.cs.ucl.ac.uk/psipred/</a></span><br>
Versions: <span class="module-version"><em>4.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Accurate protein secondary structure prediction&quot;
module-whatis &quot;URL: http://bioinf.cs.ucl.ac.uk/psipred/&quot;
module load blast
prepend-path  PATH            /salilab/diva1/programs/x86_64linux/psipred-4.0/bin
setenv        PSIPRED_LIB     /salilab/diva1/programs/x86_64linux/psipred-4.0/lib
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-attrs" class="module-name">python3/attrs</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Classes Without Boilerplate</span><br>
URL: <span class="module-url"><a href="https://www.attrs.org/">https://www.attrs.org/</a></span><br>
Versions: <span class="module-version">20.3.0, <em>21.2.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Classes Without Boilerplate&quot;
module-whatis &quot;URL: https://www.attrs.org/&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/attrs-21.2.0/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-biopython" class="module-name">python3/biopython</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Python tools for computational molecular biology</span><br>
URL: <span class="module-url"><a href="https://biopython.org/">https://biopython.org/</a></span><br>
Versions: <span class="module-version"><em>1.75</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Python tools for computational molecular biology&quot;
module-whatis &quot;URL: https://biopython.org/&quot;
conflict python2
module load python3/numpy/1.19.5
prepend-path  PYTHONPATH   /salilab/diva1/programs/x86_64linux/biopython-py36-1.75/lib64/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-bottleneck" class="module-name">python3/bottleneck</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Collection of fast NumPy array functions written in Cython</span><br>
URL: <span class="module-url"><a href="https://github.com/pydata/bottleneck">https://github.com/pydata/bottleneck</a></span><br>
Versions: <span class="module-version"><em>1.3.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Collection of fast NumPy array functions written in Cython&quot;
module-whatis &quot;URL: https://github.com/pydata/bottleneck&quot;
conflict python2
module load python3/numpy/1.19.5 python3/scipy/1.3.2
prepend-path  PYTHONPATH   /salilab/diva1/programs/x86_64linux/bottleneck-py36-1.3.1/lib64/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-cycler" class="module-name">python3/cycler</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Composable style cycles</span><br>
URL: <span class="module-url"><a href="https://github.com/matplotlib/cycler">https://github.com/matplotlib/cycler</a></span><br>
Versions: <span class="module-version"><em>0.10.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Composable style cycles&quot; 
module-whatis &quot;URL: https://github.com/matplotlib/cycler&quot;
conflict python2
module load python3/six
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/cycler-py36-0.10.0/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-dateutil" class="module-name">python3/dateutil</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Powerful extensions to the standard datetime module</span><br>
URL: <span class="module-url"><a href="https://dateutil.readthedocs.io/en/stable/">https://dateutil.readthedocs.io/en/stable/</a></span><br>
Versions: <span class="module-version"><em>2.8.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Powerful extensions to the standard datetime module&quot;
module-whatis &quot;URL: https://dateutil.readthedocs.io/en/stable/&quot;
conflict python2
module load python3/six
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/dateutil-2.8.1/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-decorator" class="module-name">python3/decorator</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Module to simplify usage of decorators</span><br>
URL: <span class="module-url"><a href="https://github.com/micheles/decorator">https://github.com/micheles/decorator</a></span><br>
Versions: <span class="module-version"><em>4.4.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Module to simplify usage of decorators&quot;
module-whatis &quot;URL: https://github.com/micheles/decorator&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/decorator-4.4.1/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-flake8" class="module-name">python3/flake8</h3>
<dl>
  <dd class="module-details">
<span class="module-description">The modular source code checker: pep8 pyflakes and co</span><br>
URL: <span class="module-url"><a href="https://gitlab.com/pycqa/flake8">https://gitlab.com/pycqa/flake8</a></span><br>
Versions: <span class="module-version"><em>5.0.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: The modular source code checker: pep8 pyflakes and co&quot;
module-whatis &quot;URL: https://gitlab.com/pycqa/flake8&quot;
conflict python2
module load python3/importlib-metadata
module load python3/mccabe
module load python3/pycodestyle
module load python3/pyflakes
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/flake8-5.0.4/lib/python3.6/site-packages
prepend-path  PATH   /salilab/diva1/programs/linux/flake8-5.0.4/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-future" class="module-name">python3/future</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Clean single-source support for Python 3 and 2</span><br>
URL: <span class="module-url"><a href="https://python-future.org/">https://python-future.org/</a></span><br>
Versions: <span class="module-version"><em>0.18.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Clean single-source support for Python 3 and 2&quot;
module-whatis &quot;URL: https://python-future.org/&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/future-0.18.2/lib/python3.6/site-packages
prepend-path  PATH   /salilab/diva1/programs/linux/future-0.18.2/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-h5py" class="module-name">python3/h5py</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Python interface to the Hierarchical Data Format library</span><br>
URL: <span class="module-url"><a href="https://www.h5py.org/">https://www.h5py.org/</a></span><br>
Versions: <span class="module-version"><em>2.10.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Python interface to the Hierarchical Data Format library&quot;
module-whatis &quot;URL: https://www.h5py.org/&quot;
conflict python2
module load python3/numpy/1.19.5 hdf5/1.10.7 python3/six
prepend-path  PYTHONPATH   /salilab/diva1/programs/x86_64linux/h5py-py36-2.10.0/lib64/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-hdbscan" class="module-name">python3/hdbscan</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A high performance implementation of HDBSCAN clustering</span><br>
URL: <span class="module-url"><a href="https://github.com/scikit-learn-contrib/hdbscan">https://github.com/scikit-learn-contrib/hdbscan</a></span><br>
Versions: <span class="module-version"><em>0.8.33</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A high performance implementation of HDBSCAN clustering&quot;
module-whatis &quot;URL: https://github.com/scikit-learn-contrib/hdbscan&quot;
conflict python2
module load python3/numpy/1.19.5 python3/scipy/1.3.2 python3/scikit/0.21.3
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/hdbscan-0.8.33/lib64/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-ihm" class="module-name">python3/ihm</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Python package for handling IHM mmCIF files</span><br>
URL: <span class="module-url"><a href="https://github.com/ihmwg/python-ihm">https://github.com/ihmwg/python-ihm</a></span><br>
Versions: <span class="module-version">0.15, 0.27, 0.28, 0.31, 0.43, <em>1.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Python package for handling IHM mmCIF files&quot;
module-whatis &quot;URL: https://github.com/ihmwg/python-ihm&quot;
conflict python2
module load python3/msgpack
prepend-path PYTHONPATH      /salilab/diva1/programs/x86_64linux/ihm-1.2/lib64/python/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-importlib-metadata" class="module-name">python3/importlib-metadata</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Read metadata from Python packages</span><br>
URL: <span class="module-url"><a href="https://github.com/python/importlib_metadata">https://github.com/python/importlib_metadata</a></span><br>
Versions: <span class="module-version"><em>3.3.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Read metadata from Python packages&quot;
module-whatis &quot;URL: https://github.com/python/importlib_metadata&quot;
conflict python2
module load python3/zipp
module load python3/toml
module load python3/typing-extensions
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/importlib-metadata-3.3.0/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-iniconfig" class="module-name">python3/iniconfig</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Brain-dead simple parsing of ini files</span><br>
URL: <span class="module-url"><a href="https://github.com/RonnyPfannschmidt/iniconfig">https://github.com/RonnyPfannschmidt/iniconfig</a></span><br>
Versions: <span class="module-version"><em>1.1.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Brain-dead simple parsing of ini files&quot;
module-whatis &quot;URL: https://github.com/RonnyPfannschmidt/iniconfig&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/iniconfig-1.1.1/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-joblib" class="module-name">python3/joblib</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Lightweight pipelining: using Python functions as pipeline jobs</span><br>
URL: <span class="module-url"><a href="https://joblib.readthedocs.io/en/latest/">https://joblib.readthedocs.io/en/latest/</a></span><br>
Versions: <span class="module-version"><em>0.17.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Lightweight pipelining: using Python functions as pipeline jobs&quot;
module-whatis &quot;URL: https://joblib.readthedocs.io/en/latest/&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/joblib-0.17.0/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-kiwisolver" class="module-name">python3/kiwisolver</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A fast implementation of the Cassowary constraint solver</span><br>
URL: <span class="module-url"><a href="https://github.com/nucleic/kiwi">https://github.com/nucleic/kiwi</a></span><br>
Versions: <span class="module-version"><em>1.1.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A fast implementation of the Cassowary constraint solver&quot;
module-whatis &quot;URL: https://github.com/nucleic/kiwi&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/x86_64linux/kiwisolver-py36-1.1.0/lib64/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-matplotlib" class="module-name">python3/matplotlib</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Python 2D plotting library</span><br>
URL: <span class="module-url"><a href="https://matplotlib.org/">https://matplotlib.org/</a></span><br>
Versions: <span class="module-version"><em>3.1.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Python 2D plotting library&quot;
module-whatis &quot;URL: https://matplotlib.org/&quot;
conflict python2
module load python3/cycler
module load python3/numpy/1.19.5
module load python3/pyparsing
module load python3/dateutil
module load python3/pytz
module load python3/kiwisolver
prepend-path PYTHONPATH   /salilab/diva1/programs/x86_64linux/matplotlib-py36-3.1.2/lib64/python3.6/site-packages
prepend-path LD_LIBRARY_PATH /salilab/diva1/programs/x86_64linux/matplotlib-py36-3.1.2/lib
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-mccabe" class="module-name">python3/mccabe</h3>
<dl>
  <dd class="module-details">
<span class="module-description">McCabe checker, plugin for flake8</span><br>
URL: <span class="module-url"><a href="https://github.com/pycqa/mccabe">https://github.com/pycqa/mccabe</a></span><br>
Versions: <span class="module-version">0.6.1, <em>0.7.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: McCabe checker, plugin for flake8&quot;
module-whatis &quot;URL: https://github.com/pycqa/mccabe&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/mccabe-0.7.0/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-mdp" class="module-name">python3/mdp</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Modular toolkit for Data Processing</span><br>
URL: <span class="module-url"><a href="http://mdp-toolkit.sourceforge.net/">http://mdp-toolkit.sourceforge.net/</a></span><br>
Versions: <span class="module-version"><em>3.6</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Modular toolkit for Data Processing&quot;
module-whatis &quot;URL: http://mdp-toolkit.sourceforge.net/&quot;
conflict python2
module load python3/scipy python3/future python3/scikit
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/mdp-3.6/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-modelcif" class="module-name">python3/modelcif</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Python package for handling ModelCIF mmCIF files</span><br>
URL: <span class="module-url"><a href="https://github.com/ihmwg/python-modelcif">https://github.com/ihmwg/python-modelcif</a></span><br>
Versions: <span class="module-version">0.2, 0.3, 0.4, 0.5, <em>0.9</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Python package for handling ModelCIF mmCIF files&quot;
module-whatis &quot;URL: https://github.com/ihmwg/python-modelcif&quot;
conflict python2
module load python3/ihm
prepend-path PYTHONPATH      /salilab/diva1/programs/linux/modelcif-0.9/lib/python/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-msgpack" class="module-name">python3/msgpack</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A Python MessagePack (de)serializer</span><br>
URL: <span class="module-url"><a href="https://msgpack.org/">https://msgpack.org/</a></span><br>
Versions: <span class="module-version"><em>0.6.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A Python MessagePack (de)serializer&quot;
module-whatis &quot;URL: https://msgpack.org/&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/x86_64linux/msgpack-py27-0.6.2/lib64/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-networkx" class="module-name">python3/networkx</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Creates and Manipulates Graphs and Networks</span><br>
URL: <span class="module-url"><a href="https://networkx.github.io/">https://networkx.github.io/</a></span><br>
Versions: <span class="module-version"><em>2.4</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Creates and Manipulates Graphs and Networks&quot;
module-whatis &quot;URL: https://networkx.github.io/&quot;
conflict python2
module load python3/scipy/1.3.2
module load python3/pyparsing
module load python3/decorator
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/networkx-2.4/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-nose" class="module-name">python3/nose</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Discovery-based unittest extension for Python3</span><br>
URL: <span class="module-url"><a href="https://nose.readthedocs.io/en/latest/">https://nose.readthedocs.io/en/latest/</a></span><br>
Versions: <span class="module-version"><em>1.3.7</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Discovery-based unittest extension for Python3&quot;
module-whatis &quot;URL: https://nose.readthedocs.io/en/latest/&quot;
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/nose-1.3.7/lib/python3.6/site-packages
prepend-path  PATH         /salilab/diva1/programs/linux/nose-1.3.7/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-numexpr" class="module-name">python3/numexpr</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Fast numerical array expression evaluator for Python and NumPy</span><br>
URL: <span class="module-url"><a href="https://github.com/pydata/numexpr">https://github.com/pydata/numexpr</a></span><br>
Versions: <span class="module-version"><em>2.8.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Fast numerical array expression evaluator for Python and NumPy&quot;
module-whatis &quot;URL: https://github.com/pydata/numexpr&quot;
conflict python2
module load python3/numpy/1.19.5 python3/packaging
prepend-path  PYTHONPATH   /salilab/diva1/programs/x86_64linux/numexpr-py36-2.8.1/lib64/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-numpy" class="module-name">python3/numpy</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A fast multidimensional array facility for Python</span><br>
URL: <span class="module-url"><a href="https://numpy.org/">https://numpy.org/</a></span><br>
Versions: <span class="module-version"><em>1.19.5</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A fast multidimensional array facility for Python&quot;
module-whatis &quot;URL: https://numpy.org/&quot;
conflict python2
prepend-path PYTHONPATH      /salilab/diva1/programs/x86_64linux/numpy-py36-1.19.5/lib64/python3.6/site-packages
prepend-path PATH            /salilab/diva1/programs/x86_64linux/numpy-py36-1.19.5/bin
prepend-path LD_LIBRARY_PATH /salilab/diva1/programs/x86_64linux/numpy-py36-1.19.5/lib
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-packaging" class="module-name">python3/packaging</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Core utilities for Python packages</span><br>
URL: <span class="module-url"><a href="https://github.com/pypa/packaging">https://github.com/pypa/packaging</a></span><br>
Versions: <span class="module-version"><em>20.8</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Core utilities for Python packages&quot;
module-whatis &quot;URL: https://github.com/pypa/packaging&quot;
conflict python2
module load python3/pyparsing
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/packaging-20.8/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-pandas" class="module-name">python3/pandas</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Python Data Analysis Library</span><br>
URL: <span class="module-url"><a href="https://pandas.pydata.org/">https://pandas.pydata.org/</a></span><br>
Versions: <span class="module-version"><em>0.25.3</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Python Data Analysis Library&quot; 
module-whatis &quot;URL: https://pandas.pydata.org/&quot;
conflict python2
module load python3/numpy/1.19.5
module load python3/dateutil
module load python3/matplotlib
module load python3/pytz
prepend-path  PYTHONPATH   /salilab/diva1/programs/x86_64linux/pandas-py36-0.25.3/lib64/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-pkgconfig" class="module-name">python3/pkgconfig</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A Python interface to the pkg-config command line tool</span><br>
URL: <span class="module-url"><a href="https://github.com/matze/pkgconfig">https://github.com/matze/pkgconfig</a></span><br>
Versions: <span class="module-version"><em>1.5.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A Python interface to the pkg-config command line tool&quot;
module-whatis &quot;URL: https://github.com/matze/pkgconfig&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/pkgconfig-1.5.1/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-pluggy" class="module-name">python3/pluggy</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A minimalist production ready plugin system</span><br>
URL: <span class="module-url"><a href="https://github.com/pytest-dev/pluggy">https://github.com/pytest-dev/pluggy</a></span><br>
Versions: <span class="module-version"><em>0.13.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A minimalist production ready plugin system&quot;
module-whatis &quot;URL: https://github.com/pytest-dev/pluggy&quot;
conflict python2
module load python3/importlib-metadata
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/pluggy-0.13.1/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-protobuf" class="module-name">python3/protobuf</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Protocol Buffers - Google's data interchange format</span><br>
URL: <span class="module-url"><a href="https://developers.google.com/protocol-buffers/">https://developers.google.com/protocol-buffers/</a></span><br>
Versions: <span class="module-version"><em>3.11.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Protocol Buffers - Google's data interchange format&quot;
module-whatis &quot;URL: https://developers.google.com/protocol-buffers/&quot;
conflict python2
module load python3/six
prepend-path PYTHONPATH      /salilab/diva1/programs/x86_64linux/protobuf-py36-3.11.2/lib64/python3.6/site-packages
prepend-path LD_LIBRARY_PATH /salilab/diva1/programs/x86_64linux/protobuf-py36-3.11.2/lib64
prepend-path PATH            /salilab/diva1/programs/x86_64linux/protobuf-py36-3.11.2/bin
prepend-path EMACSLOADPATH   /salilab/diva1/programs/x86_64linux/protobuf-py36-3.11.2/share/emacs/site-lisp
prepend-path CMAKE_INCLUDE_PATH /salilab/diva1/programs/x86_64linux/protobuf-py36-3.11.2/include
prepend-path CMAKE_LIBRARY_PATH /salilab/diva1/programs/x86_64linux/protobuf-py36-3.11.2/lib64
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-py" class="module-name">python3/py</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Cross-python path, ini-parsing, io, code, log facilities</span><br>
URL: <span class="module-url"><a href="https://py.readthedocs.io/en/latest/">https://py.readthedocs.io/en/latest/</a></span><br>
Versions: <span class="module-version"><em>1.11.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Cross-python path, ini-parsing, io, code, log facilities&quot;
module-whatis &quot;URL: https://py.readthedocs.io/en/latest/&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/py-1.11.0/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-pycodestyle" class="module-name">python3/pycodestyle</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Python style guide checker</span><br>
URL: <span class="module-url"><a href="https://pycodestyle.readthedocs.io/">https://pycodestyle.readthedocs.io/</a></span><br>
Versions: <span class="module-version">2.6.0, <em>2.9.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Python style guide checker&quot;
module-whatis &quot;URL: https://pycodestyle.readthedocs.io/&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/pycodestyle-2.9.1/lib/python3.6/site-packages
prepend-path  PATH   /salilab/diva1/programs/linux/pycodestyle-2.9.1/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-pyflakes" class="module-name">python3/pyflakes</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Passive checker of Python programs</span><br>
URL: <span class="module-url"><a href="https://github.com/PyCQA/pyflakes">https://github.com/PyCQA/pyflakes</a></span><br>
Versions: <span class="module-version">2.2.0, <em>2.5.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Passive checker of Python programs&quot;
module-whatis &quot;URL: https://github.com/PyCQA/pyflakes&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/pyflakes-2.5.0/lib/python3.6/site-packages
prepend-path  PATH   /salilab/diva1/programs/linux/pyflakes-2.5.0/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-pyparsing" class="module-name">python3/pyparsing</h3>
<dl>
  <dd class="module-details">
<span class="module-description">An object-oriented approach to text processing</span><br>
URL: <span class="module-url"><a href="https://github.com/pyparsing/pyparsing/">https://github.com/pyparsing/pyparsing/</a></span><br>
Versions: <span class="module-version"><em>2.4.5</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: An object-oriented approach to text processing&quot;
module-whatis &quot;URL: https://github.com/pyparsing/pyparsing/&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/x86_64linux/pyparsing-py36-2.4.5/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-pyrmsd" class="module-name">python3/pyrmsd</h3>
<dl>
  <dd class="module-details">
Versions: <span class="module-version"><em>4.3.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Way of performing RMSD calculations of large sets of structures&quot;
conflict python2
module load cuda/7.5.18 python3/numpy/1.19.5 python3/scipy/1.3.2
prepend-path  PYTHONPATH   /salilab/diva1/programs/x86_64linux/pyrmsd-py36-4.3.2
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-pytest" class="module-name">python3/pytest</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Simple powerful testing with Python</span><br>
URL: <span class="module-url"><a href="https://docs.pytest.org/en/latest/">https://docs.pytest.org/en/latest/</a></span><br>
Versions: <span class="module-version"><em>6.2.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Simple powerful testing with Python&quot;
module-whatis &quot;URL: https://docs.pytest.org/en/latest/&quot;
conflict python2
module load python3/toml
module load python3/importlib-metadata
module load python3/attrs
module load python3/iniconfig
module load python3/packaging
module load python3/pluggy
module load python3/py
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/pytest-6.2.1/lib/python3.6/site-packages
prepend-path  PATH   /salilab/diva1/programs/linux/pytest-6.2.1/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-pytz" class="module-name">python3/pytz</h3>
<dl>
  <dd class="module-details">
<span class="module-description">World Timezone Definitions for Python</span><br>
URL: <span class="module-url"><a href="https://pythonhosted.org/pytz/">https://pythonhosted.org/pytz/</a></span><br>
Versions: <span class="module-version"><em>2019.3</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: World Timezone Definitions for Python&quot;
module-whatis &quot;URL: https://pythonhosted.org/pytz/&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/pytz-2019.3/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-scikit" class="module-name">python3/scikit</h3>
<dl>
  <dd class="module-details">
<span class="module-description">A set of python modules for machine learning and data mining</span><br>
URL: <span class="module-url"><a href="https://scikit-learn.org/stable/index.html">https://scikit-learn.org/stable/index.html</a></span><br>
Versions: <span class="module-version"><em>0.21.3</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: A set of python modules for machine learning and data mining&quot;
module-whatis &quot;URL: https://scikit-learn.org/stable/index.html&quot;
conflict python2
module load sali-libraries
module load python3/numpy/1.19.5 python3/scipy/1.3.2 python3/joblib
prepend-path  PYTHONPATH   /salilab/diva1/programs/x86_64linux/scikit-py36-0.21.3/lib64/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-scipy" class="module-name">python3/scipy</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Scipy: Scientific Tools for Python</span><br>
URL: <span class="module-url"><a href="https://www.scipy.org/">https://www.scipy.org/</a></span><br>
Versions: <span class="module-version"><em>1.3.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Scipy: Scientific Tools for Python&quot; 
module-whatis &quot;URL: https://www.scipy.org/&quot;
conflict python2
module load python3/numpy/1.19.5
prepend-path  PYTHONPATH   /salilab/diva1/programs/x86_64linux/scipy-py36-1.3.2/lib64/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-six" class="module-name">python3/six</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Python 2 and 3 compatibility utilities</span><br>
URL: <span class="module-url"><a href="https://github.com/benjaminp/six">https://github.com/benjaminp/six</a></span><br>
Versions: <span class="module-version"><em>1.16.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Python 2 and 3 compatibility utilities&quot;
module-whatis &quot;URL: https://github.com/benjaminp/six&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/six-1.16.0/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-tables" class="module-name">python3/tables</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Hierarchical datasets in Python</span><br>
URL: <span class="module-url"><a href="http://www.pytables.org/">http://www.pytables.org/</a></span><br>
Versions: <span class="module-version"><em>3.6.1</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Hierarchical datasets in Python&quot;
module-whatis &quot;URL: http://www.pytables.org/&quot;
conflict python2
module load python3/numpy/1.19.5
module load python3/numexpr/2.8.1
module load hdf5/1.10.7
module load python3/six
prepend-path PYTHONPATH      /salilab/diva1/programs/x86_64linux/tables-py36-3.6.1/lib64/python3.6/site-packages
prepend-path PATH            /salilab/diva1/programs/x86_64linux/tables-py36-3.6.1/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-toml" class="module-name">python3/toml</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Python Library for Tom's Obvious, Minimal Language</span><br>
URL: <span class="module-url"><a href="https://github.com/uiri/toml">https://github.com/uiri/toml</a></span><br>
Versions: <span class="module-version"><em>0.10.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Python Library for Tom's Obvious, Minimal Language&quot;
module-whatis &quot;URL: https://github.com/uiri/toml&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/toml-0.10.2/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-typing-extensions" class="module-name">python3/typing-extensions</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Backported and Experimental Type Hints for Python 3.5+</span><br>
URL: <span class="module-url"><a href="https://pypi.org/project/typing-extensions/">https://pypi.org/project/typing-extensions/</a></span><br>
Versions: <span class="module-version"><em>3.7.4.3</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Backported and Experimental Type Hints for Python 3.5+&quot;
module-whatis &quot;URL: https://pypi.org/project/typing-extensions/&quot;
conflict python2
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/typing-extensions-3.7.4.3/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_python3-zipp" class="module-name">python3/zipp</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Backport of pathlib-compatible object wrapper for zip files</span><br>
URL: <span class="module-url"><a href="https://github.com/jaraco/zipp">https://github.com/jaraco/zipp</a></span><br>
Versions: <span class="module-version"><em>3.4.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Backport of pathlib-compatible object wrapper for zip files&quot;
module-whatis &quot;URL: https://github.com/jaraco/zipp&quot;
conflict python2
module load python3/toml
prepend-path  PYTHONPATH   /salilab/diva1/programs/linux/zipp-3.4.0/lib/python3.6/site-packages
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_relion" class="module-name">relion</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Electron cryo-microscopy refinement</span><br>
URL: <span class="module-url"><a href="https://github.com/3dem/relion">https://github.com/3dem/relion</a></span><br>
Versions: <span class="module-version">1.4, 2.0.6, <em>3.0.git9a02562</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Electron cryo-microscopy refinement&quot;
module-whatis &quot;URL: https://github.com/3dem/relion&quot;
module load cuda/7.5.18
# would use is-avail, but Lmod doesn't support that
if [file exists /etc/modulefiles/mpi/openmpi-x86_64] { 
  module load mpi/openmpi-x86_64
} elseif [file exists /usr/share/modulefiles/mpi/openmpi-x86_64] {    
  module load mpi/openmpi-x86_64
}
prepend-path  PATH            /salilab/diva1/programs/x86_64linux/relion-3.0.git9a02562/bin

# Provide libX11 if not available on the system
if [file exists /lib64/libX11.so.6] {
} else {
  prepend-path LD_LIBRARY_PATH /salilab/diva1/programs/x86_64linux/relion-3.0.git9a02562/lib
}
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_rosetta" class="module-name">rosetta</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Computational modeling and analysis of protein structures</span><br>
URL: <span class="module-url"><a href="https://www.rosettacommons.org/">https://www.rosettacommons.org/</a></span><br>
Versions: <span class="module-version">3.5, <em>3.10</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Computational modeling and analysis of protein structures&quot;
module-whatis &quot;URL: https://www.rosettacommons.org/&quot;
prepend-path  PATH            /salilab/diva1/programs/x86_64linux/rosetta-3.10/bin
setenv        ROSETTA3_DB     /salilab/diva1/programs/x86_64linux/rosetta-3.10/database
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_sali-libraries" class="module-name">sali-libraries</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Makes available libraries usually only present on the Sali interactive nodes</span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Makes available libraries usually only present on the Sali interactive nodes&quot;
prepend-path  LD_LIBRARY_PATH /salilab/diva1/home/libs/x86_64
if { [file exists /etc/centos-release] || [file exists /etc/rocky-release] || [file exists /etc/almalinux-release]} {
  if [file exists /etc/dnf/dnf.conf] {
    prepend-path  LD_LIBRARY_PATH /salilab/diva1/home/libs/x86_64/centos8
  } elseif [file exists /etc/systemd/system.conf] {
    prepend-path  LD_LIBRARY_PATH /salilab/diva1/home/libs/x86_64/centos7
  } else {
    prepend-path  LD_LIBRARY_PATH /salilab/diva1/home/libs/x86_64/centos
  }
}
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_scwrl" class="module-name">scwrl</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Protein side-chain conformation prediction program</span><br>
URL: <span class="module-url"><a href="http://dunbrack.fccc.edu/lab/scwrl">http://dunbrack.fccc.edu/lab/scwrl</a></span><br>
Versions: <span class="module-version"><em>4.0</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Protein side-chain conformation prediction program&quot;
module-whatis &quot;URL: http://dunbrack.fccc.edu/lab/scwrl&quot;
prepend-path PATH               /salilab/diva1/programs/x86_64linux/scwrl-4.0/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_svm_light" class="module-name">svm_light</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Support Vector Machine</span><br>
URL: <span class="module-url"><a href="http://svmlight.joachims.org/">http://svmlight.joachims.org/</a></span><br>
Versions: <span class="module-version"><em>6.0.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Support Vector Machine&quot;
module-whatis &quot;URL: http://svmlight.joachims.org/&quot;
prepend-path  PATH /salilab/diva1/programs/x86_64linux/svm_light-6.0.2
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_swig" class="module-name">swig</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Connects C/C++/Objective C to some high-level programming languages</span><br>
URL: <span class="module-url"><a href="http://www.swig.org/">http://www.swig.org/</a></span><br>
Versions: <span class="module-version">3.0.12, <em>4.0.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Connects C/C++/Objective C to some high-level programming languages&quot;
module-whatis &quot;URL: http://www.swig.org/&quot;
prepend-path PATH               /salilab/diva1/programs/x86_64linux/swig-4.0.2/bin
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_usearch" class="module-name">usearch</h3>
<dl>
  <dd class="module-details">
<span class="module-description">High-throughput search and clustering tool</span><br>
URL: <span class="module-url"><a href="http://www.drive5.com/usearch/">http://www.drive5.com/usearch/</a></span><br>
Versions: <span class="module-version">4.0.43, <em>10.0.240</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: High-throughput search and clustering tool&quot;
module-whatis &quot;URL: http://www.drive5.com/usearch/&quot;
prepend-path  PATH            /salilab/diva1/programs/linux/usearch-10.0.240/
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_web_service" class="module-name">web_service</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Command line interface (web_service.py) to most lab web services</span><br>
URL: <span class="module-url"><a href="https://github.com/salilab/saliweb">https://github.com/salilab/saliweb</a></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Command line interface (web_service.py) to most lab web services&quot;
module-whatis &quot;URL: https://github.com/salilab/saliweb&quot;
prepend-path  PATH            /salilab/diva1/programs/linux/web_service
</code></pre>

</details>
  </dd>
</dl>
<h3 id="module_sali_zdock" class="module-name">zdock</h3>
<dl>
  <dd class="module-details">
<span class="module-description">Rigid body docking</span><br>
URL: <span class="module-url"><a href="http://zdock.umassmed.edu/">http://zdock.umassmed.edu/</a></span><br>
Versions: <span class="module-version"><em>3.0.2</em></span><br>
<details>
<summary>Module code: <a>view</a></summary>
<pre><code class="language-lua">#%Module 1.0

module-whatis &quot;Description: Rigid body docking&quot;
module-whatis &quot;URL: http://zdock.umassmed.edu/&quot;
prepend-path  PATH /salilab/diva1/programs/x86_64linux/zdock-3.0.2
</code></pre>

</details>
  </dd>
</dl>
</div> 


</div> 

<ul class="nav nav-pills">
<li class="active"><a data-toggle="pill" href="#button_repository_built-in"><span style="font-weight: bold;">built-in</span>&nbsp;(6)</a></li>
<li><a data-toggle="pill" href="#button_repository_cbi"><span style="font-weight: bold;">CBI</span>&nbsp;(96)</a></li>
<li><a data-toggle="pill" href="#button_repository_sali"><span style="font-weight: bold;">Sali</span>&nbsp;(95)</a></li>
</ul>

_The above information is updated automatically once an hour by querying `module avail` and `module spider`._


<style>
dl {
  display: block;
}
dt {
  font-family: Menlo, Monaco, Consolas, "Courier New", monospace;
  font-weight: bold;
  font-size: 120%;
  margin-top: 1ex;
  text-decoration: underline;
}
dt:after {
  content: "";
}
</style>

<script type="text/javascript">
$(document).ready(function() {
  var hash = window.location.hash;
  var pattern;
  
  /* Linked to a module repository? */
  pattern = "#repository_";
  if (hash.startsWith(pattern)) {
    var repo = hash.substring(pattern.length);
    $('a[href="#button_repository_' + repo + '"]').click();
    return;
  }

  /* Linked to a module in a module repository? */
  pattern = "#module_";
  if (hash.startsWith(pattern)) {
    var repo_module = hash.substring(pattern.length);
    var repo = repo_module.replace(new RegExp("_.*$"), "");
    $('a[href="#button_repository_' + repo + '"]').click().delay(300);
    $('a[href="' + hash + '"]').focus();
    return;
  }

  /* Backward compatibility */
  pattern = "#module-software-repository-";
  if (hash.startsWith(pattern)) {
    var repo = hash.substring(pattern.length);
    $('a[href="#button_repository_' + repo + '"]').click();
    return;
  }

  pattern = "#module-";
  if (hash.startsWith(pattern)) {
    var repo_module = hash.substring(pattern.length);
    var repo = repo_module.replace(new RegExp("[-].*$"), "");
    $('a[href="#button_repository_' + repo + '"]').click().delay(300);
    $('a[href="' + hash + '"]').focus();
    return;
  }
})
</script>

[core software]: {{ '/software/core-software.html' | relative_url }}
