<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
2025-12-22: This is a draft, which is currently under review. Please use these instructions with care.
</div>

# Clean Up Files

## Alt 1. Clean Up Files using your Trash folder (safe; fast; recommended)

These instructions show how to delete files by moving them to your
personal Trash folder, _without_ deleting them permanently. This gives
you a second chance if you happen to delete files by mistake. There
are tool for recovering files from the Trash folder.  _Your Trash
folder will only be wiped when you explicitly say so_. A good strategy
is to empty the trash folder later - days or weeks - that will give
you a chance to see what files are missing.

Key to working with with the Trash folder, is the `trash-cli` toolbox
available via:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI trash-cli
```

### Alt 1a. Manually moving files to Trash folder

Analogously to using `rm` to manually remove files (danger; that's
irreversible), you can use the `trash` tool to move files and folders
to your Trash folder. For example, say you want to clean out a
specific file and a specific folder, then you can use:

```sh
[alice@{{ site.devel.name }} ~]$ trash ~/projects/some-file
[alice@{{ site.devel.name }} ~]$ trash ~/projects/superduper/
[alice@{{ site.devel.name }} ~]$ 
```

These have now been moved to your Trash folder, which you can see by
using `trash-list`, as in:

```sh
[alice@{{ site.devel.name }} ~]$ trash-list
2025-12-23 11:07:29 {{ site.user.home }}/projects/some-file
2025-12-23 11:07:33 {{ site.user.home }}/projects/superduper
[alice@{{ site.devel.name }} ~]$ 
```



### Alt 1b. Interactively moving files to Trash folder (ncdu)

If you have a lot of files and folders to delete, or you do not have a
good overview where they are and how big they are, you can use the
interactive text-based user interface (TUI) `ncdu` tool to quickly
navigate around and move files to the Trash folder. The `ncdu` tool is
available as:

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI trash-cli ncdu
```

With this, you can then go to the folder you wish to clean up and run `ncdu` from there, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ cd ~/projects/
[alice@{{ site.devel.name }} projects]$ ncdu --one-file-system --enable-delete --delete-command "trash --"
```

This will launch the TUI, and then it starts to scan all the content,
which can take several minutes to complete for large folders. When
scan is complete, you can use the TUI to interactive find files and
folders to delete.

Now, because the scan takes a long time, we recommend a two step
approach; (a) pre-scan files, then (b) navigate and delete files,
which you can do as:

```sh
[alice@{{ site.devel.name }} ~]$ cd ~/projects/
[alice@{{ site.devel.name }} projects]$ ncdu --one-file-system -o ncdu.cache
```

When the scanning is done, there will be a file `ncdu.cache` in the
current directory, which is a database index of all your files and
their sizes. From now on, the `ncdu` TUI will be fast and
responsive. Launch it as:

```sh
[alice@{{ site.devel.name }} projects]$ ncdu -f ncdu.cache --enable-delete --delete-command "trash --"
```

This will open up a text-based user interface (TUI) displaying the
size of files and folders. This TUI makes it easy to navigate in and
out of folders and delete files. Press <kbd>?</kbd> to see available
keyboard shortcuts. The most useful ones are:

 * <kbd>q</kbd> or <kbd>Ctrl-C</kbd>: exit ncdu
 * <kbd>UP</kbd> and <kbd>DOWN</kbd>: move cursor up and down
 * <kbd>RIGHT</kbd>: enter selected directory
 * <kbd>LEFT</kbd>: go back to parent directory
 * <kbd>d</kbd>: delete selected file or directory

When you delete, you will be asked to confirm with "yes", "no", or
"don't ask me again", after which the files are _swiftly_ moved to
your personal Trash folder. Keep deleting files this way until you are
done. Press <kbd>q</kbd> to exit `ncdu` when you are ready.

When you're done, remove the temporary `ncdu.cache` file;

```sh
[alice@{{ site.devel.name }} ~]$ rm ncdu.cache
```


### Recovering files from Trash folder

If you regret some of the deletions in your Trash folder;

```sh
[alice@{{ site.devel.name }} ~]$ trash-list
2025-12-23 11:07:29 {{ site.user.home }}/projects/some-file
2025-12-23 11:07:33 {{ site.user.home }}/projects/superduper
2025-12-23 11:09:32 {{ site.user.home }}/projects/another-file
[alice@{{ site.devel.name }} ~]$ 
```

you can restore them using `trash-restore`;

```sh
[alice@{{ site.devel.name }} ~]$ trash-restore ~/projects/some-file
   0 2025-12-23 11:07:33 {{ site.user.home }}/projects/some-file
What file to restore [0..0]: 0
[alice@{{ site.devel.name }} ~]$ 
```

If there are older versions of the same file, then you will be asked
to select which version you wish to restore.


### Permanently erase Trash folder (danger zone; slow)

<div class="alert alert-danger" role="alert" style="margin-top: 3ex" markdown="1">

**Warning, it is not possible to recover files after they have been
wiped from the Trash folder!** Not even the systems administrators can
do this.

</div>

Before wiping your Trash folder, think twice, because after this step
it is impossible to recover the deleted files. A good strategy is to
let files sit in your trash folder for some days or weeks and keep
doing your regular work. That gives you a chance to detect if you
deleted too many files by mistakes.

To permanently remove _parts_ of your Trash folder;

```sh
[alice@{{ site.devel.name }} ~]$ trash-list
2025-12-23 11:07:29 {{ site.user.home }}/projects/some-file
2025-12-23 11:07:33 {{ site.user.home }}/projects/superduper
2025-12-23 11:09:32 {{ site.user.home }}/projects/another-file
[alice@{{ site.devel.name }} ~]$ 
```

use the `trash-rm` command, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ trash-rm ~/projects/superduper/
[alice@{{ site.devel.name }} ~]$ 
```

This results in:

```sh
[alice@{{ site.devel.name }} ~]$ trash-list
2025-12-23 11:07:33 {{ site.user.home }}/projects/superduper
2025-12-23 11:09:32 {{ site.user.home }}/projects/another-file
[alice@{{ site.devel.name }} ~]$ 
```

That file is now permanently gone.  To permanently remove _all_
content of your Trash folder, use the `trash-empty` command, as in:

```sh
[alice@{{ site.devel.name }} ~]$ trash-empty
Would empty the following trash directories:
    - {{ site.user.home }}/.local/share/Trash
Proceed? (y/N) 
```

If you have a lot of files in your Trash folder, this may take several
minutes to complete.

It is only when you empty your Trash folder that your [disk quota]
decreases.



## Appendix

The default location of your personal Trash folder is
`~/.local/share/Trash/`. The above instructions _move_ deleted files
to this Trash folder, because we used `ncdu ... --delete-command
"trash --"`. Moving files and folders is very fast, regardless of file
system. The command `trash-empty` is slow, much like `rm` is slow,
because it _removes_ the files.


[disk quota]: storage-size.html

