---
context:
  - login
---

# Find Files

## Find files with a certain filename extension

To find all FASTQ or SAM files under `~/data/`, do

```sh
find `~/data/` -type f -name '*.fastq' -o -name '*.fq' -o -name '*.sam'
```

## Find large files with a certain filename extension

To find all FASTQ and SAM files larger than 50,000 KiB (~= 48.8 MiB) in your home directory (recursively), do

```sh
find ~ -type f -name '*.fastq' -o -name '*.fq' -o -name '*.sam' -size +50000k
```

To do the same but also list their file sizes and time stamps:

```sh
find ~ -type f -name '*.fastq' -o -name '*.fq' -o -name '*.sam' -size +50000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 " (" $6 " " $7 " " $8 ")" }'
```


## Find files older than 14 days

To find all files under `~/transfer/` that have neither been modified nor "added" during the last 14 days, do:

```sh
find ~/transfer/ -type f -ctime +14
```

To remove these files interactively (`rm -i`), do:

```sh
find ~/transfer/ -type f -ctime +14 -exec rm -i {} \;
```
