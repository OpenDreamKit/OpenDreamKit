# Introduction

The objective of task [T2.10](https://github.com/OpenDreamKit/OpenDreamKit/issues/33) is to deliver an open-source
community-curated indexing tool for resources in computational
mathematics. The goal is to collect examples, tutorials, lessons,
exercises, related to a system or a field, under a unique hub, while
maintaining the quality of the content through community curation.

Such a need had been felt in all communities involved in OpenDreamKit,
and each had come with its own solutions.  The joint development
efforts under OpenDreamKit, and in particular the unifying force of
the common Jupyer notebook infrastructure, have given a unique
occasion to produce a unified solution, applicable to all systems.
This report introduces *planetaryum*[^1], a web toolkit for building
curated Jupyter notebook collections.

Following the OpenDreamKit philosophy, *planetaryum* is not a single
piece of software, but rather a toolkit, meant to power many different
flavors of curated collections. While it may not cover all possible
use cases, it is versatile enough to adapt to many needs of the
community.

# History

The need for maintaining various types of community curated help
resources has long been felt in any community involved in
OpenDreamKit.  Some interesting examples are:

- Most computer algebra systems maintain a section of their
  website[^2][^3] containing links to high quality resources on the
  web.

- Some systems also have a wiki, e.g. <http://wiki.sagemath.org/>.

- The French SageMath community also used to host a well curated wiki
  with pointers to many didactic resources. The wiki was taken down
  due maintenance difficulties.

- SageMath maintains its own Q&A website at
  <https://ask.sagemath.org>, whereas most other systems rely on
  generic hosted solution such as StackOverflow[^4].

- For a long time, SageMath had been hosting a public instance of a
  SageMath server at <http://sagenb.org/>, where anyone could publish
  SageMath notebooks (old format incompatible with Jupyter) for
  everyone to view. The server had to be taken down among maintenance
  and security issues.

More recently, the Jupyter community has provided the NBViewer
service[^5].  It is a static notebook previewer service that takes as
input a URL pointing to a `.ipynb` file, and renders a static version
of it. The Binder service[^10] further lets the user edit and run
a copy of the notebook.
Importantly, those services do not host notebooks; they only
render them (possibly temporarily caching the rendered result).

Following the success of the Jupyter format, major code hosting
services like GitHub, GitLab, or BitBucket
have started rendering static versions
of Jupyter notebooks without relying on NBViewer.

The availability of these services has spurred a proliferation of
collections of public notebooks hosted on such code sharing services,
presented to the public through either NBViewer or the
service builtin preview.  However, this practice has the major
inconvenience of making it hard to search, classify, and rank
notebooks.

When we sat down to plan for this deliverable, we wanted to provide a
solution to host, search and rank public resources, produced and
curated by the community itself.

We started by evaluating available solutions. The first that we
studied was Géant OER[^6], a metadata aggregator for multimedia
content. It quickly became apparent that its focus on metadata and
multimedia did not suit our needs.

We also evaluated the *nbgallery*[^7] software, a solution for
hosting, indexing searching and ranking Jupyter notebooks. Despite its
potential, the application is rather unstable, and support is limited,
given that it is essentially an internal project maintained by one
person. Indeed, we didn't manage to install a fully working
instance. Plus, although its advanced features are quite impressive,
it does not cover all the use cases we were interested in.

Finally, we experimented with a custom developed application[^8],
whose development had already started in 2015 at a SageMath
meeting. The application is capable of indexing, mirroring, searching
and ranking all types of resources found on the web, with dedicated
treatment for the most relevant formats, such as PDF, Jupyter,
SageMath, HTML, etc. Unfortunately, when an alpha version the service
was deployed, it soon became apparent that it was not taking off and
about to be adopted by the community at large. This was partially
due to the service not being sufficiently trivial to discover and use.
But in the end, it simply looked like the community did not feel the
need for such a generic tool, that was essentially trying to (poorly)
replicate the job of a web search engine.

# Planetaryum

After our first failed attempts, planetaryum came as a new take on the
problem.  We realized that it was essential to recenter our efforts on
a well defined type of document, rather than dispersing our users in a
format agnostic aggregator such as[^8].  The generalization of Jupyter
as a common document format for all OpenDreamKit systems presented a
unique occasion to host instructional resources in a unified way.

Planetaryum also came with the realization that not a single
application can fill all the user needs. We wanted to cover the
teacher hosting a gallery of a dozen notebooks on his course web page,
as well as the software community hub hosting thousands of
user-contributed notebooks.

## Use cases

Planetaryum is a modular Python library that can be used to build many
different applications with a few lines of code. Some of the most
requested applications are already bundled in the library and shipped
as a command-line executable.

Here we present a few possible use cases for Planetaryum.

1. **Static collection.** A (small) collection of notebooks can be
   used to generate a static website, based exclusively on HTML and
   JavaScript, and thus requiring very few resources for hosting. The
   collection is searchable by keywords, and the appearance is
   customizable. The website generation can be automatized through
   continuous integration tools, as in the documented example[^9],
   where, from a Binder-ready GitHub repository containing notebooks,
   we automatically generate and host on GitHub pages a static view
   thanks to Travis CI.

   TODO:

   - compare with what can be obtained with Sphinx+its notebook
     integration (with hosting on e.g. RTD) or Tania's course page
     generator;
   - provide a brief tutorial on how to set up a new collection.
   - (Nicolas) set it up for Nicolas's Info 111 class

2. **Medium sized collection, contributions via PR.** This model is
   suited for small to medium collections of notebooks where it is
   expected that the submission flow will be low and reserved to power
   users. It has the same advantages as the static collection, but at
   the same time it allows contributions, and can optionally be paired
   with a full-text search engine for better exploration.

3. **Large collection, user uploads.** This is a full fledged
   application, backed by a database and a full-text search engine. It
   features filtering, user voting, and potentially other advanced
   features such as recommendation. All the build and deploy steps are
   controlled from the planetaryum executable. It is very similar in
   spirit to *nbgallery*[^7], but it is built with the same components
   as the other applications.


## Design

Planetaryum has a modular design, leading to many different types of
applications. Its main components are:

- **Readers** are responsible for reading a collection of notebooks
  from a medium (e.g., folder, git repository, ...),

- **Extractors** are responsible for parsing and transforming the
  output of a reader to a data stream.

- **Builders** take a data stream and produce an output (e.g., they
  populate a database or write files to disk); they can be chained to
  produce many effect at once (e.g., in a full stack application they
  both populate the database and write the front end files).

- **Front ends** are client side (HTML, JavaScript) applications that
  take the outputs of a builder and produce a user interface. The
  library contains a few very basic default front ends, but they are
  really intended to be developed as separate applications, with their
  own build chain, invoked by a dedicated builder at build time.

- **Apps** take all the above elements and link them together in a
  unique app with a well defined scope. Planetaryum provides a few
  default apps, but the user is free to write his own.

- The **CLI** is a simple command-line interface that permits invoking
  the apps and passing parameters to them (through the command line,
  or through a configuration file).

## Limitations

Despite its flexibility, Planetaryum has the obvious limitation of
only supporting Jupyter notebooks. Although this reduces its scope, we
believe the choice was necessary to make a product that the user would
find easy to understand and attractive.

Other limitations, such as not supporting JavaScript-less browsers,
are purely technical and could be lifted pending enough demand.

# Conclusion

Planetaryum fulfills and surpasses the original goal of having a tool
for maintaining community-curated collections of resources on
mathematical software.

We have come to it through a long process of trial and error, that has
considerably delayed the deliverable. Because of this it is hard, for
the moment, to measure its impact, but we are optimistic on its
adoption by the concerned communities.

TODO:

- strategy to advertise and make it adopted?

- discussion on the multitude of attempts at solving this or similar
  problems being currently developed in the Jupyter community; very
  unclear which one will eventually take off and prosper; it was
  therefore not necessarily worth investing a lot of efforts; better
  provide a simple solution to the most pressing use cases.


[^1]: <https://github.com/OpenDreamKit/planetaryum>.
[^2]: <http://www.gap-system.org/Doc/Examples/examples.html>.
[^3]: <http://www.sagemath.org/help.html>.
[^4]: <https://stackoverflow.com/>.
[^5]: <http://nbviewer.jupyter.org/>.
[^6]: <https://oer.geant.org/>.
[^7]: <https://github.com/nbgallery/nbgallery>.
[^8]: <http://sageindex.lipn.univ-paris13.fr/>.
[^9]: <https://github.com/OpenDreamKit/planetaryum-example-static>.
[^10]: <https://mybinder.org>.
