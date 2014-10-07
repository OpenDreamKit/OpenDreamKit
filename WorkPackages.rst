Work Package Clusters
=====================

Overview – develop and validate a software architecture building on
relevant prior art, techniques from other communities, etc. into which
a wide range of components can be plugged to develop flexible bespoke
VREs for particular communities and projects.


Emerging Technology
-------------------

Produce periodic reviews of relevant developments elsewhere and
implications for our plans, including negotiating access or shared
development if appropriate

Community Building & Engagement
-------------------------------

- Reports on community needs
- Open workshops (Sage Days, Pari Days, summer schools, etc.)
- Both for development and training
- General travel budget
- Large demonstrators

Component Architecture
----------------------

Develop and demonstrate a set of APIs enabling components such as
database interfaces, computational modules, separate systems such as
GAP, Sage to be flexibly combined and run smoothly across a range of
environments (cloud, local, server, ...).

Pick up standard components/service for storage and sharing,
computational resources, authentication etc. Recomputation connection
belongs here?

Need to dig into what Jupyter have done

Collaboration with unreliable (or restricted!) networking connections
(peer-to-peer, opportunistic syncing, 3rd world). This is technically
interesting, and gets in support for non-networked working. Not sure
if it belongs here or not.

- Self adaptation to the environment, better schemes for automatically
  selecting appropriate algorithms / components for a given task.

- Modularisation:
  - common architecture for module maintenance and distribution
    (related to point 1 above)
  - sharing experience and best practices
  - modularization of Sage
  - refactorization of GAP's package mechanism; namespaces?

- Portability
  Port to windows (GAP, Sage, Singular)
  Multiplatform test infrastructure

- Security concerns

- Parallelism

Standardisation
---------------

Either as a package by itself, or subpackage of the previous one.

- API's
- Possibly building on OpenMath / SCSCP / ...
- Notebook formats
- Virtualization

User Interfaces
---------------

A modern, robust and flexible interface for computation, supporting
real-time sharing, integration with collaborative problem-solving,
multilingual documents, paper writing and publication, links to
databases etc.

.. TODO:: include here everything about this topic in Needs.rst

Deliverable and demonstrators:

- IPython integration with GAP, Sage, Singular, ...
- Improvements to IPython, ...

Supporting the Mathematical Process
-----------------------------------

Collaboration tools, links to publication and archival, etc.
appropriate roles for proof/programme checking [does this belong here]

Includes one or two demonstrator deliverables (or make them related
WPs) If we have a publisher, maybe split that part out to give them a
WP to lead Informed by the social stuff.

Interactions with proof systems and proof assistants (reach toward
Calculemus / Theorema / Coq / Gonthier's team / ...).

Development Models for an Academic Free Software Ecosystem
----------------------------------------------------------

Sharing best practices, practices that respect academic requirements
(credit etc.)  development models that embrace more than one project –
has social and technical aspects

Next Generation Mathematical Databases
--------------------------------------

Design interfaces that can be used for a wide range of mathematical
data, facilities for accepting contributions while tracking provenance
and credit, standard metadata allowing database discovery versioning
allowing stable references, citability, recomputation without copying
entire database into VM.

- Warwick, Paul Oliver Dehaye, Logilab? (SME in Paris)
- Databases of polytopes in Polymake
- Database of finite groups (Max)
- Database of lattices

Social Aspects
--------------

Studying how collaboration, publication, acceptance, linking
computations to publications etc could work in the real community

Studying social aspects of mathematical software development models


Other Possible Packages
=======================

Management, dissemination etc.


Points that will need to be argued
==================================

