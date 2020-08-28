# SBGrid Software Collection

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Access to SBGrid software on {{ site.cluster.name }} is limited to paying members of the SBGrid Consortium.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
For bug reports related to SBGrid software, please use <a href="https://sbgrid.org/help/?tab=bug">SBGrid's Report Software Bug form</a>.  The {{ site.cluster.nickname }} sysadmins do not fix SBGrid problems.
</div>

SBGrid is a [collection of hundred of programs](https://sbgrid.org/software/) for structural biology. It is kept up to date by the [SBGrid] team without needing intervention by the {{ site.cluster.nickname }} admins. Each lab using SBGrid must pay a yearly fee. This covers usage by anyone in the lab, both on {{ site.cluster.name }} and any other Linux or Mac computer they own. The annual price depends on how many other labs from UCSF join. There are approximately 12 UCSF labs currently enrolled. See <https://sbgrid.org/join/> for information on how to join.

## Verify access to SBGrid

The SBGrid software stack is installed on {{ site.cluster.name }} but is available only to paying members of the [SBGrid Consortium](https://sbgrid.org/join/).  {{ site.cluster.name }} users who are [SBGrid members] are part of the `sbgrid` Unix group on the {{ site.cluster.name }} cluster.  You can verify this by running:

<!-- code-block #1 -->
```sh
[alice@{{ site.devel.name }} ~]$ groups
lsd sbgrid
```

If `sbgrid` is not part of your output, then you do _not_ have access to the SBGrid software on {{ site.cluster.name }}.  If you think this is a mistake, please [contact us].


## Enable SBGrid

In order to use SBGrid software, the SBGrid environment must be enabled.  To enable the SBGrid, in the shell or in a job script, do:

<!-- code-block #2 -->
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
 SBGrid installation last updated: 2020-08-20
 Please submit bug reports and help requests to:       <bugs@sbgrid.org>  or
                                                       <http://sbgrid.org/bugs>
            For additional information visit https://sbgrid.org/wiki
********************************************************************************
                              SBGrid Announcements
 - RELION users: 3.1-beta versions now use OpenMPI 3.1.6. 
    see https://sbgrid.org/software/titles/relion 
 - MacOS 10.15 Catalina users: 
    please see https://sbgrid.org/wiki/catalina 
******************************************************************************** 
```


[SBGrid]: https://sbgrid.org/
[SBGrid members]: https://sbgrid.org/members/order/-institutions/
[contact us]: {{ '/about/contact.html' | relative_url }}

<style>
dt {
  margin-top: 1ex;
}
</style>  
