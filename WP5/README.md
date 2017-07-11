# WP5: High Performance Mathematical Computing

Lead Institution: Université Joseph Fourier Grenoble

## Objectives:

The objective of this work package is to improve the performance of the computational components of OpenDreamKit,
in particular on massively parallel architectures. This includes notably:
• Fine grained High Performance Computing on many-cores architectures.
• Coarse grained or embarrassingly parallel computing on grids or on the cloud.
• Compilation of high level interpreted code to optimised parallel native code.
• Develop novel HPC infrastructure in the context of combinatorics.
A key aspect will be to foster further sharing expertise and best practices between computational components.

## Description:

As in all other areas of science, properly supporting massively parallel architectures is a major challenge. Many of
the computational components in OpenDreamKit have already gone a long way in this direction. For example, parallel
versions of the GAP kernel for a range of architectures were developed during the 2009-2013 EPSRC “HPCGAP” project.
The expertise gained there was then transferred to the ongoing SINGULAR-HPC project, in particular through the rehiring
of one of the developers of HPC-GAP. The French ANR HPAC project (2012-2015) has also widely contributed to design
parallel exact linear algebra kernels which is a core component for most HPC applications. The LINBOX library, used in
sage, has benefited from this experience on the multi-core processing aspects.
In this work package, we will build on this momentum to further implement HPC support in the component Tasks T5.1
(PARI),T5.2 (GAP), T5.3 (LINBOX), T5.5(MPIR) and T5.4 (SINGULAR).
Many of the computational components of OpenDreamKit, notably SAGE and GAP use a high level interpreted
language for their library. Performance is achieved by rewriting or compiling critical sections into a lower-level language.
SAGE uses the CYTHON PYTHON-to-C compiler; GAP has some more basic support. In Tasks T5.2 and T5.7, we will
also boost performance by further developing and applying such compilation tools, allowing the application programmer
to retain their high level approach.

## Tasks

 - [T5.1](https://github.com/OpenDreamKit/OpenDreamKit/issues/99) PARI
   * [D5.10](https://github.com/OpenDreamKit/OpenDreamKit/issues/108)
   * [D5.16](https://github.com/OpenDreamKit/OpenDreamKit/issues/114)
 - [T5.2](https://github.com/OpenDreamKit/OpenDreamKit/issues/100) GAP
   * [D5.15](https://github.com/OpenDreamKit/OpenDreamKit/issues/113)
 - [T5.3](https://github.com/OpenDreamKit/OpenDreamKit/issues/101) LinBox
   * [D5.9](https://github.com/OpenDreamKit/OpenDreamKit/issues/122)
   * [D5.12](https://github.com/OpenDreamKit/OpenDreamKit/issues/110)
   * [D5.14](https://github.com/OpenDreamKit/OpenDreamKit/issues/112)
 - [T5.4](https://github.com/OpenDreamKit/OpenDreamKit/issues/102) Singular
   * [D5.6](https://github.com/OpenDreamKit/OpenDreamKit/issues/119)
   * [D5.7](https://github.com/OpenDreamKit/OpenDreamKit/issues/120)
   * [D5.13](https://github.com/OpenDreamKit/OpenDreamKit/issues/111)
 - [T5.5](https://github.com/OpenDreamKit/OpenDreamKit/issues/103) MPIR
   * [D5.5](https://github.com/OpenDreamKit/OpenDreamKit/issues/118)
   * [D5.7](https://github.com/OpenDreamKit/OpenDreamKit/issues/120)
 - [T5.6](https://github.com/OpenDreamKit/OpenDreamKit/issues/104) HPC infrastructure for Combinatorics
   * [D5.1](https://github.com/OpenDreamKit/OpenDreamKit/issues/107)
   * [D5.8](https://github.com/OpenDreamKit/OpenDreamKit/issues/121)
   * [D5.11](https://github.com/OpenDreamKit/OpenDreamKit/issues/109)
 - [T5.7](https://github.com/OpenDreamKit/OpenDreamKit/issues/105) Pythran
   * [D5.2](https://github.com/OpenDreamKit/OpenDreamKit/issues/115)
   * [D5.4](https://github.com/OpenDreamKit/OpenDreamKit/issues/117) 
 - [T5.8](https://github.com/OpenDreamKit/OpenDreamKit/issues/106) Sun Grid Engine integration in Jupyter Hub
   * [D5.3](https://github.com/OpenDreamKit/OpenDreamKit/issues/116)

See page 49 of the [proposal](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf) for the full description.
