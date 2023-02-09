# SBGrid Software Collection

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
Access to SBGrid software on {{ site.cluster.name }} is limited to paying members of the SBGrid Consortium.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
For bug reports related to SBGrid software, please use the
[SBGrid's Report Software Bug form](https://sbgrid.org/help/?tab=bug).
The {{ site.cluster.nickname }} sysadmins do not fix problems in SBGrid software.
</div>

SBGrid is a [collection of hundred of programs](https://sbgrid.org/software/)
for structural biology.  It is kept up to date by the [SBGrid] team
without needing intervention by the {{ site.cluster.nickname }} admins.
Each lab using SBGrid must pay a yearly fee. This covers usage by anyone
in the lab, both on {{ site.cluster.name }} and any other Linux or macOS
computer they own. The annual price depends on how many other labs from
UCSF join. Many UCSF labs are already members.
See the [SBGrid] website for information on how to join.


## Verify access to SBGrid

The SBGrid software stack is installed on {{ site.cluster.name }}, but
is available only to paying members, which are listed on the
[SBGrid Member Labs] webpage.  As a {{ site.cluster.name }} user part
of a paying lab, you will have access to SBGrid on the
{{ site.cluster.name }} cluster from being part of the `sbgrid` Unix
group.  You can verify that this is get case by running:

<!-- code-block label="groups" -->
```sh
[alice@{{ site.devel.name }} ~]$ groups
boblab sbgrid
```

If `sbgrid` is not part of your output, then you currently do _not_
have access to the SBGrid software on {{ site.cluster.name }}.  If you
think this is a mistake, please [contact us] so we can add you.


## Enable SBGrid

<div class="alert alert-info" role="alert" style="margin-top: 3ex" markdown="1">
2021-05-28: All our development nodes, including the GPU one, have
CPUs that are compatible with the SBGrid software tools.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
<span>⚠️</span> If you are running SBGrid software and receive an error message regarding *"Illegal Instructions"*, this means that the version of the software you are trying to run requires a CPU feature that one or more of the compute nodes which your job ran on does not support. Many of the default versions of programs included with SBGrid work best on "modern" compute nodes with newer CPU architectures/features. For SBGrid this means Intel "Haswell+" CPUs/Motherboards. (Though read the documentation for the SBGrid software you are trying to use, if you encounter an error that references "Illegal Instructions". You may be able to specify a version of the software compiled for "pre-Haswell" CPUs.)  Alternatively, if you want to use the newer version of the software, you will need to make sure your SBGrid job ends up a on a node with a modern CPU. To do this, specify SGE option `-l hostname="qb3-id*|qb3-as*|qb3-at*`, a group of more modern nodes. (The pipe sign, `|`, is used to indicate the `OR` operator in resource requests, telling your job to run on any node whose hostname value matches the patterns given.)
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
<span>⚠️</span>If you are using SBGrid programs with GPU support, please note that SBGrid programs are compiled for *specific* versions of cuda. Also note the newest Nvidia A40 GPUs on the `qb3-atgpu*` nodes *require* the use of programs compiled against cuda-11.0.2 or greater. As of 2022-09-16, most default versions of GPU compatible versions of SBGrid programs *are not* compiled against cuda-11.0.2 or greater. You may need to specify a beta version of the SBGrid programs or avoid the `qb3-atgpu*` nodes. See the SBGrid documentation for your specific program.
</div>

SBGrid is available for interactive use on the development nodes and for use in job scripts on compute nodes. It is NOT available on the login nodes.

In order to use SBGrid software, the SBGrid environment must be
enabled.  To enable the SBGrid, in the shell or in a job script, do:

<!-- code-block label="sbgrid" -->
```sh
[alice@{{ site.devel.name }} ~]$ source /programs/sbgrid.shrc
********************************************************************************
                  Software Support by SBGrid (www.sbgrid.org)
********************************************************************************
 Your use of the applications contained in the /programs  directory constitutes
 acceptance of  the terms of the SBGrid License Agreement included  in the file
 /programs/share/LICENSE.  The applications  distributed by SBGrid are licensed
 exclusively to member laboratories of the SBGrid Consortium.
              Run sbgrid-accept-license to remove the above message.  
********************************************************************************
 SBGrid was developed with support from its members, Harvard Medical School,    
 HHMI, and NSF. If use of SBGrid compiled software was an important element     
 in your publication, please include the following reference in your work:      
                                                                                
 Software used in the project was installed and configured by SBGrid.           
 cite: eLife 2013;2:e01456, Collaboration gets the most out of software.
********************************************************************************
 SBGrid installation last updated: 2022-04-12
 Please submit bug reports and help requests to:       <bugs@sbgrid.org>  or
                                                       <http://sbgrid.org/bugs>
            For additional information visit https://sbgrid.org/wiki
********************************************************************************
```


[SBGrid]: https://sbgrid.org/
[SBGrid Member Labs]: https://sbgrid.org/members/order/-institutions/
[contact us]: /hpc/about/contact.html

<style>
dt {
  margin-top: 1ex;
}
</style>  
