# Slurm Job Arrays

An array job is a collection of similar serial tasks which can be submitted and controlled together. When submitted, the specified number of tasks (using `--array=`) will be created based on the submitted batch file.

For example, `--array=0-31` runs 32 tasks as a job array. 

Each task runs the same batch job script, but gets a different value for the $SLURM_ARRAY_TASK_ID environment variable (from '0' to '31' in this example). You can use this to choose different inputs or other parameters for each task. 

The batch file submitted in the examples below is named `testarray.sh`.

```sh
#!/bin/bash

#SBATCH --job-name=testarray
#SBATCH --output=test_%A_%a.out
#SBATCH --error=test_%A_%a.err

echo "SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
```

```sh
# Submit a job array with index values between 0 and 31
$ sbatch --array=0-31 -N1 testarray.sh
Submitted batch job 6258
```

Will run 32 taks and also produce a series of 32 output and 32 error files, 1 for each array task. Since `array=0-31` was used the index will start at 0 and end at 31 (if `array=1-32` were instead used the same number of output and error files would be created, but the index would start at 1 and end at 32).

In generating the filenames of output and error files in the `testarray.sh` erxample, the `%A` represents the Slurm job id and the `%a` the array task id.

```sh
test_6258_0.err
test_6258_0.out
test_6258_1.err
test_6258_1.out
...
test_6258_31.err
test_6258_31.out
```

Note, instead of passing the array task index range from the command line using `--array=`, it can be included in the Slurm batch file using `#SBATCH --array=` and submitted with

```sh
$ sbatch -N1 testarray.sh
```

```sh
#!/bin/bash

#SBATCH --job-name=testarray
#SBATCH --output=test_%A_%a.out
#SBATCH --error=test_%A_%a.err
#SBATCH --array=0-31

echo "SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TAST_ID
```

Array tasks can also be submitted with different index values and index step sizes.

```sh
# Submit a job array with index values of 1, 3, 5 and 7
$ sbatch --array=1,3,5,7 -N1 testarray.sh

# Submit a job array with index values between 1 and 7
# with a step size of 2 (i.e. 1, 3, 5 and 7)
$ sbatch --array=1-7:2 -N1 testarray.sh
```

Reference: [SchedMD - Slurm Job Array](https://slurm.schedmd.com/job_array.html)
