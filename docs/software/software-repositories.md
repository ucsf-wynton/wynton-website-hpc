<!--
WARNING: Do _not_ update this file; it is automatically generated from software-respository.md.rsp.
-->




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
<li class="active"><a data-toggle="pill" href="#queues-built-in"><span style="font-weight: bold;">built-in</span>&nbsp;(9)</a></li>
<li><a data-toggle="pill" href="#queues-CBI"><span style="font-weight: bold;">CBI</span>&nbsp;(73)</a></li>
<li><a data-toggle="pill" href="#queues-Sali"><span style="font-weight: bold;">Sali</span>&nbsp;(120)</a></li>
</ul>

<div class="tab-content" style="margin-top: 1ex;">
<div id="queues-built-in" class="tab-pane fadein active">

<h2>Module Software Repository: built-in (9)</h2>

Maintained by: {{ site.cluster.nickname }} Systems Administrators, <a href="{{ '/about/contact.html' | relative_url }}">{{ site.cluster.name }}</a><br>
Enable repository: <em>this software repository is always enabled</em><br>

<dl>
  <dt class="module-name">amber</dt>
  <dd class="module-details">
<span class="module-description">Amber11, for 64-bit</span><br>
URL: <span class="module-url"><a href="http://ambermd.org/">http://ambermd.org/</a></span><br>
Versions: <span class="module-version">20, <em>11</em></span><br>
  </dd>

  <dt class="module-name">CBI</dt>
  <dd class="module-details">
<strong class="module-help">Module Repository by UCSF Computational Biology and Informatics (CBI)</strong><br>
<span class="module-description">Repository of modules shared by UCSF Computational Biology and Informatics. When loading this module, you will get access to a large number of software modules.  When unloading the module, any software modules from this CBI software repository still loaded when you unload this repository module, will remain in your list of loaded modules but will be inactivate (i.e. behave as they never were loaded) until you reload this repository module again.</span><br>
Example: <span class="module-example"><code>module load CBI</code> and then <code>module avail</code>.</span><br>
URL: <span class="module-url"><a href="https://cbi.ucsf.edu/">https://cbi.ucsf.edu/</a></span><br>
Maintainer: <span class="module-maintainer">Henrik Bengtsson, CBI</span><br>
  </dd>

  <dt class="module-name">cuda</dt>
  <dd class="module-details">
Versions: <span class="module-version">6.0.37, 7.5, 7.5.18, 8.0, 8.0.61, 9.0.176, 9.1, 9.2, 10.0.130, 10.1, 11.0, <em>11.5.0</em></span><br>
  </dd>

  <dt class="module-name">julia</dt>
  <dd class="module-details">
Versions: <span class="module-version">0.6.4, <em>1.6.0</em></span><br>
  </dd>

  <dt class="module-name">matlab</dt>
  <dd class="module-details">
Versions: <span class="module-version">9.5.0.944444, 2018b, 2019a, 2019b, 2020a, 2020b, 2021a, <em>2021b</em></span><br>
  </dd>

  <dt class="module-name">matlab-runtime</dt>
  <dd class="module-details">
Versions: <span class="module-version">2020a, 2020b, 2021a, <em>2021b</em></span><br>
  </dd>

  <dt class="module-name">mpi</dt>
  <dd class="module-details">
Versions: <span class="module-version">openmpi-x86_64, <em>openmpi3-x86_64</em></span><br>
  </dd>

  <dt class="module-name">openjdk</dt>
  <dd class="module-details">
<strong class="module-help">openjdk-runtime: Open Java Development Kit</strong><br>
<span class="module-description">OpenJDK is a free and open-source implementation of the Java Platform, Standard Edition. It is the result of an effort Sun Microsystems began in 2006.</span><br>
Example: <span class="module-example"><code>java -version</code> and <code>javac -version</code>.</span><br>
URL: <span class="module-url"><a href="https://openjdk.java.net/">https://openjdk.java.net/</a></span><br>
Versions: <span class="module-version">1.8.0.282.b08-1, <em>11.0.10.0.9-0</em></span><br>
  </dd>

  <dt class="module-name">Sali</dt>
  <dd class="module-details">
<strong class="module-help">Sali lab software repository</strong><br>
  </dd>

</dl>
</div> 

<div id="queues-CBI" class="tab-pane fade">

<h2>Module Software Repository: CBI (73)</h2>

Maintained by: Henrik Bengtsson, <a href="http://cbi.ucsf.edu">Computational Biology and Informatics</a><br>
Enable repository: <code>module load CBI</code><br>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Please note that this software stacks is maintained and contributed by a research group on a voluntary basis. It is <em>not</em> maintained by the {{ site.cluster.name }} admins. Please reach out to the corresponding maintainer for bug reports, feedback, or questions.
</div>

<dl>
  <dt class="module-name">apache-ant</dt>
  <dd class="module-details">
<strong class="module-help">Apache Ant: A Java Library and Command-Line Tool to Build Software</strong><br>
<span class="module-description">Apache Ant is a Java library and command-line tool that help building software.</span><br>
Example: <span class="module-example"><code>ant -h</code></span><br>
URL: <span class="module-url"><a href="https://ant.apache.org/bindownload.cgi">https://ant.apache.org/bindownload.cgi</a></span><br>
Versions: <span class="module-version"><em>1.10.12</em></span><br>
  </dd>

  <dt class="module-name">asciigenome</dt>
  <dd class="module-details">
<strong class="module-help">ASCIIGenome: Text Only Genome Viewer</strong><br>
<span class="module-description">ASCIIGenome is a genome browser based on command line interface and designed for running from console terminals. Since ASCIIGenome does not require a graphical interface it is particularly useful for quickly visualizing genomic data on remote servers while offering flexibility similar to popular GUI viewers like IGV.</span><br>
Example: <span class="module-example"><code>ASCIIGenome --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/dariober/ASCIIGenome">https://github.com/dariober/ASCIIGenome</a></span><br>
Versions: <span class="module-version">1.15.0, <em>1.16.0</em></span><br>
  </dd>

  <dt class="module-name">bamutil</dt>
  <dd class="module-details">
<strong class="module-help">bamUtil: Programs for Working on SAM/BAM Files</strong><br>
<span class="module-description">bamUtil is a repository that contains several programs that perform operations on SAM/BAM files. All of these programs are built into a single executable, <code>bam</code>.</span><br>
Example: <span class="module-example"><code>bam help</code>.</span><br>
URL: <span class="module-url"><a href="https://genome.sph.umich.edu/wiki/BamUtil">https://genome.sph.umich.edu/wiki/BamUtil</a>, <a href="https://github.com/statgen/bamUtil">https://github.com/statgen/bamUtil</a></span><br>
Versions: <span class="module-version"><em>1.0.14</em></span><br>
  </dd>

  <dt class="module-name">bat</dt>
  <dd class="module-details">
