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


## Installing Jekyll

_Warning_: It turns out that [the most recent version of Jekyll is not compatible with the recent version of GitHub Pages](https://github.com/github/pages-gem/issues/577).  Specifically, GitHub Pages requires Jekyll version >= 3.7.3 and <= 3.8.3.  So we need to make sure to install specific version of a few packages below.  If you by mistake installed a too new version of a gem, you can uninstall using something like `gem uninstall jekyll --version 4.1.0`.

The below instructions assumes that Ruby and its `gem` command is available on the machine.  Other than that, making sure to use option `--user-install` when installing, you should be able install Jekyll to your personal account without admin rights.

We start by installing:

```sh
$ gem install --user-install bundler
Fetching: bundler-2.1.4.gem (100%)
Successfully installed bundler-2.1.4
Parsing documentation for bundler-2.1.4
Installing ri documentation for bundler-2.1.4
Done installing documentation for bundler after 3 seconds
1 gem installed
```

Next we install Jekyll 3.8.5:

```sh
$ gem install --user-install jekyll -v 3.8.5
Fetching: safe_yaml-1.0.5.gem (100%)
Successfully installed safe_yaml-1.0.5
Fetching: forwardable-extended-2.6.0.gem (100%)
...
Parsing documentation for jekyll-3.8.5
Installing ri documentation for jekyll-3.8.5
Done installing documentation for safe_yaml, forwardable-extended, pathutil, mercenary, liquid, rb-fsevent, ffi, rb-inotify, listen, jekyll-watch, sass-listen, sass, jekyll-sass-converter, i18n, http_parser.rb, eventmachine, em-websocket, colorator, jekyll after 18 seconds
19 gems installed
```

Then we install the GitHub Pages:
```sh
$ gem install --user-install github-pages
Fetching: public_suffix-3.1.1.gem (100%)
Successfully installed public_suffix-3.1.1
Fetching: addressable-2.5.2.gem (100%)
...
Parsing documentation for github-pages-206
Installing ri documentation for github-pages-206
Done installing documentation for public_suffix, addressable, kramdown, rouge, jekyll, jekyll-commonmark-ghpages, github-pages-health-check, jekyll-redirect-from, jekyll-sitemap, jekyll-feed, jekyll-seo-tag, jekyll-github-metadata, jekyll-avatar, rubyzip, jekyll-remote-theme, jemoji, jekyll-mentions, jekyll-relative-links, jekyll-optional-front-matter, jekyll-readme-index, jekyll-titles-from-headings, jekyll-swiss, minima, jekyll-theme-primer, github-pages after 9 seconds
25 gems installed
```

Finally, we install a few specific versions that GitHub Pages requires:

```sh
$ gem install --user-install liquid -v 4.0.0
Fetching: liquid-4.0.0.gem (100%)
Successfully installed liquid-4.0.0
Parsing documentation for liquid-4.0.0
Installing ri documentation for liquid-4.0.0
Done installing documentation for liquid after 1 seconds
1 gem installed
```
```r
$ gem install --user-install listen -v 3.1.5
Fetching: ruby_dep-1.5.0.gem (100%)
Successfully installed ruby_dep-1.5.0
Fetching: listen-3.1.5.gem (100%)
Successfully installed listen-3.1.5
Parsing documentation for ruby_dep-1.5.0
Installing ri documentation for ruby_dep-1.5.0
Parsing documentation for listen-3.1.5
Installing ri documentation for listen-3.1.5
Done installing documentation for ruby_dep, listen after 0 seconds
2 gems installed
```

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
