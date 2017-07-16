
<!--
WARNING: do _not_ update this file; it is automatically generated from modules.md.rsp and will be overwritten.
-->

<div class="alert alert-warning" role="alert">
Environment modules are currently in beta - to enable them, see Configuration / <a href="{{ '/configuration/lmod.html' | relative_url }}">Enable Software Modules</a>.
</div>

# Software

To use one or more of the below software modules, use `module load <name>` or `module load <name>/<version>`.  Here are a few examples:
```sh
module load bowtie2
module load bowtie2/2.2.6
module load python r bwa
```

These software modules are available from different _module repositories_, each providing several modules (more details below).  The available repositories are:

<table>
<tr>
  <th>repository</th>
  <th>description</th>
 </tr>
 <tr>
  <td>
  <strong>CBC</strong><br>
  
  </td>
  <td>
  <strong>Module Repository by CBC (Computational Biology Core)</strong><br>
  Repository of modules shared by the Computational Biology Core (<a href="http://cbc.ucsf.edu">http://cbc.ucsf.edu</a>). When loading this module, your <code>MODULEPATH</code> will be extended and you will get access to a large number of additional modules. When unloading the module, the changes to <code>MODULEPATH</code> will be undone. Note that any modules from the CBC repository still loaded when you unload this repository module, will remain in your list of loaded modules but will be inactivate (i.e. behave as they never were loaded) until you reload this repository module again.<br>
  URL: <a href="http://cbc.ucsf.edu/">http://cbc.ucsf.edu/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>Personal</strong><br>
  
  </td>
  <td>
  <strong>Modules in ~/modulefiles/</strong><br>
  Personal modules in <code>~/modulefiles/</code>.  For instance, module definition file <code>~/modulefiles/foo/1.0.lua</code> provides module foo/1.0, which can be loaded using <code>module load foo/1.0</code>.<br>
  </td>
 </tr>
</table>
<br>

To get access to one or more of these module repositories and see what modules they provide (see below), load them as regular modules, e.g.
```sh
module load CBC
module avail
```

_Technical details_: Loading a module repository will append its folder to the `$MODULEPATH`.  Unloading it will undo any changes.  For instance, `module load CBC` appends `$MODULEPATH_ROOT/CBC` to your `$MODULEPATH`.



## Module Repository 'CBC'

Maintained by: [Computational Biology Core](http://cbc.ucsf.edu)

<table>
<tr>
  <th>module &amp; versions</th>
  <th>description</th>
 </tr>
 <tr>
  <td>
  <strong>anaconda</strong><br>
  
  </td>
  <td>
  <strong>[DEPRECATED] Anaconda Package Manager w/ CBC-shared installations</strong><br>
  Open Data Science Platform powered by Python<br>
  URL: <a href="https://www.continuum.io/anaconda-overview">https://www.continuum.io/anaconda-overview</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>anaconda-python</strong><br>
  <em>2.7.13</em>
  </td>
  <td>
  <strong>[DEPRECATED] Anaconda: The Python Programming Language</strong><br>
  The Python programming language (by Anaconda)<br>
  URL: <a href="https://www.python.org/">https://www.python.org/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>bamutil</strong><br>
  <em>1.0.14</em>
  </td>
  <td>
  <strong>BamUtil - programs for working on SAM/BAM files</strong><br>
  bamUtil is a repository that contains several programs that perform operations on SAM/BAM files. All of these programs are built into a single executable, <code>bam</code>.<br>
  URL: <a href="http://genome.sph.umich.edu/wiki/BamUtil">http://genome.sph.umich.edu/wiki/BamUtil</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>bcftools</strong><br>
  1.2, 1.3.1, <em>1.4</em>
  </td>
  <td>
  <strong>BCFtools: utilities for variant calling and manipulating VCFs and BCFs</strong><br>
  BCFtools is a set of utilities that manipulate variant calls in the Variant Call Format (VCF) and its binary counterpart BCF. All commands work transparently with both VCFs and BCFs, both uncompressed and BGZF-compressed.<br>
  URL: <a href="https://samtools.github.io/bcftools/bcftools.html">https://samtools.github.io/bcftools/bcftools.html</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>bedops</strong><br>
  <em>1.2.2c</em>
  </td>
  <td>
  <strong>BEDOPS: the fast, highly scalable and easily-parallelizable genome analysis toolkit</strong><br>
  BEDOPS is an open-source command-line toolkit that performs highly efficient and scalable Boolean and other set operations, statistical calculations, archiving, conversion and other management of genomic data of arbitrary scale. Tasks can be easily split by chromosome for distributing whole-genome analyses across a computational cluster.<br>
  URL: <a href="https://bedops.readthedocs.io/">https://bedops.readthedocs.io/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>bedtools2</strong><br>
  2.13.4, 2.15.0, 2.16.2, <em>2.26.0</em>
  </td>
  <td>
  <strong>Bedtools2</strong><br>
  Collectively, the bedtools utilities are a swiss-army knife of tools for a wide-range of genomics analysis tasks. The most widely-used tools enable genome arithmetic: that is, set theory on the genome. For example, bedtools allows one to intersect, merge, count, complement, and shuffle genomic intervals from multiple files in widely-used genomic file formats such as BAM, BED, GFF/GTF, VCF.<br>
  URL: <a href="https://github.com/arq5x/bedtools2/">https://github.com/arq5x/bedtools2/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>blast</strong><br>
  <em>2.2.26</em>
  </td>
  <td>
  <strong>BLAST: Basic Local Alignment Search Tool</strong><br>
  BLAST finds regions of similarity between biological sequences. The program compares nucleotide or protein	sequences to sequence databases and calculates the statistical significance.<br>
  URL: <a href="https://blast.ncbi.nlm.nih.gov/Blast.cgi">https://blast.ncbi.nlm.nih.gov/Blast.cgi</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>bowtie2</strong><br>
  2.0.0-beta6, 2.1.0, 2.2.6, <em>2.2.9</em>
  </td>
  <td>
  <strong>Bowtie2</strong><br>
  Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences.<br>
  URL: <a href="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml">http://bowtie-bio.sourceforge.net/bowtie2/index.shtml</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>bwa</strong><br>
  0.5.10, 0.6.1, 0.7.5a, <em>0.7.12</em>
  </td>
  <td>
  <strong>Burrows-Wheeler Aligner (BWA)</strong><br>
  Burrows-Wheeler Aligner (BWA) is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome.<br>
  URL: <a href="http://bio-bwa.sourceforge.net/">http://bio-bwa.sourceforge.net/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>cbc-bin</strong><br>
  <em>0.1.0</em>
  </td>
  <td>
  <strong>CBC-shared Scripts and Binaries</strong><br>
  Utility scripts and binaries of the UCSF CBC group.<br>
  URL: <a href="https://cbc.ucsf.edu/">https://cbc.ucsf.edu/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>cbc-devel</strong><br>
  <em>0.1.0</em>
  </td>
  <td>
  <strong>CBC-shared Developer's Environment</strong><br>
  Setup for building and installing software inline with the CBC-shared setup.<br>
  URL: <a href="https://cbc.ucsf.edu/">https://cbc.ucsf.edu/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>cbc-shared</strong><br>
  0.1.0, 0.1.2, <em>0.1.1</em>
  </td>
  <td>
  <strong>CBC-shared Software: Default Set</strong><br>
  When loaded, this module loads the default set of CBC-shared software.  This replaces and is backward compatible with the deprecated usage of <code>source /home/shared/cbc/bashrc</code>.<br>
  URL: <a href="https://github.com/UCSF-TI/TIPCC/wiki/Software-shared-by-CBC">https://github.com/UCSF-TI/TIPCC/wiki/Software-shared-by-CBC</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>control-freec</strong><br>
  2.5, <em>7.2-3</em>
  </td>
  <td>
  <strong>Control FREEC: Control-FREE Copy Number and Genotype Caller</strong><br>
  Prediction of copy numbers and allelic content using deep-sequencing data.<br>
  URL: <a href="http://boevalab.com/FREEC/">http://boevalab.com/FREEC/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>cufflinks</strong><br>
  1.0.3, <em>1.3.0</em>
  </td>
  <td>
  <strong>Cufflinks: Transcriptome assembly and differential expression analysis for RNA-Seq</strong><br>
  Cufflinks assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples. It accepts aligned RNA-Seq reads and assembles the alignments into a parsimonious set of transcripts. Cufflinks then estimates the relative abundances of these transcripts based on how many reads support each one, taking into account biases in library preparation protocols.<br>
  URL: <a href="http://cole-trapnell-lab.github.io/cufflinks/">http://cole-trapnell-lab.github.io/cufflinks/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>fastqc</strong><br>
  0.10.1, <em>0.11.2</em>
  </td>
  <td>
  <strong>FastQC</strong><br>
  A quality control tool for high throughput sequence data.<br>
  URL: <a href="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/">http://www.bioinformatics.babraham.ac.uk/projects/fastqc/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>fiji</strong><br>
  <em>2.0.0-rc-54</em>
  </td>
  <td>
  <strong>Fiji - an Image Processing Package</strong><br>
  Fiji is a &quot;batteries-included&quot; distribution of ImageJ, bundling a lot of plugins which facilitate scientific image analysis.<br>
  URL: <a href="https://imagej.net/Fiji/Downloads">https://imagej.net/Fiji/Downloads</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>gdc-client</strong><br>
  <em>1.0.1</em>
  </td>
  <td>
  <strong>GDC Data Transfer Tool</strong><br>
  The GDC provides a standard client-based mechanism in support of high performance data downloads and submission.<br>
  URL: <a href="https://gdc.cancer.gov/access-data/gdc-data-transfer-tool">https://gdc.cancer.gov/access-data/gdc-data-transfer-tool</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>genetorrent</strong><br>
  3.0.2, <em>3.8.5a-94</em>
  </td>
  <td>
  <strong>GeneTorrent</strong><br>
  GeneTorrent is a set of executables for accessing data in the Cancer Genomics Hub (CGHub), a secure repository for storing, cataloging, and accessing cancer genome sequences, alignments, and mutation information from the Cancer Genome Atlas (TCGA) consortium and related projects.<br>
  URL: <a href="https://hpc.nih.gov/apps/GeneTorrent.html">https://hpc.nih.gov/apps/GeneTorrent.html</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>git</strong><br>
  2.1.1, <em>2.1.3</em>
  </td>
  <td>
  <strong>Git - Distributed Version Control System</strong><br>
  Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.<br>
  URL: <a href="https://git-scm.com/">https://git-scm.com/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>gitflow</strong><br>
  <em>0.4.2</em>
  </td>
  <td>
  <strong>Git extension Git Flow</strong><br>
  A collection of Git extensions to provide high-level repository operations for Vincent Driessen's branching model.<br>
  URL: <a href="https://github.com/nvie/gitflow">https://github.com/nvie/gitflow</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>go</strong><br>
  <em>1.8.3</em>
  </td>
  <td>
  <strong>The Go Programming Language</strong><br>
  Go is a cross-platform open-source programming language that makes it easy to build simple, reliable, and efficient software.<br>
  URL: <a href="https://golang.org//">https://golang.org//</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>htop</strong><br>
  <em>1.0.3</em>
  </td>
  <td>
  <strong>htop - an interactive process viewer for Unix</strong><br>
  <code>htop</code> is an interactive process viewer for Unix systems. It is a text-mode application (for console or X terminals) and requires ncurses.<br>
  URL: <a href="http://hisham.hm/htop/">http://hisham.hm/htop/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>htseq</strong><br>
  0.5.4p3, <em>0.6.1</em>
  </td>
  <td>
  <strong>HTSeq: Analysing high-throughput sequencing data with Python</strong><br>
  HTSeq is a Python package that provides infrastructure to process data from high-throughput sequencing assays.<br>
  URL: <a href="http://www-huber.embl.de/users/anders/HTSeq/">http://www-huber.embl.de/users/anders/HTSeq/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>htslib</strong><br>
  <em>1.3.2</em>
  </td>
  <td>
  <strong>Samtools</strong><br>
  Samtools is a suite of programs for interacting with high-throughput sequencing data. It consists of three separate repositories: Samtools, BCFtools, and HTSlib.<br>
  URL: <a href="http://www.htslib.org/">http://www.htslib.org/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>igv</strong><br>
  2.1.2, 2.3.31, 2.3.68, <em>2.3.92</em>
  </td>
  <td>
  <strong>IGV: The Integrative Genomics Viewer</strong><br>
  The Integrative Genomics Viewer (IGV) is a high-performance visualization tool for interactive exploration of large, integrated genomic datasets. It supports a wide variety of data types, including array-based and next-generation sequence data, and genomic annotations.<br>
  URL: <a href="https://software.broadinstitute.org/software/igv/">https://software.broadinstitute.org/software/igv/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>igvtools</strong><br>
  2.3.68, <em>2.3.91</em>
  </td>
  <td>
  <strong>IGVTools</strong><br>
  The igvtools utility provides a set of tools for pre-processing data files.<br>
  URL: <a href="https://software.broadinstitute.org/software/igv/igvtools">https://software.broadinstitute.org/software/igv/igvtools</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>jdk</strong><br>
  1.6.0, 1.7.0, <em>1.8.0</em>
  </td>
  <td>
  <strong>Java Development Kit (JDK)</strong><br>
  The Java programming language<br>
  URL: <a href="https://www.java.com/">https://www.java.com/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>lua</strong><br>
  5.1.4, <em>5.3.3</em>
  </td>
  <td>
  <strong>The Lua Programming Language</strong><br>
  The Lua programming language<br>
  URL: <a href="https://www.lua.org/">https://www.lua.org/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>luarocks</strong><br>
  <em>2.4.2</em>
  </td>
  <td>
  <strong>LuaRocks - the Lua package manager</strong><br>
  LuaRocks is the package manager for Lua modules.<br>
  URL: <a href="https://luarocks.org/">https://luarocks.org/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>matlab</strong><br>
  R2010b, <em>R2012a</em>
  </td>
  <td>
  <strong>The Matlab Programming Language</strong><br>
  The Matlab programming language<br>
  URL: <a href="https://www.mathworks.com/products/matlab.html">https://www.mathworks.com/products/matlab.html</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>pandoc</strong><br>
  <em>1.19.2-0</em>
  </td>
  <td>
  <strong>Pandoc - a universal document converter</strong><br>
  Pandoc is a Haskell library for converting from one markup format to another, and a command-line tool that uses this library.<br>
  URL: <a href="http://pandoc.org/">http://pandoc.org/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>pip</strong><br>
  <em>9.0.1</em>
  </td>
  <td>
  <strong>pip - The PyPA recommended tool for installing Python packages</strong><br>
  The PyPA recommended tool for installing Python packages.<br>
  URL: <a href="https://pypi.python.org/pypi/pip">https://pypi.python.org/pypi/pip</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>python</strong><br>
  2.7.3, 2.7.4, <em>2.7.9</em>
  </td>
  <td>
  <strong>The Python Programming Language</strong><br>
  The Python programming language<br>
  URL: <a href="https://www.python.org/">https://www.python.org/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>r</strong><br>
  devel, oldrel, patched, release, 2.7.0, 2.8.0, 2.10.0, 2.11.0, 2.11.1, 2.12.2, 2.13.1, 2.13.2, 2.14.0, 2.15.0, 2.15.1, 2.15.2, 2.15.3, 3.0.0, 3.0.1, 3.0.2, 3.0.3, 3.1.0, 3.1.1, 3.1.2, 3.1.3, 3.2.0, 3.2.1, 3.2.2, 3.2.3, 3.2.4, 3.2.5, 3.3.0, 3.3.1, 3.3.2, 3.3.3, 3.4.0, 3.4.1patched, 3.5.0devel, <em>3.4.1</em>
  </td>
  <td>
  <strong>The R Programming Language</strong><br>
  The R programming language<br>
  URL: <a href="https://www.r-project.org/">https://www.r-project.org/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>r-extras</strong><br>
  <em>0.1.0</em>
  </td>
  <td>
  <strong>R Extras: Additional software, libraries and include paths needed to build some R / Bioconductor packages</strong><br>
  Additional software, libraries and include paths needed to build some R / Bioconductor packages<br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>s3cmd</strong><br>
  <em>1.5.0-alpha3</em>
  </td>
  <td>
  <strong>Amazon S3 Tools: Command Line S3 Client Software and S3 Backup</strong><br>
  ommand Line S3 Client and Backup for Linux and Mac<br>
  URL: <a href="http://s3tools.org/s3cmd">http://s3tools.org/s3cmd</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>samtools</strong><br>
  0.1.12a, 0.1.17, 0.1.18, 0.1.19-patched, 0.1.19, 1.2, <em>1.3.1</em>
  </td>
  <td>
  <strong>Samtools</strong><br>
  Samtools is a suite of programs for interacting with high-throughput sequencing data. It consists of three separate repositories.<br>
  URL: <a href="http://www.htslib.org/">http://www.htslib.org/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>snpeff</strong><br>
  <em>2.0.2</em>
  </td>
  <td>
  <strong>SnpEff - Genetic Variant Annotation and Effect Prediction Toolbox</strong><br>
  SnpEff is a variant annotation and effect prediction tool. It annotates and predicts the effects of variants on genes (such as amino acid changes).<br>
  URL: <a href="http://snpeff.sourceforge.net/">http://snpeff.sourceforge.net/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>snvmix2</strong><br>
  <em>0.11.8-r3</em>
  </td>
  <td>
  <strong>SNVMix2 - Detecting Single Nucleotide Variants from Next Generation Sequencing Data</strong><br>
  SNVMix is designed to detect single nucleotide variants from next generation sequencing data. SNVMix is a post-alignment tool.<br>
  URL: <a href="http://compbio.bccrc.ca/software/snvmix/">http://compbio.bccrc.ca/software/snvmix/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>sratoolkit</strong><br>
  2.3.4-2, 2.4.1, 2.5.7, <em>2.8.2-1</em>
  </td>
  <td>
  <strong>SRA Toolkit</strong><br>
  The SRA Toolkit and SDK from NCBI is a collection of tools and libraries for using data in the INSDC Sequence Read Archives.<br>
  URL: <a href="http://ncbi.github.io/sra-tools/">http://ncbi.github.io/sra-tools/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>tophat</strong><br>
  1.3.0, 1.3.1, 1.4.0, 2.0.3, 2.0.9, 2.0.10, 2.1.0, <em>2.1.1</em>
  </td>
  <td>
  <strong>TopHat</strong><br>
  TopHat is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput short read aligner Bowtie, and then analyzes the mapping results to identify splice junctions between exons.<br>
  URL: <a href="https://ccb.jhu.edu/software/tophat/index.shtml">https://ccb.jhu.edu/software/tophat/index.shtml</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>udocker</strong><br>
  <em>1.0.0</em>
  </td>
  <td>
  <strong>udocker</strong><br>
  A basic user tool to execute simple containers in batch or interactive systems without root privileges.<br>
  URL: <a href="https://github.com/indigo-dc/udocker">https://github.com/indigo-dc/udocker</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>valgrind</strong><br>
  3.10.0, <em>3.8.1</em>
  </td>
  <td>
  <strong>Valgrind - a programming tool for memory debugging, memory leak detection, and profiling</strong><br>
  Valgrind is a programming tool for memory debugging, memory leak detection, and profiling.<br>
  URL: <a href="http://www.valgrind.org/">http://www.valgrind.org/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>varscan</strong><br>
  2.2.3, <em>2.3.9</em>
  </td>
  <td>
  <strong>VarScan</strong><br>
  Variant detection in massively parallel sequencing data<br>
  URL: <a href="http://dkoboldt.github.io/varscan/">http://dkoboldt.github.io/varscan/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>vcftools</strong><br>
  <em>0.1.13</em>
  </td>
  <td>
  <strong>VCFtools</strong><br>
  VCFtools is a program package designed for working with VCF files, such as those generated by the 1000 Genomes Project. The aim of VCFtools is to provide easily accessible methods for working with complex genetic variation data in the form of VCF files.<br>
  URL: <a href="https://vcftools.github.io/">https://vcftools.github.io/</a><br>
  </td>
 </tr>
 <tr>
  <td>
  <strong>wordspy</strong><br>
  <em>1.5</em>
  </td>
  <td>
  <strong>WordSpy</strong><br>
  A steganalysis-based approach to comprehensive identification and characterization of functional regulatory elements.<br>
  URL: <a href="http://cic.cs.wustl.edu/wordspy/dltemp.htm">http://cic.cs.wustl.edu/wordspy/dltemp.htm</a><br>
  </td>
 </tr>
</table>


<br>
<br>
<br>
_The above information was automatically generated on 2017-07-13 17:55:08._
