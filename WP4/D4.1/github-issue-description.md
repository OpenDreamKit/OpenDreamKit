# Deliverable description, as taken from Github issue #83 on 2017-02-09 {.notoc}

- **WP4:** [User Interfaces](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP4)
- **Lead Institution:** CNRS
- **Due:** 2016-02-29 (month 6)
- **Nature:** Other
- **Task:** T4.12 (#80)
- **Proposal:** [p.47](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf).

The SageMath project includes many different subsystems, mostly written in C/C++. For each subsystem, Sage provides a low-level interface, usually written in Cython, through which the higher level components access the subsystem. The mathematical community would immensely benefit if the low-level interfaces were maintained outside of the Sage project, as separate Python packages. Indeed such decoupling would enable other Python projects to build upon those externalized interfaces, thus helping to improve them, and share maintenance effort.

Of all the subsystems, the case of PARI is of particular interest. Since its inception, Sage has had a low-level Cython interface to PARI, which has evolved over time in a highly coupled way. Around 2012, some Sage developers forked this interface into a project they called [CyPari](https://bitbucket.org/t3m/cypari/). One of the primary goals of the CyPari fork was to make independent Python bindings to PARI for use in a project called [Snappy](https://bitbucket.org/t3m/snappy). Over time, the CyPari fork has diverged from the Sage/PARI interface, and has gotten behind in terms of functionality.

The goal of this deliverable is to reconcile the fork by externalizing the Sage/PARI interface into an independent package, maintained by the Sage community, which may ultimately replace CyPari inside Snappy. The task happened to be more difficult than originally thought. The high level of coupling between Sage internals and the PARI interface makes it very delicate to pull the latter out of the SageMath codebase. The process of making this possible has led to a great amount of refactoring inside the Sage project, which is summarized in [Trac ticket 20238](http://trac.sagemath.org/ticket/20238).

Because of the high degree of coupling, and thanks to the availability of Snappy, this deliverable constitutes a highly valuable case study for future externalizations of low-level interfaces in SageMath. To bring this deliverable to completion, we have decided to split it in several steps:

- [x] Move SageMath's C signalling api to a separate Python/Cython package. The package is called [cycsignals](https://github.com/sagemath/cysignals), and is [integrated to SageMath 7.1](http://trac.sagemath.org/ticket/20002).
- [x] Decouple SageMath's PARI interface from the coercion model. This has been achieved in [SageMath 7.4](http://trac.sagemath.org/ticket/21158).
- [x] Clean up the interface API, by removing unneeded object orientation and external dependencies. This has been achieved, and will be available in [SageMath 7.5](http://trac.sagemath.org/ticket/20241).
- [ ] Move SageMath's PARI interface to a separate Python/Cython package, depending on cysignals. The package is planned to eventually replace the PyPi package [CyPari](https://pypi.python.org/pypi/cypari/). 

