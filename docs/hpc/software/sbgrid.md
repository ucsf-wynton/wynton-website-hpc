# SBGrid Software Collection

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
Access to SBGrid software on {{ site.cluster.name }} is limited to
paying members of the SBGrid Consortium.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
For bug reports related to SBGrid software, please use the [SBGrid's
Report Software Bug form] The {{ site.cluster.nickname }} sysadmins do
not fix problems in SBGrid software.
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

SBGrid is available for interactive use on the development nodes and
for use in job scripts on compute nodes. It is _not_ available on the
login or data-transfer nodes.

In order to use SBGrid software, the SBGrid environment must be
enabled.  To enable the SBGrid, in the shell or in a job script, call
`source /programs/sbgrid.shrc`, e.g.

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
 SBGrid installation last updated: 2023-11-27
 Please submit bug reports and help requests to:       <bugs@sbgrid.org>  or
                                                       <https://sbgrid.org/bugs>
            For additional information visit https://sbgrid.org/wiki
********************************************************************************
********************************************************************************
```


## Example running an SBGrid software

After having enabled SBGrid, as explained above, SBGrid software tools
work like regular tools.  For example, the SBGrid version of `relion`,

<!-- code-block label="sbgrid-info-relion" -->
```sh
[alice@{{ site.devel.name }} ~]$ sbgrid-info -l relion
  Version information for: /programs/x86_64-linux/relion

Default version:                    4.0.1_cu11.6
In-use version:                     4.0.1_cu11.6

Installed versions:                 4.0.1_cu11.6 5.0-beta_cu12.2 5.0-beta_cu11.6 5.0-beta_cu10.1 4.0.1_cu12.2 4.0.1_cu12.1 4.0.1_cu10.1_legacy 4.0.0_cu11.6 4.0.0_cu10.1_legacy 4.0.0_cu10.1 4.0-beta2_cu11.5 4.0-beta2_cu11.4.1 4.0-beta2_cu10.2 4.0-beta_cu9.2 3.1.4_cu11.8 3.1.4_cu11.6 3.1.4_cu10.1_legacy 3.1.4_cu10.1 3.1.3_cu10.2 3.1.1_cu9.2 3.0.8_cu10.1 2.1_cu8.0 1.4-randomphase3d 1.4b 1.4 1.3
Other available versions:           5.0-beta_cu12.2 5.0-beta_cu11.6 5.0-beta_cu10.1 4.0.1_cu12.2 4.0.1_cu12.1 4.0.1_cu10.1_legacy 4.0.0_cu11.6 4.0.0_cu10.1_legacy 4.0.0_cu10.1 4.0-beta2_cu11.5 4.0-beta2_cu11.4.1 4.0-beta2_cu10.2 4.0-beta_cu9.2 3.1.4_cu11.8 3.1.4_cu11.6 3.1.4_cu10.1_legacy 3.1.4_cu10.1 3.1.3_cu10.2 3.1.1_cu9.2 3.0.8_cu10.1 2.1_cu8.0 1.4-randomphase3d 1.4b 1.4 1.3 
Overrides use this shell variable:  RELION_X

```

can be launched as:

<!-- code-block label="sbgrid-relion-version" -->
```sh
[alice@{{ site.devel.name }} ~]$ relion --version
RELION version: 4.0.1 
Precision: BASE=double

```



## Some SBGrid programs do not run on older compute nodes

Many SBGrid programs run only on "modern" CPUs.  Broadly speaking,
there are four generations of CPUs, on the cluster - x86-64-v1,
x86-64-v2, x86-64-v3, and x86-64-v4 - and SBGrid often requires
x86-64-v3 compute nodes or newer.  If your job fails with an obscure
error such as:

```plain
Illegal instruction (core dumped)
```

or

```plain
 *** caught illegal operation ***
address 0x2b3a8b234ccd, cause 'illegal operand'
```

it most likely ended up on a x86-64-v1 or x86-64-v2 compute node,
while the program required something newer.  To avoid this from
happening, specify the [`x86-64-v=<level>` resource] to request a
compute node with x86-64-v3 or newer.  Either specify command-line
option `-l x86-64-v=3` when you submit the job, or add it is as an SGE
declaration in your script:

```plain
#$ -l x86-64-v=3  ## Script requires a CPU compliant with x86-64-v3 or newer
```

In the unlikely case that the SBGrid documentation says a program is
compatible with pre-Haswell CPUs, it can run on also x86-64-v2 CPUs,
and in some cases even x86-64-v1. If so, you can relax the x86-64
level requirement.

All our [development nodes](/hpc/about/specs.html#development-nodes),
including the GPU ones, have x86-64-v3 or newer CPUs.


## SBGrid programs with GPU support

If you are using SBGrid programs with GPU support, please note that
SBGrid programs are compiled for _specific_ versions of
CUDA. Sometimes SBGrid provide different builds for multiple CUDA
versions.  For example, the same [RELION] version is available for
different CUDA versions.  Because of this, you have to make sure you
[load a corresponding CUDA environment
module](/hpc/scheduler/gpu.html#running-gpu-applications),
e.g. `module load cuda/10.1`.

As of 2022-09-16, most default versions of GPU-compatible SBGrid
programs _are not_ compiled against CUDA 11.0.2, or greater.  However,
note the newest NVIDIA A40 GPUs on the `qb3-atgpu*` compute nodes
_require_ the use of programs compiled against CUDA 11.0.2, or
greater, which means those compute nodes may not be compatible with
the SBGrid program you want to run.  You may need to specify a beta
version of the SBGrid programs, or avoid the `qb3-atgpu*` nodes. See
the SBGrid documentation for your specific program.


[SBGrid]: https://sbgrid.org/
[SBGrid Member Labs]: https://sbgrid.org/members/order/-institutions/
[SBGrid's Report Software Bug form]: https://sbgrid.org/help/?tab=bug
[RELION]: https://www.sbgrid.org/software/titles/relion/
[contact us]: /hpc/about/contact.html
[`x86-64-v=<level>` resource]: /hpc/scheduler/submit-jobs.html#cpu-architecture-generation--l-x86-64-vlevel
<style>
dt {
  margin-top: 1ex;
}
</style>  
