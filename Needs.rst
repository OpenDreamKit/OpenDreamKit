What are our needs?

Needs for Sage:

Small money for:
- Organizing Sage days
- Visits (short to long term)
- Laptops, ...

Postdocs

Full time developers/engineers for technical points like:

- Communication with other software
- Collaborative development tools, 
- Continuous integration, hardware for testing on many platforms

- Externalize as much stuff as possible
- HPC infrastructure:
  - For running many independent calculations at once (e.g. notebook server)
  - For parallel calculations
- Database infrastructure (persistence, ...)
- Quicker integration of latest versions of dependencies

- User interface!!!
  - Publishing / sharing notebooks and material
  - Multilingual notebooks?
  - Problem: too many notebook formats (IPython format ??? ReST? Markdown?)
    - Standardized notebook format?
    - Ease of conversion between formats
  - Security
  - Control and trust on the cloud maintainer
  - 2D/3D graphics: proper architecture with everything existing in
    IPython / VPython / ...
  - Interactive books
  - Independent on the "backend": UWashington's cloud / cloud of my
    university / my local machine
 - One possible option:  complete the transition to IPython!

- Repository of training material (outreach: teaching)



- Marcin: Guided simplification of formula

- Collaborative tools for joint research & computations

Funding students internship, teaching reliefs, part-time funding for researchers, ...

Ease of access to computational resources

Make it very easy to write and distribute small external libraries and
plug them in Sage

Usability
=======

.. TODO: getting in touch with experts in ``Usability''.

- Better distribution
- Documentation

Issues in Sage:
- Some serious cleanup is needed that will cause backward incompatibility
- Some serious cleanup everywhere to make the code maintainable
- Semantic of symbolic calculations
- Lack of modularity
- Fine control on which component is used to do a given calculation
- Sage as a library, both for other Python and non Python projects
- Standard packaging system for Sage as a distribution
  that can be replaced by that provided by the operating system
- Python 3

Adding semantic to handles to objects stored in other systems (adapter
infrastructure to propagate category/ontologies information)

Analysis with large data in computational physics

Steve:
- An interesting research project

GAP:
- Managing the package library (dependencies, consistency, review,
  licensing, testing, ...)

Jean-Pierre: with a few months of work, one could get a fully
functional one-click install Sage+Cygwin 32bits. More work for Cygwin
64 bits, but the 32bits version would work on Windows 64 bits.


Goal: Fostering collaborations/integration between components in an open source ecosystem
=============================================================================

- How to make systems "cooperate" rather than "predate each other".
- E.g. reduce the version issues
- Pushing Python bindings upstream

- How to make it easy to develop simultaneously two interdependent
  components (e.g. Sage+Singular)

- Foster communication

- Social aspect:
  Credit, Citations, Recognition
  Funding






To be discussed: articulation with SageMathCloud, NSF funding,
UWashington, ...
