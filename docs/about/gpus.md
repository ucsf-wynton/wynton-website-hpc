# GPU Compute Nodes

Several of {{ site.cluster.name}} compute nodes have Graphics Processing Units (GPUs):

<dl id="hosttable-summary" class="dl-horizontal">
  <dt>GPU nodes</dt><dd>{{ site.data.specs.gpu_nodes }} GPU compute nodes ({{ site.data.specs.communal_gpu_nodes }} communal and {{ site.data.specs.gpu_nodes | minus: site.data.specs.communal_gpu_nodes }} contributed nodes)</dd>
  <dt>GPUs</dt><dd>{{ site.data.specs.gpus }} GPUs ({{ site.data.specs.communal_gpus }} communal and {{ site.data.specs.gpus | minus: site.data.specs.communal_gpus }} contributed GPUs)</dd>
</dl>

The tables below contain the list of the {{ site.cluster.nickname}} GPU compute nodes and whether the node is contributed by a lab or a communal node contributed by the institution.  Members of groups with contributed GPUs have [extra privileges]({{ '/scheduler/queues.html' | relative_url }}) on the job scheduler for jobs running on their GPU nodes.  If you are a lab interested in contributing a GPU node, please see the [Pricing for Extra Compute]({{ '/about/pricing-compute.html' | relative_url }}) page.



| Node        | GPU         | GPU RAM | #GPUs | RAM     | Node Ownership      | NVME `/scratch` | 
|:------------|:------------|--------:|------:|--------:|:--------------------|:---------------:|
| msg-ihgpu1  | GTX 1080 Ti |  11 GiB |     2 |  48 GiB | msg                 | no              |
| msg-ihgpu2  | GTX 1080 Ti |  11 GiB |     2 |  48 GiB | msg                 | no              |
| msg-ihgpu3  | GTX 1080 Ti |  11 GiB |     2 |  48 GiB | msg                 | no              |
| msg-ihgpu4  | TITAN Xp    |  12 GiB |     2 |  48 GiB | msg                 | no              |   
| msg-ihgpu5  | TITAN Xp    |  12 GiB |     2 |  48 GiB | rosenberglab        | no              |
| msg-iogpu1  | GTX 1080 Ti |  11 GiB |     2 | 128 GiB | msg                 | ✓               |
| msg-iogpu2  | GTX 1080    |   8 GiB |     2 | 128 GiB | msg                 | ✓               |  
| msg-iogpu3  | GTX 1080    |   8 GiB |     2 | 128 GiB | msg                 | no              |
| msg-iogpu4  | GTX 1080    |   8 GiB |     2 | 128 GiB | msg                 | ✓               |
| msg-iogpu5  | GTX 1080    |   8 GiB |     2 | 128 GiB | msg                 | ✓               |
| msg-iogpu6  | GTX TITAN X |  12 GiB |     2 | 128 GiB | msg                 | ✓               |
| msg-iogpu7  | GTX 1080    |   8 GiB |     2 | 128 GiB | msg                 |                 | 
| msg-iogpu8  | GTX 1080    |   8 GiB |     2 | 128 GiB | msg                 | no              |
| msg-iogpu9  | GTX 1080 Ti |  11 GiB |     2 | 128 GiB | msg                 | no              |
| msg-iogpu11 | GTX 1080    |   8 GiB |     4 | 256 GiB | msg                 | no              |
| msg-iogpu12 | GTX 1080    |   8 GiB |     4 | 256 GiB | msg                 | no              |
| msg-iogpu13 | GTX 1080    |   8 GiB |     4 | 256 GiB | msg                 | no              |
| qb3-idgpu1  | GTX 1080    |   8 GiB |     4 | 256 GiB | (communal)          | no              |
| qb3-idgpu2  | GTX 1080    |   8 GiB |     4 | 256 GiB | (communal)          | no              |
| qb3-idgpu3  | RTX 2080 Ti |  11 GiB |     4 | 384 GiB | msg                 | no              |
| qb3-idgpu4  | RTX 2080 Ti |  11 GiB |     4 | 384 GiB | msg                 | no              |
| qb3-idgpu5  | RTX 2080 Ti |  11 GiB |     4 | 384 GiB | msg                 | no              | 
| qb3-idgpu6  | TITAN RTX   |  24 GiB |     5 | 384 GiB | jacobson, amaoutlab | ✓               |
| qb3-idgpu7  | TITAN RTX   |  24 GiB |     4 | 384 GiB | (communal)          | ✓               |
| qb3-idgpu8  | RTX 2080 Ti |  11 GiB |     4 | 384 GiB | (communal)          | ✓               |
| qb3-idgpu9  | RTX 2080 Ti |  11 GiB |     4 | 384 GiB | (communal)          | ✓               |
| qb3-idgpu10 | TITAN RTX   |  24 GiB |     4 | 384 GiB | gladstone           | ✓               | 
| qb3-idgpu11 | RTX 2080 Ti |  11 GiB |     8 | 768 GiB | msg                 | ✓               |
| qb3-idgpu12 | RTX 2080 Ti |  11 GiB |     8 | 768 GiB | msg                 | ✓               |
| qb3-idgpu13 | RTX 2080 Ti |  11 GiB |     8 |  96 GiB | grabelab            | no              |
| qb3-idgpu14 | RTX 2080 Ti |  11 GiB |     8 |  96 GiB | grabelab            | no              |
| qb3-idgpu15 | RTX 2080 Ti |  11 GiB |     8 |  96 GiB | grabelab            | no              |
| qb3-idgpu16 | RTX 2080 Ti |  11 GiB |     8 |  96 GiB | grabelab            | no              |
| qb3-idgpu17 | RTX 2080    |   8 GiB |     2 | 384 GiB | huanglab            | no              |
| qb3-iogpu1  | TITAN Xp    |  12 GiB |     2 |  96 GiB | genetics, amaoutlab | no              |
| qb3-iogpu4  | A100        |  40 GiB |     4 | 512 GiB | i4h                 | ✓               |
| qb3-iogpu5  | GTX 1080    |   8 GiB |     4 | 256 GiB | msg                 | ✓               |
| qb3-atgpu1  | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu2  | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu3  | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu4  | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu5  | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu6  | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu7  | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu8  | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu9  | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu10 | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu11 | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu12 | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu13 | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu14 | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu15 | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu16 | A40         |  48 GiB |     4 | 512 GiB | keiser              | ✓               |
| qb3-atgpu17 | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu18 | A40         |  48 GiB |     4 | 512 GiB | (communal)          | ✓               |
| qb3-atgpu19 | A40         |  48 GiB |     4 | 512 GiB | ichs                | ✓               |
