# OpenDreamKit use case for the Design your Infrastructure workshop

This is a draft of use case for the upcoming [Design your Infrastructure workshop](https://github.com/OpenDreamKit/OpenDreamKit/issues/202) in Krakow. Due date: tomorrow Friday 9th!

Questions for use case providers:

## Background:

* Who is the community/project the use case belongs to?

  computational and experimental mathematics, with a slant toward pure
  mathematics

*   What's the timeline for development, tests and large-scale operation?

    This depends very much on the desired range of features. Some
    simple public services giving easy access to ODK's computational
    components could be deployed within weeks, and already be very
    useful. For example:

    - [tmpnb](tmpnb.org): a temporary notebook server
    - [binder](http://mybinder.org): sharing live notebooks made easy
    - [jupyterhub](http://jupyter.org): generic Jupyter notebook server

    Deploying a full VRE, for example based on
    [SageMathCloud](http://cloud.sagemath.org), and making the most of
    the underlying infrastructure is more a matter of years.

*   What's your role in the use case? Any experience with using e-infrastructures? (EGI, EUDAT, GEANT, OpenAire)

    We are a mix of end users and developers of some of the
    computational, databases, and user interface components.  We have
    experience with using cloud infrastructures, but not specifically
    the European e-infrastructures.


## Users:

* Who will be the users of the planned community-specific e-infrastructure? How many of them?

    SageMathCloud, one of the early VRE based on the ecosystem of
    components OpenDreamKit is contributing to, has several thousands
    of active projects and users.

* How will the users interact with the system - Show this on a system architecture diagram

    SageMathCloud demonstrates a feature set that has been widely
    adopted by the community: users create so-called projects and can
    grant access to other users. A project is more or less a virtual
    machine with many computational components preinstalled, where the
    users can install additional software, run computations, and
    manage a collection of documents (e.g. latex documents, Jupyter
    notebooks, ...), with real time collaboration features.

* Who and how would validate the system?

    Being users ourselves and having early demonstrators helps for the
    validation. Additionally ODK has an End User Group whose specific
    workflow is still to be defined.

## Current status:
* Which components/services already exist in your architecture?

    An ecosystem of computational components (e.g. SageMath, Singular,
    GAP), user intefaces (e.g. Jupyter notebooks), collaborative
    workspaces (e.g. JupyterHub, SageMathCloud), data and knowledge
    bases (e.g. OEIS)


* Which components/services are under development (and by who)?

    Same as above + additional glue between them, all developped by
    overlaping communities with the support from OpenDreamKit.

* Which components/services do you expect to get from e-infrastructures?

    Underlying e-infrastructure services: hardware resources, resource
    allocation, authentication services, cloud management, backup,
    etc. And technical support for the deployement of the components
    on such infrastructure.

## Plans for the workshop:
* What questions would you like to get answered during the event?
* What issues (if any) you would like to solve during the event?
* Other outcomes that you would like to get out from the workshop?

    An actionnable work plan for deploying some simple service (e.g. a
    public tmpnb server with SageMath under the hood), if not an
    actual prototype. This to gain experience and mutal knowledge
    before planning for more complicated services.
