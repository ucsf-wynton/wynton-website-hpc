<div class="alert alert-danger" role="alert">
2018-10-06: This is a mockup page with mockup information.
</div>

# Wynton Compute and Storage Pricing

The Wynton cluster is built on a co-op model where every contributing research group has immediate access to the cluster **computing power** and/or **storage capacity** _proportionate to their contribution_.  In addition, **all members** (free and contributing), have access to a baseline fraction of the cluster computing power and storage capacity regardless of their contribution.

| Description                                          | Free | Compute contributor | Storage contributor
|------------------------------------------------------|:----:|:-------------------:|:-------------------:
| **Compute:**                                         |     |     |             
| • Baseline compute ([short.q & long.q])              |  ✔  |  ✔  |  ✔
| • Priority compute ([member.q])                      |     |  ✔  |      
| • GPU compute ([gpu.q]<sup>1</sup>)                  |     |  ✔  |
| **Storage:**                                         |     |     |             
| • Home storage ([200 GiB]<sup>2</sup>)               |  ✔  |  ✔  |  ✔
| • Global scratch storage ([unlimited]<sup>3</sup>)   |  ✔  |  ✔  |  ✔
| • Extra storage<sup>4</sup>                          |     |     |  ✔


<small>
_Footnote_:
<sup>1</sup> GPUs are currently only available to groups who have contributed with their own GPU-equipped compute nodes but there is [a plan] to provide baseline GPUs for all users.
<sup>2</sup> There is [a plan] to increase the included amount of storage for all users.
<sup>3</sup> Non-modified files older than two weeks are automatically removed from the global scratch storage.
<sup>4</sup> We are currently [in the process]({{ '/about/roadmap.html' | relative_url }}) of defining the _storage_ pricing model.
</small>


## Compute pricing

Free members, and other members who have not contributed toward compute, will be limited by the number of concurrent cores and will have lower priority on the job queue.  Participating co-op **members that contribute compute** to the cluster will get priority on the job queue and will be able to utilize a large number of concurrent cores (proportionate to their contribution).  For further details on scheduling and compute priorities, see [Available queues]({{ '/scheduler/queues.html' | relative_url }}).

Contributions toward compute can be done either in cash ("buy in") or by intergrating existing hardware ("bring your own").

### Buy new compute

As of October 2018, **a compute unit with four nodes (112 cores), 384 GiB RAM, ~0.8 TiB local scatch, 10 Gbps network card, is ~37,000 USD**.  It is possible buy into a partial compute unit - please let us known and we will combine your contributions with others before purchasing the new hardware.

### Bring your own compute

As of October 2018, the **minimal requirement for hardware contributions is 8 cores, 16 GiB RAM, and 1 Gbps networking**.  Please note that contributed hardware will be placed on Wynton's private network, wiped, and reinstalled with the standard Wynton image.


## Storage pricing

We are currently [in the process]({{ '/about/roadmap.html' | relative_url }}) of defining the _storage_ pricing model, which will be available as soon as we have identified all the costs involved.



<style>
table {
  width: auto;
  margin-top: 1.5ex;
  margin-bottom: 1.5ex;
}
</style>

[200 GiB]: {{ '/about/specs.html' | relative_url }}
[unlimited]: {{ '/about/specs.html' | relative_url }}
[a plan]: {{ '/about/roadmap.html' | relative_url }}
[short.q & long.q]: {{ '/scheduler/queues.html' | relative_url }}
[member.q]: {{ '/scheduler/queues.html' | relative_url }}
[gpu.q]: {{ '/scheduler/queues.html' | relative_url }}
