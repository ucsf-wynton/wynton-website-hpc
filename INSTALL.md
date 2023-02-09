# Installing Jekyll

## Ubuntu 22.04

```sh
$ sudo apt install ruby-dev
$ gem install --user-install bundler jekyll jekyll-target-blank github-pages
```

Then

```sh
$ export PATH=$HOME/.gem/ruby/3.0.0/bin
$ make start
```

Last verified: 2023-02-08


## Legacy

### Ubuntu 20.04 (Legacy Notes)

_2023-02-08: These installation notes are probably out dated by now._

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
