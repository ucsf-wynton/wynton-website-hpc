# The Wynton HPC User Website

This repository contains the [Wynton HPC user website](https://wynton.ucsf.edu/hpc/).


## Technical details

This website is built upon [Jekyll](https://jekyllrb.com/), where content is mostly written in [Markdown](https://en.wikipedia.org/wiki/Markdown) and rendered by Jekyll into HTML.  The user interface and its style is handled mainly by JavaScript and CSS.

To launch a localhost instance of the website, do:

```sh
$ cd docs
$ bundle exec jekyll serve --port 4001
```

and then open <http://127.0.0.1:4001> in the webbrowser.


## Spell checking

```sh
$ cd docs
$ make spell
No spelling errors found.
$
```

This requires [R](https://www.r-project.org/) and that the [spelling](https://cran.r-project.org/package=spelling) R package is installed, e.g. `install.packages("spelling", repos = "https://cloud.r-project.org")`.  If there are words that are incorrectly flagged as mispelled, they can be added to the 'WORDLIST' file.



## Licenses

* The _content_ of the Wynton HPC is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a> (CC BY-SA 4.0).

* In addition to _content_, there are JavaScript frameworks and CSS files controlling the rendering of the webpage.  See the corresponding folders for their licenses.
