# Missing Software?

Don't find the software you need for your analysis?
<!--
Did you make sure it is not in one of the [software repositories]({{ site.baseurl }}/software/software-repositories.html)?
-->
If so, you have a few options:

1. Install it yourself to your own account
   - Download a pre-built binary
   - Build software from source (traditional, e.g. `./configure --prefix ~/software`, `make`, and `make install`)
<!-- - Build software from source (using Spack, e.g. `spack list` and `spack install pango`) -->
   <br><br>

2. Use [Singularity]({{ site.baseurl }}/software/singularity.html) to run it via a Linux container
   - Create your own Linux containers
   - Pull down an existing image from public repositories such as Singularity Hub, Docker Hub, and Biocontainers (e.g. `singularity pull shub://nextflow-io/rnatoy` and `singularity shell nextflow-io-rnatoy-master.sif`)
   <br><br>
  
3. Reach out to the [{{ site.cluster.name }} user community]({{ site.baseurl }}/support/index.html)
   - It could be that someone else has already installed it,
     is interested in also installing it, or is willing to help
   <br><br>

4. Missing core software or missing SCL?
   - If a [CentOS core software]({{ site.baseurl }}/software/core-software.html) or a [CentOS Software Collection (SCL)]({{ site.baseurl }}/software/scl.html) is missing, it is likely that the [the system administrators]({{ site.baseurl }}/about/contact.html) are willing to add it - please let us know
