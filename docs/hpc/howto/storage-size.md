# File Sizes and Disk Quotas

## File sizes on `/wynton/`

The `/wynton/` storage is on a [ZFS] file system on top of our BeeGFS parallel storage system. This is **automatically compressed** (using [lz4] compression in ZFS) before anything is written to the physical drives.  Because of this, a 1.0 MiB file is likely to occupy less that 1.0 MiB of drive space.  Exactly, how much a file is compressed varies greatly with file format but as a rule of thumb plain text files can be compressed more than files in a binary format.  Already compressed files such as GZ or ZIP files are unlikely to be compressed further.

Because of this underlying disk compression, command-line tools such as `ls` and `du` may not report what you expect it to report.  For example, consider the Singularity image file `rocker_r-base.img` of size 274,538,527 bytes (= 274,538,527/1024^2 = 261.8 MiB);

```sh
[alice@{{ site.devel.name }} ~]$ ls -l rocker_r-base.img
-rwxr-xr-x. 1 alice boblab 274538527 May  8  2018 rocker_r-base.img
```
The actual space consumed on disk by this file is 256,136,704 bytes (93.3%):
```sh
[alice@{{ site.devel.name }} ~]$ ls -s --block-size 1 rocker_r-base.img
256136704 rocker_r-base.img
```

Using the disk-usage tool `du`, we can see the same if we do:
```sh
[alice@{{ site.devel.name }} ~]$ du --apparent-size --block-size=1 rocker_r-base.img
274538527       rocker_r-base.img
```
and
```sh
[alice@{{ site.devel.name }} ~]$ du --block-size=1 rocker_r-base.img
256136704       rocker_r-base.img
```

_Comment_: It is the _compressed_ size that counts towards your disk quota.


## Disk quota

The BeeGFS file system keeps track on how much disk each of us currently consumes in different storage locations, specifically:

1. User home folder (`$HOME`, i.e. `/wynton/home/` or `/wynton/protected/home/`)
2. Group folder under (i.e. `/wynton/group/`, `/wynton/protected/group/`, and `/wynton/protected/project/`)
3. User files and folders under `/wynton/scratch/` and `/wynton/protected/scratch/` (unlimited quota)

These different type of locations are formally referred to as _storage pools_ by BeeGFS.

If we ever run out of quota in one storage pool, BeeGFS detects this and prevent us from writing additional data. The symptoms of a full quota may vary.  You might get a clear "disk full" error, or you might experience obscure issues such as having problems logging in.
You can use the BeeGFS tool `beegfs-ctl --getquota ...` to check how much disk quota you have and how much you currently consume.  Below sections give instructions how to check this for the different storage locations available.

<div class="alert alert-warning" role="alert" markdown="1">
**Please, be patient!**  If you remove files to clean up your quota, it might take up to ten minutes before these changes are seen with `beegfs-ctl --getquota ...`.  This is because BeeGFS updates the quota information only once every ten minutes.
</div>


### User disk quota on `/wynton/home/` or `/wynton/protected/home/`

To check how much storage space you have consumed on `/wynton/home/` or `/wynton/protected/home/`, and the total amount available to you, call:

```sh
beegfs-ctl --getquota --storagepoolid=11 --uid "$USER"
```

For example,

```sh
[alice@{{ site.devel.name }} ~]$ beegfs-ctl --getquota --storagepoolid=11 --uid "$USER"
      user/group     ||           size          ||    chunk files    
     name     |  id  ||    used    |    hard    ||  used   |  hard   
--------------|------||------------|------------||---------|---------
         alice| 99002||   88.71 GiB| 1000.00 GiB||   645266|unlimited
```

tells us that user `alice` has 645,266 files that occupy 88.71 GiB ('size used') on the BeeGFS file system out of their 1000.00 GiB ('size hard').  **Importantly**, because the `/wynton/home/` storage is **mirrored**, the disk usage ('size used') and the available quota ('size hard') are **reported at twice the size** of what you would expect for a non-mirrored storage.  This is why your [500-GiB home storage space](/hpc/about/specs.html) is reported as 1000 GiB by the `beegfs-ctl` tool.


### Group disk quota on `/wynton/group/`, `/wynton/protected/group/` and `/wynton/protected/project/`

If your group/lab (e.g. `boblab`) has [purchased additional storage](/hpc/about/pricing-storage.html), it is available under `/wynton/group/`, (and possibly also under `/wynton/protected/group/` (PHI), or `/wynton/protected/project/` (PHI)).  To check how much storage space your group/lab has consumed of the total amount available to it, call:

```sh
beegfs-ctl --getquota --storagepoolid=12 --gid "$(id --group)"
```

For example,

```sh
[alice@{{ site.devel.name }} ~]$ beegfs-ctl --getquota --storagepoolid=12 --gid "$(id --group)"
      user/group     ||           size          ||    chunk files
     name     |  id  ||    used    |    hard    ||  used   |  hard
--------------|------||------------|------------||---------|---------
        boblab| 34001||      0 Byte|   40.00 TiB||        0|unlimited
```

The group storage is shared among all group members and does _not_ count toward your personal disk quota under `$HOME`.

Any group with purchased storage can have a group folder in both the non-PHI `/wynton/group/` area and the PHI `/wynton/protected/group/` area, e.g. `/wynton/group/boblab/` and `/wynton/protected/group/boblab/`. In that case, the group quota usage would include group-owned files in both areas. Of course, only members with Wynton PHI access would have access to the data under `/wynton/protected/group/`.

Protected (UCSF P3/P4 classified) data should only be stored in file systems under `/wynton/protected/`.

Your lab can also request to create a subgroup to self-manage the quota for PHI-only data storage (e.g. `/wynton/protected/boblab-phi/`), and it could be allocated as part of the parent quota.

PHI Projects in `/wynton/protected/projects/` are for controlling access to IRB related data, where the IRB access group does not encompass the whole PI group or where the access group encompasses selected members of more than one PI group. The quota for the directory in `/wynton/protected/projects/` could either be a separate group quota purchase or a portion of a purchased group quota dedicated to the project (subgroup).


### User disk usage on `/wynton/scratch/` and `/wynton/protected/scratch/`

To check your disk consumption on the _global_ scratch space (`/wynton/scratch/` and `/wynton/protected/scratch/`), use:

```sh
beegfs-ctl --getquota --storagepoolid=10 --uid "$USER"
```

_Comment_: There are no user or group quotas on `/wynton/scratch/` and `/wynton/protected/scratch/`, but [files on the global scratch that are older than two weeks are deleted automatically](/hpc/about/specs.html).



[lz4]: https://en.wikipedia.org/wiki/LZ4_(compression_algorithm)
[ZFS]: https://en.wikipedia.org/wiki/ZFS
