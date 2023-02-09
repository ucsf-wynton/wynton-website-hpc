<a target="_blank" rel="noopener noreferrer" href="https://github.com/ucsf-wynton/wynton-website-hpc/actions?query=workflow%3A%22Spell+check%22"><img src="https://github.com/ucsf-wynton/wynton-website-hpc/workflows/Spell%20check/badge.svg" alt="Spell check" style="max-width:100%;"></a> 
<a target="_blank" rel="noopener noreferrer" href="https://github.com/ucsf-wynton/wynton-website-hpc/actions?query=workflow%3A%22YAML+check%22"><img src="https://github.com/ucsf-wynton/wynton-website-hpc/workflows/YAML%20check/badge.svg" alt="YAML check" style="max-width:100%;"></a> 
<a target="_blank" rel="noopener noreferrer" href="https://github.com/ucsf-wynton/wynton-website-hpc/actions?query=workflow%3AMarkdownLint"><img src="https://github.com/ucsf-wynton/wynton-website-hpc/workflows/MarkdownLint/badge.svg" alt="MarkdownLint" style="max-width:100%;"></a>
<a target="_blank" rel="noopener noreferrer" href="https://github.com/ucsf-wynton/wynton-website-hpc/actions?query=workflow%3AMarkdown%20URLs"><img src="https://github.com/ucsf-wynton/wynton-website-hpc/workflows/Markdown%20URLs/badge.svg" alt="Markdown URLs" style="max-width:100%;"></a>
<a target="_blank" rel="noopener noreferrer" href="https://github.com/ucsf-wynton/wynton-website-hpc/actions/workflows/shellcheck.yml"><img src="https://github.com/ucsf-wynton/wynton-website-hpc/actions/workflows/shellcheck.yml/badge.svg" alt="ShellCheck" style="max-width:100%;"></a>
<a target="_blank" rel="noopener noreferrer" href="https://github.com/ucsf-wynton/wynton-website-hpc/actions/workflows/odds-and-ends.yml"><img src="https://github.com/ucsf-wynton/wynton-website-hpc/actions/workflows/odds-and-ends.yml/badge.svg" alt="Odds and Ends" style="max-width:100%;"></a>

# The Wynton HPC Website

This repository contains the  Wynton HPC website <https://wynton.ucsf.edu/hpc/>.  Updates to the 'master' branch will be published and go live within minutes.  


## Dynamically generated data

The website provides dynamic summaries of data that are produced on regular basis by crontab jobs.  Below are some of the data files used:

* Data: [docs/_data/users.yml](https://github.com/ucsf-wynton/wynton-website-hpc/blob/master/docs/_data/users.yml)
  - used by: Jekyll to generate https://wynton.ucsf.edu/hpc/about/specs.html
  - generate manual: `(cd docs; make _data/users.yml)`
  - generate via cronjob: [cron-scripts/wynton-users.sh](https://github.com/ucsf-wynton/wynton-website-hpc/blob/master/cron-scripts/wynton-users.sh)

* Data: [docs/assets/data/compute_shares.tsv](https://github.com/ucsf-wynton/wynton-website-hpc/blob/master/docs/assets/data/compute_shares.tsv)
  - used by: JavaScript to generated table on https://wynton.ucsf.edu/hpc/about/shares.html
  - generate manual: `(cd docs; make assets/data/compute_shares.tsv)`
  - generate via cronjob: [cron-scripts/wynton-shares.sh](https://github.com/ucsf-wynton/wynton-website-hpc/blob/master/cron-scripts/wynton-shares.sh)


## Technical details

This website is built upon [Jekyll](https://jekyllrb.com/), where content is mostly written in [Markdown](https://en.wikipedia.org/wiki/Markdown) and rendered by Jekyll into HTML.  The user interface and its style is handled mainly by JavaScript and CSS.

* <https://github.com/ucsf-wynton/wynton-website-hpc/>:
  - The source Git repository for the website
  
* <https://wynton.ucsf.edu/hpc/>:
  - The official, public website
  - Hosted on GitHub Pages
  - Takes about one minute for a push to go live


## Prototype the website locally

To get a local copy of this repos, do:

```sh
$ cd /path/to/my/repositories
$ git clone https://github.com/ucsf-wynton/wynton-website-hpc.git
$ cd wynton
$ pwd
/path/to/my/repositories/wynton
```

To launch a localhost instance of the website, do:

```sh
$ ## Make sure to have 'bundle' on the PATH, e.g.
$ ## export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"

$ cd docs
$ bundle exec jekyll serve --port 4001
Configuration file: /home/alice/wynton/docs/_config.yml
            Source: /home/alice/wynton/docs
       Destination: /home/alice/wynton/docs/_site
 Incremental build: disabled. Enable with --incremental
      Generating... 
                    done in 0.94 seconds.
 Auto-regeneration: enabled for '/home/alice/wynton/docs'
    Server address: http://127.0.0.1:4001
  Server running... press ctrl-c to stop.
```

and then open <http://127.0.0.1:4001> in the web browser.  Note that Jekyll monitors all files and if one of them is updated, then Jekyll will instantaneously re-render the corresponding HTML file.  There is no need to relaunch Jekyll or by other means manually re-render files.  For instance, if there has been updates made to the git repository, doing:

```sh
$ git pull
```

will pull down those updates locally and Jekyll will automatically re-render the HTML website.



## Spell checking

```sh
$ make spell
No spelling errors found.
```

This requires [R](https://www.r-project.org/) and that the [spelling](https://cran.r-project.org/package=spelling) R package is installed, e.g. `install.packages("spelling", repos="https://cloud.r-project.org")`.  If there are words that are incorrectly flagged as misspelled, they can be added to the [`docs/WORDLIST`](https://github.com/ucsf-wynton/wynton-website-hpc/blob/master/docs/WORDLIST) file.



## Linting

To validate the Markdown syntax and that we follow a consistent style, run:

```sh
$ make markdownlint
*** markdownlint:
[ OK ] checking ./assets/README.md
[ OK ] checking ./about/specs.md
...
[ OK ] checking ./index.md
RESULT: 50 OK, 0 ERROR
```

If there are errors, the explanation for them can be found on <https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md>.  The online [markdownlint demo](https://dlaa.me/markdownlint/) can be useful to better understand certain errors.

Several of the rules are disabled in the [docs/.markdownlint.json](https://github.com/ucsf-wynton/wynton-website-hpc/blob/master/docs/.markdownlint.json) configuration file.

To run these tests locally, install [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli).


To validate the Markdown URLs exists, run:

```sh
$ make markdown-link-check
*** markdown-link-check:
[ OK ] checking ./assets/README.md
[ OK ] checking ./about/specs.md
...
[ OK ] checking ./index.md
RESULT: 50 OK, 0 ERROR
```

To run these tests locally, install [markdown-link-check](https://github.com/tcort/markdown-link-check).


## Installation

To preview this website on your local computer, install Jekyll following the instructions in `INSTALL.md`. Then run:

```sh
$ export PATH=$HOME/.gem/ruby/3.0.0/bin
$ make start
```