<strong class="module-help">bat: A cat(1) Clone with Syntax Highlighting and Git Integration</strong><br>
<span class="module-description">A cat(1) clone with syntax highlighting and Git integration.</span><br>
Example: <span class="module-example"><code>bat README.md</code>, <code>bat scripts/*.sh</code>, and <code>bat src/*.c</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/sharkdp/bat">https://github.com/sharkdp/bat</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">0.17.1, <em>0.18.3</em></span><br>
  </dd>

  <dt class="module-name">bcftools</dt>
  <dd class="module-details">
<strong class="module-help">BCFtools: Utilities for Variant Calling and Manipulating VCFs and BCFs</strong><br>
<span class="module-description">BCFtools is a set of utilities that manipulate variant calls in the Variant Call Format (VCF) and its binary counterpart BCF. All commands work transparently with both VCFs and BCFs, both uncompressed and BGZF-compressed.</span><br>
Example: <span class="module-example"><code>bcftools --version</code></span><br>
URL: <span class="module-url"><a href="https://www.htslib.org/">https://www.htslib.org/</a>, <a href="https://github.com/samtools/bcftools">https://github.com/samtools/bcftools</a></span><br>
Versions: <span class="module-version">1.9, 1.10, 1.10.2, 1.11, 1.13, <em>1.14</em></span><br>
  </dd>

  <dt class="module-name">bcl2fastq</dt>
  <dd class="module-details">
<strong class="module-help">bcl2fastq: Illumina Conversion Software</strong><br>
<span class="module-description">bcl2fastq Conversion Software both demultiplexes data and converts BCL files generated by Illumina sequencing systems to standard FASTQ file formats for downstream analysis.</span><br>
Example: <span class="module-example"><code>bcl2fastq --version</code></span><br>
URL: <span class="module-url"><a href="https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software.html">https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software.html</a></span><br>
Versions: <span class="module-version"><em>2.20.0</em></span><br>
  </dd>

  <dt class="module-name">bedops</dt>
  <dd class="module-details">
<strong class="module-help">BEDOPS: The Fast, Highly Scalable and Easily-Parallelizable Genome Analysis Toolkit</strong><br>
<span class="module-description">BEDOPS is an open-source command-line toolkit that performs highly efficient and scalable Boolean and other set operations, statistical calculations, archiving, conversion and other management of genomic data of arbitrary scale. Tasks can be easily split by chromosome for distributing whole-genome analyses across a computational cluster.</span><br>
Example: <span class="module-example"><code>bedops --version</code></span><br>
URL: <span class="module-url"><a href="https://bedops.readthedocs.io/">https://bedops.readthedocs.io/</a>, <a href="https://github.com/bedops/bedops">https://github.com/bedops/bedops</a></span><br>
Versions: <span class="module-version">2.4.36, 2.4.37, 2.4.38, 2.4.39, <em>2.4.40</em></span><br>
  </dd>

  <dt class="module-name">bedtools2</dt>
  <dd class="module-details">
<strong class="module-help">bedtools2: The Swiss Army Knife for Genome Arithmetic</strong><br>
<span class="module-description">Collectively, the bedtools utilities are a swiss-army knife of tools for a wide-range of genomics analysis tasks. The most widely-used tools enable genome arithmetic: that is, set theory on the genome. For example, bedtools allows one to intersect, merge, count, complement, and shuffle genomic intervals from multiple files in widely-used genomic file formats such as BAM, BED, GFF/GTF, VCF.</span><br>
Example: <span class="module-example"><code>bedtools --version</code> and <code>ls $BEDTOOLS2_HOME/genomes/</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/arq5x/bedtools2/">https://github.com/arq5x/bedtools2/</a></span><br>
Versions: <span class="module-version">2.26.0, 2.28.0, 2.29.1, 2.29.2, <em>2.30.0</em></span><br>
  </dd>

  <dt class="module-name">blast</dt>
  <dd class="module-details">
<strong class="module-help">BLAST+: Basic Local Alignment Search Tool</strong><br>
<span class="module-description">BLAST finds regions of similarity between biological sequences. The program compares nucleotide or protein sequences to sequence databases and calculates the statistical significance.</span><br>
Example: <span class="module-example"><code>blastx -version</code></span><br>
URL: <span class="module-url"><a href="https://blast.ncbi.nlm.nih.gov/Blast.cgi">https://blast.ncbi.nlm.nih.gov/Blast.cgi</a></span><br>
Versions: <span class="module-version">2.9.0, 2.10.1, 2.11.0, <em>2.12.0</em></span><br>
  </dd>

  <dt class="module-name">blat</dt>
  <dd class="module-details">
<strong class="module-help">BLAT: Fast Sequence Search Command Line Tool</strong><br>
<span class="module-description">BLAT - client and server combined into a single program, first building the index, then using the index, and then exiting.</span><br>
Example: <span class="module-example"><code>blat</code></span><br>
URL: <span class="module-url"><a href="https://genome.ucsc.edu/goldenPath/help/blatSpec.html">https://genome.ucsc.edu/goldenPath/help/blatSpec.html</a></span><br>
Versions: <span class="module-version"><em>36x4</em></span><br>
  </dd>

  <dt class="module-name">bowtie</dt>
  <dd class="module-details">
<strong class="module-help">Bowtie: A Fast and Sensitive Gapped Read Aligner</strong><br>
<span class="module-description">Bowtie is an ultrafast, memory-efficient short read aligner.</span><br>
Example: <span class="module-example"><code>bowtie --version</code> and <code>ls $BOWTIE_HOME/{genomes,indexes}</code></span><br>
Note: <span class="module-note">This is Bowtie v1 - <em>not v2</em>.</span><br>
URL: <span class="module-url"><a href="http://bowtie-bio.sourceforge.net/index.shtml">http://bowtie-bio.sourceforge.net/index.shtml</a></span><br>
Versions: <span class="module-version">1.2.3, 1.3.0, <em>1.3.1</em></span><br>
  </dd>

  <dt class="module-name">bowtie2</dt>
  <dd class="module-details">
<strong class="module-help">Bowtie 2: A Fast and Sensitive Gapped Read Aligner</strong><br>
<span class="module-description">Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences.</span><br>
Example: <span class="module-example"><code>bowtie2 --version</code></span><br>
URL: <span class="module-url"><a href="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml">http://bowtie-bio.sourceforge.net/bowtie2/index.shtml</a></span><br>
Versions: <span class="module-version">2.3.5, 2.3.5.1, 2.4.1, 2.4.2, 2.4.4, <em>2.4.5</em></span><br>
  </dd>

  <dt class="module-name">bwa</dt>
  <dd class="module-details">
<strong class="module-help">BWA: Burrows-Wheeler Aligner</strong><br>
<span class="module-description">Burrows-Wheeler Aligner (BWA) is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome.</span><br>
Example: <span class="module-example"><code>bwa</code>.</span><br>
URL: <span class="module-url"><a href="http://bio-bwa.sourceforge.net/">http://bio-bwa.sourceforge.net/</a></span><br>
Versions: <span class="module-version"><em>0.7.17</em></span><br>
  </dd>

  <dt class="module-name">byobu</dt>
  <dd class="module-details">
<strong class="module-help">byobu: Elegant Enhancement of the Otherwise Functional, Plain, Practical GNU Screen</strong><br>
<span class="module-description">Byobu is an elegant enhancement of the otherwise functional, plain, practical GNU Screen. Byobu includes an enhanced profile, configuration utilities, and system status notifications for the GNU screen window manager as well as the Tmux terminal multiplexer.</span><br>
Example: <span class="module-example"><code>byobu --version</code>.</span><br>
URL: <span class="module-url"><a href="http://byobu.org">http://byobu.org</a>, <a href="https://github.com/dustinkirkland/byobu">https://github.com/dustinkirkland/byobu</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>5.133</em></span><br>
  </dd>

  <dt class="module-name">CBI-testing</dt>
  <dd class="module-details">
<strong class="module-help">The Computational Biology and Informatics (CBI) Software Repository - TESTING ONLY!</strong><br>
<span class="module-description">This repository provides prototypical environment modules that can change at any time. They will live in this CBI-testing repository until they have proven to work and be stable - only then they will be considered for the main CBI repository.  WARNING: Use at your own risk.</span><br>
URL: <span class="module-url"><a href="http://cbi.ucsf.edu/">http://cbi.ucsf.edu/</a></span><br>
  </dd>

  <dt class="module-name">cellranger</dt>
  <dd class="module-details">
<strong class="module-help">Cell Ranger: 10x Genomics Pipeline for Single-Cell Data Analysis</strong><br>
<span class="module-description">Cell Ranger is a set of analysis pipelines that process Chromium Single Cell 3' RNA-seq output to align reads, generate gene-cell matrices and perform clustering and gene expression analysis.</span><br>
Example: <span class="module-example"><code>cellranger</code>.</span><br>
URL: <span class="module-url"><a href="https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/what-is-cell-ranger">https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/what-is-cell-ranger</a></span><br>
Warning: <span class="module-warning">To prevent a single Cell Ranger process from hijacking all CPU and RAM by default, this module sets environment variable <code>MROFLAGS='--localcores=1 --localmem=8 --limit-loadavg'</code> making those the default.</span><br>
Versions: <span class="module-version">2.1.0, 3.0.2, 3.1.0, 4.0.0, 5.0.1, 6.1.1, <em>6.1.2</em></span><br>
  </dd>

  <dt class="module-name">cmake</dt>
  <dd class="module-details">
<strong class="module-help">CMake: Open-source, Cross-platform Family of Tools Designed to Build, Test and Package Software</strong><br>
<span class="module-description">CMake is cross-platform free and open-source software for managing the build process of software using a compiler-independent method. It supports directory hierarchies and applications that depend on multiple libraries.</span><br>
Example: <span class="module-example"><code>cmake --version</code>.</span><br>
URL: <span class="module-url"><a href="https://cmake.org/">https://cmake.org/</a>, <a href="https://github.com/Kitware/CMake/releases">https://github.com/Kitware/CMake/releases</a></span><br>
Versions: <span class="module-version">3.18.2, 3.19.2, <em>3.22.2</em></span><br>
  </dd>

  <dt class="module-name">control-freec</dt>
  <dd class="module-details">
<strong class="module-help">Control FREEC: Control-FREE Copy Number and Genotype Caller</strong><br>
<span class="module-description">Prediction of copy numbers and allelic content using deep-sequencing data.</span><br>
Example: <span class="module-example"><code>freec</code>.</span><br>
URL: <span class="module-url"><a href="http://boevalab.com/FREEC/">http://boevalab.com/FREEC/</a>, <a href="https://github.com/BoevaLab/FREEC/">https://github.com/BoevaLab/FREEC/</a></span><br>
Versions: <span class="module-version">11.5, <em>11.6</em></span><br>
  </dd>

  <dt class="module-name">cufflinks</dt>
  <dd class="module-details">
<strong class="module-help">Cufflinks: Transcriptome Assembly and Differential Expression Analysis for RNA-Seq</strong><br>
<span class="module-description">Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples. It accepts aligned RNA-Seq reads and assembles the alignments into a parsimonious set of transcripts. Cufflinks then estimates the relative abundances of these transcripts based on how many reads support each one, taking into account biases in library preparation protocols.</span><br>
Example: <span class="module-example"><code>cufflinks</code>.</span><br>
URL: <span class="module-url"><a href="http://cole-trapnell-lab.github.io/cufflinks/">http://cole-trapnell-lab.github.io/cufflinks/</a>, <a href="https://github.com/cole-trapnell-lab/cufflinks">https://github.com/cole-trapnell-lab/cufflinks</a></span><br>
Versions: <span class="module-version"><em>2.2.1</em></span><br>
  </dd>

  <dt class="module-name">easycatfs</dt>
  <dd class="module-details">
<strong class="module-help">easycatfs: Easy Read-Only Mounting of Slow Folders onto a Local Drive</strong><br>
<span class="module-description">This is Linux command-line tool for mounting one or more folders on a network file system on a local disk such that the local-disk folders mirrors everything (read-only) on the network folder. This will result in (i) faster repeated access to files, and (ii) decreased load on the network file system. This is particularly beneficial when working on high-performance compute (HPC) clusters used by hundreds and thousands of processes and users simultaneously..</span><br>
Example: <span class="module-example"><code>easycatfs --help</code> and <code>easycatfs mount /shared/data</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/HenrikBengtsson/easycatfs">https://github.com/HenrikBengtsson/easycatfs</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">0.1.2, 0.1.3, 0.1.4, <em>0.1.5</em></span><br>
  </dd>

  <dt class="module-name">emacs</dt>
  <dd class="module-details">
<strong class="module-help">GNU Emacs: An Extensible, Customizable, Free/Libre Text Editor</strong><br>
<span class="module-description">At its core is an interpreter for Emacs Lisp, a dialect of the Lisp programming language with extensions to support text editing.</span><br>
Example: <span class="module-example"><code>emacs --version</code> and <code>emacs -nw</code>.</span><br>
URL: <span class="module-url"><a href="https://www.gnu.org/software/emacs/">https://www.gnu.org/software/emacs/</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">26.3, 27.1, <em>27.2</em></span><br>
  </dd>

  <dt class="module-name">fastqc</dt>
  <dd class="module-details">
<strong class="module-help">FastQC: A Quality Control Analysis Tool for High Throughput Sequencing Data</strong><br>
<span class="module-description">FastQC is a program designed to spot potential problems in high througput sequencing datasets. It runs a set of analyses on one or more raw sequence files in fastq or bam format and produces a report which summarises the results.</span><br>
Example: <span class="module-example"><code>fastqc --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc">https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc</a>, <a href="https://github.com/s-andrews/FastQC/">https://github.com/s-andrews/FastQC/</a></span><br>
Versions: <span class="module-version">0.11.8, <em>0.11.9</em></span><br>
  </dd>

  <dt class="module-name">fzf</dt>
  <dd class="module-details">
<strong class="module-help">fzf - A Command-Line Fuzzy Finder</strong><br>
<span class="module-description">fzf is a general-purpose command-line fuzzy finder. It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.</span><br>
Example: <span class="module-example"><code>fzf --version</code> and <code>emacs &quot;$(fzf)&quot;</code>.</span><br>
Note: <span class="module-note">To install tab completions and key bindinds to your shell, call <code>$FZF_HOME/install</code>. To uninstall, use <code>$FZF_HOME/uninstall</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/junegunn/fzf">https://github.com/junegunn/fzf</a>, <a href="https://github.com/junegunn/fzf/wiki">https://github.com/junegunn/fzf/wiki</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">0.22.0, 0.25.1, 0.27.2, <em>0.29.0</em></span><br>
  </dd>

  <dt class="module-name">gatk</dt>
  <dd class="module-details">
<strong class="module-help">Genome Analysis Toolkit (GATK): Variant Discovery in High-Throughput Sequencing Data</strong><br>
<span class="module-description">Developed in the Data Sciences Platform at the Broad Institute, the toolkit offers a wide variety of tools with a primary focus on variant discovery and genotyping. Its powerful processing engine and high-performance computing features make it capable of taking on projects of any size.</span><br>
Example: <span class="module-example"><code>gatk --help</code> and <code>gatk --list</code>.</span><br>
URL: <span class="module-url"><a href="https://software.broadinstitute.org/gatk/">https://software.broadinstitute.org/gatk/</a>, <a href="https://github.com/broadinstitute/gatk">https://github.com/broadinstitute/gatk</a>, <a href="https://github.com/broadgsa/gatk">https://github.com/broadgsa/gatk</a>, <a href="https://console.cloud.google.com/storage/browser/gatk-software/package-archive">https://console.cloud.google.com/storage/browser/gatk-software/package-archive</a>, <a href="ftp://ftp.broadinstitute.org/pub/gsa/GenomeAnalysisTK/">ftp://ftp.broadinstitute.org/pub/gsa/GenomeAnalysisTK/</a></span><br>
Versions: <span class="module-version">4.1.0.0, 4.1.2.0, 4.1.3.0, 4.1.4.0, 4.1.6.0, 4.1.7.0, 4.1.9.0, 4.2.2.0, <em>4.2.4.1</em></span><br>
  </dd>

  <dt class="module-name">gcta</dt>
  <dd class="module-details">
<strong class="module-help">GCTA: Genome-wide Complex Trait Analysis</strong><br>
<span class="module-description">A tool for Genome-wide Complex Trait Analysis (GCTA).</span><br>
Example: <span class="module-example"><code>gcta64</code>.</span><br>
URL: <span class="module-url"><a href="http://cnsgenomics.com/software/gcta/">http://cnsgenomics.com/software/gcta/</a></span><br>
Versions: <span class="module-version">1.26.0, 1.92.3beta3, 1.92.4beta, <em>1.93.2beta</em></span><br>
  </dd>

  <dt class="module-name">gdal</dt>
  <dd class="module-details">
<strong class="module-help">GDAL: Geospatial Data Abstraction Library</strong><br>
<span class="module-description">GDAL is an open source X/MIT licensed translator library for raster and vector geospatial data formats.</span><br>
Example: <span class="module-example"><code>gdalinfo --version</code></span><br>
URL: <span class="module-url"><a href="https://gdal.org/">https://gdal.org/</a>, <a href="https://github.com/OSGeo/gdal">https://github.com/OSGeo/gdal</a></span><br>
Versions: <span class="module-version">2.4.3, <em>2.4.4</em></span><br>
  </dd>

  <dt class="module-name">geos</dt>
  <dd class="module-details">
<strong class="module-help">GEOS: Geometry Engine, Open Source</strong><br>
<span class="module-description">GEOS (Geometry Engine - Open Source) is a C++ port of the JTS Topology Suite (JTS). It aims to contain the complete functionality of JTS in C++. This includes all the OpenGIS Simple Features for SQL spatial predicate functions and spatial operators, as well as specific JTS enhanced functions. GEOS provides spatial functionality to many other projects and products.</span><br>
Example: <span class="module-example"><code>geos-config --version</code>.</span><br>
URL: <span class="module-url"><a href="https://trac.osgeo.org/geos/">https://trac.osgeo.org/geos/</a></span><br>
Versions: <span class="module-version">3.5.2, 3.7.3, 3.8.1, <em>3.9.1</em></span><br>
  </dd>

  <dt class="module-name">gistic2</dt>
  <dd class="module-details">
<strong class="module-help">GISTIC2: Genomic Identification of Significant Targets in Cancer (GISTIC), version 2</strong><br>
<span class="module-description">GISTIC2.0 facilitates sensitive and confident localization of the targets of focal somatic copy-number alteration in human cancers.</span><br>
Example: <span class="module-example"><code>gistic2</code>.</span><br>
URL: <span class="module-url"><a href="https://software.broadinstitute.org/cancer/cga/gistic">https://software.broadinstitute.org/cancer/cga/gistic</a>, <a href="https://github.com/broadinstitute/gistic2">https://github.com/broadinstitute/gistic2</a>, <a href="https://www.genepattern.org/modules/docs/GISTIC_2.0/7">https://www.genepattern.org/modules/docs/GISTIC_2.0/7</a></span><br>
Versions: <span class="module-version"><em>2.0.23</em></span><br>
  </dd>

  <dt class="module-name">git-flow</dt>
  <dd class="module-details">
<strong class="module-help">git-flow: Git Extension Git Flow (AVH Edition)</strong><br>
<span class="module-description">A collection of Git extensions to provide high-level repository operations for Vincent Driessen's branching model.</span><br>
Example: <span class="module-example"><code>git flow</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/petervanderdoes/gitflow-avh">https://github.com/petervanderdoes/gitflow-avh</a>, <a href="https://github.com/nvie/gitflow">https://github.com/nvie/gitflow</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>1.12.3</em></span><br>
  </dd>

  <dt class="module-name">glow</dt>
  <dd class="module-details">
<strong class="module-help">glow: Render Markdown on the CLI, with Pizzazz!</strong><br>
<span class="module-description">Glow is a terminal based markdown reader designed from the ground up to bring out the beauty—and power—of the CLI.  Use it to discover markdown files, read documentation directly on the command line and stash markdown files to your own private collection so you can read them anywhere. Glow will find local markdown files in subdirectories or a local Git repository.</span><br>
Example: <span class="module-example"><code>glow README.md</code>, <code>glow --pager README.md</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/charmbracelet/glow">https://github.com/charmbracelet/glow</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">1.3.0, <em>1.4.1</em></span><br>
  </dd>

  <dt class="module-name">gsl</dt>
  <dd class="module-details">
<strong class="module-help">GSL: Gnu Scientific Library</strong><br>
<span class="module-description">The GNU Scientific Library (GSL) is a numerical library for C and C++ programmers. It is free software under the GNU General Public License. The library provides a wide range of mathematical routines such as random number generators, special functions and least-squares fitting. There are over 1000 functions in total with an extensive test suite.</span><br>
Example: <span class="module-example"><code>gsl-config --version</code></span><br>
URL: <span class="module-url"><a href="https://www.gnu.org/software/gsl/">https://www.gnu.org/software/gsl/</a></span><br>
Versions: <span class="module-version">2.6, <em>2.7</em></span><br>
  </dd>

  <dt class="module-name">hdf5</dt>
  <dd class="module-details">
<strong class="module-help">hdf5: A General Purpose Library and File Format for Storing Scientific Data</strong><br>
<span class="module-description">Hierarchical Data Format (HDF) is a set of file formats (HDF4, HDF5) designed to store and organize large amounts of data. The HDF5 format is designed to address some of the limitations of the HDF4 library, and to address current and anticipated requirements of modern systems and applications.</span><br>
Example: <span class="module-example"><code>h5stat --version</code></span><br>
URL: <span class="module-url"><a href="https://www.hdfgroup.org/downloads/hdf5/">https://www.hdfgroup.org/downloads/hdf5/</a></span><br>
Versions: <span class="module-version">1.10.6, 1.12.0, <em>1.12.1</em></span><br>
  </dd>

  <dt class="module-name">hisat2</dt>
  <dd class="module-details">
<strong class="module-help">HISAT2: Graph-based Alignment of Next Generation Sequencing Reads to a Population of Genomes</strong><br>
<span class="module-description">HISAT2 is a fast and sensitive alignment program for mapping next-generation sequencing reads (both DNA and RNA) to a population of human genomes (as well as to a single reference genome). Based on an extension of BWT for graphs [Sirén et al. 2014], we designed and implemented a graph FM index (GFM), an original approach and its first implementation to the best of our knowledge. In addition to using one global GFM index that represents a population of human genomes, HISAT2 uses a large set of small GFM indexes that collectively cover the whole genome (each index representing a genomic region of 56 Kbp, with 55,000 indexes needed to cover the human population). These small indexes (called local indexes), combined with several alignment strategies, enable rapid and accurate alignment of sequencing reads. This new indexing scheme is called a Hierarchical Graph FM index (HGFM).</span><br>
Example: <span class="module-example"><code>hisat2 --version</code>.</span><br>
URL: <span class="module-url"><a href="https://daehwankimlab.github.io/hisat2/">https://daehwankimlab.github.io/hisat2/</a>, <a href="https://github.com/DaehwanKimLab/hisat2/">https://github.com/DaehwanKimLab/hisat2/</a></span><br>
Versions: <span class="module-version">2.1.0, <em>2.2.0</em></span><br>
  </dd>

  <dt class="module-name">htop</dt>
  <dd class="module-details">
<strong class="module-help">htop: An Interactive Process Viewer for Unix</strong><br>
<span class="module-description"><code>htop</code> is an interactive process viewer for Unix systems. It is a text-mode application (for console or X terminals) and requires ncurses.</span><br>
Example: <span class="module-example"><code>htop</code>.</span><br>
URL: <span class="module-url"><a href="https://htop.dev">https://htop.dev</a>, <a href="https://github.com/htop-dev/htop">https://github.com/htop-dev/htop</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">3.0.4, 3.0.5, 3.1.0, <em>3.1.2</em></span><br>
  </dd>

  <dt class="module-name">htslib</dt>
  <dd class="module-details">
<strong class="module-help">HTSlib: C Library for High-Throughput Sequencing Data Formats</strong><br>
<span class="module-description">HTSlib is an implementation of a unified C library for accessing common file formats, such as SAM, CRAM and VCF, used for high-throughput sequencing data, and is the core library used by samtools and bcftools. HTSlib also provides the bgzip, htsfile, and tabix utilities.</span><br>
Example: <span class="module-example"><code>bgzip --version</code>, <code>htsfile --version</code>, and <code>tabix --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.htslib.org/">https://www.htslib.org/</a>, <a href="https://github.com/samtools/htslib">https://github.com/samtools/htslib</a></span><br>
Versions: <span class="module-version">1.9, 1.10.2, 1.11, 1.13, <em>1.14</em></span><br>
  </dd>

  <dt class="module-name">htstools</dt>
  <dd class="module-details">
<strong class="module-help">htstools: Tools to Process BAM Files for Downstream Copy-Number Analysis</strong><br>
<span class="module-description">Contains three tools (dnafrags, ppflag-fixer, snp-pileup) written by Alex Studer to process bam files for downstream copy number analysis.</span><br>
Example: <span class="module-example"><code>snp-pileup --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/mskcc/htstools">https://github.com/mskcc/htstools</a></span><br>
Versions: <span class="module-version"><em>0.1.1</em></span><br>
  </dd>

  <dt class="module-name">igv</dt>
  <dd class="module-details">
<strong class="module-help">IGV: The Integrative Genomics Viewer</strong><br>
<span class="module-description">The Integrative Genomics Viewer (IGV) is a high-performance visualization tool for interactive exploration of large, integrated genomic datasets. It supports a wide variety of data types, including array-based and next-generation sequence data, and genomic annotations.</span><br>
Example: <span class="module-example"><code>igv</code>.</span><br>
Note: <span class="module-note">IGV (&gt;= 2.5.0) requires Java 11. Coincidentally, <code>igvtools</code> is integrated with IGV (&gt;= 2.5.0).</span><br>
URL: <span class="module-url"><a href="https://software.broadinstitute.org/software/igv/">https://software.broadinstitute.org/software/igv/</a>, <a href="https://software.broadinstitute.org/software/igv/download">https://software.broadinstitute.org/software/igv/download</a></span><br>
Versions: <span class="module-version">2.4.19, 2.7.0, 2.7.2, 2.8.2, 2.8.6, 2.8.13, 2.9.1, 2.11.0, <em>2.11.9</em></span><br>
  </dd>

  <dt class="module-name">igvtools</dt>
  <dd class="module-details">
<strong class="module-help">IGVTools: Tools for Pre-processing HT-Seq Data Files</strong><br>
<span class="module-description">The igvtools utility provides a set of tools for pre-processing data files. Note, <code>igvtools</code> moved to IGV as of IGV (&gt;= 2.5.0).</span><br>
Example: <span class="module-example"><code>igvtools help</code>.</span><br>
URL: <span class="module-url"><a href="https://software.broadinstitute.org/software/igv/igvtools">https://software.broadinstitute.org/software/igv/igvtools</a></span><br>
Versions: <span class="module-version"><em>2.4.19</em></span><br>
  </dd>

  <dt class="module-name">jags</dt>
  <dd class="module-details">
<strong class="module-help">JAGS: Just Another Gibbs Sampler</strong><br>
<span class="module-description">JAGS is Just Another Gibbs Sampler.  It is a program for analysis of Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation not wholly unlike BUGS.</span><br>
Example: <span class="module-example"><code>jags</code> and <code>man jags</code>.</span><br>
URL: <span class="module-url"><a href="http://mcmc-jags.sourceforge.net/">http://mcmc-jags.sourceforge.net/</a></span><br>
Versions: <span class="module-version"><em>4.3.0</em></span><br>
  </dd>

  <dt class="module-name">kallisto</dt>
  <dd class="module-details">
<strong class="module-help">kallisto: Near-optimal RNA-Seq Quantification</strong><br>
<span class="module-description">kallisto is a program for quantifying abundances of transcripts from RNA-Seq data, or more generally of target sequences using high-throughput sequencing reads. It is based on the novel idea of pseudoalignment for rapidly determining the compatibility of reads with targets, without the need for alignment.</span><br>
Example: <span class="module-example"><code>kallisto version</code>.</span><br>
URL: <span class="module-url"><a href="https://pachterlab.github.io/kallisto/about.html">https://pachterlab.github.io/kallisto/about.html</a>, <a href="https://github.com/pachterlab/kallisto">https://github.com/pachterlab/kallisto</a></span><br>
Versions: <span class="module-version">0.45.0, 0.45.1, 0.46.0, 0.46.1, <em>0.46.2</em></span><br>
  </dd>

  <dt class="module-name">mc</dt>
  <dd class="module-details">
<strong class="module-help">mc: Midnight Commander</strong><br>
<span class="module-description">GNU Midnight Commander is a visual file manager. It's a feature rich full-screen text mode application that allows you to copy, move and delete files and whole directory trees, search for files and run commands in the subshell. Internal viewer and editor are included.</span><br>
Example: <span class="module-example"><code>mc</code> and <code>mc --version</code>.</span><br>
URL: <span class="module-url"><a href="http://www.midnight-commander.org/">http://www.midnight-commander.org/</a>, <a href="https://github.com/MidnightCommander/mc">https://github.com/MidnightCommander/mc</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">4.8.26, <em>4.8.27</em></span><br>
  </dd>

  <dt class="module-name">mutect</dt>
  <dd class="module-details">
<strong class="module-help">muTect: Identification of Somatic Point Mutations in Next Generation Sequencing Data of Cancer Genomes</strong><br>
<span class="module-description">MuTect is a method developed at the Broad Institute for the reliable and accurate identification of somatic point mutations in next generation sequencing data of cancer genomes.</span><br>
Example: <span class="module-example"><code>mutect</code>, which is short for <code>java -Xmx2g -jar &quot;$MUTECT_JAR&quot;</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/broadinstitute/mutect">https://github.com/broadinstitute/mutect</a>, <a href="https://software.broadinstitute.org/cancer/cga/mutect">https://software.broadinstitute.org/cancer/cga/mutect</a></span><br>
Versions: <span class="module-version">1.1.1, 1.1.4, <em>1.1.5</em></span><br>
  </dd>

  <dt class="module-name">pandoc</dt>
  <dd class="module-details">
<strong class="module-help">Pandoc: A Universal Document Converter</strong><br>
<span class="module-description">Pandoc is a Haskell library and software tool for converting from one markup format to another, and a command-line tool that uses this library.</span><br>
Example: <span class="module-example"><code>pandoc --version</code>.</span><br>
URL: <span class="module-url"><a href="https://pandoc.org/">https://pandoc.org/</a>, <a href="https://github.com/jgm/pandoc">https://github.com/jgm/pandoc</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">2.11.4, 2.14.2, <em>2.16.2</em></span><br>
  </dd>

  <dt class="module-name">picard</dt>
  <dd class="module-details">
<strong class="module-help">Picard: Command-line tools for Manipulating High-throughput Sequencing Data and Formats</strong><br>
<span class="module-description">Picard is a set of command line tools for manipulating high-throughput sequencing (HTS) data and formats such as SAM/BAM/CRAM and VCF.</span><br>
Example: <span class="module-example"><code>picard -h</code>, which is an alias for <code>java -jar $PICARD_HOME/picard.jar -h</code></span><br>
URL: <span class="module-url"><a href="http://broadinstitute.github.io/picard/">http://broadinstitute.github.io/picard/</a>, <a href="https://github.com/broadinstitute/picard">https://github.com/broadinstitute/picard</a></span><br>
Versions: <span class="module-version">2.21.1, 2.21.4, 2.22.2, 2.23.1, 2.24.0, 2.26.2, <em>2.26.10</em></span><br>
  </dd>

  <dt class="module-name">pindel</dt>
  <dd class="module-details">
<strong class="module-help">pindel: Detection of Indels and Structural Variations</strong><br>
<span class="module-description">Pindel can detect breakpoints of large deletions, medium sized insertions, inversions, tandem duplications and other structural variants at single-based resolution from next-gen sequence data. It uses a pattern growth approach to identify the breakpoints of these variants from paired-end short reads.</span><br>
Example: <span class="module-example"><code>pindel</code>.</span><br>
URL: <span class="module-url"><a href="https://www.sanger.ac.uk/science/tools/pindel">https://www.sanger.ac.uk/science/tools/pindel</a>, <a href="https://github.com/genome/pindel">https://github.com/genome/pindel</a></span><br>
Versions: <span class="module-version"><em>0.2.5b8</em></span><br>
  </dd>

  <dt class="module-name">plink</dt>
  <dd class="module-details">
<strong class="module-help">PLINK: Whole Genome Association Analysis Toolset</strong><br>
<span class="module-description">PLINK is a free, open-source whole genome association analysis toolset, designed to perform a range of basic, large-scale analyses in a computationally efficient manner. The focus of PLINK is purely on analysis of genotype/phenotype data, so there is no support for steps prior to this (e.g. study design and planning, generating genotype or CNV calls from raw data).</span><br>
Example: <span class="module-example"><code>plink --help</code>.</span><br>
URL: <span class="module-url"><a href="https://www.cog-genomics.org/plink/">https://www.cog-genomics.org/plink/</a></span><br>
Versions: <span class="module-version">1.07, 1.90b6.10, 1.90b6.16, 1.90b6.18, 1.90b6.21, <em>1.90b6.24</em></span><br>
  </dd>

  <dt class="module-name">plink2</dt>
  <dd class="module-details">
<strong class="module-help">PLINK2: Whole Genome Association Analysis Toolset</strong><br>
<span class="module-description">PLINK is a free, open-source whole genome association analysis toolset, designed to perform a range of basic, large-scale analyses in a computationally efficient manner. The focus of PLINK is purely on analysis of genotype/phenotype data, so there is no support for steps prior to this (e.g. study design and planning, generating genotype or CNV calls from raw data).</span><br>
Example: <span class="module-example"><code>plink2 --help</code>.</span><br>
URL: <span class="module-url"><a href="https://www.cog-genomics.org/plink/2.0/">https://www.cog-genomics.org/plink/2.0/</a>, <a href="https://github.com/chrchang/plink-ng">https://github.com/chrchang/plink-ng</a></span><br>
Versions: <span class="module-version">2.00a2LM, 2.00a2.3, <em>2.00a3LM</em></span><br>
  </dd>

  <dt class="module-name">proj</dt>
  <dd class="module-details">
<strong class="module-help">PROJ: PROJ Coordinate Transformation Software Library</strong><br>
<span class="module-description">PROJ is a generic coordinate transformation software that transforms geospatial coordinates from one coordinate reference system (CRS) to another. This includes cartographic projections as well as geodetic transformations. PROJ includes command line applications for easy conversion of coordinates from text files or directly from user input. In addition to the command line utilities PROJ also exposes an application programming interface, or API in short. The API lets developers use the functionality of PROJ in their own software without having to implement similar functionality themselves.</span><br>
Example: <span class="module-example"><code>geod</code>, <code>proj</code> and <code>man proj</code>.</span><br>
URL: <span class="module-url"><a href="https://proj.org/">https://proj.org/</a></span><br>
Versions: <span class="module-version"><em>4.9.3</em></span><br>
  </dd>

  <dt class="module-name">qtop</dt>
  <dd class="module-details">
<strong class="module-help">qtop: Monitor the State of Queueing Systems, Along with Related Information Relevant on HPC &amp; Grid Clusters</strong><br>
<span class="module-description"><code>qtop</code> (pronounced queue-top) is a tool written in order to monitor the state of Queueing Systems, along with related information relevant on HPC &amp; grid clusters. At present it supports PBS, SGE &amp; OAR families. Please help to increase that list in the Python version of the tool, qtop.py!</span><br>
Example: <span class="module-example"><code>qtop</code> and <code>qtop -FGW</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/qtop/qtop">https://github.com/qtop/qtop</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>0.9.20161222</em></span><br>
  </dd>

  <dt class="module-name">r</dt>
  <dd class="module-details">
<strong class="module-help">R: The R Programming Language</strong><br>
<span class="module-description">The R programming language.</span><br>
Example: <span class="module-example"><code>R --version</code> and <code>Rscript --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.r-project.org/">https://www.r-project.org/</a></span><br>
Versions: <span class="module-version">2.12.2, 2.13.0, 2.14.0, 2.15.0, 3.0.0, 3.1.0, 3.2.0, 3.3.0, 3.4.0, 3.5.0, 3.5.3, 3.6.0, 3.6.1, 3.6.2, 3.6.3, 4.0.0, 4.0.1, 4.0.2, 4.0.3, 4.0.4, 4.0.5, 4.1.0-gcc8, 4.1.1-gcc8, <em>4.1.2-gcc8</em></span><br>
  </dd>

  <dt class="module-name">r-siteconfig</dt>
  <dd class="module-details">
<strong class="module-help">R Site Configuration: Tweaks to R for the Current Compute Environment</strong><br>
<span class="module-description">Sets R options and environment variables customized for the current compute environment. Notably, it configures R to install packages from local CRAN and Bioconductor mirrors without the need for internet access.</span><br>
Example: <span class="module-example">In R, <code>install.packages(&quot;ggplot2&quot;)</code>.</span><br>
Versions: <span class="module-version">0.1, <em>0.2</em></span><br>
  </dd>

  <dt class="module-name">rclone</dt>
  <dd class="module-details">
<strong class="module-help">rclone: Rsync for Cloud Storage and More</strong><br>
<span class="module-description">Rclone is a command line program to sync files and directories to and from a large number of end points on the local file system, or remote file systems, and in the cloud.</span><br>
Example: <span class="module-example"><code>rclone --version</code>, <code>rclone --help</code>, <code>rclone config</code>, and <code>info rclone</code>.</span><br>
URL: <span class="module-url"><a href="https://rclone.org/">https://rclone.org/</a>, <a href="https://github.com/rclone/rclone">https://github.com/rclone/rclone</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">1.53.3, 1.54.0, 1.56.1, <em>1.57.0</em></span><br>
  </dd>

  <dt class="module-name">ripgrep</dt>
  <dd class="module-details">
<strong class="module-help">ripgrep - Recursively Searches Directories for a Regex Pattern</strong><br>
<span class="module-description">ripgrep is a line-oriented search tool that recursively searches your current directory for a regex pattern. By default, ripgrep will respect your .gitignore and automatically skip hidden files/directories and binary files. ripgrep is similar to other popular search tools like The Silver Searcher, ack and grep.</span><br>
Example: <span class="module-example"><code>rg --version</code> and <code>rg -i 'lorem ipsum'</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/BurntSushi/ripgrep">https://github.com/BurntSushi/ripgrep</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">12.1.1, <em>13.0.0</em></span><br>
  </dd>

  <dt class="module-name">rstudio</dt>
  <dd class="module-details">
<strong class="module-help">rstudio: RStudio Desktop</strong><br>
<span class="module-description">The RStudio Desktop is an integrated development environment (IDE) for R, a programming language for statistical computing and graphics.</span><br>
Example: <span class="module-example"><code>rstudio</code>.  If you get blank window, retry with <code>QMLSCENE_DEVICE=softwarecontext rstudio</code>.</span><br>
URL: <span class="module-url"><a href="https://rstudio.com/products/rstudio/#rstudio-desktop">https://rstudio.com/products/rstudio/#rstudio-desktop</a>, <a href="https://www.rstudio.com/products/rstudio/release-notes/">https://www.rstudio.com/products/rstudio/release-notes/</a>, <a href="https://www.rstudio.com/products/rstudio/download/">https://www.rstudio.com/products/rstudio/download/</a></span><br>
Warning: <span class="module-warning">This software works only on the development nodes. It requires a connection with X11 Forwarding enabled. It does <em>not</em> work with X2Go (gives error &quot;GLX 1.3 or later is required&quot;). For best performance, use SSH compression when using X11 Forwarding, i.e. <code>ssh -X -C ...</code>.</span><br>
Versions: <span class="module-version">1.4.1103, 1.4.1717, 2021.09.0+351, 2021.09.1-372, <em>2021.09.2-382</em></span><br>
  </dd>

  <dt class="module-name">rstudio-server</dt>
  <dd class="module-details">
<strong class="module-help">RStudio Server: The RStudio Server</strong><br>
<span class="module-description">The RStudio Server is an integrated development environment (IDE) for R that can be used from the web browser.</span><br>
Example: <span class="module-example"><code>rserver</code>.</span><br>
URL: <span class="module-url"><a href="https://rstudio.com/products/rstudio/#rstudio-server">https://rstudio.com/products/rstudio/#rstudio-server</a>, <a href="https://www.rstudio.com/products/rstudio/release-notes/">https://www.rstudio.com/products/rstudio/release-notes/</a></span><br>
Warning: <span class="module-warning">This is work under construction!</span><br>
Versions: <span class="module-version"><em>2021.09.2-382</em></span><br>
  </dd>

  <dt class="module-name">rstudio-server-controller</dt>
  <dd class="module-details">
<strong class="module-help">RSC: An RStudio Server Controller</strong><br>
<span class="module-description">The RStudio Server Controller (RSC) is a tool for launching a personal instance of the RStudio Server on a Linux machine, which then can be access via the web browser, either directly or via SSH tunneling.</span><br>
Example: <span class="module-example"><code>rsc --help</code> and <code>rsc start --port=random</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/UCSF-CBI/rstudio-server-controller">https://github.com/UCSF-CBI/rstudio-server-controller</a></span><br>
Warning: <span class="module-warning">This is work under construction!</span><br>
Versions: <span class="module-version"><em>0.3.0</em></span><br>
  </dd>

  <dt class="module-name">salmon</dt>
  <dd class="module-details">
<strong class="module-help">salmon: Salmon Provides Fast and Bias-Aware Quantification of Transcript Expression</strong><br>
<span class="module-description">Highly-accurate &amp; wicked fast transcript-level quantification from RNA-seq reads using selective alignment.</span><br>
Example: <span class="module-example"><code>salmon --version</code>.</span><br>
URL: <span class="module-url"><a href="https://combine-lab.github.io/salmon/">https://combine-lab.github.io/salmon/</a>, <a href="https://github.com/COMBINE-lab/salmon">https://github.com/COMBINE-lab/salmon</a></span><br>
Versions: <span class="module-version">1.3.0, 1.4.0, 1.5.2, <em>1.6.0</em></span><br>
  </dd>

  <dt class="module-name">samtools</dt>
  <dd class="module-details">
<strong class="module-help">SAMtools: Tools (written in C using htslib) for Manipulating Next-Generation Sequencing Data</strong><br>
<span class="module-description">SAMtools is a suite of programs for interacting with high-throughput sequencing data.</span><br>
Example: <span class="module-example"><code>samtools --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.htslib.org/">https://www.htslib.org/</a>, <a href="https://github.com/samtools/samtools">https://github.com/samtools/samtools</a></span><br>
Versions: <span class="module-version">1.9, 1.10, 1.11, 1.13, <em>1.14</em></span><br>
  </dd>

  <dt class="module-name">scl-devtoolset</dt>
  <dd class="module-details">
<strong class="module-help">SCL Developer Toolset: GNU Compiler Collection, GNU Debugger, etc.</strong><br>
<span class="module-description">These Developer Toolset provides modern versions of the GNU Compiler Collection, GNU Debugger, and other development, debugging, and performance monitoring tools. Loading these modules enables the corresponding CentOS Software Collection (SCL) <code>devtoolset-&lt;version&gt;</code> in the current environment.  This is an alternative to calling <code>source scl_source enable devtoolset-&lt;version&gt;</code>, which is an approach that is not officially supported by RedHat/CentOS.</span><br>
Example: <span class="module-example"><code>gcc --version</code>.</span><br>
URL: <span class="module-url"><a href="https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/10">https://access.redhat.com/documentation/en-us/red_hat_developer_toolset/10</a></span><br>
Warning: <span class="module-warning">Older versions may be removed in the future.</span><br>
Versions: <span class="module-version">4, 7, 8, 9, <em>10</em></span><br>
  </dd>

  <dt class="module-name">scl-python (part of CBI-testing)</dt>
  <dd class="module-details">
<strong class="module-help">SCL Python: Python with Additional Utilities via CentOS Software Collections [DEPRECATED]</strong><br>
<span class="module-description">Enables the CentOS Software Collection (SCL) <code>rh-python36</code> in the current environment.  This is an alternative to calling <code>source scl_source enable rh-python36</code>, which is not officially supported by RedHat/CentOS.</span><br>
Example: <span class="module-example"><code>python --version</code> and <code>pip --version</code>.</span><br>
URL: <span class="module-url"><a href="https://www.softwarecollections.org/en/scls/rhscl/rh-python36/">https://www.softwarecollections.org/en/scls/rhscl/rh-python36/</a></span><br>
Warning: <span class="module-warning">This module is DEPRECATED and should no longer be used because Python SCLs are deprecated, which in turn is because Python 3 is now available directly by CentOS.</span><br>
Versions: <span class="module-version">3.3, 3.4, <em>3.6</em></span><br>
    Note: <em>To use this module, call <code>module load CBI CBI-testing</code> first.</em>
  </dd>

  <dt class="module-name">scl-rh-ruby</dt>
  <dd class="module-details">
<strong class="module-help">SCL Ruby: Ruby</strong><br>
<span class="module-description">Enables the CentOS Software Collection (SCL) <code>rh-ruby30</code> in the current environment.  This is an alternative to calling <code>source scl_source enable rh-ruby30</code>, which is an approach that is not of ficially supported by RedHat/CentOS.</span><br>
Example: <span class="module-example"><code>irb --help</code>, <code>ruby --help</code>, <code>ruby script.rb</code>.</span><br>
URL: <span class="module-url"><a href="https://www.softwarecollections.org/en/scls/rhscl/rh-ruby30/">https://www.softwarecollections.org/en/scls/rhscl/rh-ruby30/</a></span><br>
Versions: <span class="module-version">25, 26, 27, <em>30</em></span><br>
  </dd>

  <dt class="module-name">shellcheck</dt>
  <dd class="module-details">
<strong class="module-help">ShellCheck: A Shell Script Static Analysis Tool</strong><br>
<span class="module-description">ShellCheck finds bugs in your shell scripts.</span><br>
Example: <span class="module-example"><code>shellcheck --version</code> and <code>shellcheck -x ~/.bashrc</code>.</span><br>
URL: <span class="module-url"><a href="https://www.shellcheck.net/">https://www.shellcheck.net/</a>, <a href="https://github.com/koalaman/shellcheck/">https://github.com/koalaman/shellcheck/</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version">0.7.1, 0.7.2, <em>0.8.0</em></span><br>
  </dd>

  <dt class="module-name">snpeff</dt>
  <dd class="module-details">
<strong class="module-help">SnpEff: Genetic Variant Annotation and Effect Prediction Toolbox</strong><br>
<span class="module-description">SnpEff is a variant annotation and effect prediction tool. It annotates and predicts the effects of variants on genes (such as amino acid changes).</span><br>
Example: <span class="module-example"><code>snpEff -help</code>, <code>SnpSift -help</code>,  and <code>ClinEff -help</code>, which are aliases for <code>java -jar $SNPEFF_HOME/snpEff/snpEff.jar -help</code>, <code>java -jar $SNPEFF_HOME/snpEff/SnpSift.jar -help</code>, and <code>java -jar $SNPEFF_HOME/clinEff/ClinEff.jar -help</code>.</span><br>
URL: <span class="module-url"><a href="http://snpeff.sourceforge.net/">http://snpeff.sourceforge.net/</a></span><br>
Versions: <span class="module-version">4.3t, 5.0c, <em>5.0e</em></span><br>
  </dd>

  <dt class="module-name">sratoolkit</dt>
  <dd class="module-details">
<strong class="module-help">SRA Toolkit: Tools and Libraries for Using Data in the INSDC Sequence Read Archives</strong><br>
<span class="module-description">The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives.</span><br>
Example: <span class="module-example"><code>fastq-dump --help</code>.</span><br>
URL: <span class="module-url"><a href="https://ncbi.github.io/sra-tools/">https://ncbi.github.io/sra-tools/</a>, <a href="https://github.com/ncbi/sra-tools">https://github.com/ncbi/sra-tools</a></span><br>
Warning: <span class="module-warning">To work around a bug where <code>fasterq-dump</code> crashes the local machine, it has been tweaked such that it uses <code>$TMPDIR</code> rather than <code>$PWD</code> as the default temporary folder and it will only use two threads instead of six by default.</span><br>
Versions: <span class="module-version">2.10.0, 2.10.4, 2.10.5, 2.10.7, 2.10.8, 2.10.9, 2.11.0, 2.11.1, 2.11.2, <em>2.11.3</em></span><br>
  </dd>

  <dt class="module-name">star</dt>
  <dd class="module-details">
<strong class="module-help">STAR: Spliced Transcripts Alignment to a Reference</strong><br>
<span class="module-description">STAR (Spliced Transcripts Alignment to a Reference) is a fast NGS read aligner for RNA-seq data.</span><br>
Example: <span class="module-example"><code>STAR --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/alexdobin/STAR">https://github.com/alexdobin/STAR</a>, <a href="https://github.com/alexdobin/STAR/blob/master/CHANGES.md">https://github.com/alexdobin/STAR/blob/master/CHANGES.md</a> (changelog)</span><br>
Versions: <span class="module-version">2.7.0e, 2.7.0f, 2.7.1a, 2.7.2b, 2.7.3a, 2.7.5a, 2.7.5c, 2.7.7a, 2.7.9a, <em>2.7.10a</em></span><br>
  </dd>

  <dt class="module-name">tmux</dt>
  <dd class="module-details">
<strong class="module-help">tmux: A Terminal Multiplexer</strong><br>
<span class="module-description">tmux is a terminal multiplexer. It lets you switch easily between several programs in one terminal, detach them (they keep running in the background) and reattach them to a different terminal. And do a lot more.</span><br>
Example: <span class="module-example"><code>tmux</code> and <code>man tmux</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/tmux/tmux/wiki">https://github.com/tmux/tmux/wiki</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>2.8</em></span><br>
  </dd>

  <dt class="module-name">tophat</dt>
  <dd class="module-details">
<strong class="module-help">TopHat: A Spliced Read Mapper for RNA-Seq</strong><br>
<span class="module-description">TopHat is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput short read aligner Bowtie, and then analyzes the mapping results to identify splice junctions between exons.</span><br>
Example: <span class="module-example"><code>tophat --version</code>.</span><br>
URL: <span class="module-url"><a href="https://ccb.jhu.edu/software/tophat/index.shtml">https://ccb.jhu.edu/software/tophat/index.shtml</a>, <a href="https://github.com/infphilo/tophat">https://github.com/infphilo/tophat</a></span><br>
Versions: <span class="module-version"><em>2.1.1</em></span><br>
  </dd>

  <dt class="module-name">tree</dt>
  <dd class="module-details">
<strong class="module-help">tree: List Content of Directories in a Tree-like Format</strong><br>
<span class="module-description">Tree is a recursive directory listing command that produces a depth indented listing of files, which is colorized ala dircolors if the <code>LS_COLORS</code> environment variable is set and output is to tty.</span><br>
Example: <span class="module-example"><code>tree --help</code>.</span><br>
URL: <span class="module-url"><a href="http://mama.indstate.edu/users/ice/tree/">http://mama.indstate.edu/users/ice/tree/</a>,</span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>1.8.0</em></span><br>
  </dd>

  <dt class="module-name">up</dt>
  <dd class="module-details">
<strong class="module-help">up: The Ultimate Plumber</strong><br>
<span class="module-description">A tool for writing Linux pipes in a terminal-based UI interactively, with instant live preview of command results. Interactively and incrementally explore textual data in Linux using text-processing utils such as grep, sort, cut, paste, awk, wc, perl, etc.  When done, press Ctrl-C to view final pipe commands, or Ctrl-X to save it to file.</span><br>
Example: <span class="module-example"><code>up --help</code>, <code>ls | up</code> (exit with Ctrl-C).</span><br>
URL: <span class="module-url"><a href="https://github.com/akavel/up">https://github.com/akavel/up</a></span><br>
Warning: <span class="module-warning">Only the most recent version of this software will be kept.</span><br>
Versions: <span class="module-version"><em>0.4</em></span><br>
  </dd>

  <dt class="module-name">varscan</dt>
  <dd class="module-details">
<strong class="module-help">VarScan: Variant Detection in Massively Parallel Sequencing Data</strong><br>
<span class="module-description">VarScan is a platform-independent mutation caller for targeted, exome, and whole-genome resequencing data generated on Illumina, SOLiD, Life/PGM, Roche/454, and similar instruments.</span><br>
Example: <span class="module-example"><code>varscan</code>, which is an alias to <code>java -jar $VARSCAN_HOME/VarScan.jar</code>.</span><br>
URL: <span class="module-url"><a href="https://dkoboldt.github.io/varscan/">https://dkoboldt.github.io/varscan/</a></span><br>
Versions: <span class="module-version"><em>2.4.2</em></span><br>
  </dd>

  <dt class="module-name">vcf-validator</dt>
  <dd class="module-details">
<strong class="module-help">vcf-validator: Validation Suite for Variant Call Format (VCF) Files</strong><br>
<span class="module-description">Validator for the Variant Call Format (VCF) implemented using C++11. It includes all the checks from the vcftools suite, and some more that involve lexical, syntactic and semantic analysis of the VCF input.</span><br>
Example: <span class="module-example"><code>vcf_validator --help</code>, <code>vcf-debugulator --help</code>, and <code>vcf-assembly-checker --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/EBIvariation/vcf-validator">https://github.com/EBIvariation/vcf-validator</a></span><br>
Versions: <span class="module-version">0.9.2, 0.9.3, <em>0.9.4</em></span><br>
  </dd>

  <dt class="module-name">vcftools</dt>
  <dd class="module-details">
<strong class="module-help">VCFtools: Tools Written in Perl and C++ for Working with VCF Files</strong><br>
<span class="module-description">VCFtools is a program package designed for working with VCF files, such as those generated by the 1000 Genomes Project. The aim of VCFtools is to provide easily accessible methods for working with complex genetic variation data in the form of VCF files.</span><br>
Example: <span class="module-example"><code>vcftools --version</code>.</span><br>
URL: <span class="module-url"><a href="https://vcftools.github.io/">https://vcftools.github.io/</a></span><br>
Versions: <span class="module-version"><em>0.1.16</em></span><br>
  </dd>

  <dt class="module-name">wynton-tools (part of CBI-testing)</dt>
  <dd class="module-details">
<strong class="module-help">Wynton Tools: Tools for the Wynton HPC Environment</strong><br>
<span class="module-description">A command-line tool for common Wynton HPC queries.</span><br>
Example: <span class="module-example"><code>wynton --help</code>.</span><br>
URL: <span class="module-url"><a href="https://github.com/UCSF-HPC/wynton-tools/">https://github.com/UCSF-HPC/wynton-tools/</a></span><br>
Versions: <span class="module-version"><em>latest</em></span><br>
    Note: <em>To use this module, call <code>module load CBI CBI-testing</code> first.</em>
  </dd>

</dl>
</div> 

<div id="queues-Sali" class="tab-pane fade">

<h2>Module Software Repository: Sali (120)</h2>

Maintained by: Ben Webb, <a href="https://salilab.org/">Sali Lab Software Repository</a><br>
Enable repository: <code>module load Sali</code><br>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Please note that this software stacks is maintained and contributed by a research group on a voluntary basis. It is <em>not</em> maintained by the {{ site.cluster.name }} admins. Please reach out to the corresponding maintainer for bug reports, feedback, or questions.
</div>

<dl>
  <dt class="module-name">allosmod</dt>
  <dd class="module-details">
<span class="module-description">AllosMod utility library</span><br>
URL: <span class="module-url"><a href="https://github.com/salilab/allosmod-lib/">https://github.com/salilab/allosmod-lib/</a></span><br>
  </dd>

  <dt class="module-name">amber</dt>
  <dd class="module-details">
<span class="module-description">Amber11, for 64-bit</span><br>
URL: <span class="module-url"><a href="http://ambermd.org/">http://ambermd.org/</a></span><br>
Versions: <span class="module-version"><em>11</em></span><br>
  </dd>

  <dt class="module-name">anaconda</dt>
  <dd class="module-details">
<span class="module-description">Anaconda Python distribution</span><br>
URL: <span class="module-url"><a href="https://www.anaconda.com/">https://www.anaconda.com/</a></span><br>
  </dd>

  <dt class="module-name">blast</dt>
  <dd class="module-details">
<span class="module-description">Basic Local Alignment Search Tool</span><br>
URL: <span class="module-url"><a href="https://blast.ncbi.nlm.nih.gov">https://blast.ncbi.nlm.nih.gov</a></span><br>
Versions: <span class="module-version"><em>2.2.26</em></span><br>
  </dd>

  <dt class="module-name">blast+</dt>
  <dd class="module-details">
<span class="module-description">Basic Local Alignment Search Tool</span><br>
URL: <span class="module-url"><a href="https://blast.ncbi.nlm.nih.gov/">https://blast.ncbi.nlm.nih.gov/</a></span><br>
Versions: <span class="module-version">2.2.25, 2.2.28, <em>2.12.0</em></span><br>
  </dd>

  <dt class="module-name">boost</dt>
  <dd class="module-details">
<span class="module-description">The free peer-reviewed portable C++ source libraries</span><br>
URL: <span class="module-url"><a href="https://www.boost.org/">https://www.boost.org/</a></span><br>
Versions: <span class="module-version">1.68.0, <em>1.73.0</em></span><br>
  </dd>

  <dt class="module-name">cgal</dt>
  <dd class="module-details">
<span class="module-description">Computational Geometry Algorithms Library</span><br>
URL: <span class="module-url"><a href="https://www.cgal.org/">https://www.cgal.org/</a></span><br>
Versions: <span class="module-version">4.12.1, <em>5.1</em></span><br>
  </dd>

  <dt class="module-name">cmake</dt>
  <dd class="module-details">
<span class="module-description">Cross-platform make system</span><br>
URL: <span class="module-url"><a href="https://cmake.org/">https://cmake.org/</a></span><br>
Versions: <span class="module-version">3.12.2, <em>3.18.3</em></span><br>
  </dd>

  <dt class="module-name">concavity</dt>
  <dd class="module-details">
<span class="module-description">Ligand binding site prediction from protein sequence and structure</span><br>
URL: <span class="module-url"><a href="https://compbio.cs.princeton.edu/concavity/">https://compbio.cs.princeton.edu/concavity/</a></span><br>
Versions: <span class="module-version"><em>0.1</em></span><br>
  </dd>

  <dt class="module-name">cryptosite</dt>
  <dd class="module-details">
<span class="module-description">CryptoSite utility library</span><br>
URL: <span class="module-url"><a href="https://github.com/salilab/cryptosite/">https://github.com/salilab/cryptosite/</a></span><br>
  </dd>

  <dt class="module-name">cuda</dt>
  <dd class="module-details">
Versions: <span class="module-version">6.0.37, 7.5.18, 8.0.61, 9.0.176, 10.0.130, <em>11.5.0</em></span><br>
  </dd>

  <dt class="module-name">Cython</dt>
  <dd class="module-details">
<span class="module-description">A language for writing Python extension modules</span><br>
URL: <span class="module-url"><a href="https://cython.org/">https://cython.org/</a></span><br>
Versions: <span class="module-version">0.25.2, 0.29.14, <em>0.29.24</em></span><br>
  </dd>

  <dt class="module-name">doxygen</dt>
  <dd class="module-details">
<span class="module-description">A documentation system for C/C++</span><br>
URL: <span class="module-url"><a href="http://www.doxygen.org/index.html">http://www.doxygen.org/index.html</a></span><br>
Versions: <span class="module-version">1.8.6, <em>1.8.15</em></span><br>
  </dd>

  <dt class="module-name">dssp</dt>
  <dd class="module-details">
<span class="module-description">Secondary structure assignment</span><br>
URL: <span class="module-url"><a href="https://swift.cmbi.umcn.nl/gv/dssp/">https://swift.cmbi.umcn.nl/gv/dssp/</a></span><br>
Versions: <span class="module-version">2.0.4, <em>2.2.1</em></span><br>
  </dd>

  <dt class="module-name">eigen</dt>
  <dd class="module-details">
<span class="module-description">A lightweight C++ template library for vector and matrix math</span><br>
URL: <span class="module-url"><a href="http://eigen.tuxfamily.org">http://eigen.tuxfamily.org</a></span><br>
Versions: <span class="module-version"><em>3.3.5</em></span><br>
  </dd>

  <dt class="module-name">eman</dt>
  <dd class="module-details">
<span class="module-description">Single Particle Analysis and Electron Micrograph Analysis</span><br>
URL: <span class="module-url"><a href="https://blake.bcm.edu/emanwiki/EMAN2">https://blake.bcm.edu/emanwiki/EMAN2</a></span><br>
Versions: <span class="module-version">2.12, <em>2.2</em></span><br>
  </dd>

  <dt class="module-name">featuresketch</dt>
  <dd class="module-details">
<span class="module-description">Ursula's featuresketch script; run feature_sketch.sh then feature_sketch.py</span><br>
Versions: <span class="module-version"><em>3.0</em></span><br>
  </dd>

  <dt class="module-name">fpocket</dt>
  <dd class="module-details">
<span class="module-description">Protein pocket (cavity) detection algorithm</span><br>
URL: <span class="module-url"><a href="https://github.com/Discngine/fpocket">https://github.com/Discngine/fpocket</a></span><br>
Versions: <span class="module-version"><em>2.0</em></span><br>
  </dd>

  <dt class="module-name">gcc</dt>
  <dd class="module-details">
<span class="module-description">Various compilers (C, C++, Objective-C, Java, ...)</span><br>
URL: <span class="module-url"><a href="https://gcc.gnu.org/">https://gcc.gnu.org/</a></span><br>
Versions: <span class="module-version">5.1.1, 6.4.1, 7.3.1, <em>10.2.1</em></span><br>
  </dd>

  <dt class="module-name">ghostscript</dt>
  <dd class="module-details">
<span class="module-description">A PostScript interpreter and renderer</span><br>
URL: <span class="module-url"><a href="https://www.ghostscript.com/">https://www.ghostscript.com/</a></span><br>
Versions: <span class="module-version"><em>8.70</em></span><br>
  </dd>

  <dt class="module-name">gnuplot</dt>
  <dd class="module-details">
<span class="module-description">A program for plotting mathematical expressions and data</span><br>
URL: <span class="module-url"><a href="http://www.gnuplot.info/">http://www.gnuplot.info/</a></span><br>
Versions: <span class="module-version">5.0.5, <em>5.4.2</em></span><br>
  </dd>

  <dt class="module-name">hdf5</dt>
  <dd class="module-details">
<span class="module-description">A general purpose library and file format for storing scientific data</span><br>
URL: <span class="module-url"><a href="https://support.hdfgroup.org/HDF5/">https://support.hdfgroup.org/HDF5/</a></span><br>
Versions: <span class="module-version">1.8.14, 1.8.17, 1.10.1, 1.10.5, <em>1.10.6</em></span><br>
  </dd>

  <dt class="module-name">ifort</dt>
  <dd class="module-details">
<span class="module-description">Intel Fortran compiler</span><br>
URL: <span class="module-url"><a href="http://software.intel.com/content/www/us/en/develop/tools/oneapi/components/fortran-compiler.html">http://software.intel.com/content/www/us/en/develop/tools/oneapi/components/fortran-compiler.html</a></span><br>
Versions: <span class="module-version"><em>10.1.022</em></span><br>
  </dd>

  <dt class="module-name">ImageMagick</dt>
  <dd class="module-details">
<span class="module-description">An X application for displaying and manipulating images</span><br>
URL: <span class="module-url"><a href="https://imagemagick.org/">https://imagemagick.org/</a></span><br>
Versions: <span class="module-version"><em>6.8.8.10</em></span><br>
  </dd>

  <dt class="module-name">imp</dt>
  <dd class="module-details">
<span class="module-description">Integrative Modeling Platform (version 2.16.0, with only usage checks turned on)</span><br>
URL: <span class="module-url"><a href="https://integrativemodeling.org/">https://integrativemodeling.org/</a></span><br>
Versions: <span class="module-version">last_ok_build, nightly, 2.7.0, 2.8.0, 2.9.0, 2.10.0, 2.10.1, 2.11.0, 2.11.1, 2.12.0, 2.13.0, 2.14.0, 2.15.0, <em>2.16.0</em></span><br>
  </dd>

  <dt class="module-name">imp-fast</dt>
  <dd class="module-details">
<span class="module-description">Integrative Modeling Platform (version 2.16.0, fast build)</span><br>
URL: <span class="module-url"><a href="https://integrativemodeling.org/">https://integrativemodeling.org/</a></span><br>
Versions: <span class="module-version">last_ok_build, nightly, 2.7.0, 2.8.0, 2.9.0, 2.10.0, 2.10.1, 2.11.0, 2.11.1, 2.12.0, 2.13.0, 2.14.0, 2.15.0, <em>2.16.0</em></span><br>
  </dd>

  <dt class="module-name">itcell</dt>
  <dd class="module-details">
<span class="module-description">Integrative T-cell epitope prediction</span><br>
URL: <span class="module-url"><a href="https://github.com/salilab/itcell-lib">https://github.com/salilab/itcell-lib</a></span><br>
  </dd>

  <dt class="module-name">libtau</dt>
  <dd class="module-details">
<span class="module-description">Code from the SAMBA group at TAU</span><br>
URL: <span class="module-url"><a href="https://integrativemodeling.org/libTAU.html">https://integrativemodeling.org/libTAU.html</a></span><br>
Versions: <span class="module-version"><em>1.0.1</em></span><br>
  </dd>

  <dt class="module-name">main</dt>
  <dd class="module-details">
<span class="module-description">Dusan Turk's MAIN program</span><br>
URL: <span class="module-url"><a href="https://stef.ijs.si/">https://stef.ijs.si/</a></span><br>
Versions: <span class="module-version"><em>2013</em></span><br>
  </dd>

  <dt class="module-name">matlab</dt>
  <dd class="module-details">
<span class="module-description">Language for technical computing</span><br>
URL: <span class="module-url"><a href="https://www.mathworks.com/products/matlab.html">https://www.mathworks.com/products/matlab.html</a></span><br>
Versions: <span class="module-version"><em>9.5.0.944444</em></span><br>
  </dd>

  <dt class="module-name">mist</dt>
  <dd class="module-details">
<span class="module-description">MiST - Mass spectrometry interaction STatistics</span><br>
URL: <span class="module-url"><a href="https://github.com/salilab/mist/">https://github.com/salilab/mist/</a></span><br>
  </dd>

  <dt class="module-name">modeller</dt>
  <dd class="module-details">
<span class="module-description">MODELLER comparative modeling</span><br>
URL: <span class="module-url"><a href="https://salilab.org/modeller/">https://salilab.org/modeller/</a></span><br>
Versions: <span class="module-version">9.10, 9.11, 9.12, 9.13, 9.14, 9.15, 9.16, 9.17, 9.18, 9.19, 9.20, 9.21, 9.22, 9.23, 9.24, 9.25, 10.0, 10.1, 10.2, <em>SVN</em></span><br>
  </dd>

  <dt class="module-name">modpipe</dt>
  <dd class="module-details">
<span class="module-description">ModPipe (sets $MODPIPE; only works on the cluster)</span><br>
URL: <span class="module-url"><a href="https://salilab.org/modpipe/">https://salilab.org/modpipe/</a></span><br>
Versions: <span class="module-version">2.0.1, 2.0.2, 2.1.0, 2.1.1, 2.1.2, 2.1.3, 2.2.0, <em>2.3.0</em></span><br>
  </dd>

  <dt class="module-name">muscle</dt>
  <dd class="module-details">
<span class="module-description">Multiple alignment program for protein sequences</span><br>
URL: <span class="module-url"><a href="http://www.drive5.com/muscle/">http://www.drive5.com/muscle/</a></span><br>
Versions: <span class="module-version"><em>3.8.31</em></span><br>
  </dd>

  <dt class="module-name">ninja</dt>
  <dd class="module-details">
<span class="module-description">A small build system with a focus on speed</span><br>
URL: <span class="module-url"><a href="https://ninja-build.org/">https://ninja-build.org/</a></span><br>
Versions: <span class="module-version">1.6.0, <em>1.8.2</em></span><br>
  </dd>

  <dt class="module-name">opencv</dt>
  <dd class="module-details">
<span class="module-description">Collection of algorithms for computer vision</span><br>
URL: <span class="module-url"><a href="https://opencv.org/">https://opencv.org/</a></span><br>
Versions: <span class="module-version">3.4.3, <em>4.3.0</em></span><br>
  </dd>

  <dt class="module-name">openeye</dt>
  <dd class="module-details">
<span class="module-description">OpenEye products (work on any 64-bit node)</span><br>
URL: <span class="module-url"><a href="https://www.eyesopen.com/">https://www.eyesopen.com/</a></span><br>
Versions: <span class="module-version"><em>2012</em></span><br>
  </dd>

  <dt class="module-name">patch_dock</dt>
  <dd class="module-details">
<span class="module-description">Molecular Docking Based on Shape Complementarity Principles</span><br>
URL: <span class="module-url"><a href="https://bioinfo3d.cs.tau.ac.il/PatchDock/">https://bioinfo3d.cs.tau.ac.il/PatchDock/</a></span><br>
Versions: <span class="module-version"><em>1.3</em></span><br>
  </dd>

  <dt class="module-name">pcss</dt>
  <dd class="module-details">
<span class="module-description">Peptide Classification using Sequence and Structure</span><br>
URL: <span class="module-url"><a href="https://github.com/salilab/pcss">https://github.com/salilab/pcss</a></span><br>
  </dd>

  <dt class="module-name">phenix</dt>
  <dd class="module-details">
<span class="module-description">Python-based Hierarchical ENvironment for Integrated Xtallography</span><br>
URL: <span class="module-url"><a href="https://www.phenix-online.org/">https://www.phenix-online.org/</a></span><br>
Versions: <span class="module-version">1.10.1.2155, 1.18.2.3874, <em>1.19.1.4122</em></span><br>
  </dd>

  <dt class="module-name">profit</dt>
  <dd class="module-details">
<span class="module-description">ProFit, a protein least squares fitting program</span><br>
URL: <span class="module-url"><a href="http://www.bioinf.org.uk/software/profit/">http://www.bioinf.org.uk/software/profit/</a></span><br>
Versions: <span class="module-version"><em>3.1</em></span><br>
  </dd>

  <dt class="module-name">psipred</dt>
  <dd class="module-details">
<span class="module-description">Accurate protein secondary structure prediction</span><br>
URL: <span class="module-url"><a href="http://bioinf.cs.ucl.ac.uk/psipred/">http://bioinf.cs.ucl.ac.uk/psipred/</a></span><br>
Versions: <span class="module-version"><em>4.0</em></span><br>
  </dd>

  <dt class="module-name">python2/biopython</dt>
  <dd class="module-details">
Versions: <span class="module-version">1.68, 1.69, <em>1.70</em></span><br>
  </dd>

  <dt class="module-name">python2/bottleneck</dt>
  <dd class="module-details">
Versions: <span class="module-version">1.2.0, <em>1.2.1</em></span><br>
  </dd>

  <dt class="module-name">python2/cycler</dt>
  <dd class="module-details">
Versions: <span class="module-version"><em>0.10.0</em></span><br>
  </dd>

  <dt class="module-name">python2/dateutil</dt>
  <dd class="module-details">
Versions: <span class="module-version">1.5, <em>2.6.1</em></span><br>
  </dd>

  <dt class="module-name">python2/decorator</dt>
  <dd class="module-details">
Versions: <span class="module-version">4.0.11, <em>4.2.1</em></span><br>
  </dd>

  <dt class="module-name">python2/functools32</dt>
  <dd class="module-details">
Versions: <span class="module-version"><em>3.2.3</em></span><br>
  </dd>

  <dt class="module-name">python2/h5py</dt>
  <dd class="module-details">
Versions: <span class="module-version">2.6.0, 2.7.0, <em>2.7.1</em></span><br>
  </dd>

  <dt class="module-name">python2/ihm</dt>
  <dd class="module-details">
Versions: <span class="module-version"><em>0.11</em></span><br>
  </dd>

  <dt class="module-name">python2/lru_cache</dt>
  <dd class="module-details">
Versions: <span class="module-version"><em>1.5</em></span><br>
  </dd>

  <dt class="module-name">python2/matplotlib</dt>
  <dd class="module-details">
Versions: <span class="module-version">2.0.0, 2.0.2, <em>2.1.2</em></span><br>
  </dd>

  <dt class="module-name">python2/mdp</dt>
  <dd class="module-details">
Versions: <span class="module-version"><em>2.6</em></span><br>
  </dd>

  <dt class="module-name">python2/msgpack</dt>
  <dd class="module-details">
Versions: <span class="module-version">0.5.6, <em>0.6.2</em></span><br>
  </dd>

  <dt class="module-name">python2/networkx</dt>
  <dd class="module-details">
Versions: <span class="module-version"><em>1.11</em></span><br>
  </dd>

  <dt class="module-name">python2/nose</dt>
  <dd class="module-details">
Versions: <span class="module-version"><em>1.3.7</em></span><br>
  </dd>

  <dt class="module-name">python2/numexpr</dt>
  <dd class="module-details">
Versions: <span class="module-version">2.6.2, <em>2.6.4</em></span><br>
  </dd>

  <dt class="module-name">python2/numpy</dt>
  <dd class="module-details">
Versions: <span class="module-version">1.12.0, 1.13.0, <em>1.14.1</em></span><br>
  </dd>

  <dt class="module-name">python2/pandas</dt>
  <dd class="module-details">
Versions: <span class="module-version">0.19.2, 0.20.2, <em>0.22.0</em></span><br>
  </dd>

  <dt class="module-name">python2/pkgconfig</dt>
  <dd class="module-details">
Versions: <span class="module-version"><em>1.2.2</em></span><br>
  </dd>

  <dt class="module-name">python2/protobuf</dt>
  <dd class="module-details">
Versions: <span class="module-version">2.3.0, <em>2.5.0</em></span><br>
  </dd>

  <dt class="module-name">python2/pymc</dt>
  <dd class="module-details">
Versions: <span class="module-version"><em>2.3.6</em></span><br>
  </dd>

  <dt class="module-name">python2/pyparsing</dt>
  <dd class="module-details">
Versions: <span class="module-version"><em>2.1.10</em></span><br>
  </dd>

  <dt class="module-name">python2/pyrmsd</dt>
  <dd class="module-details">
Versions: <span class="module-version"><em>4.1.git48ab119</em></span><br>
  </dd>

  <dt class="module-name">python2/pytz</dt>
  <dd class="module-details">
Versions: <span class="module-version"><em>2016.10</em></span><br>
  </dd>

  <dt class="module-name">python2/scikit</dt>
  <dd class="module-details">
Versions: <span class="module-version">0.12, 0.18.1, <em>0.19.1</em></span><br>
  </dd>

  <dt class="module-name">python2/scipy</dt>
  <dd class="module-details">
Versions: <span class="module-version">0.18.1, 0.19.0, <em>1.0.0</em></span><br>
  </dd>

  <dt class="module-name">python2/six</dt>
  <dd class="module-details">
Versions: <span class="module-version"><em>1.10.0</em></span><br>
  </dd>

  <dt class="module-name">python2/tables</dt>
  <dd class="module-details">
Versions: <span class="module-version">3.3.0, 3.4.2, <em>3.5.2</em></span><br>
  </dd>

  <dt class="module-name">python3/attrs</dt>
  <dd class="module-details">
<span class="module-description">Classes Without Boilerplate</span><br>
URL: <span class="module-url"><a href="https://www.attrs.org/">https://www.attrs.org/</a></span><br>
Versions: <span class="module-version">20.3.0, <em>21.2.0</em></span><br>
  </dd>

  <dt class="module-name">python3/biopython</dt>
  <dd class="module-details">
<span class="module-description">Python tools for computational molecular biology</span><br>
URL: <span class="module-url"><a href="https://biopython.org/">https://biopython.org/</a></span><br>
Versions: <span class="module-version"><em>1.75</em></span><br>
  </dd>

  <dt class="module-name">python3/bottleneck</dt>
  <dd class="module-details">
<span class="module-description">Collection of fast NumPy array functions written in Cython</span><br>
URL: <span class="module-url"><a href="https://github.com/pydata/bottleneck">https://github.com/pydata/bottleneck</a></span><br>
Versions: <span class="module-version"><em>1.3.1</em></span><br>
  </dd>

  <dt class="module-name">python3/cycler</dt>
  <dd class="module-details">
<span class="module-description">Composable style cycles</span><br>
URL: <span class="module-url"><a href="https://github.com/matplotlib/cycler">https://github.com/matplotlib/cycler</a></span><br>
Versions: <span class="module-version"><em>0.10.0</em></span><br>
  </dd>

  <dt class="module-name">python3/dateutil</dt>
  <dd class="module-details">
<span class="module-description">Powerful extensions to the standard datetime module</span><br>
URL: <span class="module-url"><a href="https://dateutil.readthedocs.io/en/stable/">https://dateutil.readthedocs.io/en/stable/</a></span><br>
Versions: <span class="module-version"><em>2.8.1</em></span><br>
  </dd>

  <dt class="module-name">python3/decorator</dt>
  <dd class="module-details">
<span class="module-description">Module to simplify usage of decorators</span><br>
URL: <span class="module-url"><a href="https://github.com/micheles/decorator">https://github.com/micheles/decorator</a></span><br>
Versions: <span class="module-version"><em>4.4.1</em></span><br>
  </dd>

  <dt class="module-name">python3/flake8</dt>
  <dd class="module-details">
<span class="module-description">The modular source code checker: pep8 pyflakes and co</span><br>
URL: <span class="module-url"><a href="https://gitlab.com/pycqa/flake8">https://gitlab.com/pycqa/flake8</a></span><br>
Versions: <span class="module-version"><em>3.8.4</em></span><br>
  </dd>

  <dt class="module-name">python3/future</dt>
  <dd class="module-details">
<span class="module-description">Clean single-source support for Python 3 and 2</span><br>
URL: <span class="module-url"><a href="https://python-future.org/">https://python-future.org/</a></span><br>
Versions: <span class="module-version"><em>0.18.2</em></span><br>
  </dd>

  <dt class="module-name">python3/h5py</dt>
  <dd class="module-details">
<span class="module-description">Python interface to the Hierarchical Data Format library</span><br>
URL: <span class="module-url"><a href="https://www.h5py.org/">https://www.h5py.org/</a></span><br>
Versions: <span class="module-version"><em>2.10.0</em></span><br>
  </dd>

  <dt class="module-name">python3/ihm</dt>
  <dd class="module-details">
<span class="module-description">Python package for handling IHM mmCIF files</span><br>
URL: <span class="module-url"><a href="https://github.com/ihmwg/python-ihm">https://github.com/ihmwg/python-ihm</a></span><br>
Versions: <span class="module-version"><em>0.15</em></span><br>
  </dd>

  <dt class="module-name">python3/importlib-metadata</dt>
  <dd class="module-details">
<span class="module-description">Read metadata from Python packages</span><br>
URL: <span class="module-url"><a href="https://github.com/python/importlib_metadata">https://github.com/python/importlib_metadata</a></span><br>
Versions: <span class="module-version"><em>3.3.0</em></span><br>
  </dd>

  <dt class="module-name">python3/iniconfig</dt>
  <dd class="module-details">
<span class="module-description">Brain-dead simple parsing of ini files</span><br>
URL: <span class="module-url"><a href="https://github.com/RonnyPfannschmidt/iniconfig">https://github.com/RonnyPfannschmidt/iniconfig</a></span><br>
Versions: <span class="module-version"><em>1.1.1</em></span><br>
  </dd>

  <dt class="module-name">python3/joblib</dt>
  <dd class="module-details">
<span class="module-description">Lightweight pipelining: using Python functions as pipeline jobs</span><br>
URL: <span class="module-url"><a href="https://joblib.readthedocs.io/en/latest/">https://joblib.readthedocs.io/en/latest/</a></span><br>
Versions: <span class="module-version">0.14.0, <em>0.17.0</em></span><br>
  </dd>

  <dt class="module-name">python3/kiwisolver</dt>
  <dd class="module-details">
<span class="module-description">A fast implementation of the Cassowary constraint solver</span><br>
URL: <span class="module-url"><a href="https://github.com/nucleic/kiwi">https://github.com/nucleic/kiwi</a></span><br>
Versions: <span class="module-version"><em>1.1.0</em></span><br>
  </dd>

  <dt class="module-name">python3/matplotlib</dt>
  <dd class="module-details">
<span class="module-description">Python 2D plotting library</span><br>
URL: <span class="module-url"><a href="https://matplotlib.org/">https://matplotlib.org/</a></span><br>
Versions: <span class="module-version"><em>3.1.2</em></span><br>
  </dd>

  <dt class="module-name">python3/mccabe</dt>
  <dd class="module-details">
<span class="module-description">McCabe checker, plugin for flake8</span><br>
URL: <span class="module-url"><a href="https://github.com/pycqa/mccabe">https://github.com/pycqa/mccabe</a></span><br>
Versions: <span class="module-version"><em>0.6.1</em></span><br>
  </dd>

  <dt class="module-name">python3/mdp</dt>
  <dd class="module-details">
<span class="module-description">Modular toolkit for Data Processing</span><br>
URL: <span class="module-url"><a href="http://mdp-toolkit.sourceforge.net/">http://mdp-toolkit.sourceforge.net/</a></span><br>
Versions: <span class="module-version"><em>3.6</em></span><br>
  </dd>

  <dt class="module-name">python3/msgpack</dt>
  <dd class="module-details">
<span class="module-description">A Python MessagePack (de)serializer</span><br>
URL: <span class="module-url"><a href="https://msgpack.org/">https://msgpack.org/</a></span><br>
Versions: <span class="module-version"><em>0.6.2</em></span><br>
  </dd>

  <dt class="module-name">python3/networkx</dt>
  <dd class="module-details">
<span class="module-description">Creates and Manipulates Graphs and Networks</span><br>
URL: <span class="module-url"><a href="https://networkx.github.io/">https://networkx.github.io/</a></span><br>
Versions: <span class="module-version"><em>2.4</em></span><br>
  </dd>

  <dt class="module-name">python3/nose</dt>
  <dd class="module-details">
<span class="module-description">Discovery-based unittest extension for Python3</span><br>
URL: <span class="module-url"><a href="https://nose.readthedocs.io/en/latest/">https://nose.readthedocs.io/en/latest/</a></span><br>
Versions: <span class="module-version"><em>1.3.7</em></span><br>
  </dd>

  <dt class="module-name">python3/numexpr</dt>
  <dd class="module-details">
<span class="module-description">Fast numerical array expression evaluator for Python and NumPy</span><br>
URL: <span class="module-url"><a href="https://github.com/pydata/numexpr">https://github.com/pydata/numexpr</a></span><br>
Versions: <span class="module-version"><em>2.7.0</em></span><br>
  </dd>

  <dt class="module-name">python3/numpy</dt>
  <dd class="module-details">
<span class="module-description">A fast multidimensional array facility for Python</span><br>
URL: <span class="module-url"><a href="https://numpy.org/">https://numpy.org/</a></span><br>
Versions: <span class="module-version">1.17.4, <em>1.19.5</em></span><br>
  </dd>

  <dt class="module-name">python3/packaging</dt>
  <dd class="module-details">
<span class="module-description">Core utilities for Python packages</span><br>
URL: <span class="module-url"><a href="https://github.com/pypa/packaging">https://github.com/pypa/packaging</a></span><br>
Versions: <span class="module-version"><em>20.8</em></span><br>
  </dd>

  <dt class="module-name">python3/pandas</dt>
  <dd class="module-details">
<span class="module-description">Python Data Analysis Library</span><br>
URL: <span class="module-url"><a href="https://pandas.pydata.org/">https://pandas.pydata.org/</a></span><br>
Versions: <span class="module-version"><em>0.25.3</em></span><br>
  </dd>

  <dt class="module-name">python3/pkgconfig</dt>
  <dd class="module-details">
<span class="module-description">A Python interface to the pkg-config command line tool</span><br>
URL: <span class="module-url"><a href="https://github.com/matze/pkgconfig">https://github.com/matze/pkgconfig</a></span><br>
Versions: <span class="module-version"><em>1.5.1</em></span><br>
  </dd>

  <dt class="module-name">python3/pluggy</dt>
  <dd class="module-details">
<span class="module-description">A minimalist production ready plugin system</span><br>
URL: <span class="module-url"><a href="https://github.com/pytest-dev/pluggy">https://github.com/pytest-dev/pluggy</a></span><br>
Versions: <span class="module-version"><em>0.13.1</em></span><br>
  </dd>

  <dt class="module-name">python3/protobuf</dt>
  <dd class="module-details">
<span class="module-description">Protocol Buffers - Google's data interchange format</span><br>
URL: <span class="module-url"><a href="https://developers.google.com/protocol-buffers/">https://developers.google.com/protocol-buffers/</a></span><br>
Versions: <span class="module-version"><em>3.11.2</em></span><br>
  </dd>

  <dt class="module-name">python3/py</dt>
  <dd class="module-details">
<span class="module-description">Cross-python path, ini-parsing, io, code, log facilities</span><br>
URL: <span class="module-url"><a href="https://py.readthedocs.io/en/latest/">https://py.readthedocs.io/en/latest/</a></span><br>
Versions: <span class="module-version"><em>1.10.0</em></span><br>
  </dd>

  <dt class="module-name">python3/pycodestyle</dt>
  <dd class="module-details">
<span class="module-description">Python style guide checker</span><br>
URL: <span class="module-url"><a href="https://pycodestyle.readthedocs.io/">https://pycodestyle.readthedocs.io/</a></span><br>
Versions: <span class="module-version"><em>2.6.0</em></span><br>
  </dd>

  <dt class="module-name">python3/pyflakes</dt>
  <dd class="module-details">
<span class="module-description">Passive checker of Python programs</span><br>
URL: <span class="module-url"><a href="https://github.com/PyCQA/pyflakes">https://github.com/PyCQA/pyflakes</a></span><br>
Versions: <span class="module-version"><em>2.2.0</em></span><br>
  </dd>

  <dt class="module-name">python3/pyparsing</dt>
  <dd class="module-details">
<span class="module-description">An object-oriented approach to text processing</span><br>
URL: <span class="module-url"><a href="https://github.com/pyparsing/pyparsing/">https://github.com/pyparsing/pyparsing/</a></span><br>
Versions: <span class="module-version"><em>2.4.5</em></span><br>
  </dd>

  <dt class="module-name">python3/pyrmsd</dt>
  <dd class="module-details">
<span class="module-description">Way of performing RMSD calculations of large sets of structures</span><br>
URL: <span class="module-url"><a href="https://github.com/salilab/pyRMSD">https://github.com/salilab/pyRMSD</a></span><br>
Versions: <span class="module-version"><em>4.1.gita558b8a</em></span><br>
  </dd>

  <dt class="module-name">python3/pytest</dt>
  <dd class="module-details">
<span class="module-description">Simple powerful testing with Python</span><br>
URL: <span class="module-url"><a href="https://docs.pytest.org/en/latest/">https://docs.pytest.org/en/latest/</a></span><br>
Versions: <span class="module-version"><em>6.2.1</em></span><br>
  </dd>

  <dt class="module-name">python3/pytest-flake8</dt>
  <dd class="module-details">
<span class="module-description">pytest plugin to check FLAKE8 requirements</span><br>
URL: <span class="module-url"><a href="https://github.com/tholo/pytest-flake8">https://github.com/tholo/pytest-flake8</a></span><br>
Versions: <span class="module-version"><em>1.0.7</em></span><br>
  </dd>

  <dt class="module-name">python3/pytz</dt>
  <dd class="module-details">
<span class="module-description">World Timezone Definitions for Python</span><br>
URL: <span class="module-url"><a href="https://pythonhosted.org/pytz/">https://pythonhosted.org/pytz/</a></span><br>
Versions: <span class="module-version"><em>2019.3</em></span><br>
  </dd>

  <dt class="module-name">python3/scikit</dt>
  <dd class="module-details">
<span class="module-description">A set of python modules for machine learning and data mining</span><br>
URL: <span class="module-url"><a href="https://scikit-learn.org/stable/index.html">https://scikit-learn.org/stable/index.html</a></span><br>
Versions: <span class="module-version"><em>0.21.3</em></span><br>
  </dd>

  <dt class="module-name">python3/scipy</dt>
  <dd class="module-details">
<span class="module-description">Scipy: Scientific Tools for Python</span><br>
URL: <span class="module-url"><a href="https://www.scipy.org/">https://www.scipy.org/</a></span><br>
Versions: <span class="module-version"><em>1.3.2</em></span><br>
  </dd>

  <dt class="module-name">python3/six</dt>
  <dd class="module-details">
<span class="module-description">Python 2 and 3 compatibility utilities</span><br>
URL: <span class="module-url"><a href="https://github.com/benjaminp/six">https://github.com/benjaminp/six</a></span><br>
Versions: <span class="module-version"><em>1.13.0</em></span><br>
  </dd>

  <dt class="module-name">python3/tables</dt>
  <dd class="module-details">
<span class="module-description">Hierarchical datasets in Python</span><br>
URL: <span class="module-url"><a href="http://www.pytables.org/">http://www.pytables.org/</a></span><br>
Versions: <span class="module-version"><em>3.6.1</em></span><br>
  </dd>

  <dt class="module-name">python3/toml</dt>
  <dd class="module-details">
<span class="module-description">Python Library for Tom's Obvious, Minimal Language</span><br>
URL: <span class="module-url"><a href="https://github.com/uiri/toml">https://github.com/uiri/toml</a></span><br>
Versions: <span class="module-version"><em>0.10.2</em></span><br>
  </dd>

  <dt class="module-name">python3/typing-extensions</dt>
  <dd class="module-details">
<span class="module-description">Backported and Experimental Type Hints for Python 3.5+</span><br>
URL: <span class="module-url"><a href="https://pypi.org/project/typing-extensions/">https://pypi.org/project/typing-extensions/</a></span><br>
Versions: <span class="module-version"><em>3.7.4.3</em></span><br>
  </dd>

  <dt class="module-name">python3/zipp</dt>
  <dd class="module-details">
<span class="module-description">Backport of pathlib-compatible object wrapper for zip files</span><br>
URL: <span class="module-url"><a href="https://github.com/jaraco/zipp">https://github.com/jaraco/zipp</a></span><br>
Versions: <span class="module-version"><em>3.4.0</em></span><br>
  </dd>

  <dt class="module-name">relion</dt>
  <dd class="module-details">
<span class="module-description">Electron cryo-microscopy refinement</span><br>
URL: <span class="module-url"><a href="https://github.com/3dem/relion">https://github.com/3dem/relion</a></span><br>
Versions: <span class="module-version">1.4, 2.0.6, <em>3.0.git9a02562</em></span><br>
  </dd>

  <dt class="module-name">rosetta</dt>
  <dd class="module-details">
<span class="module-description">Computational modeling and analysis of protein structures</span><br>
URL: <span class="module-url"><a href="https://www.rosettacommons.org/">https://www.rosettacommons.org/</a></span><br>
Versions: <span class="module-version">3.5, <em>3.10</em></span><br>
  </dd>

  <dt class="module-name">sali-libraries</dt>
  <dd class="module-details">
<span class="module-description">Makes available libraries usually only present on the Sali interactive nodes</span><br>
  </dd>

  <dt class="module-name">scwrl</dt>
  <dd class="module-details">
<span class="module-description">Protein side-chain conformation prediction program</span><br>
URL: <span class="module-url"><a href="http://dunbrack.fccc.edu/SCWRL4.php">http://dunbrack.fccc.edu/SCWRL4.php</a></span><br>
Versions: <span class="module-version"><em>4.0</em></span><br>
  </dd>

  <dt class="module-name">svm_light</dt>
  <dd class="module-details">
<span class="module-description">Support Vector Machine</span><br>
URL: <span class="module-url"><a href="http://svmlight.joachims.org/">http://svmlight.joachims.org/</a></span><br>
Versions: <span class="module-version"><em>6.0.2</em></span><br>
  </dd>

  <dt class="module-name">swig</dt>
  <dd class="module-details">
<span class="module-description">Connects C/C++/Objective C to some high-level programming languages</span><br>
URL: <span class="module-url"><a href="http://www.swig.org/">http://www.swig.org/</a></span><br>
Versions: <span class="module-version">3.0.12, <em>4.0.2</em></span><br>
  </dd>

  <dt class="module-name">usearch</dt>
  <dd class="module-details">
<span class="module-description">High-throughput search and clustering tool</span><br>
URL: <span class="module-url"><a href="http://www.drive5.com/usearch/">http://www.drive5.com/usearch/</a></span><br>
Versions: <span class="module-version">4.0.43, <em>10.0.240</em></span><br>
  </dd>

  <dt class="module-name">web_service</dt>
  <dd class="module-details">
<span class="module-description">Command line interface (web_service.py) to most lab web services</span><br>
URL: <span class="module-url"><a href="https://github.com/salilab/saliweb">https://github.com/salilab/saliweb</a></span><br>
  </dd>

  <dt class="module-name">zdock</dt>
  <dd class="module-details">
<span class="module-description">Rigid body docking</span><br>
URL: <span class="module-url"><a href="http://zdock.umassmed.edu/">http://zdock.umassmed.edu/</a></span><br>
Versions: <span class="module-version"><em>3.0.2</em></span><br>
  </dd>

</dl>
</div> 


</div> 

<ul class="nav nav-pills">
<li class="active"><a data-toggle="pill" href="#queues-built-in"><span style="font-weight: bold;">built-in</span>&nbsp;(9)</a></li>
<li><a data-toggle="pill" href="#queues-CBI"><span style="font-weight: bold;">CBI</span>&nbsp;(73)</a></li>
<li><a data-toggle="pill" href="#queues-Sali"><span style="font-weight: bold;">Sali</span>&nbsp;(120)</a></li>
</ul>

_The above information was automatically generated on 2022-02-03 02:37:34 from querying `module avail` and `module spider`._


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

[core software]: {{ '/software/core-software.html' | relative_url }}
