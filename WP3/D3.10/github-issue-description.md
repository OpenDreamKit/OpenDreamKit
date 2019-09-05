- **WP3:** [Component Architecture](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP3)
- **Lead Institution:** Université Joseph Fourier
- **Due:** 2019-08-31 (month 48)
- **Nature:** Other
- **Task:** T3.3 (#52)
- **Proposal:** [p. 42](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP3/D3.10/report-final.pdf)** ([sources](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP3/D3.10/))

Tentative content:
- Context (can be borrowed from the text of T3.3): ease of installation, better sustainability, supporting Binder, ... Maybe include some quotes on how sceptical people (including us) were about the feasibility.
- Prerequisites: work on refactoring Sage's build system and modularizing Sage's code base; work on libgap (described in D5.15 #113), Cython bindings to PARI (#83, #84).
- Contributions to packaging Sage and dependencies for Debian, Conda, ...: mention Sage Days 77, Sage Days 85, Sage Days 101. Recall here the means of distribution on Windows (D3.7 #66), MacOS and docker images (D3.1 #58). Packaging work for all other components: JOOMMF, Jupyter components, etc. Assess long term sustainability: amount of recurrent work needed, available manpower, ...
- Fostering contributions as extension packages: pip packages using Sage: sage-sample, sage-package, recursive-monkey-patch, sharing best practices (wiki page, tutorials at Sage Days);  GAP's package manager (described in D5.15 #113. Collect some statistics on external packages for GAP and Sage (will be used for KPI's)
- Do we want to mention this here? along ODK, the KWARC group has professionalized the release process for MMT.
- Any relevant work on the Singular side, the LinBox side?

Where do we want to mention work on low-level software integration? E.g. Cernay workshop on low level interfaces, experimentation with cppyy, cysignals, ... contributions to packaging and interfacing libsemigroups, ... In this deliverable or elsewhere?

References:
- SageMath's [External package list](https://wiki.sagemath.org/SageMathExternalPackages)
- SageMath's [Code Sharing Workflow wiki page](https://wiki.sagemath.org/CodeSharingWorkflow)
