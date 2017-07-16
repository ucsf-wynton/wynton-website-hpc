## Cleanup temporary disk usage on each node

If you have no jobs running, you can run the following to clean out all _your_ files have on the temporary disks on the head node and on each of the nodes:
```sh
$ /home/shared/cbc/bin/clean_tmp --cleanup
```

To inspect how much total temporary disk space are used (everyone's files), do:
```sh
$ /home/shared/cbc/bin/clean_tmp --usage
```

**TIPS**: The `TMPDIR` environment variable is set to `/tmp/$USER` for all users on the cluster and is provides a _personal_ temporary folder.  This folder is automatically created and available on all nodes on the cluster.
