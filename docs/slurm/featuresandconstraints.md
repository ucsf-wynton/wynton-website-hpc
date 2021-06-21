### Slurm Features and Constraints

Features/Constraints allow users to make very specific requests to the scheduler, such as what network speed you prefer and what type of CPU you want to use.

#### Requesting a Feature

```sh
#SBATCH --constraint=<feature_name>
```

Where <feature_name> is one of the features defined below.

To request multiple features/constraints, you must add the following line to your script.


|**Operator Function**|**Operator Symbol**|**Example**|
|:---|:---|:---|
|**AND**|& (ampersand)|#SBATCH --constraint=“cpu_xeon&sse4”|
|**OR**|\| (pipe)|#SBATCH --constraint=“xeon_E52630 \| xeon_E52650 \|xeon_E52670”|

Example:

```sh
#!/bin/bash
#SBATCH --name=my_job_needs_10g_network
#SBATCH --time=02:00:00
#SBATCH --ntasks=8
#SBATCH --mem-per-cpu=4096
#SBATCH --constraint=10g
#SBATCH --output=output.$SLURM_JOB_ID

mpirun /opt/apps/my_app/my_binary
```
  - Job requests 2 hours of runtime (time=02:00:00)
  - Job requests 32GB of memory (4GB per CPU)
  - Job requests only nodes with 10g network connections

|**Feature**|**Description**|
|:---|:---|
|cpu_xeon|Select nodes with Intel Xeon CPUs only|
|cpu_amd|Select nodes with AMD CPUs only|
|10g|Select nodes with 10g Network connections only|
|40g|Select nodes with 40g Network connections only|
|sse4|Select only nodes with sse4 (and above) CPU instruction set|
|sse41|Select only nodes with sse41 (and above) CPU instruction set|
|sse42|Select only nodes with sse42 (and above) CPU instruction set|
|xeon_E52640|Select only nodes with Intel Xeon E_52640 CPUs|
|xeon_6240|Select only nodes with Intel Xeon Gold 6240 CPUs|
