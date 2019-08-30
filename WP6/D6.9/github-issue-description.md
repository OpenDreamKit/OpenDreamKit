# Deliverable description, as taken from Github issue #143 on 2019-08-30 {.notoc}

- **WP6:** [Data/Knowledge/Software-Bases](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP6)
- **Lead Institution:** University of St Andrews
- **Due:** 2019-02-28 (month 42)
- **Nature:** Other
- **Task:**  T6.9 (#131)
- **Proposal:** [p. 54](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP6/D6.9/report-final.pdf)** ([sources](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP6/D6.9/))

**Persistent memoisation** is the computational process of storing a program's outputs and retrieving them later, instead of re-running programs that are guaranteed to return the same answer. This approach may be useful in a wide range of fields but is particularly relevant to mathematicians: indeed, it's common for them to face compute intensive exact problems with small inputs and small outputs.

Results can be stored for future calls to a function in the present program session, in later sessions, or even for other users in different parts of the world.  Beside the advantages of recalling old results instead of repeating work, a human-readable cache could also be used by researchers to create a reproducible record of computed results that can be used outside the context of the memoisation system itself.

The aim of D6.9 is to establish a persistent memoisation framework to cache results in Python and GAP across sessions, in a way that is easy to deploy and configure, and allows for results to be shared reliably between different researchers.  D6.9 requires a "shared persistent memoisation library for Python/Sage", which is fulfilled by `pypersist`, a new Python library written by the current author.  A corresponding GAP package, `Memoisation`, was also written, featuring similar features and with a certain level of interoperability between the two systems. This is a step in the general effort of WP6 toward bridging together Data, Knowledge, and Software notably for Virtual Research Environments.

In this report, we present a review of some existing tools for memoisation, describe the two new packages, show an example of their use together, and give an overview of the future direction of this project.
