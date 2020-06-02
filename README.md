# The Wynton HPC User Website

This repository contains the [Wynton HPC user website](https://wynton.ucsf.edu/hpc/).  Updates to the 'master' branch will be published and go live within one minute.


## Prototype the website locally

To get a local copy of this repos, do:

```sh
$ cd /path/to/my/repositories
$ git clone https://github.com/UCSF-HPC/wynton.git
$ cd wynton
$ pwd
/path/to/my/repositories/wynton
```

To launch a localhost instance of the website, do:

```sh
$ cd docs
$ bundle exec jekyll serve --port 4001
```

and then open <http://127.0.0.1:4001> in the web browser.  Note that Jekyll monitors all files and if one of them is updated, then Jekyll will instantaneously re-render the corresponding HTML file.  There is no need to relaunch Jekyll or by other means manually re-render files.  For instance, if there has been updates made to the git repository, doing:

```sh
$ git pull
```

will pull down those updates locally and Jekyll will automatically re-render the HTML website.



## Spell checking

```sh
$ cd docs
$ make spell
No spelling errors found.
```

This requires [R](https://www.r-project.org/) and that the [spelling](https://cran.r-project.org/package=spelling) R package is installed, e.g. `install.packages("spelling", repos="https://cloud.r-project.org")`.  If there are words that are incorrectly flagged as misspelled, they can be added to the 'WORDLIST' file.



## Technical details

This website is built upon [Jekyll](https://jekyllrb.com/), where content is mostly written in [Markdown](https://en.wikipedia.org/wiki/Markdown) and rendered by Jekyll into HTML.  The user interface and its style is handled mainly by JavaScript and CSS.

* <https://github.com/UCSF-HPC/wynton>:
  - The source Git repository for the website
  
* <https://ucsf-hpc.github.io/wynton/>:
  - The legacy website rendered by GitHub Pages (near instant)
  - Only kept up until everyone has moved to the official site

* <https://wynton.ucsf.edu/hpc/>:
  - The official, public website
  - This is updated ones per minute via a local cronjob using a simple `git pull`
  - This web server runs its own local instance of Jekyll


## Licenses

* The _content_ of the Wynton HPC is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a> (CC BY-SA 4.0).

* In addition to _content_, there are JavaScript frameworks and CSS files controlling the rendering of the webpage.  See the corresponding folders for their licenses.
