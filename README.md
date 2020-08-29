<a target="_blank" rel="noopener noreferrer" href="https://github.com/UCSF-HPC/wynton/actions?query=workflow%3A%22Spell+check%22"><img src="https://github.com/UCSF-HPC/wynton/workflows/Spell%20check/badge.svg" alt="Spell check" style="max-width:100%;"></a> 
<a target="_blank" rel="noopener noreferrer" href="https://github.com/UCSF-HPC/wynton/actions?query=workflow%3A%22YAML+check%22"><img src="https://github.com/UCSF-HPC/wynton/workflows/YAML%20check/badge.svg" alt="YAML check" style="max-width:100%;"></a> 
<a target="_blank" rel="noopener noreferrer" href="https://github.com/UCSF-HPC/wynton/actions?query=workflow%3AShellCheck"><img src="https://github.com/UCSF-HPC/wynton/workflows/ShellCheck/badge.svg" alt="ShellCheck" style="max-width:100%;"></a>
<a target="_blank" rel="noopener noreferrer" href="https://github.com/UCSF-HPC/wynton/actions?query=workflow%3AMarkdownLint"><img src="https://github.com/UCSF-HPC/wynton/workflows/MarkdownLint/badge.svg" alt="MarkdownLint" style="max-width:100%;"></a>
<a target="_blank" rel="noopener noreferrer" href="https://github.com/UCSF-HPC/wynton/actions?query=workflow%3AMarkdown%20URLs"><img src="https://github.com/UCSF-HPC/wynton/workflows/Markdown%20URLs/badge.svg" alt="Markdown URLs" style="max-width:100%;"></a>


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

This requires [R](https://www.r-project.org/) and that the [spelling](https://cran.r-project.org/package=spelling) R package is installed, e.g. `install.packages("spelling", repos="https://cloud.r-project.org")`.  If there are words that are incorrectly flagged as misspelled, they can be added to the 'docs/WORDLIST' file.



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

Several of the rules are disabled in the [docs/.markdownlint.json](https://github.com/UCSF-HPC/wynton/blob/master/docs/.markdownlint.json) configuration file.

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




## Technical details

This website is built upon [Jekyll](https://jekyllrb.com/), where content is mostly written in [Markdown](https://en.wikipedia.org/wiki/Markdown) and rendered by Jekyll into HTML.  The user interface and its style is handled mainly by JavaScript and CSS.

* <https://github.com/UCSF-HPC/wynton/>:
  - The source Git repository for the website
  
* <https://ucsf-hpc.github.io/wynton/>:
  - The legacy website rendered by GitHub Pages (near instant)
  - Only kept up until everyone has moved to the official site

* <https://wynton.ucsf.edu/hpc/>:
  - The official, public website
  - This is updated ones per minute via a local cronjob using a simple `git pull`
  - This web server runs its own local instance of Jekyll


## Installing Jekyll

_Warning_: It turns out that [the most recent version of Jekyll is not compatible with the recent version of GitHub Pages](https://github.com/github/pages-gem/issues/577).  Specifically, GitHub Pages requires Jekyll version >= 3.7.3 and < 4.0.0 - the latest version verified to work is Jekyll 3.8.7.  So we need to make sure to install specific version of a few packages below.

The below instructions assumes that Ruby and its `gem` command is available on the machine.  Other than that, making sure to use option `--user-install` when installing, you should be able install Jekyll to your personal account without admin rights.

```sh
$ gem install --user-install bundler jekyll:3.8.7 listen:3.1.5 liquid:4.0.0 github-pages:204
Fetching: bundler-2.1.4.gem (100%)
WARNING:  You don't have /home/alice/.gem/ruby/2.5.0/bin in your PATH,
          gem executables will not run.
Successfully installed bundler-2.1.4
Parsing documentation for bundler-2.1.4
Installing ri documentation for bundler-2.1.4
...
Installing ri documentation for liquid-4.0.0
Done installing documentation for liquid after 1 seconds
48 gems installed
```

That's it.

You then need to prepend `$HOME/.gem/ruby/2.5.0/bin` to your PATH such that the `bundler` command in that folder is automatically found;
```sh
$ export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"
$ which bundle
/home/alice/.gem/ruby/2.5.0/bin/bundle
```
Set that PATH in your `~/.bashrc` startup file to make it apply automatically.

That's it.  You can now launch the website locally as above.


## Licenses

* The _content_ of the Wynton HPC is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a> (CC BY-SA 4.0).

* In addition to _content_, there are JavaScript frameworks and CSS files controlling the rendering of the webpage.  See the corresponding folders for their licenses.
