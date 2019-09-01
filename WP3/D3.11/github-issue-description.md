# Deliverable description, as taken from Github issue #60 on 2019-09-02 {.notoc}

- **WP3:** [Component Architecture](https://github.com/OpenDreamKit/OpenDreamKit/tree/master/WP3)
- **Lead Institution:** Univ. Grenoble Alpes
- **Due:** 2019-08-31 (month 48)
- **Nature:** Other
- **Task:** T3.5 (#54)
- **Proposal:** [p. 42](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/Proposal/proposal-www.pdf)
- **[Report](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP3/D3.11/report-final.pdf)** ([sources](https://github.com/OpenDreamKit/OpenDreamKit/raw/master/WP3/D3.11/))

The primary use of computational mathematics software is to perform experimental mathematics, for example for testing a conjecture on as many as possible instances of size as large as possible. In this perspective, users seek for computational efficiency and the ability to harness the power of a variety of modern architectures. This is particularly relevant in the context of the OpenDreamKit Virtual Research Environment toolkit which is meant to reduce entry barriers by providing a uniform user experience from multicore personal computers -- a most common use case -- to high-end servers or even clusters. Hence, in the realm of this project, we use the term High Performance Computing (HPC) in a broad sense, covering all the above architectures with appropriate parallel paradigms (SIMD, multiprocessing, distributed computing, etc).

Work Package 5 has resulted in either enabling or drastically enhancing the high performance capabilities of several computational mathematics systems, namely Singular (D5.13 #111), GAP (D5.15 #113) and PARI (D5.16, #114), or of the dedicated library LinBox (D5.12 #110, D5.14 #112).

Bringing further HPC to a general purpose computational mathematics systems such as `SageMath` is particularly challenging; indeed, they need to cover a broad -- if not exhaustive -- range of features, in a high level and user friendly environment, with competitive performance. To achieve this, they are composed from the ground up as integrated systems that take advantage of existing highly tuned dedicated libraries or sub-systems such as aforementioned.

Were report here on the exploratory work carried out in Task to expose HPC capabilities of components to the end-user level of an integrated system such as `SageMath`.

Our first test bed is the `LinBox` library. Its multicore parallelism features have been successfully integrated in `Sage`, with a simple API letting the user control the desired level of parallelism. We demonstrate the efficiency of the composition with experiments. Going beyond expectations, the outcome has been integrated in the next production release of `SageMath`, hence immediately benefiting thousands of users.

We proceed by detailing the unique challenges posed by each of the Singular, Pari, and GAP systems. The common cause is that they were created decades ago as standalone systems, represent hundreds of man-years of development, and were only recently redesigned to be usable as a parallel libraries. Some successes were nevertheless obtained in experimental setups and pathways to production are discussed (together with best practices that parallel libraries should follow).

