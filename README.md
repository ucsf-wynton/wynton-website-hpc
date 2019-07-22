# The Wynton HPC User Website

This repository contains the [Wynton HPC user website](https://ucsf-hpc.github.io/wynton/).


## Technical details

This website is built upon [Jekyll](https://jekyllrb.com/), where content is mostly written in [Markdown](https://en.wikipedia.org/wiki/Markdown) and rendered by Jejyll into HTML.  The user interface and its style is mainly handled by JavaScript and CSS.

To launch a localhost instance of the website, do:

```sh
$ cd docs
$ bundle exec jekyll serve --port 4001
```

and then open <http://127.0.0.1:4001> in the webbrowser.


## Licenses

* The _content_ of the Wynton HPC is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a> (CC BY-SA 4.0).

* In addition to _content_, there are JavaScript frameworks and CSS files controlling the rendering of the webpage.  See the corresponding folders for their licenses.
