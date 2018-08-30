# Deliverable description, as taken from Github issue #66 on 2018-08-16 {.notoc}

- **WP3:** [Component Architecture](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP3)
- **Lead Institution:** Université Paris-Sud
- **Due:** 2017-08-31 (month 24)
- **Nature:** Other
- **Participants:** @embray, @jpflori, @defeo, @wbhart, ...
- **Proposal:** [p.43](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Blog post](http://opendreamkit.org/2017/10/11/SageWindows/)**
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP3/D3.1/report-final.pdf)**

One of the main tasks of WP3 is concerned with portability of the
software components of OpenDreamKit. Most components are developed in
UNIX environments (Linux and/or OS X), and porting them to other
platforms, most importantly the Windows operating system, is usually a
challenge.

Although UNIX-like systems are popular among open source software
developers and some academics, the desktop and laptop market share of
Windows computers is estimated to be more than 75\% and is an important
source of potential users, especially students.

Some OpenDreamKit components have been supporting Windows for a long
time. However Windows support for SageMath, the largest of them, has
been elusive for more than 10 years. This is particularly challenging,
not so much because of the Sage Python library (which has some, but
relatively little system-specific code). Rather, the challenge is in
porting all of SageMath's 150+ standard dependencies, and ensuring that
they integrate well on Windows, with full Sage's test suite fully passing.

Thus, finally bringing Windows support to the SageMath distribution has
the added benefit of producing working Windows versions of all the CAS's
and other software SageMath depends on, such as GAP, Singular, etc.

We are happy to report that, thanks to OpenDreamKit's efforts, and in
particular thanks to Erik Bray's work at Université Paris-Sud, starting from
version 8.0 of SageMath, released on July 21, 2017, a native Windows 64 bit
installer based on Cygwin has been made available for all users from
[Sage's download page](https://www.sagemath.org/download-windows.html). This is now the recommended way to install SageMath on Windows
platforms.

Originally, the deliverable also had the goal of delivering an installer
for Windows 32-bit based on Cygwin. Unfortunately, this goal was not
achieved due to technical obstacles that we shall briefly explain at
the end of the report. Fortunately, the market share for Windows
32-bit is ever shrinking, and we estimate that the lack of a 32-bit
installer has a very low impact on SageMath's user base.

References:
- Trac pages tracking the current status of [Sage on Cygwin](http://trac.sagemath.org/wiki/CygwinPort) and [Cygwin64](http://trac.sagemath.org/wiki/Cygwin64Port) (lead: @jpflori)
- [Thread on sage-devel initiated by @wbhart on using alternatively MSYS2 for porting Sage on Windows](https://groups.google.com/d/msg/sage-devel/3tKSfcbhlDM/fWFa-X1WBwAJ)
- Experimentation with a [one click installer using a docker image](https://github.com/sagemath/docker-images/issues/1)
- [Notes](https://wiki.sagemath.org/days77/packaging#Windows) from Sage Days 77 workshop (Cernay 2016) on packaging and portability

