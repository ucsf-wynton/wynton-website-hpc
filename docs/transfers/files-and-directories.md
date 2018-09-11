<div class="alert alert-info" role="alert">
To set up password-free file transfers, see <a href="{{ '/howto/log-in-without-pwd.html' | relative_url }}">Log in without Password</a>.  Then there is also no need to specify your cluster username.
</div>


# Transfer Files and Directories

For _storage_ mounted _directly_ on the Wynton cluster, files can be transferred to and from the cluster using regular file copying, e.g. `cp` and `rsync`.
For _non-mounted storage_, files may be transferred to and from the cluster via secure copying, e.g. `scp` and `sftp`, which can be utilized via `rsync`.
For _file downloads_ from online resources, tools such as `curl`, `wget`, and `rsync` may be used.

<div class="alert alert-warning" role="alert">
<a href="{{ '/about/specs.html#compute-nodes' | relative_url }}">Compute nodes</a> have no internet access, i.e. they cannot be used for file transfers other than between mount points.  Although file transfers can also be done via the login nodes, it is recommended to use the <a href="{{ '/about/specs.html#data-transfer-nodes' | relative_url }}">dedicated data transfer node</a>, which provides ten times faster transfers.
</div>


## From a remote machine to the cluster

### Copy a single file to your cluster home directory

To copy a single file to `~/` on the cluster, use
```sh
{remote}$ scp one_file.tsv alice@{{ site.transfer.hostname }}:
```

### Copy one or more files to folder on the cluster

To copy multiple files to the cluster so they appear directly under `~/data/files/`, use
```sh
{remote}$ scp *.txt *.R ../some/path/another_file.tsv alice@{{ site.transfer.hostname }}:data/files/
```

### Recursively copy a directory to folder on the cluster

To copy all content of directory `dataset/` to the cluster so that it appears as `~/data/dataset/`, use
```sh
{remote}$ scp -r dataset/ alice@{{ site.transfer.hostname }}:data/
```
