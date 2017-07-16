# Transfer Files and Directories

## From a remote machine to cluster

### Copy a single file to your cluster home directory

To copy a single file to `~/` on the cluster, use
```sh
{remote}$ scp one_file.tsv wynton.ucsf.edu:
```

### Copy one or more files to folder `~/data/files/`

To copy multiple files to the cluster so they appear directly under `~/data/files/`, use
```sh
{remote}$ scp *.txt *.R ../some/path/another_file.tsv wynton.ucsf.edu:data/files/
```

### Recursively copy a directory to folder `~/data/`

To copy all content of directory `dataset/` to the cluster so that it appears as `~/data/dataset/`, use
```sh
{remote}$ scp -r dataset/ wynton.ucsf.edu:data/
```



