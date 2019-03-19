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


## <span class="glyphicon glyphicon-upload"></span> From your local machine to the Wynton HPC file system

### Copy a single file on your local file system to your Wynton home directory

To copy a single file to your home directory (`~/`) on the cluster, use
```sh
{local_machine}$ scp one_file.tsv alice@{{ site.transfer.hostname }}:~/
```


### Copy one or more files to a folder on the cluster

To copy multiple files to Wynton so they appear directly under `~/study/files/`, use
```sh
{local_machine}$ scp *.txt *.R ../some/path/another_file.tsv alice@{{ site.transfer.hostname }}:study/files/
```

### Recursively copy a directory to a folder on the cluster

To copy all content of directory `dataset/` to Wynton so that it appears as `~/study/dataset/`, use
```sh
{local_machine}$ scp -r dataset/ alice@{{ site.transfer.hostname }}:study/
```



## <span class="glyphicon glyphicon-download"></span> From the Wynton HPC file system to your local machine

### Copy a single file from your Wynton home directory to your local machine

To copy a single file in your  Wynton home directory to the working directory of your local machine, use
```sh
{local_machine}$ cd /path/project
{local_machine}$ scp alice@{{ site.transfer.hostname }}:one_file.tsv .
```

_Note_: Don't forget that period (`.`) at the end - it indicates copy [the file] "to the current directory".


### Copy one or more files from the cluster

To copy multiple files from `~/study/files/` on the cluster to `~/study/` on your local machine, do:
```sh
{local_machine}$ scp alice@{{ site.transfer.hostname }}:study/files/*.txt alice@{{ site.transfer.hostname }}:study/files/*.R ~/study/
```

### Recursively copy a folder from cluster

To copy all content of directory `dataset/` on the cluster so that it appears as `dataset/` in your local working directory, use
```sh
{local_machine}$ cd /path/project
{local_machine}$ scp -r alice@{{ site.transfer.hostname }}:dataset/ .
```

_Note_: Don't forget that period (`.`) at the end - it indicates copy [the folder] "to the current directory".
