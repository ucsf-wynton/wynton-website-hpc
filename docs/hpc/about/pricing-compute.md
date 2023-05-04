# Pricing for Extra Compute

_Example specifications and pricing as of May 2023_

Please note: You cannot be charged for the hardware until it has been received and invoiced. Since lead times can be extensive, please plan as far ahead as you can. 

## Pricing for prioritized compute ("CPU")

Cluster compute nodes are purchased by Wynton in units that have 4 Compute Nodes in a single chassis. If partial nodes are requested, contributions will be pooled with other requests towards a full system. Another option is to pay $170/per member.q slot/share. 

**Price per 4 compute node unit: ~$33k USD excluding tax (for 4 nodes in a 2U chassis)**

SMC RM224Q 2U Quad-Node Server 
Four Hot-Pluggable Compute Modules, each Node Includes:  
CPU: (2) Xeon Gold 6336Y 2.4GHz Twenty-Four-core  
Memory: 256GB DDR4-3200 ECC (16x 16GB)  
OS: (1) 1.92TB SATA SSD, 3DWPD 

Based on the above pricing, the pricing for CPU contributions is about $173 per CPU/Slot/Share.

**As of May 2023, lead times for compute nodes are 6 weeks from order to delivery.** Once the hardware is received, we will schedule time to configure hardware as time allows given priority projects. Unless you are purchasing a 4-compute node unit, we will need to wait until we have enough requests to place an order for a whole unit. If we have capacity, we may be able to provision some shares in advance of the billing. 

## Pricing for Graphics Processing Unit (GPU)

<div class="alert alert-info" role="alert" markdown="1">
{{ site.cluster.name }} has {{ site.data.specs.gpu_nodes }} GPU nodes with a total of {{ site.data.specs.gpus }} GPUs available to all users. Among these, {{ site.data.specs.gpu_nodes | minus: site.data.specs.communal_gpu_nodes }} GPU nodes, with a total of {{ site.data.specs.gpus | minus: site.data.specs.communal_gpus }} GPUs, were contributed by different research groups. GPU jobs are limited to 2 hours in length when run on GPUs not contributed by the running user's lab.  In contrast, [contributors are _not_ limited to 2-hour GPU jobs on nodes they contributed](/hpc/scheduler/queues.html). There is also one GPU development node that is available to all users.
</div>

Single GPU cards cannot be purchased - only a full GPU node. However, just like partial compute nodes can be purchased, GPU purchase requests can also be pooled towards a full system. 

**All options include the following Mercury GPU208 2U Server. Pricing is in USD and includes warranty. Taxes are calculated and added once hardware is received.** 

CPU: (1) EPYC 7543P 2.8GHz Thirty-Two-Core Procs 
Memory: 512GB DDR4-3200 (8x 64GB)  
OS Drive: (1) 512GB SATA SSD  
Storage: (1) 960GB U.2 NVMe SSD  

**Price per A40 GPU node: ~$25k**
GPU: (4) A40 48GB GDDR6

**Price per L40 GPU node: ~$33k**
GPU: (4) L40 48GB GDDR6 PCIe

**Price per A100 GPU node: ~$58k**
GPU: (4) A100 80GB GDDR6 PCIe 

**As of May 2023, lead times for GPUs are 4-5 months from order to delivery.** Once the hardware is received, we will schedule time to configure hardware as time allows given priority projects.  

## How to purchase

To purchase compute nodes or GPUs, please contact [{{ site.cluster.email_compute }}](mailto:{{ site.cluster.email_compute }}?subject=Request%20to%20purchase%20compute). Please include what you are considering contributing and your speedtype or COA/chartstring for billing, along with any questions.

If you are not ready to purchase but have technical questions while you explore options, please contact support@wynton.ucsf.edu. 
