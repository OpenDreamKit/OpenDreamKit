# Deliverable description, as taken from Github issue #98 on 2017-02-27 {.notoc}

- **WP4:** [User Interfaces](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP4)
- **Lead Institution:** Simula Research Laboratory
- **Due:** 2017-02-28 (month 18)
- **Nature:** Other
- **Task:** T4.3 (#71): Reproducible notebooks
- **Proposal:** [p. 48](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Final report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP4/D4.8/report-final.pdf)**

The [Jupyter Notebook](https://jupyter.org) is a web application that enables the creation and sharing of executable documents that contains live code, equations, visualizations and explanatory text. Thanks to a modular design, Jupyter can be used with any computational system that provides a so-called [_Jupyter kernel_](https://jupyter.readthedocs.io/en/latest/projects/kernels.html) implementing the [_Jupyter messaging protocol_](https://jupyter-client.readthedocs.io/en/latest/) to communicate with the notebook. OpenDreamKit therefore promotes the Jupyter notebook as user interface of choice, in particular since it is particularly suitable for building modular web based Virtual Research Environments.

This deliverable aims at enabling testing of Jupyter notebooks, with a good balance of convenience and configurability to address the range of possible ways to validate noteboooks. Testing is integral to ODK's goals of enabling reproducible practices in computational math and science, and this work enables validating notebooks as documentation and communication products, extending the scope of testing beyond traditional software.

Accomplishments:

  - [x] Develop [nbval](https://github.com/computationalmodelling/nbval) package for testing notebooks;
  - [x] Allow multiple testing modes, ranging from lax error-checking to strict output comparison;
  - [x] Enable normalizing output for comparison of transient values such as memory addresses and dates;
  - [x] Integrate D4.6 (#95: nbdime) for displaying changes between notebooks when they differ.

