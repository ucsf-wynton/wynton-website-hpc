---
context:
  - xfer
---

# Dos2Unix: Windows-Unix File Transfers

## TL;DR

Do you get obscure errors like `\r: command not found` when trying to run your scripts on {{ site.cluster.name }}?  If so, the most likely explanation is that the problematic script file was created in an editor on MS Windows and then copied to {{ site.cluster.name }}. There is a simple solution - just run `dos2unix` on the file, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ dos2unix script.sh
```

Similar problems may occur when you try to run Matlab, Python, and R scripts.


## The reason for the problem

When you hit <kbd>ENTER</kbd> in text editor, the editor will add so called _invisible_ [newline](https://en.wikipedia.org/wiki/Newline).  When you edit on Linux or macOS, the newline comprise the `\n` symbol, which is also referred to as the LF symbol.  However, if you edit on MS Windows, the newline sequence comprise two symbols - `\r\n` (CR+LF).

Now, most software tools on Linux and macOS assumes LF line endings and will not handle CR+LF line endings.  So, say we create the following shell script file `script.sh` on an MS Windows machine:

```plain
#! /usr/bin/env bash

hostname
```

transfer it to {{ site.cluster.name }}, and then try to run it there, we get an obscure error:

```sh
[alice@{{ site.devel.name }} ~]$ source script.sh 

: command not found
```

The problem is that Unix-like systems gets confused by that extra `r` (CR) at the end of each line.  Now, since these symbols are _invisible_ to you, we cannot really tell when looking at the file in the editor whether the line endings are LF or CR+LF.


## Identifying the problem

We can use `cat` with option `-A` to see if a file uses CR symbols;

```sh
[alice@{{ site.devel.name }} ~]$ source script.sh
$ cat -A script.sh
#! /usr/bin/env bash^M$
^M$
hostname^M$
```

The problematic CR symbols are displayed as `^M` and the end-of-line as `$`.  Another way to check whether a file has CR symbols, is to use `dos2unix` with the `--info=d` option;

```sh
[alice@{{ site.devel.name }} ~]$ dos2unix --info=d script.sh
       3  script.sh
```

The '3' is the number of CR symbols found in file `script.sh`.  When running on {{ site.cluster.name }}, we want this count to be zero.


## Fixing the problem

To fix this problem, we can use `dos2unix`.  As its name suggests, this tool converts a file from a DOS format to Unix format.  DOS is the origin of MS Windows.  By running:

```sh
[alice@{{ site.devel.name }} ~]$ dos2unix script.sh
dos2unix: converting file script.sh to Unix format...
```

all CR+LF line endings will be replaced with LF line endings.  We can confirm this using:

```sh
[alice@{{ site.devel.name }} ~]$ dos2unix --info=d script.sh
       0  script.sh
```

and `cat` also agrees:

```sh
[alice@{{ site.devel.name }} ~]$ dos2unix script.sh
#! /usr/bin/env bash$
$
hostname$
```

There are no `^M` displayed.  If we try to run this script again, it'll now work:

```sh
[alice@{{ site.devel.name }} ~]$ source script.sh
{{ site.devel.name }}
```
