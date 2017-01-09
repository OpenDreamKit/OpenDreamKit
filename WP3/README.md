# WP3: Component Architecture

Lead Institution: Université de Versailles Saint-Quentin

- Objectives:

The objective of this work package is to develop and demonstrate a set of APIs that enable components, such as
database interfaces, computational modules, separate systems such as GAP or SAGE, to be flexibly combined and run
smoothly across a wide range of environments (such as Cloud-based, local, and server environments).

- Description:

This Work Package focuses on the structure of the components that make up a mathematical software and their interactions.
Such components can be separate modules inside a unique software, or separate softwares interacting through
library calls and/or through APIs (e.g.: web APIs). When combined together, they make up a full VRE.
The architecture of these software components must be:
• Portable, to support a wide range of platforms (mobile, desktops, cloud, . . . ).
• Modular, so to ease installing, building, testing, and remixing.
• Flexible, so to adapt to different use cases: personal computation, HPC, parallel platforms, . . .
• Open, in the sense of open source, but also in the sense of clearly documented and open to the user who wants
to understand its underpinnings and/or contribute to it. Indeed we must not forget that the working mathematicians
and other users need to know what algorithms the software is going to run to solve a given problem.

See page 41 of the [proposal](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf) for the full description.
