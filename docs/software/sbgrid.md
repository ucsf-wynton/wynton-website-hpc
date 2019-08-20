# SBGrid

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Access to SBGrid software on Wynton HPC is limited to paying members of the SBGrid Consortium.
</div>


## Verify access to SBGrid

The [SBGrid] software is installed on Wynton HPC but is available only to paying members of the [SBGrid Consortium](https://sbgrid.org/join/).  Wynton HPC users who are [SBGrid members] are part of the `sbgrid` Unix group on the Wynton HPC cluster.  You can verify this by running:

```sh
[alice@{{ site.devel.name }} ~]$ groups
lsd sbgrid
```

If `sbgrid` is not part of your output, then you do _not_ have access to the SBGrid software on Wynton HPC.  If you think this is a mistake, please [contact us].


## Enable SBGrid

In order to use SBGrid software, the SBGrid environment must be enabled.  To enable the SBGrid, in the shell or in a job script, do:

```sh
[alice@{{ site.devel.name }} ~]$ source /programs/sbgrid.shrc
********************************************************************************
                  Software Support by SBGrid (www.sbgrid.org)
********************************************************************************
 Your use of the applications contained in the /programs  directory constitutes
 acceptance of  the terms of the SBGrid License Agreement included  in the file
 /programs/share/LICENSE.  The applications  distributed by SBGrid are licensed
 exclusively to member laboratories of the SBGrid Consortium.
******************************************************************************** 
 SBGrid was developed with support from its members, Harvard Medical School,    
 HHMI, and NSF. If use of SBGrid compiled software was an important element     
 in your publication, please include the following reference in your work:      
                                                                                      
 Software used in the project was installed and configured by SBGrid.                   
 cite: eLife 2013;2:e01456, Collaboration gets the most out of software.                
********************************************************************************
 SBGrid installation last updated: 2019-08-20
 Please submit bug reports and help requests to:       <bugs@sbgrid.org>  or
                                                       <http://sbgrid.org/bugs>
********************************************************************************
 Capsule Status: Active
       For additional information visit https://sbgrid.org/wiki/capsules
********************************************************************************
[alice@{{ site.devel.name }} ~]$ 
```


[SBGrid]: https://sbgrid.org/
[SBGrid members]: https://sbgrid.org/members/order/-institutions/
[contact us]: {{ '/about/contact.html' | relative_url }}

<style>
dt {
  margin-top: 1ex;
}
</style>  
