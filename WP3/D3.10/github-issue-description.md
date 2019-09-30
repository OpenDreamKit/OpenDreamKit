# Deliverable description, as taken from Github issue #59 on 2019-09-05 {.notoc}

- **WP3:** [Component Architecture](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP3)
- **Lead Institution:** Université Joseph Fourier
- **Due:** 2019-08-31 (month 48)
- **Nature:** Other
- **Task:** T3.3 (#52) Modularisation and Packaging
- **Proposal:** [p. 42](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP3/D3.10/report-final.pdf)** ([sources](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP3/D3.10/))

This deliverable addresses the following objectives of OpenDreamKit:

**Objective 1:** To develop and standardise an architecture allowing combination of mathematical data and software components with off-the-shelf computing infrastructure to produce specialised VRE for different communities.

**Objective 3:** To bring together research communities (e.g. users of Jupyter, GAP, PARI, Sage, and Singular) to symbiotically exploit overlaps in tool creation efforts, avoid duplication of effort in different disciplines, and share best practice.

**Objective 4:** Update a range of existing open source mathematical software systems for seamless deployment and efficient execution within the VRE architecture of objective 1.

**Objective 5:** Ensure that our ecosystem of interoperable open source components is sustainable by promoting collaborative software development and outsourcing development to larger communities whenever suitable.

We contribute to the achievements of these objectives through the creation of source and binary packages for major Linux distributions, for all OpenDreamKit components.

Sage has a long history of integrating and distributing large mathematical libraries/software as a whole, with relatively little attention given to defining and exposing interfaces. This conscious compromise was made by the Sage community during the first stages of the project, in order to reach as quickly as possible the critical mass required for its survival. Component re-usability was then not the main focus for the Sage community; at the same time the non-standard and relatively underused package system discouraged writing and maintaining autonomous libraries. These factors contributed to make the Sage distribution what is usually described as a “monolith” (Sage library code alone, not counting included libraries, makes up for 1.5M lines of code and documentation), hard to distribute, to maintain, to port, and to develop with as it reached maturity. On the other hand, GAP has been distributing community-developed “GAP packages” for a long time, but faced fragmentation issues, at the code and at the community level. The rudimentary package system added more technical difficulties to GAP’s development model.

We achieved the stated goal of packaging for major Linux distributions through several actions:

- Workshops dedicated to packaging,
- Limiting *patched* dependencies in OpenDreamKit software,
- Updating dependencies of OpenDreamKit software,
- Modularization of OpenDreamKit software,
- Providing alternate workflows for user-contributed code, thanks to system-specific packaging tools and repositories.
- Contributing to packaging OpenDreamKit components, new or pre-existing, for cross-platforms packaging systems.
