# Clean Up Files

The below instructions show how to swiftly navigate around in your
folders and move select files to your personal Trash folder. When you
are ready, and certain you didn't make any mistakes, you can choose to
empty your Trash folder. It is only when you your Trash folder that
your [disk quota] decreases.


## Load modules (once per session)

```sh
[alice@{{ site.devel.name }} ~]$ module load CBI ncdu trash-cli
```


## Go to the folder to be cleaned up

Go to the root of the folder you would like to scan for files to be
cleaned up. If you are interested in scanning all of your HOME folder, do:

```sh
[alice@{{ site.devel.name }} somewhere]$ cd ~
[alice@{{ site.devel.name }} ~]$ 
```

If you like to clean up a specific folder, go there, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ cd projects/superduper
[alice@{{ site.devel.name }} superduper]$ 
```

## Scan the folder to be cleaned up

Next, we will pre-scan the folder recursively to find the size of all
files and folders therein;

```sh
[alice@{{ site.devel.name }} ~]$ ncdu --one-file-system -o ncdu.cache
```

This will make it faster to navigate subfolders when selecting what to
delete in the next step. Strictly speaking, this is not necessary for
using `ncdu` to clean up files, but we highly recommend it, especially
for large folder. Depending on how many files are scanned this might
take anything from seconds to minutes to complete. When it's done,
there will be a file `ncdu.cache` in the current directory.


## Moving files to your personal Trash folder (fast)

Now we are ready to start cleaning up among the pre-scanned files. To
do this, launch:

```sh
[alice@{{ site.devel.name }} ~]$ ncdu --enable-delete -f ncdu.cache --delete-command "trash --"
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
"don't ask me again", before the files are _swiftly_ moved to your
personal Trash folder. Keep deleting files this way until you are
done. Press <kbd>q</kbd> to exit `ncdu` when you are ready.

When you're done, remove the temporary `ncdu.cache` file;

```sh
[alice@{{ site.devel.name }} ~]$ rm ncdu.cache
```


## Empty your personal Trash folder (slow)

You can use `trash-list` to see what is in your personal Trash folder,
e.g.

```sh
[alice@{{ site.devel.name }} ~]$ trash-list
2025-12-21 12:31:23 /home/alice/.cache/R/pkgdown
2025-12-21 12:31:24 /home/alice/.cache/R/litedown
2025-12-21 12:30:20 /home/alice/.cache/R/R.cache
2025-12-21 12:31:21 /home/alice/.cache/R/sass
[alice@{{ site.devel.name }} ~]$ 
```

You can restore files using `trash-restore`. See `trash --help` for
more details. 

To empty your personal Trash folder, run:

```sh
[alice@{{ site.devel.name }} ~]$ trash-empty
Would empty the following trash directories:
    - /home/alice/.local/share/Trash
Proceed? (y/N) 
```

If you deleted a lot of files and folders, this may take several
minutes to complete.


## Appendix

The default location of your personal Trash folder is
`~/.local/share/Trash/`. The above instructions move deleted files to
this Trash folder, because we used `ncdu ... --delete-command "trash
--"`.


[disk quota]: storage-size.html

