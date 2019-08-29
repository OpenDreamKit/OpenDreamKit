# The KWARC.bib repository [![Build Status](https://travis-ci.org/KWARC/bibs.svg?branch=master)](https://travis-ci.org/KWARC/bibs)

The repository contains the bib resources of the KWARC group, most notably the
citation database ```kwarc.bib```. It is generated automatically by concatenating
several source files via a [Travis CI](https://travis-ci.org/) build job. 
We additionally use the Travis job to generate  
[publication websites](https://kwarc.github.io/bibs/) with the help of 
[LaTeXML](http://dlmf.nist.gov/LaTeXML/)  - see (far below).

## Using the KWARC bibs

In the simplest case, just clone the repository, and extend your  ```BIBINPUTS```
environment variable so that it can find it. On a UNIX system something like the following
should work. 
```
cd /path/to/your/setup
mkdir -p KWARC
cd KWARC
git clone https://github.com/KWARC/bibs
echo 'export BIBINPUTS="${BIBINPUTS}:/path/to/your/setup/KWARC/bibs:"' >> ~/.bashrc
```

Your `BIBINPUTS` should look something like this: `".//:/path/to/your/setup/KWARC/bibs:"`.

Of course you will have to replace ```/path/to/your/setup``` with a path appropriate to
your system.

If you want to use the KWARC in a revision control system for a larger group,  read (far) below. 


## File structure

This repository contains two main folders: ```src/``` and ```dist/```. The first 
folder contains the sources used to generate the content of the latter. All bib
files are toplevel. 

## Bib files
The top-level bib files  concatenated to create the unified ```kwarc.bib```
file. The sources are: 

* ```preamble.bib``` – LaTeX preamble that defines shared macros and strings
* ```kwarcpubs.bib``` – individual publications of KWARC members (e.g. ```@article```, ```@inproceedings```)
* ```kwarccrossrefs.bib``` – crossref targets (e.g. ```@proceedings```) edited by KWARC
members (e.g. when one of us chaired a workshop)
* ```extpubs.bib``` – publications by external researchers (which may cross-reference
targets in ```kwarccrossrefs.bib```!)
* ```extcrossrefs.bib``` – crossref targets edited by external researchers,
 regardless of whether KWARC or external publications refer to them.
 * ```deprecated.bib``` deprecated citations that are still kept in ```kwarc.bib``` to
   format old papers. NOTE that they may contain double crossrefs that need to be fixed
   manually (the bib is mostly for documentation purposes), best by moving to the
   non-deprecated versions. 
 
For making citations in your documents, you can simply continue to use the
all-in-one ```kwarc.bib``` (but keep in mind that it is not editable!), or
alternatively you can use the individual files. In the latter case, use the
following order:

1. ```preamble.bib```
2. pubs.bib
3. crossrefs.bib

## Editing
The source files do not have any particular order.
 
Do not use any graphical frontend for editing, but use a text 
editor, as the latter makes sure that changes are easy to spot
when using Git/Subversion's diff.
 
Do not touch anything that you don't understand.
 
It is easiest to create new entries by copying and modifying 
existing ones. 

## Online Publications

For online publications, it is strongly recommended to use
BibLaTeX's ```@online{foo:on}``` entries; see 
http://trac.kwarc.info/KWARC/wiki/BibLaTeX 
 
Most online publications come in multiple variants for 
compatibility with legacy publication workflows (such as LNCS). 
The naming scheme is: 
 
* ```@online{entry:on}``` -- BibLaTeX ```online``` entry 
* ```@webpage{entry:webpage}``` -- alpha[h]url, an older solution for 
 online citations
* ```@misc{entry:web}``` -- plain BibTeX entry 
* ```@misc{entry:base}``` -- crossref'd by the others above, contains 
common fields, not suitable for citation

# Publication Pages

We use the Travis job to generate  
[publication websites](https://kwarc.github.io/bibs/) with the help of
[LaTeXML](http://dlmf.nist.gov/LaTeXML/).  Additionally, we generate
specific publication pages for [KWARC members](http://kwarc.info/people/), 
[KWARC projects](http://kwarc.info/projects/), and theses. This behavior is triggered by
the `pubs` key in the bibTeX entries: an entry with `pubs = {foo,bar}` will be listed in
the publication pages http://kwarc.github.io/foo and http://kwarc.github.io/bar.

## The Build Process
In a nutshell,  the build process transforms `kwarcpubs.bib` and `kwarccrossrefs.bib` to LTXML format via
[LaTeXML](http://dlmf.nist.gov/LaTeXML/). Then we run the script `src/pubs/publist.xsl`
over it for all the values from the `pubs=` field in the bibTeX entries that are registered
in the `bibs.do` variable in the `Makefile`. `publist.xsl`
selects the respective items and makes a html file from that. The results are committed to
[the `gh-pages` branch](https://github.com/KWARC/bibs/tree/gh-pages) and are then hosted by GitHub. 

For details see the top-level `Makefile`. 

## Adding a Person or Project Page to the Publication Pages (Generation)
To add a person to the publication pages 
1. update the `bib.people` variable in the top-level `Makefile` and add the username of the person to add
2. update the `<xsl:choose>` statement in `src/pubs/publist.xsl` to set the real name of the person to be added.
Travis will re-build the web page (takes about 30 min), but you should probably test by
building locally first. 
 
## Building locally
The website and concatenated files are generated and pushed automatically via
TRAVIS. For building locally we use a ```Makefile```. It has the following 
targets: 

* ```all = dist```
* ```dist = bib pubs```
* ```bib``` Takes the individual .bib files and concatenates them into ```kwarc.bib```
* ```xml``` Takes the individual .bib files and generates xml versions of them in ```dist/ltxml/*.bib.xml``` using ```latexml```. The generated files are ```.gitignore```d as users should not need them. 
* ```html``` Takes the generated xml files from above and uses latexml and xslt to first generate .tex files in  ```dist/tex/name-type.tex``` and then html files ```dist/html/name-type.html```. Both types are gitignored. Uses an adapted version of the  ```generate-pubwww``` script, now found in ```src/html/generate.html```. 
* ```pubs``` Takes the generated html files and builds a nice-looking bibliography in ```dist/pubs```. The output is .gitignored and intended to be committed to a gh-pages branch later on. Although that would still need an index.html, but that should not be a problem. 
* ```clean-bib```, ```clean-xml```, ```clean-html```, ```clean-pubs```Removes files generated by an individual target. 
* ```clean``` Removes **all** generated files

The ```xml``` and ```html``` targets depend on a working latexml installation. The ```html``` and ```pubs``` targets also need ```xsltproc```. 

# Using this repo in a paper repository
We write most of our papers in ```git``` repositories, there it is usually a good idea to
make this repository into an external sub-repository that can be updated as necessary. In
the instructions below we assume that you - as the paper repos maintainer - want to add the
KWARC bibs as a sub-repository at path ```lib/kbibs``` from the top of the paper
repository.
## The best way for GIT
is via the ```git-subrepo``` extension of ```git```. Unfortunately this is not part of git
(yet). So you as the paper repos maintainer have to
[install it first](https://github.com/git-commands/git-subrepo#readme) if you want to
install the KWARC bibs as a subrepos. Your users do not, they will get the subrepos
automatically on ```git clone``` or ```git pull```. 

1. go to the top of your paper prehistory: ```cd path/to/top``` (you can only make a
  "subrepo" from there) 
2. add the KWARC bibs repos as a "subrepo": ```git subrepo clone git@github.com:KWARC/bibs.git lib/kbibs```

Note that under ```git-subrepo``` the "external" is not updated automatically, a
maintainer has to "pull" it. This can be seen as a feature and not a bug (there is less of
a chance to break things).

1. go to the top of your paper repository: ```cd path/to/top``` (you can only pull from there)
2. pull the KWARC bibs repos as a "subrepo": ```git subrepo pull lib/kbibs```

To contribute changes back to the the KWARC bibs repository, you analogously do 

1. go to the top of your paper prehistory: ```cd path/to/top``` (you can only push from there)
2. pull the KWARC bibs repos as a "subrepo": ```git subrepo push lib/kbibs```

easypeasy!

## The second best way for GIT
is via ```git subtree```. 

1. go to the top of your paper repository: ```cd path/to/top```
2. add the KWARC bibs repos as a remote: ```git remote add kbibs
    git@github.com:KWARC/bibs.git``` under the name ```kbibs```.
3. add the remote ```kbibs```  as a subtree: ```git subtree add --prefix=lib/kbibs kbibs master --squash```
  (here under the path ```lib/kbibs```). The ```--squash``` reduces history noise. 

When you want to update the subrepository to the newest version, you have to "subtree
pull" as above: 

1. go to the top of your paper repository: ```cd path/to/top```
2. subtree-pull: ```git subtree pull --prefix=lib/kbibs kbibs master --squash```
  this is a bit inconvenient, but works well.

Contributing back to the KWARC bibs repository is somewhat more complex; RTFM!

## Externals in SVN
In a subversion repository you can must make an external by

1. go to the top of your paper prehistory: ```cd path/to/top```
2. make the ```lib``` subdir if necessary: ```mkdir lib```
3. add the external: ```svn propedit svn:externals lib```
4. an editor will appear, add the line ```kbibs bibs https://github.com/KWARC/bibs/trunk```
5. commit your work: ```svn commit -m'adding external for the KWARC bibs'```

Note that in SVN any ```svn update``` will update the KWARC bibs in the external as well. 

<!--  LocalWords:  kwarc.bib kwarcpubs.bib kwarccrossrefs.bib crossref extpubs.bib foo:on
 -->
<!--  LocalWords:  extcrossrefs.bib crossrefs entry:on entry:webpage entry:web entry:base
 -->
<!--  LocalWords:  ltxml latexml gitignore xslt gitignored generate-pubwww gh-pages kbibs
 -->
<!--  LocalWords:  xsltproc git-subrepo readme subrepos subrepos subrepo easypeasy subdir
 -->
<!--  LocalWords:  subrepository svn:externals
 -->

## License

Licensed under CC0 1.0 Universal
