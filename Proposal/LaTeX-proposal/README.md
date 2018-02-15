# LaTeX-proposal:  A set of LaTeX classes for preparing proposals

Writing grant proposals is a collaborative effort that requires the integration of
contributions from many individuals. The use of an ASCII-based format like LATEX allows to
coordinate the process via a source code control system like Git or Subversion, allowing
the proposal writing team to concentrate on the contents rather than the mechanics of
wrangling with text fragments and revisions. In fact the proposal package has evolved out
of a series of collaborative proposal writing efforts, where large teams (up to 30
individuals from up to 20 sites) have written a 100- page proposal in three weeks (with
over 2000 commits). Such collaborative writing sprints are impossible without a revision
control system and a “semantic” document class that generates tables, charts, and
deliverable lists from content markup and thus takes care of many of the routine tasks of
keeping information consistent.

## Using the LaTeX Proposal Class

In the simplest case, just clone the repository, and extend your  `TEXINPUTS`
environment variable so that it can find it. On a UNIX system something like the following
should work. 
```
cd /path/to/your/project
git clone https://github.com/KWARC/LaTeX-proposal
echo 'export TEXINPUTS = "$(TEXINPUTS):/path/to/your/project/LaTeX-proposal//:"' >> ~/.bashrc
```
Of course you will have to replace `/path/to/your/project` with a path appropriate to
your system. A simple `git pull` will update you to the newest version.

## Getting Started with a New Proposal

The simplest way to start a new proposal is to copy one of the examples at
`LaTeX-proposal/examples/*/*` to your system and start editing. You should probably adapt
the three variables in the upper section of the `Makefile` accordingly, if you want to use
(UNIX) `Makefile` automation (recommended). If you want to use the LaTeX proposal class in
a revision control system for a larger group, read (far) below.

Here is what you would do on a UNIX system after the initial steps above to prepare a DFG
proposal (or an EU proposal the same setup works as well, but with suitably adapted
paths). 
```
cp examples/dfg/proposal .
sed -i .bak s/PROP.dir = ..\/..\/..\//Prop.dir = ./ proposal/Makefile 
sed -i .bak s/BIB = ..\/lib/BIB = ./ proposal/Makefile 

```


## Disclaimer

The LaTeX proposal class has been developed to "scratch my own itch" over many proposals
and will likely be developed further driven by future proposals. It is still quite poorly
documented (but see [proposal.pdf](base/proposal.pdf),
[euproposal.pdf](eu/euproposal.pdf), and [dfgproposal.pdf](dfg/dfgproposal.pdf)), and
experimental in places. It should really be re-coded to be more uniform; but it works for
me and saves me (and my friends who use it) a lot of work.

## License

The proposal class is distributed under the terms of the LaTeX Project Public License from
CTAN archives in directory macros/latex/base/lppl.txt. Either version 1.0 or, at your
option, any later version.

## Help wanted; submit issues, feature requests, & pull requests

As this is just a side project for me, please submit issues and feature requests to the
[issue tracker](issues). Even better, improve the code and submit a
[pull request](https://help.github.com/articles/about-pull-requests/)

## Repository Layout

The base proposal class supports many of the general elements of project proposals. It is
optimized towards collaborating on writing project proposals. This class is intended to be
specialized to particular funding bodies that have their own styles.

* `base`: the base proposal class ([documentation](https://github.com/KWARC/LaTeX-proposal/tree/master/base/proposal.pdf))
* `dfg`: the instance for Deutsche Forschungsgemeinschaft ([documentation](https://github.com/KWARC/LaTeX-proposal/tree/master/dfg/dfgproposal.pdf), [examples](https://github.com/KWARC/LaTeX-proposal/tree/master/examples/dfg))
* `eu`: the instance for EU proposals ([documentation](https://github.com/KWARC/LaTeX-proposal/tree/master/eu/euproposal.pdf), [examples](https://github.com/KWARC/LaTeX-proposal/tree/master/examples/eu))
* `examples`: example proposal (stubs). 
* `etc`: style files from the sTeX bundle added for convenience (only on GitHub, not on CTAN)
* `lib`: Makefiles for the management of self-documenting packages
* `bin`: utilities, e.g. a script that makes GitHub issues from the deliverables of a proposal for project managment if the proposal is granted. 


# Using this repo in a paper repository

The best way to write a collaborative proposal is to use a revision control system. It is
usually a good idea to make this repository into an external sub-repository that can be
updated as necessary. In the instructions below we assume that you - as the paper repos
maintainer - want to add the proposal classes as a sub-repository at path
`lib/LaTeX-proposal` from the top of the paper repository.

## The best way for GIT

is via the `git-subrepo` extension of `git`. Unfortunately this is not part of git
(yet). So you as the paper repos maintainer have to
[install it first](https://github.com/git-commands/git-subrepo#readme) if you want to
install the proposal classes as a subrepos. Your users do not, they will get the subrepos
automatically on `git clone` or `git pull`.

1. go to the top of your paper prehistory: `cd path/to/top` (you can only make a
  "subrepo" from there) 
2. add the LaTeX-proposal distribution repos as a "subrepo": `git subrepo clone git@github.com:KWARC/LaTeX-proposal.git LaTeX-proposal`

Note that under `git-subrepo` the "external" is not updated automatically, a
maintainer has to "pull" it. This can be seen as a feature and not a bug (there is less of
a chance to break things).

1. go to the top of your paper repository: `cd path/to/top` (you can only pull from there)
2. pull the proposal classes repos as a "subrepo": `git subrepo pull LaTeX-proposal`

To contribute changes back to the the LaTeX-proposal  repository, you analogously do 

1. go to the top of your paper prehistory: `cd path/to/top` (you can only push from there)
2. do the push: `git subrepo push LaTeX-proposal`

easypeasy!

## The second best way for GIT
is via `git subtree`. 

1. go to the top of your paper repository: `cd path/to/top`
2. add the LaTeX-proposal  repos as a remote: `git remote add LaTeX-proposal
    git@github.com:KWARC/LaTeX-proposal.git` under the name `LaTex-proposal`.
3. add the remote `LaTeX-proposal`  as a subtree: `git subtree add --prefix=LaTeX-proposal LaTeX-proposal master --squash`
  (here under the path `LaTeX-proposal`). The `--squash` reduces history noise. 

When you want to update the subrepository to the newest version, you have to "subtree
pull" as above: 

1. go to the top of your paper repository: `cd path/to/top`
2. subtree-pull: `git subtree pull --prefix=LaTeX-proposal LaTeX-proposal master --squash`
  this is a bit inconvenient, but works well.

Contributing back to the LaTeX-proposal  repository is somewhat more complex; RTFM!

## Externals in SVN
In a subversion repository you can must make an external by

1. go to the top of your paper prehistory: `cd path/to/top`
2. make the `lib` subdir if necessary: `mkdir lib`
3. add the external: `svn propedit svn:externals lib`
4. an editor will appear, add the line `LaTeX-proposal LaTeX-proposal https://github.com/KWARC/LaTeX-proposal/trunk`
5. commit your work: `svn commit -m'adding external for the LaTeX-proposal '`

Note that in SVN any `svn update`@ will update the LaTeX-proposal repository in the
external as well.

