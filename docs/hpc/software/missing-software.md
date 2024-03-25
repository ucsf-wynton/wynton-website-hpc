# Missing Software?

Don't find the software you need for your analysis?
<!--
Did you make sure it is not in one of the [software repositories](/hpc/software/software-repositories.html)?
-->
If so, you have a few options:

1. [Install it yourself]({{ '/hpc/howto/install-from-source.html' | relative_url }}) to your own account
   - Download a pre-built binary
   - [Build software from source](/hpc/howto/install-from-source.html) (traditional, e.g. `./configure --prefix ~/software`, `make`, and `make install`)
<!-- - Build software from source (using Spack, e.g. `spack list` and `spack install pango`) -->
   <br><br>

2. Use [Apptainer](/hpc/software/singularity.html) to run it via a Linux container
   - Pull down an existing image from public repositories such as Docker Hub and Biocontainers (e.g. `apptainer build blast.sif docker://biocontainers/blast:2.2.31` and `apptainer exec blast.sif blastp -help`)
   - Create your own Linux containers
   <br><br>
  
3. Reach out to the [{{ site.cluster.name }} user community](/hpc/support/index.html)
   - It could be that someone else has already installed it,
     is interested in also installing it, or is willing to help
   <br><br>

4. Missing core software or missing SCL?
   - If a [core software](/hpc/software/core-software.html) or a [Software Collection (SCL)](/hpc/software/scl.html) is missing, it is likely that the [the system administrators](/hpc/about/contact.html) are willing to add it - please let us know
