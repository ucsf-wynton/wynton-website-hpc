<div class="alert alert-info" role="alert">
To set up password-free file transfers, see <a href="{{ '/howto/log-in-without-pwd.html' | relative_url }}">Log in without Password</a>.
</div>


# Transfer Files and Directories

## From a remote machine to the cluster

### Copy a single file to your cluster home directory

To copy a single file to `~/` on the cluster, use
```sh
{remote}$ scp one_file.tsv {{ site.transfer.hostname }}:
```

### Copy one or more files to folder on the cluster

To copy multiple files to the cluster so they appear directly under `~/data/files/`, use
```sh
{remote}$ scp *.txt *.R ../some/path/another_file.tsv {{ site.transfer.hostname }}:data/files/
```

### Recursively copy a directory to folder on the cluster

To copy all content of directory `dataset/` to the cluster so that it appears as `~/data/dataset/`, use
```sh
{remote}$ scp -r dataset/ {{ site.transfer.hostname }}:data/
```
