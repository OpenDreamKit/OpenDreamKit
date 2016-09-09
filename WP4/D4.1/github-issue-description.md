# Deliverable description, as taken from Github issue's #83 on 2016-09-07 {.notoc}

- **WP4:** [User Interfaces](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP4)
- **Lead Institution:** CNRS
- **Due:** 2016-02-29 (month 6)
- **Nature:** Other
- **Task:** T4.12 (#80)
- **Proposal:** [p.47](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf).

The SageMath project includes many different subsystems, mostly written in C/C++. For each subsystem, Sage provides a low-level interface, usually written in Cython, through which the higher level components access the subsystem. The mathematical community would immensely benefit if the low-level interfaces were maintained outside of the Sage project, as separate Python packages. Indeed such decoupling would enable other Python projects to build upon those externalized interfaces, thus helping to improve them, and share maintenance effort.

Of all the subsystems, the case of Pari is of particular interest. Since its inception, Sage has had a low-level Cython interface to Pari, which has evolved over time in a highly coupled way. Around 2012, some Sage developers forked this interface into a project they called [CyPari](https://bitbucket.org/t3m/cypari/). One of the primary goals of the CyPari fork was to make independent Python bindings to Pari for use in a project called [Snappy](https://bitbucket.org/t3m/snappy). Over time, the CyPari fork has diverged from the Sage/Pari interface, and has gotten behind in terms of functionality.

The goal of this deliverable is to reconcile the fork by externalizing the Sage/Pari interface into an independent package, maintained by the Sage community, which may ultimately replace CyPari inside Snappy. The task happened to be more difficult than originally thought. The high level of coupling between Sage internals and the Pari interface makes it very delicate to pull the latter out of the SageMath codebase. The process of making this possible has lead to a great amount of refactoring inside the Sage project, which is summarized in [Trac ticket 20238](http://trac.sagemath.org/ticket/20238).

Because of the high degree of coupling, and thanks to the availability of Snappy, this deliverable constitutes a highly valuable case study for future externalizations of low-level interfaces in SageMath. To bring this deliverable to completion, we have decided to split it in several steps:

- [x] Move SageMath's C signalling api to a separate Python/Cython package. The package is called [cycsignals](https://github.com/sagemath/cysignals), and is [integrated to SageMath 7.1](http://trac.sagemath.org/ticket/20002).
- [X] Decouple SageMath's Pari interface from the coercion model. This needs review at [Trac ticket 21158](http://trac.sagemath.org/ticket/21158) and its dependencies.
- [ ] Clean up the interface API, by removing unneeded object orientation and external dependencies. This work is in progress at [Trac ticket 20241](http://trac.sagemath.org/ticket/20241).
- [ ] Move SageMath's Pari interface to a separate Python/Cython package, depending on cysignals. The package is planned to replace the PyPi package [CyPari](https://pypi.python.org/pypi/cypari/). 

The first item is complete and delivered. Progress has been slowed down by delays in the recruitment process in Université Paris Sud, and by the aforementioned technical difficulties. The next two items are approaching completion, we estimate the remaining effort to three more person/weeks. The last item is very easy, once the previous ones are completed.
