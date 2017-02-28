# Deliverable description, as taken from Github issue #61 on 2017-02-28 {.notoc}

- **WP3:** [Component Architecture](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP3)
- **Lead Institution:** Université Paris-Sud
- **Due:** 2016-02-28 (month 18; originally month 6)
- **Nature:** Report
- **Task:** T3.6 (#55): Document and modularise SageMathCloud’s codebase
- **Proposal:** [p. 43](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP3/D3.2/report-final.pdf)**

SageMathCloud (SMC) is both an open source software project (https://github.com/sagemathinc/smc) and an online instance of that software (hosted at https://cloud.sagemath.com/) that provides an interactive, collaborative environment for teaching and research in science, technology, engineering, and mathematics. See e.g. D2.3 (#43) for a description of this emergent technology.

SMC predates OpenDreamKit (ODK) and acts as prototypical example of VRE that can be built from the ecosystem OpenDreamKit aims at fostering. In particular, SMC is one of the main channels through which some of the most important technologies of ODK, such as Jupyter and SageMath, are distributed on-line. It makes it a good mean to distribute some of the newly developed ODK features, like the new Jupyter kernels of D4.4 (#93). It is very probable that many users will benefit from some of the ODK new developments through SMC. Reciprocally, the inner technologies of SMC are of special interest to ODK developers: they show advanced uses of cutting-edge web technologies and explore new leads that could inspire the work we do in ODK.

For all these reasons, is has been planned since the beginning for ODK to collaborate actively with SMC. For example, in D2.4 (#44), we have developed a short course for educators who wish to adopt SMC and related ODK technology in order to enhance their teaching.

In this deliverable, we start exploring the main layers of SMC's backend code and give a general overview of its functioning. The material we have produced can directly help the platform attract more developers. One of the expected follow-up is an easy install for a local version of SMC especially designed for development which could be part of upcoming D3.5 (#63). The long term goal however is to understand the extent of a full install of a SMC instance on a server or cluster: How hard is it? What is the total cost of ownership? Is it a viable solution for institutions of various scales to deploy and run a local SMC instance?

